#!/usr/bin/env python3
"""Una ROM solo para la sonda de musica: la cabecera del sonido `pedida`
(p04:663E + 2 x numero) apunta a la de `tocada`, para oir `tocada` en el
sitio de `pedida` sin que el juego la vuelva a pedir cada cuadro.

Uso: rom_musica.py <pedida> <tocada> <salida.rom>
"""
import os
import sys

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def main(argv):
    de, a, sal = int(argv[1], 0), int(argv[2], 0), argv[3]
    d = bytearray(open(os.path.join(RAIZ, "salamander.rom"), "rb").read())
    t = 4 * 0x2000 + (0x663E - 0x6000)
    d[t + 2 * de:t + 2 * de + 2] = d[t + 2 * a:t + 2 * a + 2]
    open(sal, "wb").write(d)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
