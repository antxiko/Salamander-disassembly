#!/usr/bin/env python3
"""Lo que el trazador de cartucho entero (tools/bancos.py) necesita saber de
ESTE cartucho: donde esta el despachador, como cambia de banco y por donde
arranca. bancos.py es maquinaria y no lleva direcciones de ningun juego; las
lee de aqui.

Salamander - Operation X (Konami, RC-758, 1987), mapper Konami con SCC. Todo
medido sobre los bytes (tools/reconocimiento.py repasa cada escritura al mapper).
"""

# El despachador de Konami: `pop hl / add a,a / add a,l / ld l,a / jr nc /
# inc h / ld a,(hl) / inc hl / ld h,(hl) / ld l,a / jp (hl)`, con la tabla de
# destinos pegada detras del `call`. En este cartucho esta en p00:40CE.
DESPACHADOR = 0x40CE
DESPACHADORES = (0x40CE,)

# Registro del mapper -> casilla del reparto (0x6000, 0x8000, 0xA000). El de
# 0x5000 no esta: solo lo escriben INIT y p00:5BD0, con un 0 (el banco 0 se
# queda fijo).
RANURA_REG = {0x7000: 0, 0x9000: 1, 0xB000: 2}

# Las copias en RAM de los registros: 0xF0F1/0xF0F2/0xF0F3, que las rutinas
# de banco escriben junto al registro y que la interrupcion (p00:409A-40AC) y
# las llamadas al sonido (p00:4D87-4D96, p00:50F3-5102) leen para devolver lo
# que habia. 0xF0F0 es la del banco 0 y nadie la lee.
SOMBRA = {0xF0F1: 0, 0xF0F2: 1, 0xF0F3: 2}
SOMBRA_RANURA = {0: 0, 1: 1, 2: 2}
PONE_ZONA = ()
DEVUELVE_ZONA = ()

# Subrutinas del banco 0 que CAMBIAN de banco y vuelven con `ret`; sin ellas
# el trazador sigue tras el `call` con el reparto de antes. Cada una escribe
# el registro Y su copia en RAM. None = esa ranura no la toca.
PONE_BANCOS = {
    0x416E: (1, 2, 3),          # p00:416E  push af / ld a,1 / jr p00:4180: 0x7000 / inc a / 0x9000 / inc a / 0xB000, con su copia en 0xF0F1-3
    0x4173: (4, 5, 6),          # p00:4173  push af / ld a,4 / jr p00:4180
    0x4178: (7, 8, 9),          # p00:4178  push af / ld a,7 / jr p00:4180
    0x417D: (13, 14, 15),       # p00:417D  push af / ld a,13 y cae en p00:4180
    0x4199: (None, 10, 15),     # p00:4199  ld a,10 en 0x9000 y ld a,15 en 0xB000
    0x41AC: (None, 14, None),   # p00:41AC  ld a,14 / jr p00:41B2: solo 0x9000 y 0xF0F2
    0x41B0: (None, 10, None),   # p00:41B0  ld a,10 y cae en p00:41B2
    0x41BB: (None, None, 6),    # p00:41BB  ld a,6 / jr p00:41CD / jr p00:41E2: solo 0xB000 y 0xF0F3
    0x41BF: (None, None, 11),   # p00:41BF  ld a,11 / jr p00:41CD
    0x41C3: (None, None, 15),   # p00:41C3  ld a,15 / jr p00:41CD
    0x41C7: (None, None, 9),    # p00:41C7  ld a,9 / jr p00:41CD
    0x41CB: (None, None, 12),   # p00:41CB  ld a,12 y cae en p00:41CD
    0x41D0: (None, 2, 3),       # p00:41D0  ld a,2 / jr p00:41DA: 0x9000 / inc a / 0xB000
    0x41D4: (None, 8, 9),       # p00:41D4  ld a,8 / jr p00:41DA
    0x41D8: (None, 14, 15),     # p00:41D8  ld a,14 y cae en p00:41DA
    0x41EA: (1, 2, None),       # p00:41EA  ld a,1 / jr p00:41F0: 0x7000 / inc a / 0x9000
    0x41EE: (7, 8, None),       # p00:41EE  ld a,7 y cae en p00:41F0
}


# Los bancos que llevan codigo y el reparto con el que corre (para
# tools/huerfanas.py): el 0 y los 1-2-3 con el trio de arranque, el sonido
# con 4-5-6, la presentacion con 1-10-15 y los jefes con 1-2-11 / 1-2-12.
CODIGO = {0: (1, 2, 3), 1: (1, 2, 3), 2: (1, 2, 3), 3: (1, 2, 3), 4: (4, 5, 6),
          10: (1, 10, 15), 11: (1, 2, 11), 12: (1, 2, 12)}


def semillas_iniciales(rom):
    """Los dos unicos puntos de entrada que el hardware garantiza.

    - INIT de la cabecera "AB" (0x40DA): lo llama la BIOS al arrancar, con el
      mapper en su estado de encendido (bancos 1, 2 y 3 en 0x6000, 0x8000 y
      0xA000; INIT los vuelve a poner en p00:40F1-410A).
    - 0x4069: lo que INIT instala en el gancho H.KEYI, con `ld a,0xC3 /
      ld (0xFD9A),a / ld hl,0x4069 / ld (0xFD9B),hl` (p00:40DD-40E7).
    """
    init = rom[2] | (rom[3] << 8)
    return [(init, (1, 2, 3), "cabecera AB: INIT"),
            (0x4069, (1, 2, 3),
             "gancho de interrupcion H.KEYI: INIT escribe 0xC3 en 0xFD9A y esta"
             " direccion en 0xFD9B (p00:40DD-p00:40E7)")]
