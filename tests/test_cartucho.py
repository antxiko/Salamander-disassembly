#!/usr/bin/env python3
"""Lo que se ha MEDIDO del cartucho, clavado para que no se deshaga solo.

Estas comprobaciones necesitan la ROM, y si no esta **fallan**: no se saltan.
Un test que se salta no comprueba nada y en verde daria la impresion
contraria. Quien clone esto sin poner su copia del cartucho vera fallar este
fichero con un mensaje que dice exactamente que falta.

Cada una corresponde a una afirmacion de la web o de las notas, y todas leen
el binario: ninguna compara una constante contra si misma.
"""
import hashlib
import os
import subprocess
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.path.join(RAIZ, "tools")
sys.path.insert(0, TOOLS)

from paginas import ORG   # noqa: E402

ROM = os.path.join(RAIZ, "salamander.rom")
SHA = "edbbba820ac67d6a55b9dc5da9309e45979936d5620c07d09793efaf077e86b9"

FALTA = ("falta salamander.rom en la raiz del repo. Son los 131.072 bytes de "
         "Salamander (Konami, RC-758, 1987, MSX) y no se distribuyen aqui: pon tu "
         "copia. El sha256 tiene que ser %s" % SHA)


def leer_rom():
    if not os.path.exists(ROM):
        raise AssertionError(FALTA)
    with open(ROM, "rb") as f:
        return f.read()


def b(rom, banco, a, n=1):
    """n bytes del banco en la direccion a (con su org)."""
    o = banco * 0x2000 + (a - ORG[banco])
    return rom[o:o + n]


class Cartucho(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.rom = leer_rom()

    def test_es_la_misma_rom(self):
        self.assertEqual(len(self.rom), 131072)
        self.assertEqual(hashlib.sha256(self.rom).hexdigest(), SHA)

    def test_cabecera_ab(self):
        """0x4000 'AB', INIT 0x40DA y los otros tres vectores a cero."""
        self.assertEqual(self.rom[0:2], b"AB")
        self.assertEqual(self.rom[2] | (self.rom[3] << 8), 0x40DA)
        self.assertEqual(self.rom[4:10], b"\x00" * 6)

    def test_segunda_cabecera_del_game_master(self):
        """0x4010: 'CD', 0x07 y 0x58, o sea RC-758."""
        self.assertEqual(self.rom[0x10:0x14], bytes([0x43, 0x44, 0x07, 0x58]))

    def test_mapper_konami_con_scc(self):
        """Escrituras a 0x7000, 0x9000 y 0xB000 y ni una a 0x6000/0x8000/0xA000."""
        for reg in (0x7000, 0x9000, 0xB000):
            self.assertIn(bytes([0x32, reg & 0xFF, reg >> 8]), self.rom)
        for reg in (0x6000, 0x8000, 0xA000):
            self.assertNotIn(bytes([0x32, reg & 0xFF, reg >> 8]), self.rom)

    def test_regla_banco_org(self):
        """tools/reconocimiento.py: toda escritura con banco conocido lo pone en
        la ranura que dice tools/paginas.py (exit 0)."""
        r = subprocess.run([sys.executable, os.path.join(TOOLS, "reconocimiento.py"), ROM],
                           capture_output=True, text=True, cwd=TOOLS)
        self.assertEqual(r.returncode, 0, r.stdout)
        self.assertIn("OK: la regla banco -> org", r.stdout)

    def test_banco_10_solo_en_0x8000(self):
        """p00:41B0: `ld a,10` y cae en p00:41B2, que solo escribe 0x9000 y su
        copia 0xF0F2."""
        self.assertEqual(b(self.rom, 0, 0x41B0, 11), bytes([
            0x3E, 0x0A, 0xF3, 0x32, 0x00, 0x90, 0x32, 0xF2, 0xF0, 0xFB, 0xC9]))
        self.assertEqual(ORG[10], 0x8000)

    def test_bancos_11_y_12_solos_en_0xa000(self):
        """p00:41BF `ld a,11` y p00:41CB `ld a,12` llegan a p00:41E2, que solo
        escribe 0xB000 y su copia 0xF0F3."""
        self.assertEqual(b(self.rom, 0, 0x41BF, 2), bytes([0x3E, 0x0B]))
        self.assertEqual(b(self.rom, 0, 0x41CB, 2), bytes([0x3E, 0x0C]))
        self.assertEqual(b(self.rom, 0, 0x41E2, 8), bytes([
            0x32, 0x00, 0xB0, 0x32, 0xF3, 0xF0, 0xFB, 0xC9]))
        self.assertEqual(ORG[11], 0xA000)
        self.assertEqual(ORG[12], 0xA000)

    def test_gancho_de_interrupcion(self):
        """INIT engancha 0x4069 en H.KEYI (0xFD9A)."""
        self.assertEqual(b(self.rom, 0, 0x40DD, 11), bytes([
            0x3E, 0xC3, 0x32, 0x9A, 0xFD, 0x21, 0x69, 0x40, 0x22, 0x9B, 0xFD]))


if __name__ == "__main__":
    unittest.main()
