#!/usr/bin/env python3
"""Rehace la VRAM repitiendo, con los bytes de la ROM, las escrituras que el
cartucho hizo en openMSX (tools/omsx_vram.tcl con VRAM_ESCRITURAS):

  0x004D WRTVRM   un byte A en HL
  0x0056 FILVRM   BC bytes A desde HL
  0x005C LDIRVM   BC bytes de HL (la ROM con los bancos de 0xF0F1-3, o la RAM:
                  esos bytes van apuntados en la traza) a DE
  p00:4D16        las rachas de DE (la ROM) en HL (tools/vram.py)

Asi cada byte de la VRAM tiene su origen en la ROM (o en un bufer de la RAM que
el codigo llena). `coteja` compara la VRAM rehecha con la volcada en el mismo
instante; lo que no sale de estas rutinas (las que escriben con OUT, como la
nave de p01:6094) queda distinto.

Uso: repite.py coteja <dir> <etiqueta> ...       (la etiqueta es el segundo del volcado)
     repite.py vram <dir> <segundo> <salida.bin>
     repite.py png <dir> <segundo> <salida.png> [--escala N]
"""
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import bloques as B      # noqa: E402
import vram as V         # noqa: E402

PAT = re.compile(r"^([0-9A-F]{4}) HL=([0-9A-F]{4}) DE=([0-9A-F]{4}) BC=([0-9A-F]{4}) A=([0-9A-F]{2}) "
                 r"F0F1=([0-9A-F]{6}) t=([0-9.]+)(?: DATOS=([0-9a-f]*))?")


class Ventana:
    """El cartucho con el banco 0 en 0x4000 y los de F0F1-3 en 0x6000-0xBFFF."""

    def __init__(self, bancos):
        if 0xFF in bancos:          # antes de que INIT ponga la sombra: los del arranque
            bancos = (1, 2, 3)
        self.v = B.Ventana(bancos)
        self.v0 = B.ventana_de(0)

    def __call__(self, a):
        return self.v0(a) if a < 0x6000 else self.v(a)

    def w(self, a):
        return self(a) | (self(a + 1) << 8)


def escrituras(dir_):
    for ln in open(os.path.join(dir_, "escrituras.txt")):
        m = PAT.match(ln.strip())
        if m:
            pc, hl, de, bc, a, f, t, datos = m.groups()
            yield (int(pc, 16), int(hl, 16), int(de, 16), int(bc, 16), int(a, 16),
                   tuple(int(f[i:i + 2], 16) for i in (0, 2, 4)), float(t), datos)


def rehace(dir_, hasta):
    vram = bytearray(0x4000)
    origen = {}
    for pc, hl, de, bc, a, bancos, t, datos in escrituras(dir_):
        if t > hasta:
            break
        if pc == 0x004D:
            vram[hl & 0x3FFF] = a
        elif pc == 0x0056:
            for i in range(bc):
                vram[(hl + i) & 0x3FFF] = a
        elif pc == 0x005C:
            if hl < 0x4000:
                continue                     # la BIOS (C-BIOS copia su fuente al arrancar)
            if hl >= 0xC000:
                b = bytes.fromhex(datos or "")
            else:
                v = Ventana(bancos)
                b = bytes(v(hl + i) for i in range(bc))
                origen[(de, bc)] = hl
            for i in range(min(bc, len(b))):
                vram[(de + i) & 0x3FFF] = b[i]
        elif pc == 0x4D16:
            V.rachas(vram, Ventana(bancos), de, hl)
            origen[(hl, 0)] = de
    return vram, origen


def coteja(dir_, et):
    real = open(os.path.join(dir_, "vram-%s.bin" % et), "rb").read()
    mio, _ = rehace(dir_, float(et))
    zonas = (("colores", 0x0000, 0x1800), ("sprites", 0x1800, 0x2000), ("dibujos", 0x2000, 0x3800),
             ("nombres", 0x3800, 0x3B00), ("atributos", 0x3B00, 0x3B80))
    partes = []
    for nom, a, b in zonas:
        d = sum(1 for i in range(a, b) if real[i] != mio[i])
        partes.append("%s %d" % (nom, d))
    print("%s: bytes distintos: %s" % (et, ", ".join(partes)))


def main(argv):
    if len(argv) >= 4 and argv[1] == "coteja":
        for et in argv[3:]:
            coteja(argv[2], et)
    elif len(argv) >= 5 and argv[1] == "png":
        import pantalla
        esc = int(argv[argv.index("--escala") + 1]) if "--escala" in argv else 1
        mio, _ = rehace(argv[2], float(argv[3]))
        pantalla.pinta(mio, mio, esc).save(argv[4])
    elif len(argv) >= 5 and argv[1] == "vram":
        mio, _ = rehace(argv[2], float(argv[3]))
        open(argv[4], "wb").write(mio)
    else:
        sys.exit(__doc__)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
