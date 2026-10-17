# The code

## The numbers

**100 %** of the 131,072 bytes is explained: 52,996 of code and 78,076 of
data. The nine banks with code have 3,429 routines and labels, and 11,342
of their 25,417 instructions carry a comment: **44.6 %**, with no routine
under 10 %.

## Where everything is

- bank 0: the interrupt, the bank sets, the graphics loading (`p00:438C`),
  the maps in RAM (`p00:49BB`, `p00:4A88`) and the game states;
- banks 1, 2 and 3: the enemies, the ship, its weapons, the collisions and
  the script of each stage (`p02:8525`-`p02:86EF`);
- bank 4: the sound;
- bank 10: the intro, the take-off, the planet choice, the cut-scenes and
  the endings;
- bank 11: the eight bosses (table `p01:6E89`) and the screen fade;
- bank 12: the special enemies, the items to pick up and the SELECTION
  screen;
- banks 5, 7, 8, 9, 13, 14 and 15: data only (waveforms, graphics, maps and
  texts).

## The names

The routine and RAM names are in `tools/anotaciones.py`, and
`tools/anota.py` takes them to every call and every access in the listing.
