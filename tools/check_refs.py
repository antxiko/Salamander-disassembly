#!/usr/bin/env python3
"""Las referencias 'pNN:XXXX' de los comentarios escritos a mano: cada una
tiene que caer en el principio de una instruccion o de un bloque de datos de
ese banco.

Uso: check_refs.py                 lista las que no caen
     check_refs.py --arregla p01 ...  en esas notas, cambia pNN por el
                              banco del otro trio (13-14-15 <-> 1-2-3)
                              cuando solo alli cae. Solo vale para los
                              bancos que corren con ese trio; una
                              referencia a la mitad de un bloque de datos
                              tambien sale como que no cae.
"""
import glob
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
OTRO = {13: 1, 14: 2, 15: 3, 1: 13, 2: 14, 3: 15}


def principios():
    out = {}
    for f in glob.glob(os.path.join(RAIZ, "src", "*_p*.asm")):
        b = int(f[-6:-4])
        s = out.setdefault(b, set())
        for ln in open(f, encoding="utf-8"):
            m = re.match(r"^\t[a-z]+[^;]*;\s*([0-9a-f]{4})", ln)
            if m:
                s.add(int(m.group(1), 16))
    return out


def main(argv):
    ok = principios()
    malas = 0
    cuales = [a for a in argv[1:] if re.match(r"^p\d\d$", a)]
    for f in sorted(glob.glob(os.path.join(RAIZ, "src", "p??.notes"))):
        arregla = "--arregla" in argv and os.path.basename(f)[:3] in cuales
        texto = open(f, encoding="utf-8").read()
        nuevo = []
        for ln in texto.split("\n"):
            if ln.startswith("C ") and "AUTO" not in ln:
                def cambia(m):
                    nonlocal malas
                    b, a = int(m.group(1)), int(m.group(2), 16)
                    if a in ok.get(b, ()):
                        return m.group(0)
                    malas += 1
                    o = OTRO.get(b)
                    if o is not None and a in ok.get(o, ()):
                        print("%s: %s -> p%02d  (%s)" % (os.path.basename(f), m.group(0), o, ln[:70]))
                        return "p%02d:%04X" % (o, a) if arregla else m.group(0)
                    print("%s: %s no cae  (%s)" % (os.path.basename(f), m.group(0), ln[:70]))
                    return m.group(0)
                ln = re.sub(r"\bp(\d\d):([0-9A-F]{4})\b", cambia, ln)
            nuevo.append(ln)
        if arregla:
            open(f, "w", encoding="utf-8", newline="\n").write("\n".join(nuevo))
    print("%d referencias que no caen" % malas)


if __name__ == "__main__":
    main(sys.argv)
