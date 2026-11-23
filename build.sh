#!/bin/bash
# Builds the My Suite installer: one package per architecture that installs My Explorer,
# My Notepad and My Paint, each one a choice the person can untick.
#
# It only assembles applications that were already released: the notarized installers of
# My Notepad and My Paint and the notarized My Explorer application. Nothing is compiled here.
#
# Usage: ./build.sh
#   EXPLORER_APP, NOTEPAD_DIST and PAINT_DIST point at the inputs (defaults: the sibling folders).
#   With DEVELOPER_ID_INSTALLER set, the installers are signed; with NOTARY_PROFILE also set,
#   Apple notarizes them and the ticket is stapled.
set -euo pipefail
cd "$(dirname "$0")"
version=$(cat VERSION)
explorer="${EXPLORER_APP:-../My Explorer - Private/dist/My Explorer.app}"
notepad="${NOTEPAD_DIST:-../My Notepad - Private/dist}"
paint="${PAINT_DIST:-../My Paint - Private/dist}"

read_plist() { /usr/libexec/PlistBuddy -c "Print $2" "$1/Contents/Info.plist"; }
newest() { ls "$1"/$2 2>/dev/null | sort -V | tail -1; }

# My Explorer must carry its notarization ticket: the suite installer is notarized as a whole,
# but the application is also copied around by its own updater.
xcrun stapler validate "$explorer" >/dev/null
for arch in arm64 x86_64; do lipo "$explorer/Contents/MacOS/MyExplorer" -verify_arch "$arch"; done
explorer_version=$(read_plist "$explorer" CFBundleShortVersionString)
explorer_build=$(read_plist "$explorer" CFBundleVersion)
explorer_minimum=$(read_plist "$explorer" LSMinimumSystemVersion)

signing=()
if [[ -n "${DEVELOPER_ID_INSTALLER:-}" ]]; then signing=(--sign "$DEVELOPER_ID_INSTALLER" --timestamp); fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
mkdir -p dist

# My Explorer as a component package. The installer runs as root, but the application replaces
# itself when it updates and applies its own Finder icon, so it has to belong to the person.
mkdir -p "$tmp/explorer/root" "$tmp/explorer/scripts"
ditto "$explorer" "$tmp/explorer/root/My Explorer.app"
cat > "$tmp/explorer/scripts/postinstall" <<'SH'
#!/bin/bash
app="$2/My Explorer.app"
owner=$(/usr/bin/stat -f %Su /dev/console)
if [ -n "$owner" ] && [ "$owner" != root ]; then /usr/sbin/chown -R "$owner" "$app" || true; fi
exit 0
SH
chmod +x "$tmp/explorer/scripts/postinstall"
pkgbuild --analyze --root "$tmp/explorer/root" "$tmp/explorer/components.plist" >/dev/null
plutil -replace 0.BundleIsRelocatable -bool false "$tmp/explorer/components.plist"
pkgbuild --root "$tmp/explorer/root" --component-plist "$tmp/explorer/components.plist" \
    --identifier io.github.leoars.myexplorer.pkg --version "$explorer_version.$explorer_build" \
    --install-location /Applications --scripts "$tmp/explorer/scripts" "$tmp/Explorer.pkg" >/dev/null

for arch in arm64 x86_64; do
    work="$tmp/$arch"
    mkdir -p "$work"
    cp "$tmp/Explorer.pkg" "$work/Explorer.pkg"
    # The component packages of the two editors come out of their released installers unchanged.
    versions=()
    for pair in "Notepad:$notepad:My-Notepad" "Paint:$paint:My-Paint"; do
        IFS=: read -r part folder prefix <<<"$pair"
        source=$(newest "$folder" "$prefix-*-$arch.pkg")
        [[ -n "$source" ]] || { echo "Missing $prefix installer for $arch in $folder" >&2; exit 1; }
        xcrun stapler validate "$source" >/dev/null
        pkgutil --expand "$source" "$work/$part-expanded"
        pkgutil --flatten "$work/$part-expanded/Editor.pkg" "$work/$part.pkg"
        base=$(basename "$source" "-$arch.pkg")
        versions+=("${base#"$prefix"-}")
    done

    cat > "$work/Distribution" <<XML
<?xml version="1.0" encoding="utf-8"?>
<installer-gui-script minSpecVersion="2">
  <title>My Suite</title>
  <options customize="always" hostArchitectures="$arch"/>
  <domains enable_anywhere="false" enable_currentUserHome="false" enable_localSystem="true"/>
  <volume-check><allowed-os-versions><os-version min="12.0"/></allowed-os-versions></volume-check>
  <script>
    function explorerFits() { return system.compareVersions(system.version.ProductVersion, '$explorer_minimum') &gt;= 0; }
  </script>
  <choices-outline>
    <line choice="explorer"/>
    <line choice="notepad"/>
    <line choice="paint"/>
  </choices-outline>
  <choice id="explorer" title="My Explorer $explorer_version" description="File manager. Requires macOS $explorer_minimum or later."
          enabled="explorerFits()" selected="explorerFits()">
    <pkg-ref id="io.github.leoars.myexplorer.pkg"/>
  </choice>
  <choice id="notepad" title="My Notepad ${versions[0]}" description="Plain-text editor.">
    <pkg-ref id="local.mynotepad.editor.pkg"/>
  </choice>
  <choice id="paint" title="My Paint ${versions[1]}" description="Image editor.">
    <pkg-ref id="local.mypaint.editor.pkg"/>
  </choice>
  <pkg-ref id="io.github.leoars.myexplorer.pkg" version="$explorer_version.$explorer_build">Explorer.pkg</pkg-ref>
  <pkg-ref id="local.mynotepad.editor.pkg" version="${versions[0]}">Notepad.pkg</pkg-ref>
  <pkg-ref id="local.mypaint.editor.pkg" version="${versions[1]}">Paint.pkg</pkg-ref>
</installer-gui-script>
XML
    name="My-Suite-$version-$arch.pkg"
    productbuild ${signing[@]+"${signing[@]}"} --distribution "$work/Distribution" --package-path "$work" "$work/$name" >/dev/null

    # Check what the installer would put in /Applications, without installing it.
    pkgutil --expand-full "$work/$name" "$work/check"
    codesign --verify --deep --strict "$work/check/Explorer.pkg/Payload/My Explorer.app"
    test -x "$work/check/Explorer.pkg/Scripts/postinstall"
    for item in "Notepad:My Notepad:MyNotepad" "Paint:My Paint:MyPaint"; do
        IFS=: read -r part app binary <<<"$item"
        installed="$work/check/$part.pkg/Payload/$app.app"
        codesign --verify --strict "$installed"
        test "$(lipo -archs "$installed/Contents/MacOS/$binary")" = "$arch"
    done

    if [[ -n "${DEVELOPER_ID_INSTALLER:-}" ]]; then
        pkgutil --check-signature "$work/$name" >/dev/null
        if [[ -n "${NOTARY_PROFILE:-}" ]]; then
            xcrun notarytool submit "$work/$name" --keychain-profile "$NOTARY_PROFILE" --wait
            xcrun stapler staple "$work/$name"
            spctl --assess --type install --verbose "$work/$name"
        fi
    fi
    mv "$work/$name" "dist/$name"
    echo "dist/$name: My Explorer $explorer_version ($explorer_build), My Notepad ${versions[0]}, My Paint ${versions[1]}"
    shasum -a 256 "dist/$name"
done
