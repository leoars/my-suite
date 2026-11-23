# My Suite

**Português (Brasil)** · [English](docs/readme/en.md) · [Español](docs/readme/es.md) · [Français](docs/readme/fr.md) · [Deutsch](docs/readme/de.md) · [Italiano](docs/readme/it.md) · [日本語](docs/readme/ja.md) · [한국어](docs/readme/ko.md)

Três aplicativos para macOS simples e diretos, com os menus e os atalhos de sempre: um gerenciador de arquivos, um editor de texto e um editor de imagens. Cada um tem repositório, versão e download próprios; este repositório reúne os três num instalador só.

## Instalar

- **[Baixar para Apple Silicon (série M)](https://github.com/leoars/my-suite/releases/download/1.0.1/My-Suite-1.0.1-arm64.pkg)**
- **[Baixar para Intel](https://github.com/leoars/my-suite/releases/download/1.0.1/My-Suite-1.0.1-x86_64.pkg)**

O instalador traz o My Explorer 1.0.1, o My Notepad 1.0.2 e o My Paint 1.0. Abra-o e, em **Personalizar**, escolha quais aplicativos instalar; os três vêm marcados. Ele é assinado com Developer ID e notarizado pela Apple, e fala português, inglês, espanhol, francês, alemão, italiano, japonês e coreano.

Requer macOS 12 ou posterior. O My Explorer requer macOS 14 ou posterior: em versões anteriores ele aparece desmarcado e os outros dois são instalados normalmente.

## My Explorer

Gerenciador de arquivos com árvore de pastas, abas, barra de comandos e várias visualizações, integrado à Lixeira, aos volumes, ao iCloud e aos aplicativos do Mac.

![Janela do My Explorer em português, com uma pasta de fotos em Ícones grandes, a árvore de pastas à esquerda e o painel de visualização à direita](docs/screenshots/explorer-pt-BR.png)

- **Navegação:** árvore com as pastas do Mac, Pastas preferidas e recentes, abas com histórico próprio, barra de endereço que vira texto ao clicar e filtro da pasta com curingas (`*.pdf`).
- **Cinco visualizações**, lembradas por pasta: Detalhes, Lista, Ícones pequenos, Ícones grandes e Galeria, com miniaturas de fotos e vídeos.
- **Operações com arquivos:** copiar e mover com progresso e pausa, desfazer, Lixeira com Restaurar, ZIP, Propriedades com o tamanho das pastas e exclusão rápida de milhares de arquivos.
- **Visualização:** imagens, vídeo, áudio e PDF no painel de visualização e num visualizador próprio.
- **E mais:** texto de imagens e PDFs (OCR), estado do iCloud Drive, Amazon S3, pastas protegidas por senha, Git e conexão a servidores SMB.

Requer macOS 14 ou posterior. [Conheça o My Explorer](https://github.com/leoars/my-explorer/blob/main/README.pt-BR.md)

## My Notepad

Editor de texto simples: abra um .txt, escreva e salve com os atalhos que você já conhece.

![Janela do My Notepad em português, com um caderno de campo aberto e o painel Substituir pronto para trocar “ponte” por “passarela”](docs/screenshots/notepad-pt-BR.png)

- **Texto simples de verdade:** sem corretor ortográfico, sem substituições automáticas e sem formatação escondida.
- **Localizar, Substituir** e **Ir para** uma linha pelo número.
- **Codificações** ANSI, UTF-8 e UTF-16, com detecção automática, mantendo os fins de linha do arquivo.
- **Quebra automática de linha**, escolha de fonte e barra de status com linha e coluna.
- **Configurar página e Imprimir**, com cabeçalho e rodapé, e o diário em .txt com `.LOG`.

Requer macOS 12 ou posterior. [Conheça o My Notepad](https://github.com/leoars/My-Notepad)

## My Paint

Editor de imagens simples: abra uma imagem, desenhe com lápis, pincéis, formas e texto, e salve em PNG, JPEG, BMP ou GIF.

![Janela do My Paint em português, com a guia Início e a tela em branco](docs/screenshots/paint-pt-BR.png)

- **Ferramentas:** lápis, borracha, preencher com cor, selecionador de cor, lupa e texto.
- **Nove pincéis** e as **23 formas** da galeria, com contorno e preenchimento.
- **Cores:** Cor 1 e Cor 2, paleta de 20 cores e cores personalizadas.
- **Seleção** retangular e de forma livre, recortar, copiar e colar entre aplicativos.
- **Imagem:** cortar, redimensionar, inclinar, girar e inverter.

Requer macOS 12 ou posterior. [Conheça o My Paint](https://github.com/leoars/my-paint)

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
