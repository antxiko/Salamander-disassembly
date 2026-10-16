#!/usr/bin/env python3
"""La VRAM de Salamander, cargada como la carga el cartucho, con codigo nuestro.

El VDP esta en SCREEN 2: dibujos de caracteres en 0x2000 (tres tercios de
0x800), colores en 0x0000, nombres en 0x3800, dibujos de sprite en 0x1800 y
atributos en 0x3B00. Es el motor de Nemesis 2 y los formatos son los mismos:

  p00:4D16  rachas a la VRAM (0 acaba; < 0x80 repite el byte siguiente;
            0x80 trae otro destino; > 0x80 copia n & 0x7F bytes)
  p00:4CE5  las mismas rachas en los tres tercios (+0x800 y +0x1000)
  p00:4546  lista de caracteres: fichas [tercios][dibujos][caracter][colores]
            (bit 0 de tercios: el de abajo, +0x1000; bit 1: el del medio,
            +0x800; bit 2: el de arriba)
  p00:44F9  copias de caracteres VRAM -> VRAM: [origen][destino][marcas]
            [cuantos]; el tercio de origen sale de los bits 2-1 de las marcas
            (p00:467B) y los de destino de los bits 5-3 (p00:45FF); con 0xF000
            = 0 en espejo (p00:45E0) y con 0xF000 = 1 cabeza abajo (p00:459B)
  p00:44B7  los caracteres de una fase: la lista comun p07:6C63, la de las
            fases 2, 3 y 6 (p07:6C95) o la de las demas (p07:6C8E), en la 7 lo
            que p00:5B91 trae del otro cartucho, la de la fase (p07:6C37), y
            sus copias en espejo (p07:6C45) y cabeza abajo (p07:6C53)
  p00:483F  unas rachas en los tres tercios desde 0x2280 y 0x0280

La fase 7 solo existe con Nemesis 2 en la otra ranura: p00:5BA5 trae a 0xC100
veinte trozos de sus bancos 7-8-9 (tabla p00:5BFE) y las listas de la fase los
apuntan. Para dibujarla hace falta nemesis2.rom (NEMESIS2_DISAM o --vecino).

Uso como modulo: v = vram.de_la_fase(fase) -> bytearray de 16 KB.
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import bloques as B   # noqa: E402

DIBUJOS = 0x2000
COLORES = 0x0000
NOMBRES = 0x3800
SPRITES = 0x1800

VECINO = os.path.join(AQUI, "..", "..", "NEMESIS2_DISAM", "nemesis2.rom")


class ConRam:
    """Una Ventana del cartucho con la RAM de 0xC000 en adelante (fase 7)."""

    def __init__(self, v, ram):
        self.v, self.ram = v, ram

    def __call__(self, a):
        if a >= 0xC000:
            return self.ram[a - 0xC000]
        return self.v(a)

    def w(self, a):
        return self(a) | (self(a + 1) << 8)


def ram_del_vecino(ruta=VECINO):
    """Los 0x4000 bytes de 0xC000 tras p00:5BE1: los trozos de Nemesis 2."""
    rom = open(ruta, "rb").read()

    def n2(a):          # Nemesis 2 con sus bancos 7-8-9 en 0x6000-0xBFFF
        b = 7 + (a - 0x6000) // 0x2000
        return rom[b * 0x2000 + (a & 0x1FFF)]
    v0 = B.ventana_de(0)
    ram = bytearray(0x4000)
    d = 0xC100
    for k in range(20):
        f = 0x5BFE + 3 * k
        n, o = v0(f), v0.w(f + 1)
        for i in range(n):
            ram[d - 0xC000 + i] = n2(o + i)
        d += n
    return ram


def rachas(vram, v, origen, destino):
    """p00:4D16."""
    a, d = origen, destino
    while True:
        n = v(a)
        a += 1
        if n == 0:
            return a
        if n == 0x80:
            d = v.w(a)
            a += 2
        elif n < 0x80:
            x = v(a)
            a += 1
            for _ in range(n):
                vram[d & 0x3FFF] = x
                d += 1
        else:
            for _ in range(n & 0x7F):
                vram[d & 0x3FFF] = v(a)
                a += 1
                d += 1


def rachas_3(vram, v, origen, destino):
    """p00:4CE5: las rachas en los tres tercios."""
    for t in (0, 0x800, 0x1000):
        rachas(vram, v, origen, destino + t)


def lista_caracteres(vram, v, ix):
    """p00:4546."""
    while v(ix) != 0:
        tercios = v(ix)
        for bit, base in ((0, 0x1000), (1, 0x0800), (2, 0x0000)):
            if tercios >> bit & 1:
                hl = v(ix + 3) * 8 + base
                rachas(vram, v, v.w(ix + 1), DIBUJOS + hl)
                rachas(vram, v, v.w(ix + 4), COLORES + hl)
        ix += 6


def copias(vram, v, ix, cabeza_abajo):
    """p00:44F9, con 0xF000 = 0 (espejo) o 1 (cabeza abajo)."""
    while v(ix) != 0:
        marcas = v(ix + 2)
        n = (marcas >> 6) & 3
        largo = 3
        if not n:
            n = v(ix + 3)
            largo = 4
        nbytes = n * 8
        if marcas & 4:          # p00:467B
            t = 0x0000
        elif marcas & 2:
            t = 0x0800
        else:
            t = 0x1000
        o = v(ix) * 8 + t
        dib = bytearray(vram[(DIBUJOS + o + i) & 0x3FFF] for i in range(nbytes))
        col = bytearray(vram[(COLORES + o + i) & 0x3FFF] for i in range(nbytes))
        if not cabeza_abajo:    # p00:45E0: los bits de cada byte al reves
            dib = bytearray(int("{:08b}".format(x)[::-1], 2) for x in dib)
        else:                   # p00:459B: las 8 filas al reves
            for k in range(n):
                dib[8 * k:8 * k + 8] = dib[8 * k:8 * k + 8][::-1]
                col[8 * k:8 * k + 8] = col[8 * k:8 * k + 8][::-1]
        for bit, base in ((3, 0x1000), (4, 0x0800), (5, 0x0000)):   # p00:45FF
            if marcas >> bit & 1:
                d = v(ix + 1) * 8 + base
                for i in range(nbytes):
                    vram[(DIBUJOS + d + i) & 0x3FFF] = dib[i]
                    vram[(COLORES + d + i) & 0x3FFF] = col[i]
        ix += largo


def verticales(fase):
    """p00:4835: el bit de la fase en 0x26 (las fases 2, 3 y 6)."""
    return bool(0x26 >> (fase - 1) & 1)


def ventana_789(fase):
    v = B.Ventana((7, 8, 9))
    if fase == 7:
        return ConRam(v, ram_del_vecino())
    return v


def de_la_fase(fase):
    """La VRAM de caracteres de la fase, como la dejan p00:44B7 y p00:483F."""
    vram = bytearray(0x4000)
    v = ventana_789(fase)
    lista_caracteres(vram, v, 0x6C63)
    lista_caracteres(vram, v, 0x6C95 if verticales(fase) else 0x6C8E)
    lista_caracteres(vram, v, v.w(0x6C37 + 2 * fase))
    copias(vram, v, v.w(0x6C45 + 2 * fase), False)
    copias(vram, v, v.w(0x6C53 + 2 * fase), True)
    v0 = B.ventana_de(0)
    if verticales(fase):
        rachas_3(vram, v0, 0x4876, 0x2280)
        rachas_3(vram, v0, 0x4879, 0x0280)
    else:
        rachas_3(vram, v0, 0x4868, 0x2280)
        rachas_3(vram, v0, 0x486B, 0x0280)
    return vram


# p00:5C3A (al empezar) y p00:5C77 (cuando entra la columna o fila de ese
# scroll): a mitad de fase se cargan otra lista de caracteres y sus copias,
# tres punteros en el banco 0 (p00:5CCB).
CAMBIOS = {1: [(0x190, 0x5CFA)], 3: [(0x20F, 0x5D00)],
           6: [(0x0B8, 0x5D06), (0x1A0, 0x5D0C)], 7: [(0x1C0, 0x5D12)]}


def cambio(vram, fase, tabla):
    """p00:5CCB."""
    v0 = B.ventana_de(0)
    v = ventana_789(fase)
    lista_caracteres(vram, v, v0.w(tabla))
    copias(vram, v, v0.w(tabla + 2), False)
    copias(vram, v, v0.w(tabla + 4), True)


def tramos(fase):
    """[(desde el scroll, vram)]: la VRAM de la fase y la de tras cada cambio."""
    vr = de_la_fase(fase)
    out = [(0, bytes(vr))]
    for desde, tabla in CAMBIOS.get(fase, []):
        cambio(vr, fase, tabla)
        out.append((desde, bytes(vr)))
    return out


# ------------------------------------------------------------------ sprites
#
# Los dibujos de sprite (16 x 16: 32 bytes, la columna izquierda y luego la
# derecha) van en 0x1800. p00:438C pone los de la fase, con 7-8-9:
#   p00:444F  rachas de p09:A130 a 0x1880 y de p09:A06F a 0x1960; segun la
#             fase (p00:4835: las verticales) p09:A009/A042 a 0x18C0,
#             p09:A0F3/A0D8 a 0x1900 y p09:A122/A113 a 0x18A0
#   p00:4494  la lista de la fase p08:8B26[fase]: [n][rachas] a 0x1800 + 8 x n
#   p00:43A7  las fichas p08:8BD3[fase]: [tipo][cuantos][origen][destino]
#             (numeros de dibujo de 8 bytes); el tipo 1 copia cabeza abajo
#             (p00:4411 invierte las 16 filas de cada columna) y los demas en
#             espejo (p00:4D3B invierte los bits y cambia una columna por la
#             otra; el destino es 0x1810 + 8 x n)

def copias_de_sprites(vram, v, ix):
    """p00:43A7."""
    while v(ix) != 0:
        tipo, n, o, d = v(ix), v(ix + 1), v(ix + 2), v(ix + 3)
        for k in range(n):
            src = bytes(vram[SPRITES + o * 8 + 32 * k:SPRITES + o * 8 + 32 * k + 32])
            if tipo == 1:
                dst = src[0:16][::-1] + src[16:32][::-1]
            else:
                r = bytes(int("{:08b}".format(x)[::-1], 2) for x in src)
                dst = r[16:32] + r[0:16]
            a = SPRITES + d * 8 + 32 * k
            vram[a:a + 32] = dst
        ix += 4


def sprites_de_la_fase(fase, vram=None):
    """La VRAM con los dibujos de sprite que deja p00:438C en la fase."""
    if vram is None:
        vram = bytearray(0x4000)
    v = ventana_789(fase)
    rachas(vram, v, 0xA130, 0x1880)
    rachas(vram, v, 0xA06F, 0x1960)
    c = verticales(fase)
    rachas(vram, v, 0xA009 if c else 0xA042, 0x18C0)
    rachas(vram, v, 0xA0F3 if c else 0xA0D8, 0x1900)
    rachas(vram, v, 0xA122 if c else 0xA113, 0x18A0)
    a = v.w(0x8B26 + 2 * fase)
    while v(a):
        rachas(vram, v, v.w(a + 1), SPRITES + 8 * v(a))
        a += 3
    copias_de_sprites(vram, v, v.w(0x8BD3 + 2 * fase))
    return vram


# p00:4DC8, al llegar el jefe (0xE640): el 8 no carga nada; el 3 y el 6 dejan
# en 0xE220-0xE225 la lista p07:6822 y sus copias p07:6895 (espejo) y p07:68C0
# (cabeza abajo), que se pintan poco a poco (p00:4763); los demas, la entrada
# del jefe de p07:67D6, p07:67E4 (espejo) y p07:67F2 (cabeza abajo).

def del_jefe(fase, jefe, vram):
    v = ventana_789(fase)
    if jefe == 8:
        return vram
    if jefe in (3, 6):
        lista_caracteres(vram, v, 0x6822)
        copias(vram, v, 0x6895, False)
        copias(vram, v, 0x68C0, True)
        return vram
    lista_caracteres(vram, v, v.w(0x67D6 + 2 * jefe))
    copias(vram, v, v.w(0x67E4 + 2 * jefe), False)
    copias(vram, v, v.w(0x67F2 + 2 * jefe), True)
    return vram


# p12:A4A9: cada 4 cuadros (16 en la fase 4), sin jefe, un paso de la lista de
# la fase (p12:A52F + 2 x fase; 0 = sin lista). Primer byte: los pasos (bits
# 0-6) y, con el bit 7, que son colores (0x0000) y no dibujos (0x2000). Cada
# paso son 10 bytes: [caracter][tercios: bit 0 arriba, 1 medio, 2 abajo][8 bytes].

def animacion(fase):
    """[(caracter, [tercios], es_color, 8 bytes)] de la fase, en orden."""
    v = B.Ventana((1, 2, 12))
    a = v.w(0xA52F + 2 * fase)
    if not a:
        return []
    n, color = v(a) & 0x7F, bool(v(a) & 0x80)
    pasos = []
    for k in range(n):
        e = a + 1 + 10 * k
        t = v(e + 1)
        pasos.append((v(e), [i for i in range(3) if t >> i & 1], color,
                      bytes(v(e + 2 + i) for i in range(8))))
    return pasos


if __name__ == "__main__":
    for f in range(1, 8):
        vr = de_la_fase(f)
        print(f, sum(1 for x in vr[0x2000:0x3800] if x), "bytes de dibujo")
