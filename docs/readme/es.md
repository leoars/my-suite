# My Suite

[Português (Brasil)](../../README.md) · [English](en.md) · **Español** · [Français](fr.md) · [Deutsch](de.md) · [Italiano](it.md) · [日本語](ja.md) · [한국어](ko.md)

Tres aplicaciones para macOS sencillas y directas, con los menús y los atajos de siempre: un gestor de archivos, un editor de texto y un editor de imágenes. Cada una tiene su propio repositorio, su versión y su descarga; este repositorio reúne las tres en un solo instalador.

## Instalar

- **[Descargar para Apple Silicon (serie M)](https://github.com/leoars/my-suite/releases/download/1.0.2/My-Suite-1.0.2-arm64.pkg)**
- **[Descargar para Intel](https://github.com/leoars/my-suite/releases/download/1.0.2/My-Suite-1.0.2-x86_64.pkg)**

El instalador incluye My Explorer 1.0.1, My Notepad 1.0.3 y My Paint 1.0. Ábrelo y, en **Personalizar**, elige qué aplicaciones instalar; las tres vienen seleccionadas. Está firmado con Developer ID y notarizado por Apple, y está disponible en inglés, portugués, español, francés, alemán, italiano, japonés y coreano.

Requiere macOS 12 o posterior. My Explorer requiere macOS 14 o posterior: en versiones anteriores aparece sin seleccionar y las otras dos se instalan con normalidad.

## My Explorer

Un gestor de archivos con árbol de carpetas, pestañas, barra de comandos y varias vistas, integrado con la Papelera, los volúmenes, iCloud y las aplicaciones del Mac.

![Ventana de My Explorer en español, con una carpeta de fotos en Iconos grandes, el árbol de carpetas a la izquierda y el panel de vista previa a la derecha](../screenshots/explorer-es.png)

### Navegación

- Árbol de carpetas con Carpeta personal, Escritorio, Documentos, Descargas, Este Mac, Volúmenes, Almacenamiento en la nube, Búsquedas guardadas, iPhone y iPad y Papelera, además de las carpetas favoritas y recientes.
- Pestañas, cada una con su propio historial, selección, orden y filtro.
- Una sola barra de direcciones: cada carpeta de la ruta se puede pulsar, y al hacer clic en la barra aparece la ruta en texto, con sugerencias mientras escribes.
- **Atrás**, **Adelante**, **Subir** y **Actualizar**; la lista se actualiza sola cuando los archivos cambian desde fuera.
- **Filtrar esta carpeta** por nombre, con comodines (`*.pdf`), y **Buscar archivos…** por nombre, extensión, contenido, fecha y etiquetas, en esta carpeta o en todo el Mac. Las búsquedas se pueden guardar en el árbol.

### Vistas

- Cinco modos, recordados por carpeta: **Detalles**, **Lista**, **Iconos pequeños**, **Iconos grandes** y **Galería**, con miniaturas de fotos y vídeos.
- **Ordenar** por nombre, fecha de modificación, tipo o tamaño; en Detalles, arrastra las cabeceras para cambiar el orden y el ancho de las columnas.
- **Elementos ocultos** y **Extensiones de nombre de archivo** en el menú Ver.

### Operaciones con archivos

- Barra de comandos con **Nuevo**, **Cortar**, **Copiar**, **Pegar**, **Cambiar nombre**, **Compartir** y **Eliminar**.
- Copiar y mover con progreso, pausa y verificación. Si el nombre ya existe: reemplazar, combinar carpetas, conservar ambos u omitir.
- **Deshacer** para hasta 20 copias, traslados y eliminaciones de la sesión, y cambiar el nombre en el propio lugar con F2.
- Papelera en el árbol, con **Restaurar**, **Eliminar definitivamente…** y **Vaciar papelera…**.
- **Comprimir en ZIP** y **Extraer ZIP**, arrastrar y soltar entre aplicaciones, **Abrir con…**, **Compartir…** (también por AirDrop), etiquetas del Finder y **Copiar ruta**.
- **Propiedades** con ruta y permisos; en un volumen, capacidad total, usada y libre.
- Acciones rápidas para imágenes y PDF: girar, convertir a JPEG o PNG y crear un PDF.

### Vista previa y multimedia

- El panel de vista previa muestra imágenes, vídeo y audio con controles de reproducción, PDF con paso de páginas y los demás tipos mediante Vista Rápida (Quick Look).
- Un visor propio abre imágenes, vídeos y audio, avanza por los archivos de la carpeta con las flechas y permite un zoom del 1 % al 800 %. Las imágenes animadas (WebP, GIF, APNG) se reproducen.

### Reconocimiento de texto (OCR)

- **Extraer texto…** de imágenes y PDF escaneados, con detección del idioma, para copiarlo o guardarlo como TXT.
- **Crear PDF con búsqueda…**, de archivo en archivo o por lotes de hasta 50. Todo se hace en el propio Mac.

### iCloud y almacenamiento en la nube

- Estado de cada elemento de iCloud Drive en la lista (en el Mac, solo en línea, descargándose o subiéndose), descarga con un clic y el progreso en el icono, y **Eliminar descarga de este Mac**.
- Descargar una carpeta entera o solo la selección, con una reserva de espacio en disco que nunca se sobrepasa.
- Amazon S3: conectar un bucket, navegar, copiar entre el Mac y la nube, mover, crear carpetas y eliminar, con las credenciales en Llaveros de macOS. Azure Blob Storage y Google Cloud Storage son experimentales.

### Carpetas protegidas, Git y red

- **Proteger carpeta…** guarda una carpeta en una bóveda cifrada con AES-256 que se abre con contraseña y se bloquea sola al bloquear la sesión, al entrar en reposo y al salir.
- Git: marcas de estado en los archivos, la rama en la barra de estado, **Ver cambios**, **Ver historial**, commit, cambio de rama, fetch, pull y push, con el Git instalado en el Mac.
- Expulsar discos, **Conectar al servidor…** por SMB e importar fotos de un iPhone o iPad.

### Opciones y atajos

- Restaurar las pestañas o la última carpeta al abrir, tamaños de letra independientes para el árbol, la lista, los menús y las barras, y tema claro u oscuro, según el sistema.
- Los atajos con Ctrl funcionan como ya los conoces (Ctrl+C, Ctrl+V, F2, F5, Ctrl+T para una nueva pestaña), y sus equivalentes con ⌘ también.
- Busca nuevas versiones al abrirse e instala la que aceptes.
- Experimental y desactivado por defecto: una línea de comandos y un servidor MCP permiten que un asistente de IA trabaje en las carpetas que autorices, durante 24 horas.

Requiere macOS 14 o posterior. [Más información sobre My Explorer](https://github.com/leoars/my-explorer/blob/main/README.es.md)

## My Notepad

Un editor de texto sencillo: abre un archivo .txt, escribe y guarda con los atajos que ya conoces.

![Ventana de My Notepad en español, con un cuaderno de campo abierto y el panel Reemplazar listo para cambiar «puente» por «pasarela»](../screenshots/notepad-es.png)

- **Texto plano de verdad:** sin corrector ortográfico, sin sustituciones automáticas y sin formato oculto.
- **Archivo:** Nuevo, Abrir, Guardar y Guardar como, con un aviso antes de perder los cambios. La primera vez que lo abres, se ofrece como editor predeterminado de los archivos .txt.
- **Buscar** con dirección y distinción entre mayúsculas y minúsculas, **Reemplazar** y **Reemplazar todo** en un panel que sigue abierto mientras trabajas, e **Ir a** una línea por su número.
- **Codificaciones:** abre y guarda en ANSI (CP-1252), UTF-8, UTF-16 LE y UTF-16 BE, con detección automática, y conserva los finales de línea CRLF, LF o CR del archivo.
- **Vista:** ajuste de línea, elección de la fuente, tamaño de la fuente desde el teclado o con Ctrl y la rueda del ratón, y una barra de estado con la línea y la columna.
- **Imprimir:** Configurar página con encabezado, pie de página (`&f`, `&p`, `&d`, `&t`), márgenes, papel y orientación.
- **Hora y fecha** con F5 y el diario en .txt: un archivo que empieza por `.LOG` recibe la hora y la fecha al final cada vez que se abre.
- **Los atajos de siempre:** Ctrl+S, Ctrl+F, F3, Ctrl+H, Ctrl+G, Ctrl+Backspace y los demás, con sus equivalentes con ⌘.

Requiere macOS 12 o posterior. [Más información sobre My Notepad](https://github.com/leoars/My-Notepad/blob/main/docs/readme/es.md)

## My Paint

Un editor de imágenes sencillo: abre una imagen, dibuja con lápices, pinceles, formas y texto, y guarda en PNG, JPEG, BMP o GIF.

![Ventana de My Paint en español, con la pestaña Inicio y el lienzo en blanco](../screenshots/paint-es.png)

- **Archivo:** abre y guarda PNG, JPEG, BMP, GIF y TIFF, con Imágenes recientes, Propiedades de la imagen y Establecer como fondo de escritorio.
- **Herramientas:** lápiz, borrador, rellenar con color, selector de color, lupa y texto; el botón izquierdo pinta con Color 1 y el derecho con Color 2.
- **Nueve pinceles**, entre ellos los caligráficos, el aerógrafo, el óleo, el crayón y la acuarela, cada uno con cuatro tamaños.
- **23 formas** de la galería, con contorno y relleno en color sólido o con textura, que se ajustan con los controladores antes de fijarlas.
- **Colores:** una paleta de 20 colores, colores personalizados y Editar colores por matiz, saturación y luminosidad o por RGB.
- **Selección** rectangular, libre y transparente; mover, duplicar, estirar y pegar entre aplicaciones.
- **Imagen:** recortar, cambiar tamaño e inclinar, girar, voltear e invertir colores, en la selección o en toda la imagen.
- **Texto** con fuente, tamaño, negrita, cursiva, subrayado y tachado, y compatibilidad con los métodos de entrada del japonés y del coreano.
- **Vista e impresión:** zoom del 12,5 % al 800 %, reglas, cuadrícula, pantalla completa, miniatura, Vista previa de impresión y Deshacer con 50 niveles.

Requiere macOS 12 o posterior. [Más información sobre My Paint](https://github.com/leoars/my-paint/blob/main/docs/readme/es.md)

## Cómo funcionan juntas

- En My Explorer, el doble clic en un archivo de texto abre My Notepad, y el menú contextual ofrece **Editar con My Notepad** y **Editar con My Paint**.
- La ventana **Acerca de** de cada aplicación lleva a las otras dos.
- Ninguna depende de otra: instala solo las que quieras.

## Actualizaciones

My Explorer busca nuevas versiones por sí mismo e instala la que aceptes. My Notepad y My Paint se actualizan instalando la nueva versión, con este instalador o con el de cada aplicación.

## Generar el instalador

`build.sh` monta el instalador a partir de las aplicaciones ya publicadas y notarizadas; aquí no se compila nada. El número de la suite está en `VERSION`.

```sh
DEVELOPER_ID_INSTALLER="Developer ID Installer: …" NOTARY_PROFILE=my-suite-notary ./build.sh
```

Distribuido bajo la [licencia Apache 2.0](../../LICENSE).
