# Salamander - Operation X - desensamblado comentado

*(Also [in English](README.md).)*

El desensamblado comentado de **Salamander - Operation X** (Konami, 1987,
RC-758) para MSX: un MegaROM de 128 KB con el mapper de Konami con SCC,
dieciséis bancos de 8 KB.

- **100 %** del binario explicado: 52.996 bytes de código y 78.076 de datos
  con nombre, ni un byte sin asignar.
- **44,6 %** del listado comentado, 3.429 rutinas y etiquetas, ninguna por
  debajo del 10 % de comentarios.
- El listado se reensambla en la ROM original **byte a byte**.
- Las siete fases con sus recorridos enteros, la nave, los enemigos, los
  ocho jefes, la presentación, la elección de planeta y los dos finales están
  **dibujados desde la ROM**, no capturados, y cotejados con la VRAM de
  openMSX; la música sale de ejecutar el propio motor de sonido del cartucho.

La web: <https://antxiko.github.io/Salamander-disassembly/es/>
(en inglés: <https://antxiko.github.io/Salamander-disassembly/>).

## Reproducirlo

La imagen del cartucho no se distribuye. Pon la tuya en la raíz como
`salamander.rom` (sha256 `edbbba82...`) y ejecuta `make`. El detalle, en
[POR DENTRO](docs/es/POR-DENTRO.md).

## Legal

El juego es de Konami y de sus titulares. La licencia de `LICENSE` cubre solo
las herramientas, los comentarios, el análisis y la documentación de aquí.
Mira [AVISO-LEGAL.md](AVISO-LEGAL.md).
