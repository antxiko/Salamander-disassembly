# Por dentro

## Empezar

Este repositorio no trae el juego. Trae las herramientas que, a partir de tu
propia imagen del cartucho, vuelven a montar el listado comentado, lo
reensamblan y comprueban que sale la ROM **byte a byte**.

### Lo que hace falta

- La imagen de *Salamander - Operation X* (RC-758), 131.072 bytes, en la
  raíz con el nombre `salamander.rom`. Su sha256:
  `edbbba820ac67d6a55b9dc5da9309e45979936d5620c07d09793efaf077e86b9`.
- `make`, `python3` y el ensamblador `pasmo`.
- Para las imágenes y la música, Python con PIL, numpy y lameenc. Para la
  fase 7, también la imagen de *Nemesis 2* en `../NEMESIS2_DISAM/nemesis2.rom`.

### Lo que se ejecuta

    make               # traza, genera el listado, reensambla y pasa los tests
    make verify        # los dieciséis bancos contra la ROM
    make densidad      # cuántas instrucciones llevan comentario
    make sanity        # el presupuesto: ni un byte sin asignar

`make verify` tiene que decir `OK: la ROM entera reproducible byte a byte`.

### Dónde está cada cosa

- `src/salamander_pNN.asm`: el listado de cada banco (p00 a p15).
- `src/pNN.notes`: los nombres, los comentarios y los bloques de datos de
  cada banco. El listado se genera desde aquí.
- `tools/vram.py`, `tools/mundo.py`, `tools/nave.py`, `tools/enemigos.py`,
  `tools/jefes.py`, `tools/repite.py`: las imágenes.
- `tools/musica.py`: la música; `tools/textos.py`: los textos.
- `tools/omsx_vram.tcl` y `tools/omsx_psg.tcl`: las sondas de openMSX con las
  que se coteja todo.

### Las imágenes

    python tools/imagenes.py docs/imagenes

Los recorridos, la nave y los caracteres salen solo de la ROM. Los
enemigos y los jefes se pintan con los dibujos de la ROM sobre lo que
hacen en openMSX. Las pantallas de la presentación, la elección de planeta
y los finales se rehacen repitiendo con los bytes de la ROM las escrituras
a la VRAM que hace el cartucho, y cada una es igual, píxel a píxel, a la
VRAM del emulador en ese momento. Las piezas del marcador y los objetos
salen de la ROM (`tools/armas.py`, que los coteja con la VRAM). Las
animaciones son la VRAM y los registros del VDP de cada cuadro de una
partida en openMSX (`VRAM_CUADROS` en `tools/omsx_vram.tcl`), pintados como
los pinta el TMS9918 (`tools/anima.py`).

## El cartucho

### La máquina

Un MSX de primera generación: el VDP TMS9918 en SCREEN 2, el PSG y el SCC
que lleva el propio cartucho. Nombres en 0x3800, colores en 0x0000, dibujos
en 0x2000, dibujos de sprite en 0x1800 y sus atributos en 0x3B00. La zona
de juego son 21 filas; las tres de abajo son el marcador.

### El mapper

Es el de Konami con SCC: dieciséis bancos de 8 KB. El 0 está fijo en 0x4000
y los otros tres huecos se eligen en 0x7000, 0x9000 y 0xB000, con una copia
en `0xF0F1`-`0xF0F3`. El juego los pone de tres en tres
(`p00:416E`-`p00:417D`): 1-2-3 para el juego, 4-5-6 para el sonido, 7-8-9
para los gráficos y 13-14-15 para los mapas. El 10 va solo en 0x8000 (la
presentación, las escenas y los finales) y el 11 y el 12 solos en 0xA000
(los jefes y los enemigos especiales). El banco 0x3F en 0x8000 abre el SCC.

### La interrupción

INIT (`p00:40DA`) borra la RAM del juego, instala el gancho H.KEYI y se
queda en `jr $`: todo corre dentro de la interrupción (`p00:4069`). Primero
el sonido, con los bancos 4-5-6 (`p04:6978`); después, si el cuadro anterior
ha acabado (`0xE205`), un cuadro de juego.

### El sonido

Ocho canales de 0x2C bytes desde `0xE000`: tres del PSG y cinco del SCC.
Son 89 sonidos; cada uno tiene una cabecera con sus canales y su prioridad
(`p04:663E`) y una partitura por canal. Los efectos usan dos canales (el C
del PSG y el primero del SCC) y las músicas seis u ocho, así que una música
de seis sigue sonando por debajo de los efectos. Las órdenes 0xF0-0xF6
hacen la pausa, los fundidos y el paso del SCC al PSG (`p04:6472`).

### La RAM

El juego usa `0xE000`-`0xEFFF`. Los 12 enemigos son fichas de 0x40 bytes
en `0xE700`, los 15 disparos de la nave van en `0xE440` y el jefe en
`0xEC80`. La pantalla se monta en la RAM, en `0xCA00` con 64 bytes por
fila, y cada cuadro se vuelca a la VRAM (`p00:5FED`).

### El otro cartucho

Al arrancar, `p03:B599` mira qué hay en la otra ranura. Si encuentra
*Nemesis 2* (`p03:B5E3` compara su 0x4010 con CD 07 51 y seis bytes de su
0x7FFA), se abre la fase 7. Para dibujarla, `p00:5B91` copia a 0xC000 una
rutina que pone el otro cartucho y trae 1.137 bytes, veinte trozos de sus
bancos 7, 8 y 9 (tabla `p00:5BFE`), a `0xC100`.

## El código

### Las cifras

El **100 %** de los 131.072 bytes está explicado: 52.996 de código y 78.076
de datos. Los nueve bancos con código tienen 3.429 rutinas y etiquetas, y
11.342 de sus 25.417 instrucciones llevan comentario: el **44,6 %**, sin
ninguna rutina por debajo del 10 %.

### Dónde está cada cosa

- banco 0: la interrupción, los repartos de bancos, la carga de gráficos
  (`p00:438C`), los mapas en la RAM (`p00:49BB`, `p00:4A88`) y los estados
  del juego;
- bancos 1, 2 y 3: los enemigos, la nave, sus armas, los choques y el guion
  de cada fase (`p02:8525`-`p02:86EF`);
- banco 4: el sonido;
- banco 10: la presentación, el despegue, la elección de planeta, las
  escenas y los finales;
- banco 11: los ocho jefes (tabla `p01:6E89`) y el fundido de pantalla;
- banco 12: los enemigos especiales, los objetos que se recogen y la
  pantalla SELECTION;
- bancos 5, 7, 8, 9, 13, 14 y 15: solo datos (formas de onda, gráficos,
  mapas y textos).

### Los nombres

Los nombres de las rutinas y de la RAM están en `tools/anotaciones.py`, y
`tools/anota.py` los lleva a cada llamada y a cada acceso del listado.
