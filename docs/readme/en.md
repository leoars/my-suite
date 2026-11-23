# My Suite

[Português (Brasil)](../../README.md) · **English**

Three simple, straightforward apps for macOS, with the menus and shortcuts you already know. Each one has its own repository, version and download; this repository brings the three together in a single installer.

| App | What it is | Repository |
| --- | --- | --- |
| **My Explorer** | File manager with a folder tree, tabs, a command bar and several views. | [leoars/my-explorer](https://github.com/leoars/my-explorer) |
| **My Notepad** | Simple plain-text editor. | [leoars/My-Notepad](https://github.com/leoars/My-Notepad/blob/main/docs/readme/en.md) |
| **My Paint** | Simple image editor. | [leoars/my-paint](https://github.com/leoars/my-paint/blob/main/docs/readme/en.md) |

## Install

- **[Download for Apple Silicon (M-series)](https://github.com/leoars/my-suite/releases/download/1.0/My-Suite-1.0-arm64.pkg)**
- **[Download for Intel](https://github.com/leoars/my-suite/releases/download/1.0/My-Suite-1.0-x86_64.pkg)**

Open the installer and, under **Customize**, choose which apps to install. All three come selected. The installer is signed with Developer ID and notarized by Apple.

Requires macOS 12 or later. My Explorer requires macOS 14 or later: on earlier versions it appears unselected and the other two are installed normally.

## How the apps work together

- In My Explorer, double-clicking a text file opens My Notepad, and the context menu offers **Edit with My Notepad** and **Edit with My Paint**.
- The **About** window of each app leads to the other two.
- None depends on another: install only the ones you want.

## Updates

My Explorer checks for new versions by itself and installs the one you accept. My Notepad and My Paint are updated by installing the new version, with this installer or with each app's own.

## Building the installer

`build.sh` assembles the installer from the apps already released and notarized; nothing is compiled here. The suite's number is in `VERSION`.

```sh
DEVELOPER_ID_INSTALLER="Developer ID Installer: …" NOTARY_PROFILE=my-suite-notary ./build.sh
```

Distributed under the [Apache 2.0 license](../../LICENSE).
