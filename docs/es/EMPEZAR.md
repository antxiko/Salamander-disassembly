# Empezar

Este repositorio no trae el juego. Trae las herramientas que, a partir de tu
propia imagen del cartucho, vuelven a montar el listado comentado, lo
reensamblan y comprueban que sale la ROM **byte a byte**.

## Lo que hace falta

- La imagen de *Salamander - Operation X* (RC-758), 131.072 bytes, en la
  raíz con el nombre `salamander.rom`. Su sha256:
  `edbbba820ac67d6a55b9dc5da9309e45979936d5620c07d09793efaf077e86b9`.
- `make`, `python3` y el ensamblador `pasmo`.
- Para las imágenes y la música, Python con PIL, numpy y lameenc. Para la
  fase 7, también la imagen de *Nemesis 2* en `../NEMESIS2_DISAM/nemesis2.rom`.

## Lo que se ejecuta

    make               # traza, genera el listado, reensambla y pasa los tests
    make verify        # los dieciséis bancos contra la ROM
    make densidad      # cuántas instrucciones llevan comentario
    make sanity        # el presupuesto: ni un byte sin asignar

`make verify` tiene que decir `OK: la ROM entera reproducible byte a byte`.

## Dónde está cada cosa

- `src/salamander_pNN.asm`: el listado de cada banco (p00 a p15).
- `src/pNN.notes`: los nombres, los comentarios y los bloques de datos de
  cada banco. El listado se genera desde aquí.
- `tools/vram.py`, `tools/mundo.py`, `tools/nave.py`, `tools/enemigos.py`,
  `tools/jefes.py`, `tools/repite.py`: las imágenes.
- `tools/musica.py`: la música; `tools/textos.py`: los textos.
- `tools/omsx_vram.tcl` y `tools/omsx_psg.tcl`: las sondas de openMSX con las
  que se coteja todo.

## Las imágenes

    python tools/imagenes.py docs/imagenes

Los recorridos, la nave y los caracteres salen solo de la ROM. Los
enemigos y los jefes se pintan con los dibujos de la ROM sobre lo que
hacen en openMSX. Las pantallas de la presentación, la elección de planeta
y los finales se rehacen repitiendo con los bytes de la ROM las escrituras
a la VRAM que hace el cartucho, y cada una es igual, píxel a píxel, a la
VRAM del emulador en ese momento.
