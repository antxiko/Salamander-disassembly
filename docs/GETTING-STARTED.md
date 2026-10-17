# Getting started

This repository does not include the game. It includes the tools that,
from your own image of the cartridge, rebuild the commented listing,
reassemble it and check that the ROM comes out **byte for byte**.

## What you need

- The image of *Salamander - Operation X* (RC-758), 131,072 bytes, in the
  root as `salamander.rom`. Its sha256:
  `edbbba820ac67d6a55b9dc5da9309e45979936d5620c07d09793efaf077e86b9`.
- `make`, `python3` and the `pasmo` assembler.
- For the pictures and the music, Python with PIL, numpy and lameenc. For
  stage 7, also the *Nemesis 2* image at `../NEMESIS2_DISAM/nemesis2.rom`.

## What to run

    make               # traces, builds the listing, reassembles and runs the tests
    make verify        # the sixteen banks against the ROM
    make densidad      # how many instructions carry a comment
    make sanity        # the budget: not one byte unassigned

`make verify` has to say `OK: la ROM entera reproducible byte a byte`.

## Where everything is

- `src/salamander_pNN.asm`: the listing of each bank (p00 to p15).
- `src/pNN.notes`: the names, comments and data blocks of each bank. The
  listing is generated from here.
- `tools/vram.py`, `tools/mundo.py`, `tools/nave.py`, `tools/enemigos.py`,
  `tools/jefes.py`, `tools/repite.py`: the pictures.
- `tools/musica.py`: the music; `tools/textos.py`: the texts.
- `tools/omsx_vram.tcl` and `tools/omsx_psg.tcl`: the openMSX probes
  everything is checked against.

## The pictures

    python tools/imagenes.py docs/imagenes

The routes, the ship and the characters come from the ROM alone. The
enemies and the bosses are drawn with the ROM's patterns over what they do
in openMSX. The screens of the intro, the planet choice and the endings are
rebuilt by repeating, with the ROM's bytes, the cartridge's writes to the
VRAM, and each one is identical, pixel for pixel, to the emulator's VRAM at
that moment.
