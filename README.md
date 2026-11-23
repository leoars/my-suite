# My Suite

**Português (Brasil)** · [English](docs/readme/en.md)

Três aplicativos para macOS simples e diretos, com os menus e os atalhos de sempre. Cada um tem repositório, versão e download próprios; este repositório reúne os três num instalador só.

| Aplicativo | O que é | Repositório |
| --- | --- | --- |
| **My Explorer** | Gerenciador de arquivos com árvore de pastas, abas, barra de comandos e várias visualizações. | [leoars/my-explorer](https://github.com/leoars/my-explorer) |
| **My Notepad** | Editor de texto simples. | [leoars/My-Notepad](https://github.com/leoars/My-Notepad) |
| **My Paint** | Editor de imagens simples. | [leoars/my-paint](https://github.com/leoars/my-paint) |

## Instalar

- **[Baixar para Apple Silicon (série M)](https://github.com/leoars/my-suite/releases/download/1.0.1/My-Suite-1.0.1-arm64.pkg)**
- **[Baixar para Intel](https://github.com/leoars/my-suite/releases/download/1.0.1/My-Suite-1.0.1-x86_64.pkg)**

Abra o instalador e, em **Personalizar**, escolha quais aplicativos instalar. Os três vêm marcados. O instalador é assinado com Developer ID e notarizado pela Apple.

Requer macOS 12 ou posterior. O My Explorer requer macOS 14 ou posterior: em versões anteriores ele aparece desmarcado e os outros dois são instalados normalmente.

## Como os aplicativos trabalham juntos

- No My Explorer, o duplo clique em um arquivo de texto abre o My Notepad, e o menu de contexto oferece **Editar com o My Notepad** e **Editar com o My Paint**.
- A janela **Sobre** de cada aplicativo leva aos outros dois.
- Nenhum depende do outro: instale só os que quiser.

## Atualizações

O My Explorer verifica novas versões sozinho e instala a que você aceitar. O My Notepad e o My Paint são atualizados instalando a versão nova, por este instalador ou pelo de cada aplicativo.

## Gerar o instalador

`build.sh` monta o instalador a partir dos aplicativos já publicados e notarizados; nada é compilado aqui. O número da suíte fica em `VERSION`.

```sh
DEVELOPER_ID_INSTALLER="Developer ID Installer: …" NOTARY_PROFILE=my-suite-notary ./build.sh
```

Distribuído sob a [licença Apache 2.0](LICENSE).
