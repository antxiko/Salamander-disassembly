; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 09 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS colores_9F4E_cola: rachas (p00:4D16) con los colores de los caracteres
;   desde el 144, ficha 1 de la lista 0x687E (p00:4540) (sigue del banco 8);
;   lo leen p00:4DE1 (9 bytes)
;   0xa000..0xa009  (9 bytes)
DATA_colores_9F4E_cola:
	defb 0c1h,084h,021h,0c1h,021h,0c1h,00ch,021h,000h	; a000  ..!.!..!.

; ----------------------------------------------------------------------
; DATOS rachas_A009: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p00:446F (57 bytes)
;   0xa009..0xa042  (57 bytes)
DATA_rachas_A009:
	defb 086h,000h,003h,007h,007h,00fh,00fh,004h,01fh,002h,00fh,002h,007h,088h,003h,000h	; a009  ................
	defb 000h,0c0h,0e0h,0e0h,0f0h,0f0h,004h,0f8h,002h,0f0h,002h,0e0h,081h,0c0h,004h,000h	; a019  ................
	defb 083h,003h,007h,007h,004h,00fh,002h,007h,081h,003h,006h,000h,083h,0c0h,0e0h,0e0h	; a029  ................
	defb 004h,0f0h,002h,0e0h,081h,0c0h,003h,000h,000h	; a039  .........

; ----------------------------------------------------------------------
; DATOS rachas_A042: rachas a la VRAM 0x18C0 (p00:4D16): la otra rama del `jr
;   nc` de p00:4835 (bit fase de 0x26), que el trazador no ve; lo leen
;   p00:446F (45 bytes)
;   0xa042..0xa06f  (45 bytes)
DATA_rachas_A042:
	defb 003h,000h,083h,003h,01fh,07fh,004h,0ffh,083h,07fh,01fh,003h,006h,000h,083h,0c0h	; a042  ................
	defb 0f8h,0feh,004h,0ffh,083h,0feh,0f8h,0c0h,008h,000h,086h,007h,01fh,03fh,03fh,01fh	; a052  .............??.
	defb 007h,00ah,000h,086h,0e0h,0f8h,0fch,0fch,0f8h,0e0h,005h,000h,000h	; a062  .............

; ----------------------------------------------------------------------
; DATOS rachas_A06F: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p00:445E (105 bytes)
;   0xa06f..0xa0d8  (105 bytes)
DATA_rachas_A06F:
	defb 084h,060h,0f0h,0f0h,060h,01ch,000h,0adh,080h,009h,000h,005h,035h,0a1h,01ah,007h	; a06f  .`..`.......5...
	defb 0abh,035h,00bh,035h,014h,063h,000h,010h,010h,080h,002h,000h,030h,052h,0e0h,0c0h	; a07f  .5.5.c......0R..
	defb 0c0h,0e0h,0d0h,08ch,028h,026h,000h,040h,000h,004h,004h,000h,018h,019h,001h,001h	; a08f  ....(&.@........
	defb 00eh,01fh,02fh,01fh,02eh,005h,000h,08ch,080h,058h,0fch,0f4h,0f0h,0f0h,0f6h,026h	; a09f  ../......X.....&
	defb 070h,070h,020h,080h,006h,000h,088h,001h,000h,001h,004h,000h,003h,007h,002h,00ah	; a0af  pp .............
	defb 000h,086h,050h,0e0h,040h,010h,040h,040h,00ah,000h,084h,002h,004h,002h,002h,00bh	; a0bf  ..P.@.@@........
	defb 000h,084h,0c0h,020h,080h,020h,007h,000h,000h	; a0cf  ... . ...

; ----------------------------------------------------------------------
; DATOS rachas_A0D8: rachas a la VRAM 0x1900 (p00:4D16): la otra rama del `jr
;   nc` de p00:4835 (bit fase de 0x26), que el trazador no ve; lo leen
;   p00:4480 (27 bytes)
;   0xa0d8..0xa0f3  (27 bytes)
DATA_rachas_A0D8:
	defb 087h,002h,00eh,01eh,03ch,0d8h,060h,020h,019h,000h,083h,0beh,0bfh,0beh,01dh,000h	; a0d8  ....<.` ........
	defb 087h,020h,060h,0d8h,03ch,01eh,00eh,002h,019h,000h,000h	; a0e8  . `.<......

; ----------------------------------------------------------------------
; DATOS rachas_A0F3: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p00:4480 (32 bytes)
;   0xa0f3..0xa113  (32 bytes)
DATA_rachas_A0F3:
	defb 088h,060h,070h,078h,03ch,01ch,00fh,006h,004h,018h,000h,081h,010h,005h,038h,082h	; a0f3  .`px<.........8.
	defb 010h,038h,018h,000h,088h,006h,00eh,01eh,03ch,038h,0f0h,060h,020h,018h,000h,000h	; a103  .8......<8.` ...

; ----------------------------------------------------------------------
; DATOS rachas_A113: rachas a la VRAM 0x18A0 (p00:4D16): la otra rama del `jr
;   nc` de p00:4835 (bit fase de 0x26), que el trazador no ve; lo leen
;   p00:4491 (15 bytes)
;   0xa113..0xa122  (15 bytes)
DATA_rachas_A113:
	defb 085h,060h,071h,0efh,071h,060h,00ch,000h,083h,080h,0e0h,080h,00ch,000h,000h	; a113  .`q.q`.........

; ----------------------------------------------------------------------
; DATOS rachas_A122: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p00:4491 (14 bytes)
;   0xa122..0xa130  (14 bytes)
DATA_rachas_A122:
	defb 002h,020h,002h,070h,003h,020h,084h,050h,0f8h,0f8h,020h,015h,000h,000h	; a122  . .p. .P.. ...

; ----------------------------------------------------------------------
; DATOS rachas_A130: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p00:4455 (21 bytes)
;   0xa130..0xa145  (21 bytes)
DATA_rachas_A130:
	defb 089h,080h,055h,036h,063h,008h,063h,036h,055h,080h,007h,000h,081h,080h,007h,000h	; a130  ..U6c.c6U.......
	defb 081h,080h,007h,000h,000h	; a140

; ----------------------------------------------------------------------
; DATOS fichas9_A145: 3 fichas de 9 bytes que p02:82C7 elige con B x 9 (la
;   tabla la da p02:831C: IY+20 = 1, en horizontal): un byte que va a IY+27
;   (ldi) y dos grupos de 4 que p02:8309 copia sumando IY+24 e IY+26 a los dos
;   primeros; lo leen p02:8326 (27 bytes)
;   0xa145..0xa160  (27 bytes)
DATA_fichas9_A145:
	defb 000h,000h,004h,000h,00fh,000h,000h,004h,005h	; a145  .........
	defb 001h,000h,004h,000h,00fh,000h,000h,004h,005h	; a14e  .........
	defb 002h,000h,004h,000h,00fh,000h,000h,004h,005h	; a157  .........

; ----------------------------------------------------------------------
; DATOS fichas9_A160: 4 fichas de 9 bytes que p02:82C7 elige con B x 9 (la
;   tabla la da p02:831C: IY+20 distinto de 1, en horizontal): un byte que va
;   a IY+27 (ldi) y dos grupos de 4 que p02:8309 copia sumando IY+24 e IY+26 a
;   los dos primeros; lo leen p02:832A (36 bytes)
;   0xa160..0xa184  (36 bytes)
DATA_fichas9_A160:
	defb 003h,000h,004h,000h,00fh,000h,000h,004h,005h	; a160  .........
	defb 004h,000h,004h,000h,00fh,000h,000h,004h,005h	; a169  .........
	defb 005h,000h,004h,000h,00fh,000h,000h,004h,005h	; a172  .........
	defb 006h,000h,004h,000h,00fh,000h,000h,004h,005h	; a17b  .........

; ----------------------------------------------------------------------
; DATOS fichas9_A184: 3 fichas de 9 bytes que p02:82C7 elige con B x 9 (la
;   tabla la da p02:831C: IY+20 = 1, en vertical (0xE620)): un byte que va a
;   IY+27 (ldi) y dos grupos de 4 que p02:8309 copia sumando IY+24 e IY+26 a
;   los dos primeros; lo leen p02:832F (27 bytes)
;   0xa184..0xa19f  (27 bytes)
DATA_fichas9_A184:
	defb 007h,000h,000h,000h,00fh,003h,000h,004h,005h	; a184  .........
	defb 008h,000h,000h,000h,00fh,003h,000h,004h,005h	; a18d  .........
	defb 009h,000h,000h,000h,00fh,003h,000h,004h,005h	; a196  .........

; ----------------------------------------------------------------------
; DATOS fichas9_A19F: 4 fichas de 9 bytes que p02:82C7 elige con B x 9 (la
;   tabla la da p02:831C: IY+20 distinto de 1, en vertical): un byte que va a
;   IY+27 (ldi) y dos grupos de 4 que p02:8309 copia sumando IY+24 e IY+26 a
;   los dos primeros; lo leen p02:8333 (36 bytes)
;   0xa19f..0xa1c3  (36 bytes)
DATA_fichas9_A19F:
	defb 00ah,000h,000h,000h,00fh,003h,000h,004h,005h	; a19f  .........
	defb 00bh,000h,000h,000h,00fh,003h,000h,004h,005h	; a1a8  .........
	defb 00ch,000h,000h,000h,00fh,003h,000h,004h,005h	; a1b1  .........
	defb 00dh,000h,000h,000h,00fh,003h,000h,004h,005h	; a1ba  .........

; ----------------------------------------------------------------------
; DATOS fichas17_A1C3: 3 fichas de 17 bytes que p02:8375 elige con A x 17 (la
;   tabla la da p02:83B3: IY+22 = 0, en horizontal): un byte (ldi) y cuatro
;   grupos de 4 de p02:8309; lo leen p02:83BE (51 bytes)
;   0xa1c3..0xa1f6  (51 bytes)
DATA_fichas17_A1C3:
	defb 080h,000h,000h,000h,00fh,000h,010h,004h,00fh,000h,004h,008h,002h,010h,000h,00ch,002h	; a1c3  .................
	defb 081h,000h,000h,000h,00fh,000h,010h,004h,00fh,000h,004h,008h,002h,010h,000h,00ch,002h	; a1d4  .................
	defb 082h,000h,000h,000h,00fh,000h,010h,004h,00fh,000h,004h,008h,002h,010h,000h,00ch,002h	; a1e5  .................

; ----------------------------------------------------------------------
; DATOS fichas17_A1F6: 3 fichas de 17 bytes que p02:8375 elige con A x 17 (la
;   tabla la da p02:83B3: IY+22 = 0, en vertical (0xE620)): un byte (ldi) y
;   cuatro grupos de 4 de p02:8309; lo leen p02:83C8 (51 bytes)
;   0xa1f6..0xa229  (51 bytes)
DATA_fichas17_A1F6:
	defb 083h,000h,000h,000h,00fh,010h,000h,004h,00fh,00bh,0f8h,008h,002h,00bh,008h,00ch,002h	; a1f6  .................
	defb 084h,000h,000h,000h,00fh,010h,000h,004h,00fh,00bh,000h,008h,002h,020h,000h,00ch,002h	; a207  ............. ...
	defb 085h,000h,000h,000h,00fh,010h,000h,004h,00fh,00bh,000h,008h,002h,020h,000h,00ch,002h	; a218  ............. ...

; ----------------------------------------------------------------------
; DATOS fichas17_A229: 4 fichas de 17 bytes que p02:8375 elige con A x 17 (la
;   tabla la da p02:83B3: IY+22 distinto de 0, en horizontal): un byte (ldi) y
;   cuatro grupos de 4 de p02:8309; lo leen p02:83C2 (68 bytes)
;   0xa229..0xa26d  (68 bytes)
DATA_fichas17_A229:
	defb 086h,000h,000h,000h,00fh,000h,010h,004h,00fh,000h,004h,008h,002h,000h,000h,00ch,000h	; a229  .................
	defb 087h,000h,000h,000h,00fh,000h,010h,004h,00fh,000h,004h,008h,002h,000h,000h,00ch,002h	; a23a  .................
	defb 088h,000h,000h,000h,00fh,000h,010h,004h,00fh,000h,004h,008h,002h,000h,000h,00ch,002h	; a24b  .................
	defb 089h,000h,000h,000h,00fh,000h,010h,004h,00fh,000h,004h,008h,002h,000h,000h,00ch,002h	; a25c  .................

; ----------------------------------------------------------------------
; DATOS fichas17_A26D: 4 fichas de 17 bytes que p02:8375 elige con A x 17 (la
;   tabla la da p02:83B3: IY+22 distinto de 0, en vertical): un byte (ldi) y
;   cuatro grupos de 4 de p02:8309; lo leen p02:83CC (68 bytes)
;   0xa26d..0xa2b1  (68 bytes)
DATA_fichas17_A26D:
	defb 08ah,000h,000h,000h,00fh,010h,000h,004h,00fh,00ch,0f8h,008h,002h,00ch,008h,00ch,002h	; a26d  .................
	defb 08bh,000h,000h,000h,00fh,010h,000h,004h,00fh,00ch,000h,008h,002h,020h,000h,00ch,002h	; a27e  ............. ...
	defb 08ch,000h,000h,000h,00fh,010h,000h,004h,00fh,00ch,000h,008h,002h,020h,000h,00ch,002h	; a28f  ............. ...
	defb 08dh,000h,000h,000h,00fh,010h,000h,004h,00fh,00ch,0f8h,008h,002h,00ch,008h,00ch,002h	; a2a0  .................

; ----------------------------------------------------------------------
; DATOS fichas_A2B1: 4 fichas de 17 bytes que p02:8375 elige con IY+38 < 4 (A
;   x 17): un byte (ldi) y cuatro grupos que copia p02:8309; lo leen p02:84F0
;   (68 bytes)
;   0xa2b1..0xa2f5  (68 bytes)
DATA_fichas_A2B1:
	defb 08eh,000h,000h,040h,008h,000h,000h,044h,00ah,010h,000h,048h,00fh,010h,010h,04ch,00fh	; a2b1  ...@...D...H...L.
	defb 08fh,000h,0f8h,040h,008h,000h,008h,044h,008h,000h,000h,048h,00ah,010h,010h,04ch,00fh	; a2c2  ...@...D...H...L.
	defb 090h,000h,0f8h,040h,008h,000h,008h,044h,008h,000h,000h,048h,00ah,010h,010h,04ch,00fh	; a2d3  ...@...D...H...L.
	defb 091h,000h,0f8h,040h,008h,000h,008h,044h,008h,000h,000h,048h,00ah,010h,010h,04ch,00fh	; a2e4  ...@...D...H...L.

; ----------------------------------------------------------------------
; DATOS valores_A2F5: 16 fichas de 4 bytes [lo hi][lo hi] que p02:8447 elige
;   con (IY+0F) & 0x0F (x 4); la ultima son los cuatro ceros con que empieza
;   0xA331; se solapan 2 bloques: (pares_A331 A331-A34D); lo leen p02:8454,
;   p00:488A (88 bytes)
;   0xa2f5..0xa34d  (88 bytes)
DATA_valores_A2F5:
	defb 000h,000h,000h,000h	; a2f5
	defb 080h,0ffh,000h,000h	; a2f9
	defb 080h,000h,000h,000h	; a2fd
	defb 000h,000h,000h,000h	; a301
	defb 000h,000h,080h,0ffh	; a305
	defb 080h,0ffh,080h,0ffh	; a309
	defb 080h,000h,080h,0ffh	; a30d
	defb 000h,000h,080h,0ffh	; a311
	defb 000h,000h,080h,000h	; a315
	defb 080h,0ffh,080h,000h	; a319
	defb 080h,000h,080h,000h	; a31d
	defb 000h,000h,080h,000h	; a321
	defb 000h,000h,000h,000h	; a325
	defb 080h,0ffh,000h,000h	; a329
	defb 080h,000h,000h,000h	; a32d
	defb 000h,000h,000h,000h	; a331
	defb 04dh,0a3h,06fh,0a3h	; a335
	defb 08fh,0a3h,0b1h,0a3h	; a339
	defb 0d3h,0a3h,0f5h,0a3h	; a33d
	defb 017h,0a4h,039h,0a4h	; a341
	defb 05bh,0a4h,07dh,0a4h	; a345
	defb 08fh,0a3h,09fh,0a4h	; a349

; ----------------------------------------------------------------------
; DATOS rachas3_A34D: rachas en los tres tercios (p00:4CE5) con los dibujos
;   (0x2120) de la ficha 1 de 0xA331; lo leen p00:4895 (34 bytes)
;   0xa34d..0xa36f  (34 bytes)
DATA_rachas3_A34D:
	defb 0a0h,00bh,020h,02fh,020h,023h,00bh,02bh,0ffh,0d0h,004h,0f4h,004h,0c4h,0d0h,0d4h	; a34d  .. / #.+........
	defb 000h,000h,02bh,00bh,023h,020h,02fh,020h,00bh,0ffh,0d4h,0d0h,0c4h,004h,0f4h,004h	; a35d  ..+.# / ........
	defb 0d0h,000h	; a36d

; ----------------------------------------------------------------------
; DATOS rachas3_A36F: rachas en los tres tercios (p00:4CE5) con los colores
;   (0x0120) de la ficha 1 de 0xA331; lo leen p00:4895 (32 bytes)
;   0xa36f..0xa38f  (32 bytes)
DATA_rachas3_A36F:
	defb 08bh,030h,0e0h,0f2h,0c0h,020h,030h,0e0h,000h,020h,0e0h,0fch,003h,0c0h,004h,0e0h	; a36f  .0... 0.. ......
	defb 088h,030h,020h,0c0h,0f2h,0e0h,030h,000h,0e0h,003h,0c0h,083h,0fch,0e0h,020h,000h	; a37f  .0 ...0....... .

; ----------------------------------------------------------------------
; DATOS rachas3_A38F: rachas en los tres tercios (p00:4CE5) con los dibujos
;   (0x2120) de la ficha 2 de 0xA331; lo leen p00:4895 (34 bytes)
;   0xa38f..0xa3b1  (34 bytes)
DATA_rachas3_A38F:
	defb 0a0h,005h,01bh,027h,058h,001h,003h,031h,078h,0a0h,0d8h,0e4h,01ah,080h,0c0h,08ch	; a38f  ...'X..1x.......
	defb 01eh,031h,003h,001h,058h,027h,01bh,005h,0ffh,08ch,0c0h,080h,01ah,0e4h,0d8h,0a0h	; a39f  .1..X'..........
	defb 000h,000h	; a3af

; ----------------------------------------------------------------------
; DATOS rachas3_A3B1: rachas en los tres tercios (p00:4CE5) con los colores
;   (0x0120) de la ficha 2 de 0xA331; lo leen p00:4895 (34 bytes)
;   0xa3b1..0xa3d3  (34 bytes)
DATA_rachas3_A3B1:
	defb 0a0h,0f0h,080h,090h,0f0h,090h,0a0h,090h,0a0h,0f0h,080h,090h,0f0h,090h,0a0h,090h	; a3b1  ................
	defb 0a0h,090h,0a0h,090h,0f0h,090h,080h,0f0h,000h,090h,0a0h,090h,0f0h,090h,080h,0f0h	; a3c1  ................
	defb 0f0h,000h	; a3d1

; ----------------------------------------------------------------------
; DATOS rachas3_A3D3: rachas en los tres tercios (p00:4CE5) con los dibujos
;   (0x2120) de la ficha 3 de 0xA331; lo leen p00:4895 (34 bytes)
;   0xa3d3..0xa3f5  (34 bytes)
DATA_rachas3_A3D3:
	defb 0a0h,001h,01bh,0bbh,076h,034h,039h,073h,077h,080h,0d8h,0ddh,05ah,02ah,09ch,0cch	; a3d3  ....v49sw...Z*..
	defb 0eeh,077h,073h,039h,034h,076h,0bbh,01bh,001h,0eeh,0cch,09ch,02ah,05ah,0ddh,0d8h	; a3e3  .ws94v......*Z..
	defb 080h,000h	; a3f3

; ----------------------------------------------------------------------
; DATOS rachas3_A3F5: rachas en los tres tercios (p00:4CE5) con los colores
;   (0x0120) de la ficha 3 de 0xA331; lo leen p00:4895 (34 bytes)
;   0xa3f5..0xa417  (34 bytes)
DATA_rachas3_A3F5:
	defb 0a0h,0f0h,0a0h,0f0h,0e0h,0a0h,0a0h,0b0h,0f0h,0f0h,0a0h,0f0h,0e0h,0b0h,0a0h,0b0h	; a3f5  ................
	defb 0f0h,0e0h,0b0h,0a0h,0a0h,0e0h,0f0h,0a0h,0f0h,0e0h,0b0h,0a0h,0b0h,0e0h,0f0h,0a0h	; a405  ................
	defb 0f0h,000h	; a415

; ----------------------------------------------------------------------
; DATOS rachas3_A417: rachas en los tres tercios (p00:4CE5) con los dibujos
;   (0x2120) de la ficha 4 de 0xA331; lo leen p00:4895 (34 bytes)
;   0xa417..0xa439  (34 bytes)
DATA_rachas3_A417:
	defb 0a0h,00bh,037h,09fh,0e0h,001h,018h,01ch,03bh,0d0h,0ech,0f9h,007h,0c0h,080h,078h	; a417  ..7............x
	defb 0fch,01ch,018h,001h,0e0h,09fh,037h,00bh,000h,078h,080h,0c0h,007h,0f9h,0ech,0d0h	; a427  ......7..x......
	defb 000h,000h	; a437

; ----------------------------------------------------------------------
; DATOS rachas3_A439: rachas en los tres tercios (p00:4CE5) con los colores
;   (0x0120) de la ficha 4 de 0xA331; lo leen p00:4895 (34 bytes)
;   0xa439..0xa45b  (34 bytes)
DATA_rachas3_A439:
	defb 0a0h,070h,0f0h,040h,050h,050h,0f0h,070h,0f0h,070h,0f0h,040h,050h,040h,040h,0f0h	; a439  .p.@PP.p.p.@P@@.
	defb 0f0h,070h,050h,050h,050h,040h,0f0h,070h,070h,070h,040h,040h,050h,040h,0f0h,070h	; a449  .pPPP@.ppp@@P@.p
	defb 050h,000h	; a459

; ----------------------------------------------------------------------
; DATOS rachas3_A45B: rachas en los tres tercios (p00:4CE5) con los dibujos
;   (0x2120) de la ficha 5 de 0xA331; lo leen p00:4895 (34 bytes)
;   0xa45b..0xa47d  (34 bytes)
DATA_rachas3_A45B:
	defb 0a0h,081h,045h,031h,098h,040h,006h,03eh,001h,081h,0a2h,08ch,019h,002h,060h,07ch	; a45b  ..E1.@.>......`|
	defb 080h,001h,03eh,006h,040h,098h,031h,045h,081h,080h,07ch,060h,002h,019h,08ch,0a2h	; a46b  ..>.@.1E..|`....
	defb 081h,000h	; a47b

; ----------------------------------------------------------------------
; DATOS rachas3_A47D: rachas en los tres tercios (p00:4CE5) con los colores
;   (0x0120) de la ficha 5 de 0xA331; lo leen p00:4895 (34 bytes)
;   0xa47d..0xa49f  (34 bytes)
DATA_rachas3_A47D:
	defb 0a0h,0e0h,0f4h,0f5h,0e0h,0f0h,070h,050h,0f5h,0e0h,0f4h,0f5h,0e0h,0f0h,0b0h,090h	; a47d  ......pP........
	defb 0f9h,0e4h,040h,050h,0f0h,0e0h,0f5h,0f4h,0e0h,0e8h,080h,090h,0f0h,0e0h,0f5h,0f4h	; a48d  ..@P............
	defb 0e0h,000h	; a49d

; ----------------------------------------------------------------------
; DATOS rachas3_A49F: rachas en los tres tercios (p00:4CE5) con los colores
;   (0x0120) de la ficha 6 de 0xA331; lo leen p00:4895 (34 bytes)
;   0xa49f..0xa4c1  (34 bytes)
DATA_rachas3_A49F:
	defb 0a0h,0f0h,040h,0c0h,0f0h,0c0h,030h,0c0h,030h,0f0h,040h,0c0h,0f0h,0c0h,030h,0c0h	; a49f  ..@...0.0.@...0.
	defb 030h,0c0h,030h,0c0h,0f0h,0c0h,040h,0f0h,0f0h,0c0h,030h,0c0h,0f0h,0c0h,040h,0f0h	; a4af  0.0...@...0...@.
	defb 0f0h,000h	; a4bf

; ----------------------------------------------------------------------
; DATOS caracteres_menu: 6 punteros (0xE63A & 0x0F = 1 a 6; tabla en 0xA4BF +
;   2 x A): las listas de caracteres de p10:8107; lo leen p10:810C (12 bytes)
;   0xa4c1..0xa4cd  (12 bytes)
DATA_caracteres_menu:
	defw 0a4e5h,0a4f5h,0a505h,0a53dh,0a55ch,0a567h	; a4c1

; ----------------------------------------------------------------------
; DATOS copias_menu_A4CB: 6 punteros (0xE63A & 0x0F = 1 a 6; tabla en 0xA4CB +
;   2 x A): las listas de copias de p00:44F3; lo leen p10:80F2 (12 bytes)
;   0xa4cd..0xa4d9  (12 bytes)
DATA_copias_menu_A4CB:
	defw 0a56dh,0a56dh,0a572h,0a57fh,0a584h,0a589h	; a4cd

; ----------------------------------------------------------------------
; DATOS copias_menu_A4D7: 6 punteros (0xE63A & 0x0F = 1 a 6; tabla en 0xA4D7 +
;   2 x A): las listas de copias de p00:44F3; lo leen p10:8101 (12 bytes)
;   0xa4d9..0xa4e5  (12 bytes)
DATA_copias_menu_A4D7:
	defw 0a592h,0a592h,0a593h,0a59ch,0a5a9h,0a5a1h	; a4d9

; ----------------------------------------------------------------------
; DATOS caracteres5_A4E5: lista de caracteres de p10:8107 (0xE63A & 0x0F = 1):
;   fichas de 5 bytes [dibujos][caracter][colores], 0 acaba; los tercios, de
;   los bits 4-6 de B; lo leen p10:810C (16 bytes)
;   0xa4e5..0xa4f5  (16 bytes)
DATA_caracteres5_A4E5:
	defb 0eeh,0b0h,001h,0e8h,0b3h	; a4e5
	defb 057h,0b1h,010h,0ffh,0b2h	; a4ea
	defb 0cch,0b2h,040h,025h,0b4h	; a4ef
	defb 000h	; a4f4

; ----------------------------------------------------------------------
; DATOS caracteres5_A4F5: lista de caracteres de p10:8107 (0xE63A & 0x0F = 2):
;   fichas de 5 bytes [dibujos][caracter][colores], 0 acaba; los tercios, de
;   los bits 4-6 de B; lo leen p10:810C (16 bytes)
;   0xa4f5..0xa505  (16 bytes)
DATA_caracteres5_A4F5:
	defb 0eeh,0b0h,001h,0e8h,0b3h	; a4f5
	defb 04dh,0b4h,010h,0dah,0b6h	; a4fa
	defb 0deh,0b2h,067h,033h,0b4h	; a4ff
	defb 000h	; a504

; ----------------------------------------------------------------------
; DATOS caracteres5_A505: lista de caracteres de p10:8107 (0xE63A & 0x0F = 3):
;   fichas de 5 bytes [dibujos][caracter][colores], 0 acaba; los tercios, de
;   los bits 4-6 de B; lo leen p10:810C, p10:8009 (56 bytes)
;   0xa505..0xa53d  (56 bytes)
DATA_caracteres5_A505:
	defb 0f8h,0b7h,001h,0e5h,0bah	; a505
	defb 0f8h,0b7h,006h,005h,0bbh	; a50a
	defb 01eh,0b8h,010h,027h,0bbh	; a50f
	defb 045h,0b9h,040h,002h,0bch	; a514
	defb 02ch,0adh,080h,0e1h,0adh	; a519
	defb 056h,0adh,098h,001h,0aeh	; a51e
	defb 09dh,0adh,0a4h,023h,0aeh	; a523
	defb 056h,0adh,0b6h,073h,0aeh	; a528
	defb 0d7h,0adh,0b3h,055h,0aeh	; a52d
	defb 0d7h,0adh,0b4h,05fh,0aeh	; a532
	defb 0d7h,0adh,0b5h,069h,0aeh	; a537
	defb 000h	; a53c

; ----------------------------------------------------------------------
; DATOS caracteres5_A53D: lista de caracteres de p10:8107 (0xE63A & 0x0F = 4):
;   fichas de 5 bytes [dibujos][caracter][colores], 0 acaba; los tercios, de
;   los bits 4-6 de B; lo leen p10:810C (31 bytes)
;   0xa53d..0xa55c  (31 bytes)
DATA_caracteres5_A53D:
	defb 0f8h,0b7h,001h,0e5h,0bah	; a53d
	defb 0f8h,0b7h,006h,005h,0bbh	; a542
	defb 01eh,0b8h,010h,027h,0bbh	; a547
	defb 045h,0b9h,040h,002h,0bch	; a54c
	defb 093h,0bah,071h,009h,0bdh	; a551
	defb 027h,0abh,091h,045h,0ach	; a556
	defb 000h	; a55b

; ----------------------------------------------------------------------
; DATOS caracteres5_A55C: lista de caracteres de p10:8107 (0xE63A & 0x0F = 5):
;   fichas de 5 bytes [dibujos][caracter][colores], 0 acaba; los tercios, de
;   los bits 4-6 de B; lo leen p10:810C (11 bytes)
;   0xa55c..0xa567  (11 bytes)
DATA_caracteres5_A55C:
	defb 0aah,0a5h,051h,078h,0a8h	; a55c
	defb 055h,0bdh,0c1h,0c4h,0beh	; a561
	defb 000h	; a566

; ----------------------------------------------------------------------
; DATOS caracteres5_A567: lista de caracteres de p10:8107 (0xE63A & 0x0F = 6):
;   fichas de 5 bytes [dibujos][caracter][colores], 0 acaba; los tercios, de
;   los bits 4-6 de B; lo leen p10:810C (6 bytes)
;   0xa567..0xa56d  (6 bytes)
DATA_caracteres5_A567:
	defb 092h,0aeh,010h,0d4h,0afh	; a567
	defb 000h	; a56c

; ----------------------------------------------------------------------
; DATOS copias_A56D: lista de copias VRAM -> VRAM en espejo (0xF000 = 0)
;   (p00:44F3) con 0xE63A & 0x0F = 1, 2; lo leen p10:80F2 (5 bytes)
;   0xa56d..0xa572  (5 bytes)
DATA_copias_A56D:
	defb 001h,00eh,000h,002h	; a56d
	defb 000h	; a571

; ----------------------------------------------------------------------
; DATOS copias_A572: lista de copias VRAM -> VRAM en espejo (0xF000 = 0)
;   (p00:44F3) con 0xE63A & 0x0F = 3; lo leen p10:80F2, p10:800F (13 bytes)
;   0xa572..0xa57f  (13 bytes)
DATA_copias_A572:
	defb 080h,086h,000h,006h	; a572
	defb 098h,0a2h,000h,002h	; a576
	defb 0b5h,0c0h,000h,002h	; a57a
	defb 000h	; a57e

; ----------------------------------------------------------------------
; DATOS copias_A57F: lista de copias VRAM -> VRAM en espejo (0xF000 = 0)
;   (p00:44F3) con 0xE63A & 0x0F = 4; lo leen p10:80F2 (5 bytes)
;   0xa57f..0xa584  (5 bytes)
DATA_copias_A57F:
	defb 091h,0c1h,000h,028h	; a57f
	defb 000h	; a583

; ----------------------------------------------------------------------
; DATOS copias_A584: lista de copias VRAM -> VRAM en espejo (0xF000 = 0)
;   (p00:44F3) con 0xE63A & 0x0F = 5; lo leen p10:80F2 (5 bytes)
;   0xa584..0xa589  (5 bytes)
DATA_copias_A584:
	defb 062h,087h,000h,025h	; a584
	defb 000h	; a588

; ----------------------------------------------------------------------
; DATOS copias_A589: lista de copias VRAM -> VRAM en espejo (0xF000 = 0)
;   (p00:44F3) con 0xE63A & 0x0F = 6; lo leen p10:80F2 (9 bytes)
;   0xa589..0xa592  (9 bytes)
DATA_copias_A589:
	defb 010h,040h,000h,029h	; a589
	defb 02eh,069h,000h,003h	; a58d
	defb 000h	; a591

; ----------------------------------------------------------------------
; DATOS copias_A592: lista de copias VRAM -> VRAM cabeza abajo (0xF000 = 1)
;   (p00:44F3) con 0xE63A & 0x0F = 1, 2; lo leen p10:8101 (1 bytes)
;   0xa592..0xa593  (1 bytes)
DATA_copias_A592:
	defb 000h	; a592

; ----------------------------------------------------------------------
; DATOS copias_A593: lista de copias VRAM -> VRAM cabeza abajo (0xF000 = 1)
;   (p00:44F3) con 0xE63A & 0x0F = 3; lo leen p10:8101, p10:8015 (9 bytes)
;   0xa593..0xa59c  (9 bytes)
DATA_copias_A593:
	defb 080h,08ch,000h,006h	; a593
	defb 086h,092h,000h,006h	; a597
	defb 000h	; a59b

; ----------------------------------------------------------------------
; DATOS copias_A59C: lista de copias VRAM -> VRAM cabeza abajo (0xF000 = 1)
;   (p00:44F3) con 0xE63A & 0x0F = 4; lo leen p10:8101 (5 bytes)
;   0xa59c..0xa5a1  (5 bytes)
DATA_copias_A59C:
	defb 071h,07bh,000h,00ah	; a59c
	defb 000h	; a5a0

; ----------------------------------------------------------------------
; DATOS copias_A5A1: lista de copias VRAM -> VRAM cabeza abajo (0xF000 = 1)
;   (p00:44F3) con 0xE63A & 0x0F = 6; se solapan 2 bloques: (copias_A5A9
;   A5A9-A5AA); lo leen p10:8101 (9 bytes)
;   0xa5a1..0xa5aa  (9 bytes)
DATA_copias_A5A1:
	defb 02eh,039h,000h,003h	; a5a1
	defb 069h,069h,000h,003h	; a5a5
	defb 000h	; a5a9

; ----------------------------------------------------------------------
; DATOS dibujos_A5AA: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 81, ficha 0 de la lista 0xA55C (p10:8107); lo leen
;   p10:8107 (718 bytes)
;   0xa5aa..0xa878  (718 bytes)
DATA_dibujos_A5AA:
	defb 0e0h,07ah,09ch,0feh,07eh,01fh,03eh,0feh,0feh,05fh,03ch,050h,097h,0bch,03ch,07fh	; a5aa  .z..~.>.._<P..<.
	defb 07fh,03fh,07bh,0f3h,03bh,017h,07fh,07eh,01fh,0fch,0f9h,0ffh,0feh,008h,083h,0ffh	; a5ba  .?{....~........
	defb 0cbh,000h,01fh,001h,000h,000h,088h,042h,0a5h,0ffh,0ffh,0f0h,0c0h,003h,010h,085h	; a5ca  .......B........
	defb 04bh,0bfh,0dfh,0ffh,043h,041h,0c3h,0ffh,0e7h,02fh,027h,013h,021h,028h,008h,014h	; a5da  K...CA.../'.!(..
	defb 09ah,0e0h,0e0h,0c0h,080h,010h,010h,028h,059h,0feh,0feh,07ch,07eh,0feh,000h,000h	; a5ea  .......(Y..|~...
	defb 040h,083h,081h,07eh,083h,03ch,018h,0c9h,062h,080h,03fh,0c1h,000h,07eh,018h,052h	; a5fa  @..~.<..b.?..~.R
	defb 0a5h,003h,080h,002h,0c0h,09bh,040h,0e0h,060h,005h,005h,00dh,002h,00ah,005h,002h	; a60a  ......@.`.......
	defb 028h,0f0h,078h,028h,03ah,014h,00ah,000h,014h,0a0h,060h,020h,080h,068h,036h,03bh	; a61a  (.x(:.....` .h6.
	defb 03bh,003h,000h,087h,001h,016h,06ch,0dch,0dch,003h,003h,003h,007h,0c8h,006h,005h	; a62a  ......l.........
	defb 00fh,0efh,0ffh,0f7h,0f3h,0f9h,00ch,0c6h,0f3h,07fh,0c7h,0e3h,0f9h,0f1h,078h,014h	; a63a  ..............x.
	defb 0c0h,0f3h,0feh,0feh,0d8h,0feh,05ch,000h,001h,07fh,03fh,01fh,00fh,00fh,006h,040h	; a64a  ......\...?....@
	defb 0f4h,0beh,09ch,09ch,099h,011h,032h,048h,01ch,0b0h,0d8h,0d8h,0d0h,098h,028h,02ch	; a65a  ......2H......(,
	defb 04ch,00fh,00fh,00eh,00eh,00ch,00dh,00fh,00bh,0feh,08fh,005h,058h,0feh,0e1h,0c0h	; a66a  L...........X...
	defb 08fh,003h,003h,002h,003h,003h,003h,001h,002h,00fh,082h,006h,007h,003h,005h,09ch	; a67a  ................
	defb 006h,05ch,014h,028h,048h,028h,094h,0a4h,088h,03ch,071h,0c3h,09ah,0bch,024h,076h	; a68a  .\.(H(...<q...$v
	defb 05ah,028h,003h,087h,00fh,00fh,047h,08fh,03fh,07dh,0f7h,07fh,005h,0ffh,0a5h,0fdh	; a69a  Z(....G.?}......
	defb 0feh,0feh,0fch,0f5h,000h,00fh,01fh,0eeh,0f6h,000h,0f7h,0f7h,0f0h,0fch,0feh,07fh	; a6aa  ................
	defb 07fh,0ffh,0fdh,0feh,0ffh,0ffh,07fh,098h,0b0h,090h,020h,090h,0a0h,0a0h,080h,09fh	; a6ba  .......... .....
	defb 07fh,01fh,03fh,07fh,003h,0feh,08dh,073h,069h,039h,033h,099h,09dh,04fh,046h,07fh	; a6ca  ..?....si93..OF.
	defb 07fh,000h,000h,0c0h,003h,080h,082h,0ffh,07fh,004h,03fh,003h,07fh,002h,03fh,002h	; a6da  ..........?...?.
	defb 09fh,002h,0cfh,093h,0c7h,0ffh,002h,003h,001h,001h,0ffh,0feh,0f4h,07fh,07fh,03fh	; a6ea  ...............?
	defb 03fh,00fh,001h,000h,080h,0feh,0feh,003h,0fch,002h,0f8h,081h,0f0h,005h,0ffh,099h	; a6fa  ?...............
	defb 0fch,000h,000h,063h,061h,030h,080h,040h,030h,08ch,063h,090h,08ch,01ch,09ch,09eh	; a70a  ...ca0.@0.c.....
	defb 08eh,0cfh,038h,034h,032h,03bh,079h,074h,067h,003h,077h,0a1h,037h,027h,017h,00fh	; a71a  ..842.ytg.w.7'..
	defb 007h,003h,080h,0f8h,07eh,03eh,00eh,050h,0a0h,0a0h,050h,070h,00fh,0f0h,0fdh,007h	; a72a  ....~>.P..Pp....
	defb 0f2h,02ah,092h,001h,0ffh,000h,0fdh,003h,0fah,022h,08ah,098h,038h,003h,0f8h,08dh	; a73a  .*......."..8...
	defb 068h,050h,050h,0a0h,0dah,00dh,043h,04ch,04fh,04dh,060h,0c0h,0c0h,003h,0e0h,0c8h	; a74a  hPP...CLOM`.....
	defb 060h,0a0h,0f0h,0f7h,0ffh,0efh,0cfh,09fh,030h,063h,0cfh,0feh,0e3h,0c7h,09fh,08fh	; a75a  `.......0c......
	defb 01eh,028h,003h,0cfh,07fh,07fh,01bh,07fh,03ah,000h,080h,0feh,0fch,0f8h,0f0h,0f0h	; a76a  .(......:.......
	defb 060h,002h,02fh,07dh,039h,039h,099h,088h,04ch,012h,038h,00dh,01bh,01bh,00bh,019h	; a77a  `./}99..L.8.....
	defb 014h,034h,032h,0f0h,0f0h,070h,070h,030h,0b0h,0f0h,0d0h,07fh,0f1h,0a0h,01ah,07fh	; a78a  .42..pp0........
	defb 087h,003h,0f1h,0c0h,0c0h,040h,0c0h,0c0h,003h,080h,002h,0f0h,082h,060h,0e0h,003h	; a79a  .....@.......`..
	defb 0a0h,09ch,060h,03ah,028h,014h,012h,014h,029h,025h,011h,03ch,08eh,0c3h,059h,03dh	; a7aa  ..`:(...)%.<..Y=
	defb 024h,06eh,05ah,014h,0c0h,0e1h,0f0h,0f0h,0e2h,0f1h,0fch,0beh,0efh,0feh,005h,0ffh	; a7ba  $nZ.............
	defb 0a5h,0bfh,07fh,07fh,03fh,0afh,0ffh,0f0h,0f8h,077h,06fh,000h,0efh,0efh,00fh,03fh	; a7ca  ....?....wo....?
	defb 07fh,0feh,0feh,0ffh,0bfh,07fh,0ffh,0ffh,0feh,019h,00dh,009h,004h,009h,005h,005h	; a7da  ................
	defb 001h,0f9h,0feh,0f8h,0fch,0feh,003h,07fh,08dh,0ceh,096h,09ch,0cch,099h,0b9h,0f2h	; a7ea  ................
	defb 062h,0feh,0feh,000h,000h,003h,003h,001h,082h,0ffh,0feh,004h,0fch,003h,0feh,002h	; a7fa  b...............
	defb 0fch,002h,0f9h,002h,0f3h,093h,0e3h,000h,040h,0c0h,080h,080h,000h,07fh,02fh,0feh	; a80a  ........@...../.
	defb 0feh,0fch,0fch,0f0h,080h,000h,001h,07fh,07fh,003h,03fh,002h,01fh,081h,00fh,005h	; a81a  ..........?.....
	defb 0ffh,099h,03fh,000h,000h,0c6h,086h,00ch,001h,002h,00ch,031h,0c6h,009h,031h,038h	; a82a  ..?........1..18
	defb 039h,079h,071h,0f3h,01ch,02ch,04ch,0dch,09eh,02eh,0e6h,003h,0eeh,0a1h,0ech,0e4h	; a83a  9yq..,L.........
	defb 0e8h,0f0h,0e0h,0c0h,001h,01fh,07eh,07ch,070h,00ah,005h,005h,00ah,00eh,0f0h,00fh	; a84a  ......~|p.......
	defb 0bfh,0e0h,04fh,054h,049h,080h,0ffh,000h,0bfh,0c0h,05fh,044h,051h,019h,01ch,003h	; a85a  ..OTI....._DQ...
	defb 01fh,08bh,016h,00ah,00ah,005h,05bh,0b0h,0c2h,032h,0f2h,0b2h,006h,000h	; a86a  ......[..2....

; ----------------------------------------------------------------------
; DATOS colores_A878: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 81, ficha 0 de la lista 0xA55C (p10:8107); lo leen
;   p10:8107 (502 bytes)
;   0xa878..0xaa6e  (502 bytes)
DATA_colores_A878:
	defb 002h,0a6h,009h,0a0h,081h,090h,004h,0a0h,003h,0bah,002h,0b0h,002h,0a0h,081h,0bah	; a878  ................
	defb 003h,0b0h,088h,0a9h,0a0h,0bah,0b0h,0b0h,0bah,0a0h,0a0h,004h,0f0h,081h,090h,004h	; a888  ................
	defb 0b0h,084h,090h,0f0h,0f0h,0a0h,003h,0b0h,083h,0b9h,0b0h,0b9h,006h,0b0h,004h,0f0h	; a898  ................
	defb 004h,0b0h,004h,0f0h,085h,0bah,0b6h,0b6h,0b9h,0b0h,003h,0fbh,090h,0bah,0a6h,096h	; a8a8  ................
	defb 090h,040h,0e4h,0f4h,0a5h,0a6h,098h,090h,040h,040h,0e4h,0f4h,0b5h,00fh,080h,081h	; a8b8  .@......@@......
	defb 040h,007h,080h,084h,040h,090h,080h,090h,003h,0e0h,082h,050h,040h,005h,0e0h,002h	; a8c8  @...@......P@...
	defb 050h,081h,040h,005h,090h,003h,080h,003h,090h,005h,080h,083h,090h,080h,090h,005h	; a8d8  P.@.............
	defb 080h,002h,090h,082h,080h,098h,003h,080h,003h,090h,084h,080h,090h,080h,080h,004h	; a8e8  ................
	defb 090h,004h,080h,006h,090h,002h,080h,08ah,090h,080h,090h,090h,080h,080h,090h,090h	; a8f8  ................
	defb 080h,090h,003h,080h,081h,090h,004h,080h,081h,090h,009h,080h,083h,090h,080h,090h	; a908  ................
	defb 008h,080h,083h,090h,0a0h,0a0h,003h,080h,003h,090h,083h,0a0h,090h,080h,003h,090h	; a918  ................
	defb 086h,0a0h,090h,0a0h,0a0h,090h,090h,006h,0a9h,081h,090h,004h,0a0h,003h,0bah,085h	; a928  ................
	defb 090h,0a0h,0bah,0a0h,0a0h,006h,0bah,082h,0b9h,0b0h,003h,0bah,002h,0b0h,088h,0a0h	; a938  ................
	defb 090h,0a0h,0a0h,090h,0a0h,0a9h,0a9h,003h,0bah,003h,0b0h,085h,0a0h,0b0h,0a0h,0b0h	; a948  ................
	defb 0a0h,003h,0b0h,002h,0a0h,00eh,0bah,008h,0a0h,081h,0b0h,004h,0fbh,003h,0b0h,003h	; a958  ................
	defb 0bah,004h,0b0h,081h,0e0h,010h,0b0h,002h,0a0h,081h,090h,005h,0e0h,088h,040h,050h	; a968  ..............@P
	defb 050h,040h,040h,050h,040h,0b4h,010h,040h,081h,050h,003h,054h,004h,0c4h,088h,0e0h	; a978  P@@P@..@.P.T....
	defb 0f0h,050h,050h,0c5h,050h,084h,040h,003h,0f0h,085h,0e0h,0c0h,0e0h,095h,040h,007h	; a988  .PP.P.@.......@.
	defb 0e0h,089h,050h,0f0h,0e0h,0e0h,050h,040h,040h,050h,0b4h,005h,090h,003h,080h,003h	; a998  ..P...P@@P......
	defb 090h,005h,080h,083h,090h,080h,090h,005h,080h,002h,090h,082h,080h,098h,003h,080h	; a9a8  ................
	defb 003h,090h,084h,080h,090h,080h,080h,004h,090h,004h,080h,006h,090h,002h,080h,08ah	; a9b8  ................
	defb 090h,080h,090h,090h,080h,080h,090h,090h,080h,090h,003h,080h,081h,090h,004h,080h	; a9c8  ................
	defb 081h,090h,009h,080h,083h,090h,080h,090h,008h,080h,083h,090h,0a0h,0a0h,003h,080h	; a9d8  ................
	defb 003h,090h,083h,0a0h,090h,080h,003h,090h,086h,0a0h,090h,0a0h,0a0h,090h,090h,006h	; a9e8  ................
	defb 0a9h,081h,090h,005h,0a0h,002h,0bah,085h,090h,0a0h,0bah,0a0h,0a0h,006h,0bah,082h	; a9f8  ................
	defb 0b9h,0b0h,003h,0bah,002h,0b0h,088h,0a0h,090h,0a0h,0a0h,090h,0a0h,0a9h,0a9h,003h	; aa08  ................
	defb 0bah,003h,0b0h,085h,0a0h,0b0h,0a0h,0b0h,0a0h,003h,0b0h,002h,0a0h,00eh,0bah,008h	; aa18  ................
	defb 0a0h,006h,0fbh,002h,0b0h,003h,0bah,004h,0b0h,081h,0e0h,008h,0b0h,002h,0bah,006h	; aa28  ................
	defb 0b0h,002h,0a0h,081h,090h,005h,0e0h,088h,040h,050h,050h,040h,040h,050h,040h,0b4h	; aa38  ........@PP@@P@.
	defb 010h,040h,081h,050h,003h,054h,004h,0c4h,088h,0e0h,0f0h,050h,050h,0c5h,050h,084h	; aa48  .@.P.T.....PP.P.
	defb 040h,003h,0f0h,085h,0e0h,0c0h,0e0h,095h,040h,007h,0e0h,089h,050h,0f0h,0e0h,0e0h	; aa58  @.......@...P...
	defb 050h,040h,040h,050h,0b4h,000h	; aa68

; ----------------------------------------------------------------------
; DATOS rachas_AA6E: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p10:9966, p10:996F, p10:9978 (31 bytes)
;   0xaa6e..0xaa8d  (31 bytes)
DATA_rachas_AA6E:
	defb 002h,001h,004h,003h,002h,001h,006h,000h,08ch,03ch,0fah,06ch,090h,042h,010h,044h	; aa6e  .........<.l.B.D
	defb 0feh,0f8h,045h,080h,080h,004h,0c0h,002h,080h,082h,0ffh,03ch,006h,000h,000h	; aa7e  ..E........<...

; ----------------------------------------------------------------------
; DATOS rachas_AA8D: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p10:9981 (54 bytes)
;   0xaa8d..0xaac3  (54 bytes)
DATA_rachas_AA8D:
	defb 003h,000h,002h,0cch,005h,000h,08dh,03ch,00fh,0fch,03fh,05ch,000h,018h,00eh,05ch	; aa8d  .......<..?\...\
	defb 0b3h,018h,0dch,060h,003h,000h,083h,007h,01fh,00fh,004h,000h,086h,012h,0bch,02eh	; aa9d  ...`............
	defb 0f4h,070h,018h,003h,000h,085h,002h,01fh,07dh,00eh,002h,002h,000h,087h,080h,0e0h	; aaad  .p......}.......
	defb 0f8h,0feh,0f8h,0e0h,080h,000h	; aabd

; ----------------------------------------------------------------------
; DATOS rachas_AAC3: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p10:998A (19 bytes)
;   0xaac3..0xaad6  (19 bytes)
DATA_rachas_AAC3:
	defb 004h,090h,082h,080h,090h,008h,060h,081h,090h,006h,098h,003h,086h,082h,060h,080h	; aac3  ......`.......`.
	defb 00eh,060h,000h	; aad3

; ----------------------------------------------------------------------
; DATOS rachas_AAD6: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p10:9993 (19 bytes)
;   0xaad6..0xaae9  (19 bytes)
DATA_rachas_AAD6:
	defb 004h,070h,082h,050h,070h,008h,040h,081h,070h,006h,075h,003h,054h,082h,040h,050h	; aad6  .p.Pp.@.p.u.T.@P
	defb 00eh,040h,000h	; aae6

; ----------------------------------------------------------------------
; DATOS rachas_AAE9: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p10:999C (19 bytes)
;   0xaae9..0xaafc  (19 bytes)
DATA_rachas_AAE9:
	defb 004h,0b0h,082h,0a0h,0b0h,008h,090h,081h,0b0h,006h,0bah,003h,0a9h,082h,090h,0a0h	; aae9  ................
	defb 00eh,090h,000h	; aaf9

; ----------------------------------------------------------------------
; DATOS rachas_AAFC: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p10:99A5 (43 bytes)
;   0xaafc..0xab27  (43 bytes)
DATA_rachas_AAFC:
	defb 004h,080h,004h,060h,003h,0a0h,082h,0b0h,0bah,003h,090h,002h,0b0h,083h,0a0h,0a9h	; aafc  ...`............
	defb 0a9h,003h,0a0h,003h,0c0h,081h,030h,004h,0c0h,003h,030h,082h,0c3h,0c0h,003h,030h	; ab0c  ......0...0....0
	defb 003h,070h,085h,050h,070h,040h,070h,030h,008h,0f0h,000h	; ab1c  .p.Pp@p0...

; ----------------------------------------------------------------------
; DATOS dibujos_AB27: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 145, ficha 5 de la lista 0xA53D (p10:8107); lo leen
;   p10:8107 (286 bytes)
;   0xab27..0xac45  (286 bytes)
DATA_dibujos_AB27:
	defb 0a8h,080h,0f2h,000h,0ffh,000h,000h,080h,0edh,000h,0fch,03fh,000h,020h,0cah,02ah	; ab27  ...........?. .*
	defb 000h,000h,080h,001h,0fbh,000h,006h,000h,0ffh,0c0h,030h,0bch,000h,008h,000h,042h	; ab37  ..........0....B
	defb 063h,000h,000h,010h,000h,090h,012h,060h,065h,004h,000h,0a7h,0c0h,030h,00ch,087h	; ab47  c......`e....0..
	defb 078h,000h,000h,042h,05ah,042h,05ah,002h,000h,0ffh,003h,074h,003h,0f0h,000h,0feh	; ab57  x..BZBZ....t....
	defb 0ffh,0ffh,03fh,00fh,003h,03ch,00fh,003h,0fbh,0fbh,0f8h,0e3h,0ebh,0e3h,03bh,0c0h	; ab67  ..?..<..........
	defb 0ffh,0ffh,0f8h,003h,07fh,093h,083h,000h,0f2h,06dh,06fh,003h,078h,084h,030h,084h	; ab77  .........mo.x.0.
	defb 00ah,0a2h,0d2h,068h,034h,018h,00ch,007h,0fbh,004h,0ffh,094h,0fbh,03bh,0c0h,000h	; ab87  ...h4...........
	defb 07fh,000h,0b0h,078h,01ch,08eh,0c7h,0fbh,03bh,000h,00fh,020h,000h,010h,018h,000h	; ab97  ...x....... ....
	defb 006h,040h,081h,002h,004h,0b4h,098h,04bh,030h,084h,0b4h,060h,0e0h,0e4h,0e7h,0e3h	; aba7  .@.....K0..`....
	defb 024h,0a6h,0a6h,0ffh,000h,001h,003h,0ffh,000h,067h,037h,000h,03ch,07eh,07eh,003h	; abb7  $........g7.<~~.
	defb 000h,088h,0ffh,000h,007h,003h,074h,003h,0f0h,000h,009h,0feh,084h,000h,080h,001h	; abc7  ......t.........
	defb 0fbh,004h,000h,084h,080h,0f2h,000h,0ffh,004h,000h,095h,00ch,0edh,02dh,0adh,0ach	; abd7  .............-..
	defb 0a1h,0adh,0adh,000h,007h,003h,074h,003h,0f0h,000h,0feh,000h,03ch,07eh,07eh,000h	; abe7  ......t.....<~~.
	defb 003h,0ffh,081h,080h,003h,0fah,09eh,000h,001h,0ffh,0edh,000h,080h,0eah,0eah,003h	; abf7  ................
	defb 0f8h,0ffh,0ffh,000h,0c7h,0deh,0dah,0c0h,0c0h,0fbh,0f8h,0feh,03ch,0d8h,0d0h,069h	; ac07  ............<..i
	defb 060h,0b0h,0b8h,0c0h,014h,003h,001h,084h,000h,001h,000h,0ffh,003h,000h,085h,07ch	; ac17  `..............|
	defb 000h,000h,0f7h,000h,003h,055h,084h,000h,001h,055h,0ffh,008h,0feh,084h,099h,000h	; ac27  .....U...U......
	defb 0f7h,000h,004h,0feh,088h,0c0h,0d8h,02ch,0ech,036h,0b6h,0bbh,000h,000h	; ac37  .......,.6....

; ----------------------------------------------------------------------
; DATOS colores_AC45: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 145, ficha 5 de la lista 0xA53D (p10:8107); lo leen
;   p10:8107 (231 bytes)
;   0xac45..0xad2c  (231 bytes)
DATA_colores_AC45:
	defb 083h,050h,070h,050h,003h,040h,08eh,050h,040h,070h,070h,075h,0c5h,050h,040h,080h	; ac45  .PpP.@.P@ppu.P@.
	defb 080h,040h,097h,050h,0c0h,003h,040h,081h,044h,004h,040h,084h,097h,050h,050h,054h	; ac55  .@.P..@.D.@..PPT
	defb 004h,090h,081h,065h,003h,040h,008h,050h,081h,0e7h,003h,050h,002h,070h,002h,040h	; ac65  ...e.@.P...P.p.@
	defb 002h,070h,082h,050h,0c0h,004h,040h,085h,0eeh,077h,070h,074h,054h,003h,040h,081h	; ac75  .p.P..@..wptT.@.
	defb 0e0h,003h,070h,003h,050h,091h,040h,0e9h,074h,0c7h,070h,054h,054h,085h,050h,095h	; ac85  ..p.P.@.t.pTT.P.
	defb 074h,040h,040h,070h,070h,050h,050h,008h,040h,084h,0e0h,070h,070h,074h,003h,050h	; ac95  t@@ppPP.@..ppt.P
	defb 005h,040h,004h,050h,004h,040h,08ch,095h,050h,050h,054h,050h,050h,070h,0f0h,020h	; aca5  .@.P.@..PPTPPp.
	defb 070h,050h,060h,004h,050h,081h,0c5h,003h,050h,008h,040h,081h,070h,007h,040h,083h	; acb5  pP`.P...P.@.p.@.
	defb 000h,085h,070h,004h,040h,085h,044h,040h,075h,050h,0c0h,005h,040h,007h,074h,083h	; acc5  ..p.@.D@uP..@.t.
	defb 050h,097h,050h,005h,0c0h,082h,050h,070h,006h,040h,009h,070h,083h,075h,050h,0c0h	; acd5  P.P...Pp.@.p.uP.
	defb 003h,040h,084h,070h,050h,085h,070h,003h,040h,093h,077h,075h,050h,070h,070h,040h	; ace5  .@.pP.p.@.wuPpp@
	defb 040h,074h,077h,050h,000h,090h,074h,075h,075h,074h,077h,055h,000h,003h,075h,08ch	; acf5  @twP..tuutwU..u.
	defb 054h,075h,075h,054h,0e9h,070h,0f0h,070h,074h,070h,070h,0e4h,008h,040h,081h,070h	; ad05  TuuT.p.ptpp..@.p
	defb 007h,040h,008h,070h,007h,074h,086h,040h,0e4h,0e0h,0f4h,070h,0f4h,003h,074h,082h	; ad15  .@.p.t.@...p..t.
	defb 070h,0e0h,004h,070h,002h,0e0h,000h	; ad25

; ----------------------------------------------------------------------
; DATOS dibujos_AD2C: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 128, ficha 4 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (42 bytes)
;   0xad2c..0xad56  (42 bytes)
DATA_dibujos_AD2C:
	defb 0a3h,036h,065h,09bh,0ddh,0ddh,080h,000h,000h,006h,009h,016h,017h,019h,026h,00ch	; ad2c  .6e...........&.
	defb 05ch,000h,003h,00eh,031h,00eh,0eeh,0c6h,0b8h,058h,060h,0d0h,0d8h,018h,0e0h,0c0h	; ad3c  \...1....X`.....
	defb 0b0h,050h,0c0h,080h,00bh,000h,082h,002h,006h,000h	; ad4c  .P........

; ----------------------------------------------------------------------
; DATOS dibujos_AD56: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 152, ficha 5 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (71 bytes)
;   0xad56..0xad9d  (71 bytes)
DATA_dibujos_AD56:
	defb 003h,007h,003h,003h,085h,001h,000h,07fh,03fh,007h,006h,000h,081h,001h,003h,003h	; ad56  ........?.......
	defb 003h,007h,005h,000h,094h,00fh,03fh,07fh,0e3h,064h,0b0h,096h,0ddh,095h,035h,0b5h	; ad66  ......?..d....5.
	defb 0ffh,02dh,043h,0a6h,0a6h,0ech,0b5h,0bdh,01eh,003h,03fh,096h,01eh,0e0h,0fch,0feh	; ad76  .-C.......?.....
	defb 09fh,056h,04fh,04bh,03fh,02fh,024h,012h,07dh,0edh,0e8h,0c4h,0fch,0f4h,058h,068h	; ad86  .VOK?/$.}.....Xh
	defb 000h,080h,003h,0c0h,003h,0e0h,000h	; ad96

; ----------------------------------------------------------------------
; DATOS dibujos_AD9D: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 164, ficha 6 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (58 bytes)
;   0xad9d..0xadd7  (58 bytes)
DATA_dibujos_AD9D:
	defb 0b8h,00eh,002h,004h,004h,008h,00eh,000h,0ffh,0e8h,088h,0c8h,088h,088h,0eeh,000h	; ad9d  ................
	defb 0ffh,0eeh,0a8h,0aeh,0a2h,0a2h,0eeh,000h,0ffh,077h,045h,065h,045h,045h,047h,000h	; adad  .........wEeEEG.
	defb 0ffh,067h,055h,054h,064h,055h,057h,000h,0ffh,070h,040h,060h,040h,040h,070h,000h	; adbd  .gUTdUW..p@`@@p.
	defb 0ffh,080h,040h,020h,010h,008h,004h,002h,001h,000h	; adcd  ..@ ......

; ----------------------------------------------------------------------
; DATOS dibujos_ADD7: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 179, ficha 8 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (10 bytes)
;   0xadd7..0xade1  (10 bytes)
DATA_dibujos_ADD7:
	defb 088h,03ch,07eh,0cah,0a1h,050h,07ch,07eh,03ch,000h	; add7  .<~..P|~<.

; ----------------------------------------------------------------------
; DATOS colores_ADE1: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 128, ficha 4 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (32 bytes)
;   0xade1..0xae01  (32 bytes)
DATA_colores_ADE1:
	defb 085h,050h,040h,050h,040h,050h,005h,040h,002h,050h,08ah,040h,050h,050h,040h,040h	; ade1  .P@P@P.@.P.@PP@@
	defb 050h,040h,050h,050h,040h,006h,050h,002h,040h,003h,050h,00eh,040h,081h,050h,000h	; adf1  P@PP@.P.@.P.@.P.

; ----------------------------------------------------------------------
; DATOS colores_AE01: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 152, ficha 5 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (34 bytes)
;   0xae01..0xae23  (34 bytes)
DATA_colores_AE01:
	defb 010h,060h,010h,080h,081h,086h,007h,098h,081h,080h,007h,098h,088h,0b0h,090h,0a0h	; ae01  .`..............
	defb 090h,090h,080h,060h,060h,004h,098h,004h,086h,004h,098h,004h,086h,002h,080h,006h	; ae11  ...``...........
	defb 060h,000h	; ae21

; ----------------------------------------------------------------------
; DATOS colores_AE23: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 164, ficha 6 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (50 bytes)
;   0xae23..0xae55  (50 bytes)
DATA_colores_AE23:
	defb 0aeh,0f0h,0f0h,0b0h,0a0h,070h,030h,0c0h,0c0h,0f0h,0f0h,0b0h,0a0h,070h,030h,0c0h	; ae23  .....p0......p0.
	defb 0c0h,0f0h,0f0h,0b0h,0a0h,070h,030h,0c0h,0c0h,0f0h,0f0h,0b0h,0a0h,070h,030h,0c0h	; ae33  .....p0......p0.
	defb 0c0h,0f0h,0f0h,0b0h,0a0h,070h,030h,0c0h,0c0h,0f0h,0f0h,0b0h,0a0h,070h,030h,00ah	; ae43  .....p0......p0.
	defb 0c0h,000h	; ae53

; ----------------------------------------------------------------------
; DATOS colores_AE55: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 179, ficha 8 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (10 bytes)
;   0xae55..0xae5f  (10 bytes)
DATA_colores_AE55:
	defb 088h,070h,070h,075h,075h,075h,054h,040h,040h,000h	; ae55  .ppuuuT@@.

; ----------------------------------------------------------------------
; DATOS colores_AE5F: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 180, ficha 9 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (10 bytes)
;   0xae5f..0xae69  (10 bytes)
DATA_colores_AE5F:
	defb 088h,090h,090h,098h,098h,098h,086h,060h,060h,000h	; ae5f  .......``.

; ----------------------------------------------------------------------
; DATOS colores_AE69: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 181, ficha 10 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (10 bytes)
;   0xae69..0xae73  (10 bytes)
DATA_colores_AE69:
	defb 088h,030h,030h,032h,032h,032h,0c2h,0c0h,0c0h,000h	; ae69  .00222....

; ----------------------------------------------------------------------
; DATOS colores_AE73: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 182, ficha 7 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (31 bytes)
;   0xae73..0xae92  (31 bytes)
DATA_colores_AE73:
	defb 010h,0c0h,010h,020h,081h,0c2h,007h,032h,081h,020h,007h,032h,005h,010h,083h,020h	; ae73  ... ...2. .2...
	defb 0c0h,0c0h,004h,032h,004h,0c2h,004h,032h,004h,0c2h,002h,020h,006h,0c0h,000h	; ae83  ...2...2... ...

; ----------------------------------------------------------------------
; DATOS dibujos_AE92: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 16, ficha 0 de la lista 0xA567 (p10:8107); lo leen
;   p10:8107 (322 bytes)
;   0xae92..0xafd4  (322 bytes)
DATA_dibujos_AE92:
	defb 006h,000h,082h,00fh,07fh,007h,000h,084h,003h,007h,01fh,03fh,003h,07fh,0ebh,03fh	; ae92  ...........?...?
	defb 00fh,003h,08fh,00fh,003h,0ffh,040h,00bh,001h,00fh,017h,02bh,025h,072h,03ah,095h	; aea2  ......@....+%r:.
	defb 04ah,083h,0e0h,0f8h,007h,047h,0b8h,060h,0c0h,0ffh,01fh,007h,0ffh,0f0h,00fh,01fh	; aeb2  J....G.`........
	defb 0ffh,003h,007h,00fh,00bh,009h,008h,014h,01ah,083h,003h,00ch,017h,029h,0a2h,0aah	; aec2  .............)..
	defb 0aeh,080h,079h,074h,00bh,0f0h,00bh,0c7h,0f8h,01ch,01eh,00dh,015h,018h,01dh,01dh	; aed2  ..yt............
	defb 00ch,0cah,0d6h,08ch,058h,0d2h,0c7h,04fh,0dfh,0cah,0d6h,08ch,058h,0d2h,0c7h,04fh	; aee2  ....X..O....X..O
	defb 0dfh,013h,008h,001h,001h,0aah,0aah,0abh,0aah,0c0h,08fh,03fh,023h,047h,04fh,027h	; aef2  ...........?#GO'
	defb 093h,005h,001h,006h,007h,007h,003h,005h,006h,04dh,003h,06dh,0ach,06eh,06dh,0ebh	; af02  .........M.m.nm.
	defb 006h,0ffh,00ch,032h,09ch,050h,040h,000h,000h,03fh,007h,0c0h,058h,00bh,005h,000h	; af12  ...2.P@..?..X...
	defb 000h,087h,0c3h,0e1h,0cch,0cch,002h,058h,05ah,0e9h,0eeh,0ech,001h,0fah,030h,09eh	; af22  .......XZ.....0.
	defb 06ah,0ffh,004h,020h,086h,07fh,0d3h,0bch,0dbh,003h,000h,085h,0e0h,0d6h,0fbh,037h	; af32  j.. ...........7
	defb 0fah,003h,000h,085h,01eh,0b2h,00fh,04bh,03eh,004h,000h,0ffh,078h,0feh,0f7h,0dfh	; af42  .......K>...x...
	defb 059h,076h,079h,0fdh,09fh,07bh,01fh,0c0h,0e5h,038h,0ceh,07dh,0deh,0e0h,00fh,076h	; af52  Yvy..{...8.}...v
	defb 09ch,020h,046h,0cfh,045h,09bh,0e7h,078h,0f4h,0c0h,0eeh,078h,05ch,0e5h,08eh,0d8h	; af62  . F.E..x...x\...
	defb 027h,063h,04fh,01bh,027h,063h,04fh,01bh,000h,0ffh,040h,060h,024h,071h,032h,0c4h	; af72  'cO.'cO...@`$q2.
	defb 084h,002h,043h,027h,025h,016h,09fh,089h,00ah,090h,0abh,006h,03bh,013h,026h,0afh	; af82  ..C'%.........&.
	defb 084h,062h,03bh,01dh,03fh,00fh,047h,027h,03fh,077h,03fh,013h,04fh,0bfh,05fh,003h	; af92  .b..?.G'?w?.O._.
	defb 01fh,0afh,00dh,0b6h,07fh,03fh,06fh,0dfh,006h,001h,001h,000h,001h,001h,003h,00eh	; afa2  .....?o.........
	defb 06bh,0a5h,08bh,01fh,067h,05fh,0eeh,0c3h,0feh,0fah,003h,000h,0f6h,007h,0bdh,0ceh	; afb2  k...g_..........
	defb 07dh,0eeh,0f7h,0bdh,0fdh,0d7h,07dh,036h,0e3h,01eh,00ch,085h,015h,018h,01dh,01dh	; afc2  }.....}6........
	defb 00ch,000h	; afd2

; ----------------------------------------------------------------------
; DATOS colores_AFD4: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 16, ficha 0 de la lista 0xA567 (p10:8107); lo leen
;   p10:8107 (282 bytes)
;   0xafd4..0xb0ee  (282 bytes)
DATA_colores_AFD4:
	defb 007h,040h,081h,054h,008h,070h,008h,050h,081h,065h,003h,085h,090h,050h,0f5h,0f5h	; afd4  .@.T.p.P.e...P..
	defb 075h,070h,070h,050h,070h,0f0h,0f0h,070h,050h,040h,070h,070h,0f4h,004h,040h,088h	; afe4  uppPp..pP@pp..@.
	defb 050h,054h,040h,000h,0f0h,0f4h,040h,000h,003h,050h,002h,070h,081h,050h,003h,040h	; aff4  PT@...@..P.p.P.@
	defb 08fh,050h,040h,070h,040h,040h,050h,0f0h,040h,040h,0e4h,0e0h,0e0h,0b0h,070h,050h	; b004  .P@p@@P.@@....pP
	defb 003h,040h,081h,050h,004h,040h,006h,050h,082h,070h,0f0h,006h,050h,092h,070h,0f0h	; b014  .@.P.@.P.p..P.p.
	defb 050h,050h,080h,080h,040h,050h,0f0h,050h,086h,0f8h,0b8h,0f9h,0b9h,0a9h,0b8h,0f8h	; b024  PP..@P.P........
	defb 008h,040h,081h,070h,005h,050h,002h,0f0h,084h,000h,040h,0f0h,050h,004h,040h,002h	; b034  .@.p.P....@.P.@.
	defb 080h,002h,040h,081h,050h,003h,040h,084h,080h,060h,060h,090h,003h,0a9h,090h,096h	; b044  ..@.P.@..``.....
	defb 0f0h,050h,040h,060h,090h,0a9h,090h,060h,000h,060h,060h,090h,060h,090h,0a6h,006h	; b054  .P@`...`.``.`...
	defb 090h,082h,060h,096h,004h,090h,084h,060h,096h,096h,060h,003h,090h,088h,060h,090h	; b064  ..`....`..`...`.
	defb 096h,060h,090h,060h,096h,090h,003h,096h,081h,090h,003h,060h,003h,096h,002h,090h	; b074  .`.`.......`....
	defb 002h,060h,085h,090h,098h,0a9h,098h,0a9h,003h,090h,084h,086h,0a6h,096h,0a9h,004h	; b084  .`..............
	defb 096h,091h,0a9h,060h,0a9h,060h,0a9h,060h,0a9h,060h,0a0h,000h,0a0h,090h,0a0h,090h	; b094  ...`.`.`.`......
	defb 096h,0a6h,0a0h,003h,060h,086h,0a0h,060h,060h,096h,0a6h,0a6h,003h,096h,003h,0a9h	; b0a4  ....`..``.......
	defb 081h,0a0h,003h,060h,002h,090h,082h,0a0h,0a6h,003h,096h,004h,0a9h,083h,0fah,0a9h	; b0b4  ...`............
	defb 0a9h,006h,0fah,088h,0a0h,090h,060h,060h,040h,040h,090h,060h,003h,0a9h,084h,0a6h	; b0c4  ......``@@.`....
	defb 0a9h,0a6h,0a6h,003h,0a9h,002h,0fah,086h,0a9h,0fah,0a9h,0a9h,0f9h,0f9h,003h,0fah	; b0d4  ................
	defb 003h,0f9h,084h,0a4h,040h,090h,050h,004h,040h,000h	; b0e4  ....@.P.@.

; ----------------------------------------------------------------------
; DATOS dibujos_B0EE: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 1, ficha 0 de la lista 0xA4E5 (p10:8107); lo leen
;   p10:8107 (105 bytes)
;   0xb0ee..0xb157  (105 bytes)
DATA_dibujos_B0EE:
	defb 0b4h,0fbh,0fch,0e9h,0eah,0f5h,0fch,0c8h,0d4h,0e0h,0d4h,0a1h,0d0h,0a4h,040h,0a8h	; b0ee  ..............@.
	defb 051h,000h,000h,003h,00ch,033h,0cch,030h,0c0h,031h,0c1h,001h,001h,003h,00ch,030h	; b0fe  Q....3.0.1.....0
	defb 0c0h,001h,001h,011h,050h,050h,040h,000h,000h,006h,006h,060h,060h,003h,00ch,030h	; b10e  ....PP@....``..0
	defb 0c0h,003h,00ch,030h,0c0h,004h,000h,08dh,003h,00ch,030h,0c0h,003h,00ch,033h,0cch	; b11e  ...0......0...3.
	defb 003h,00ch,033h,0cch,0b0h,003h,0a0h,0a0h,030h,0c0h,001h,001h,003h,00dh,031h,0c1h	; b12e  ..3.....0.....1.
	defb 003h,00ch,033h,0cch,030h,0c0h,0feh,0fah,0bfh,0a0h,0aeh,0aah,0aah,0aeh,0a0h,0bfh	; b13e  ..3.0...........
	defb 081h,081h,07fh,001h,03dh,001h,0ffh,001h,000h	; b14e  ....=....

; ----------------------------------------------------------------------
; DATOS dibujos_B157: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 16, ficha 1 de la lista 0xA4E5 (p10:8107); lo leen
;   p10:8107 (373 bytes)
;   0xb157..0xb2cc  (373 bytes)
DATA_dibujos_B157:
	defb 0f1h,001h,002h,004h,008h,009h,011h,012h,012h,005h,00bh,057h,08bh,017h,02fh,057h	; b157  ...........W../W
	defb 02fh,001h,000h,002h,006h,00ch,030h,0c1h,00fh,0fah,0fdh,0feh,0fdh,0ffh,00fh,0d5h	; b167  /.....0.........
	defb 0aah,0a4h,052h,0a0h,055h,0a9h,0feh,054h,07eh,0e0h,034h,086h,040h,011h,028h,050h	; b177  ..R.U..T~.4.@.(P
	defb 0aah,0f0h,0f8h,0fch,0fch,0feh,071h,078h,03ch,026h,023h,02dh,058h,050h,043h,04ch	; b187  ......qx<&#-XPCL
	defb 030h,05fh,091h,00ah,035h,0e8h,02bh,09fh,061h,07fh,0f8h,0e0h,01fh,0feh,0d8h,0e0h	; b197  0_..5.+.a.......
	defb 0bah,0e0h,01fh,0f1h,0c0h,00fh,07fh,0c0h,013h,078h,0fch,0f0h,03fh,0dfh,07eh,07fh	; b1a7  .........x..?.~.
	defb 03fh,00fh,0b7h,0dbh,0ddh,0eeh,0eeh,0e0h,0eeh,01eh,0deh,0b1h,067h,05ch,0dbh,0bfh	; b1b7  ?...........g\..
	defb 0b6h,000h,003h,080h,088h,0c0h,040h,0e0h,0e0h,003h,003h,009h,009h,003h,004h,08eh	; b1c7  ......@.........
	defb 00ah,004h,000h,000h,012h,02dh,031h,03bh,03bh,07ch,06eh,07bh,07dh,0feh,003h,0ffh	; b1d7  .....-1..|n{}...
	defb 0a0h,002h,044h,083h,08fh,0e1h,0c7h,0ffh,0ffh,0dfh,0f8h,0f4h,0e0h,0f1h,0fch,0f8h	; b1e7  ..D.............
	defb 0f8h,0eeh,0deh,0deh,0d8h,0d6h,0ceh,0d1h,0d7h,0beh,0beh,0bfh,0b7h,0b7h,09bh,04ch	; b1f7  ...............L
	defb 047h,005h,0e0h,09bh,040h,0c0h,080h,00ah,006h,00ch,00eh,004h,000h,004h,00ch,037h	; b207  G...@..........7
	defb 037h,02fh,00fh,00fh,013h,01dh,00eh,0ffh,0ffh,0dfh,0efh,00fh,01fh,07fh,007h,006h	; b217  7/..............
	defb 0ffh,002h,0feh,099h,0f8h,0e0h,0e0h,0c0h,0c0h,080h,000h,040h,0d6h,0c5h,0d3h,0d6h	; b227  ...........@....
	defb 0ceh,09ch,0bdh,0b8h,0b0h,0d9h,076h,039h,031h,07eh,08fh,03fh,080h,005h,000h,0c4h	; b237  ......v91~.?....
	defb 080h,0c0h,00eh,00ah,005h,01fh,006h,01ch,003h,00fh,00eh,00eh,007h,007h,003h,003h	; b247  ................
	defb 083h,0c1h,0f8h,07eh,001h,03fh,07fh,08fh,01fh,03fh,0ffh,0feh,0fah,0fah,0f8h,0f8h	; b257  ...~.?...?......
	defb 0f0h,0e0h,000h,000h,080h,0ffh,0feh,0feh,0fch,0f8h,0b9h,0b1h,003h,003h,007h,007h	; b267  ................
	defb 00fh,00fh,0feh,0f8h,0f3h,0e7h,0cfh,09fh,0bfh,03ch,020h,0d0h,0d8h,0ech,0eeh,0f7h	; b277  .........< .....
	defb 006h,0f9h,007h,001h,006h,000h,082h,0c1h,081h,006h,000h,002h,07fh,0b6h,03fh,01fh	; b287  ..............?.
	defb 07fh,00fh,000h,000h,060h,0c0h,0feh,0f8h,0c0h,000h,033h,0cfh,0e0h,080h,002h,00ch	; b297  ....`.....3.....
	defb 039h,0f3h,0e7h,0cfh,01eh,03eh,07ch,0fdh,039h,0c0h,0fbh,0fbh,073h,06fh,01fh,0bfh	; b2a7  9....>|.9...so..
	defb 0b9h,07ah,076h,077h,0fdh,0e5h,0deh,0beh,0bfh,0bfh,0dfh,06fh,0ach,077h,07bh,07dh	; b2b7  .zvw.......o.w{}
	defb 03eh,01fh,08fh,083h,000h	; b2c7

; ----------------------------------------------------------------------
; DATOS dibujos_B2CC: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 64, ficha 2 de la lista 0xA4E5 (p10:8107); lo leen
;   p10:8107 (18 bytes)
;   0xb2cc..0xb2de  (18 bytes)
DATA_dibujos_B2CC:
	defb 090h,0e3h,01fh,0fch,07fh,08fh,01fh,01fh,03fh,0ffh,0ffh,0dfh,0efh,00fh,01fh,07fh	; b2cc  ........?.......
	defb 0ffh,000h	; b2dc

; ----------------------------------------------------------------------
; DATOS dibujos_B2DE: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 103, ficha 2 de la lista 0xA4F5 (p10:8107); lo leen
;   p10:8107 (33 bytes)
;   0xb2de..0xb2ff  (33 bytes)
DATA_dibujos_B2DE:
	defb 09dh,0bdh,00eh,01ah,07fh,06dh,000h,001h,018h,05ch,0dah,07eh,066h,082h,001h,0e0h	; b2de  .....m...\.~f...
	defb 001h,01fh,05fh,0afh,040h,0abh,055h,02bh,015h,0f9h,0fbh,01fh,00fh,07fh,003h,0ffh	; b2ee  .._.@.U+........
	defb 000h	; b2fe

; ----------------------------------------------------------------------
; DATOS colores_B2FF: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 16, ficha 1 de la lista 0xA4E5 (p10:8107); lo leen
;   p10:8107 (233 bytes)
;   0xb2ff..0xb3e8  (233 bytes)
DATA_colores_B2FF:
	defb 081h,0f0h,005h,070h,002h,0f0h,002h,050h,002h,070h,004h,050h,008h,0f5h,005h,054h	; b2ff  ...p...P.p.P...T
	defb 083h,0f5h,0f7h,0f7h,005h,054h,083h,074h,0f7h,087h,003h,074h,081h,054h,003h,074h	; b30f  .....T.t...t.T.t
	defb 081h,076h,005h,040h,003h,054h,002h,0f0h,002h,0e0h,004h,0f0h,081h,050h,003h,0f5h	; b31f  .v.@.T.......P..
	defb 090h,0f8h,096h,060h,060h,0f5h,0f8h,0f8h,098h,090h,090h,080h,080h,0f8h,098h,090h	; b32f  ...``...........
	defb 090h,003h,060h,081h,0f0h,003h,096h,002h,080h,083h,086h,080h,080h,008h,060h,083h	; b33f  ..`...........`.
	defb 054h,064h,064h,005h,0e4h,003h,040h,005h,0e0h,081h,050h,003h,040h,003h,050h,08dh	; b34f  Tdd...@...P.@.P.
	defb 0e0h,060h,080h,060h,090h,080h,060h,080h,090h,086h,098h,096h,096h,004h,098h,085h	; b35f  .`.`..`.........
	defb 0f0h,070h,060h,098h,098h,003h,096h,081h,080h,007h,098h,002h,060h,006h,080h,008h	; b36f  .p`.........`...
	defb 0e4h,008h,0e0h,084h,0f0h,0e0h,070h,050h,004h,0f0h,004h,090h,084h,080h,060h,060h	; b37f  ......pP......``
	defb 080h,006h,096h,082h,098h,090h,010h,098h,008h,080h,005h,0e4h,083h,0f4h,0feh,0feh	; b38f  ................
	defb 006h,0e0h,002h,0f0h,088h,0e0h,0f0h,0e0h,0f0h,0f0h,0e0h,0e0h,0f0h,003h,080h,005h	; b39f  ................
	defb 060h,086h,0f0h,060h,090h,098h,080h,080h,00dh,098h,007h,080h,005h,0e0h,006h,0f0h	; b3af  `..`............
	defb 004h,0e0h,007h,0f0h,081h,070h,007h,050h,002h,060h,006h,080h,004h,098h,081h,080h	; b3bf  .....p.P.`......
	defb 003h,060h,002h,098h,002h,080h,081h,060h,003h,0e0h,002h,080h,006h,0e0h,006h,0f0h	; b3cf  .`.....`........
	defb 004h,0e0h,00ch,0f0h,002h,0e0h,008h,0f0h,000h	; b3df  .........

; ----------------------------------------------------------------------
; DATOS colores_B3E8: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 1, ficha 0 de la lista 0xA4E5 (p10:8107); lo leen
;   p10:8107 (61 bytes)
;   0xb3e8..0xb425  (61 bytes)
DATA_colores_B3E8:
	defb 002h,040h,081h,050h,003h,040h,081h,050h,004h,040h,081h,050h,004h,040h,005h,050h	; b3e8  .@.P.@.P.@.P.@.P
	defb 087h,0d0h,020h,030h,090h,080h,060h,0d0h,004h,040h,085h,0b0h,090h,080h,090h,080h	; b3f8  .. 0..`..@......
	defb 003h,060h,084h,0a0h,090h,0a0h,090h,010h,040h,003h,050h,081h,054h,003h,050h,00dh	; b408  .`......@.P.T.P.
	defb 054h,003h,050h,003h,054h,002h,040h,00eh,054h,082h,050h,054h,000h	; b418  T.P.T.@.T.PT.

; ----------------------------------------------------------------------
; DATOS colores_B425: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 64, ficha 2 de la lista 0xA4E5 (p10:8107); lo leen
;   p10:8107 (14 bytes)
;   0xb425..0xb433  (14 bytes)
DATA_colores_B425:
	defb 085h,060h,090h,098h,080h,080h,003h,098h,006h,096h,082h,098h,090h,000h	; b425  .`............

; ----------------------------------------------------------------------
; DATOS colores_B433: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 103, ficha 2 de la lista 0xA4F5 (p10:8107); lo leen
;   p10:8107 (26 bytes)
;   0xb433..0xb44d  (26 bytes)
DATA_colores_B433:
	defb 081h,0e0h,003h,0feh,081h,0e0h,003h,080h,004h,0feh,082h,0f0h,060h,004h,080h,081h	; b433  ............`...
	defb 060h,005h,080h,083h,098h,086h,098h,005h,096h,000h	; b443  `.........

; ----------------------------------------------------------------------
; DATOS dibujos_B44D: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 16, ficha 1 de la lista 0xA4F5 (p10:8107); lo leen
;   p10:8107 (653 bytes)
;   0xb44d..0xb6da  (653 bytes)
DATA_dibujos_B44D:
	defb 093h,016h,00ch,01ah,00ch,01eh,00ch,006h,000h,080h,07fh,00bh,001h,045h,0a0h,043h	; b44d  .............E.C
	defb 01fh,0bfh,07fh,07fh,003h,0ffh,082h,07fh,0feh,005h,0ffh,083h,0fdh,0f3h,08fh,008h	; b45d  ................
	defb 000h,002h,003h,002h,001h,094h,000h,0feh,0feh,0f4h,0b9h,0b1h,0f2h,067h,03ah,077h	; b46d  .............g:w
	defb 023h,04eh,09dh,0ddh,0cdh,09bh,0bbh,0b5h,035h,06fh,003h,000h,004h,080h,084h,0c0h	; b47d  #N......5o......
	defb 006h,002h,002h,005h,000h,0bah,007h,0afh,083h,001h,000h,000h,009h,00ch,0cdh,06ch	; b48d  ...............l
	defb 062h,077h,03fh,01fh,01fh,00fh,07fh,0f1h,0f0h,080h,0c0h,081h,0c4h,0bbh,0c0h,007h	; b49d  bw?.............
	defb 001h,000h,088h,0c0h,0e0h,003h,01fh,06fh,05dh,02eh,01eh,03fh,07eh,07eh,016h,055h	; b4ad  .......o]..?~~.U
	defb 023h,036h,01fh,014h,012h,080h,0dfh,07eh,0feh,0bdh,057h,05fh,0b7h,097h,0c0h,0e0h	; b4bd  #6.....~..W_....
	defb 003h,0a0h,003h,0e0h,08ah,006h,060h,079h,0feh,05dh,07eh,03eh,01ch,00fh,00fh,006h	; b4cd  ......`y.]~>....
	defb 01fh,085h,0a8h,05eh,03fh,0bfh,0bfh,003h,07fh,085h,0f6h,01fh,0ffh,0efh,09fh,003h	; b4dd  ...^?...........
	defb 0ffh,083h,0fch,0bfh,0efh,003h,0ffh,093h,0f7h,0dbh,080h,0c3h,0e8h,0d0h,0fah,0f1h	; b4ed  ................
	defb 09fh,0dfh,077h,0b5h,0afh,037h,06fh,00fh,01fh,00fh,0e0h,004h,0c0h,003h,080h,088h	; b4fd  ..w..7o.........
	defb 018h,07eh,03eh,03eh,01eh,01eh,02eh,016h,003h,01fh,002h,05fh,09ch,01fh,00eh,000h	; b50d  .~>>......._....
	defb 0ffh,0efh,0f7h,0fbh,0f1h,0e1h,008h,03ch,0ffh,0efh,0f1h,0f8h,0fch,0ffh,0ffh,07fh	; b51d  .......<........
	defb 0f7h,0fbh,0d7h,0afh,01fh,07fh,0bfh,09fh,0ceh,004h,0c0h,0c3h,0c2h,084h,082h,03bh	; b52d  ................
	defb 03fh,06bh,0bbh,01eh,03bh,05eh,088h,02eh,016h,00ah,004h,008h,004h,002h,005h,0bdh	; b53d  ?k...^..........
	defb 00eh,01ah,07fh,06dh,000h,003h,01fh,05ch,0dah,07eh,066h,0eah,011h,081h,0f8h,07fh	; b54d  ...m...\.~f.....
	defb 07fh,03fh,03fh,01fh,04fh,0dfh,0dfh,07fh,03fh,0ffh,07fh,0ffh,0ffh,0feh,0feh,084h	; b55d  .??.O...?.......
	defb 08ah,094h,088h,014h,028h,010h,060h,014h,0e8h,010h,022h,05dh,0beh,0a3h,09ch,003h	; b56d  ....(.`..."]....
	defb 000h,085h,0c0h,0f8h,0f7h,07fh,0bch,005h,000h,087h,080h,040h,0f0h,002h,001h,002h	; b57d  ...........@....
	defb 001h,004h,004h,08ch,00fh,000h,0a9h,057h,0afh,057h,027h,017h,043h,03bh,01fh,07fh	; b58d  .......W.W'.C...
	defb 007h,0ffh,0b5h,07fh,0ffh,0efh,0f7h,0e9h,0feh,0fch,0fch,0f8h,0f0h,0e0h,0c0h,003h	; b59d  ................
	defb 001h,001h,002h,005h,00bh,037h,0cfh,03eh,03bh,077h,0f7h,0e7h,0efh,0c2h,0adh,066h	; b5ad  .....7.>.w.....f
	defb 0d3h,0efh,0f7h,0e7h,0cfh,093h,03dh,0beh,0ech,093h,0efh,0f7h,0f8h,0e0h,078h,01ch	; b5bd  ......=.......x.
	defb 0e0h,0fch,0e7h,099h,07eh,0bfh,0c5h,0f0h,003h,000h,085h,0e0h,09eh,07fh,0ffh,0ffh	; b5cd  ....~...........
	defb 005h,000h,083h,080h,0f0h,0feh,003h,000h,0b1h,007h,03eh,0f1h,0cch,033h,00ah,00ah	; b5dd  ..........>..3..
	defb 0edh,0e7h,0a6h,093h,070h,0e7h,007h,003h,003h,001h,0c0h,030h,00fh,0f0h,0ffh,0ffh	; b5ed  ....p......0....
	defb 03ch,0fch,001h,03eh,0c1h,03fh,0fch,0e0h,007h,018h,0e7h,01fh,0ffh,0ffh,01ch,0e3h	; b5fd  <..>.?..........
	defb 01fh,0feh,0f8h,0e3h,0e7h,0cfh,0f9h,0f3h,0cfh,03fh,004h,0ffh,094h,0f1h,0fbh,0e7h	; b60d  .........?......
	defb 0dfh,0dfh,0bfh,0ffh,0ffh,07fh,0fch,0fbh,0ffh,0ffh,004h,018h,075h,03fh,0dfh,0efh	; b61d  ............u?..
	defb 0efh,003h,0f7h,082h,0ffh,0f7h,003h,0ffh,090h,0dfh,001h,003h,08ah,03fh,0cfh,0e3h	; b62d  .............?..
	defb 0fch,0ffh,0fdh,0feh,0ech,0f8h,0e3h,09fh,07fh,004h,0ffh,091h,0c0h,0feh,0ffh,0ffh	; b63d  ................
	defb 0feh,0ffh,0ffh,0fbh,000h,000h,080h,040h,0a0h,050h,0a8h,050h,077h,007h,0ffh,090h	; b64d  .......@.P.Pw...
	defb 0c8h,0d7h,0d7h,0cbh,0ebh,0e5h,0e5h,0d2h,00fh,0f9h,0e2h,0d5h,0c8h,0c8h,0e4h,0feh	; b65d  ................
	defb 003h,0ffh,002h,07fh,00bh,0ffh,0a3h,09fh,0bfh,05fh,0bfh,07fh,0beh,0fdh,0fbh,0feh	; b66d  ........._......
	defb 0f3h,0cfh,0bfh,07fh,001h,006h,004h,001h,00fh,03dh,0bah,05ch,0f0h,080h,0ffh,0c0h	; b67d  .........=.\....
	defb 0c8h,022h,047h,08eh,01fh,01fh,033h,0fbh,0fdh,0fdh,003h,0feh,0a6h,080h,0c0h,056h	; b68d  ."G...3........V
	defb 07eh,03bh,02fh,03eh,078h,030h,000h,0f6h,0fah,0f4h,0eah,0f4h,0e9h,0d1h,0abh,0feh	; b69d  ~./>x0..........
	defb 0f5h,0feh,0fbh,0feh,0edh,0feh,0f5h,0a8h,054h,0a8h,054h,0aah,054h,0aah,055h,007h	; b6ad  ........T.T.T.U.
	defb 0afh,083h,001h,005h,000h,092h,060h,079h,0feh,05dh,07eh,03eh,01ch,07fh,0f1h,0f0h	; b6bd  ......`y.]~>....
	defb 080h,0c0h,080h,0c4h,0bbh,0c0h,007h,001h,004h,000h,081h,003h,000h	; b6cd  .............

; ----------------------------------------------------------------------
; DATOS colores_B6DA: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 16, ficha 1 de la lista 0xA4F5 (p10:8107); lo leen
;   p10:8107 (286 bytes)
;   0xb6da..0xb7f8  (286 bytes)
DATA_colores_B6DA:
	defb 008h,0e0h,082h,0e6h,060h,005h,096h,081h,086h,006h,098h,081h,096h,009h,098h,009h	; b6da  ....`...........
	defb 0e9h,081h,0e8h,003h,0e9h,083h,090h,096h,086h,003h,0e7h,002h,0f7h,003h,0f0h,005h	; b6ea  ................
	defb 0f7h,003h,0e7h,010h,0e0h,081h,086h,005h,060h,082h,070h,0e0h,003h,098h,081h,096h	; b6fa  ........`.p.....
	defb 004h,090h,089h,098h,096h,090h,090h,060h,050h,060h,060h,090h,003h,060h,002h,070h	; b70a  .......`P``..`.p
	defb 084h,0e0h,060h,060h,080h,006h,096h,003h,0e0h,003h,0f0h,082h,0e0h,060h,003h,0f7h	; b71a  ..``.........`..
	defb 085h,0e7h,0e0h,0f0h,0f7h,0e7h,004h,0e0h,085h,0f0h,0e0h,0f0h,0f0h,050h,003h,060h	; b72a  .............P.`
	defb 004h,096h,008h,090h,081h,096h,007h,098h,083h,086h,096h,096h,005h,098h,081h,096h	; b73a  ................
	defb 007h,098h,003h,060h,002h,090h,086h,098h,090h,090h,0f7h,0e7h,0e0h,004h,0f0h,005h	; b74a  ...`............
	defb 0e0h,002h,0f0h,002h,0e0h,081h,096h,007h,060h,006h,090h,002h,080h,006h,090h,002h	; b75a  ........`.......
	defb 0e0h,007h,098h,081h,090h,008h,098h,008h,090h,083h,0e0h,0f0h,0f7h,003h,0f0h,002h	; b76a  ................
	defb 0e0h,008h,060h,081h,0e0h,003h,0feh,081h,0e0h,003h,080h,004h,0feh,084h,0f0h,060h	; b77a  ..`............`
	defb 098h,098h,004h,090h,004h,096h,002h,098h,081h,099h,003h,098h,00ah,090h,003h,0e0h	; b78a  ................
	defb 015h,0a0h,004h,060h,004h,0a0h,003h,060h,005h,080h,082h,098h,080h,00eh,098h,006h	; b79a  ...`...`........
	defb 090h,081h,080h,01eh,0a0h,003h,0fah,028h,0a0h,004h,080h,004h,0a0h,084h,099h,098h	; b7aa  .......(........
	defb 098h,080h,004h,0a0h,082h,090h,080h,021h,0a0h,002h,0aah,003h,0fah,00dh,0a0h,003h	; b7ba  .......!........
	defb 0fah,031h,0a0h,00fh,0a9h,015h,0a0h,00ah,0fah,081h,0aah,008h,0fah,006h,0a0h,00ah	; b7ca  .1..............
	defb 0fah,018h,0a0h,081h,086h,007h,060h,081h,080h,003h,060h,004h,096h,08bh,098h,096h	; b7da  ......`...`.....
	defb 090h,090h,060h,050h,060h,060h,090h,060h,060h,004h,010h,081h,060h,000h	; b7ea  ..`P``.``...`.

; ----------------------------------------------------------------------
; DATOS dibujos_B7F8: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 1, ficha 0 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (38 bytes)
;   0xb7f8..0xb81e  (38 bytes)
DATA_dibujos_B7F8:
	defb 004h,000h,084h,080h,0f6h,005h,0f8h,005h,000h,002h,080h,099h,0f0h,003h,0fch,0fah	; b7f8  ................
	defb 0f5h,0e3h,0ddh,0a6h,000h,01ch,0e3h,01fh,0c7h,038h,0c7h,0f8h,0e0h,0f0h,0f8h,0fch	; b808  .........8......
	defb 0fch,07ch,087h,0f9h,01ch,000h	; b818

; ----------------------------------------------------------------------
; DATOS dibujos_B81E: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 16, ficha 2 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (295 bytes)
;   0xb81e..0xb945  (295 bytes)
DATA_dibujos_B81E:
	defb 004h,000h,094h,0c0h,070h,03ch,01fh,00fh,007h,003h,000h,002h,002h,003h,003h,0c0h	; b81e  ....p<..........
	defb 0f8h,0feh,060h,0dch,0dch,06bh,068h,003h,000h,085h,080h,0f8h,0ffh,00fh,0e0h,005h	; b82e  ..`..kh.........
	defb 000h,083h,0e0h,0ffh,038h,006h,000h,08ah,00fh,0f0h,000h,008h,004h,002h,001h,0c0h	; b83e  ....8...........
	defb 03dh,0e3h,004h,000h,0c4h,080h,0e0h,078h,086h,0b0h,0b9h,006h,0a9h,086h,0b9h,02ah	; b84e  =......x.......*
	defb 082h,03ch,0e2h,016h,0e8h,045h,02bh,00bh,057h,0ffh,0deh,0bfh,071h,08fh,0c3h,01ch	; b85e  .<...E+.W...q...
	defb 007h,0ffh,07fh,08fh,0f1h,0feh,0f8h,0c7h,03fh,057h,0ebh,0f4h,09bh,0fdh,09eh,0c0h	; b86e  ........?W......
	defb 039h,040h,07eh,046h,07eh,07eh,0bdh,081h,030h,000h,0e0h,01fh,0e0h,01fh,000h,077h	; b87e  9@~F~~..0......w
	defb 088h,000h,000h,0fch,0c8h,0f0h,0ffh,013h,06dh,003h,000h,0ffh,0f0h,03fh,00fh,0f0h	; b88e  ........m....?..
	defb 01fh,0a8h,0bah,0aah,0bah,029h,087h,02eh,0a8h,097h,094h,02fh,0afh,02fh,05fh,05fh	; b89e  .....)....././__
	defb 08eh,0a8h,00dh,09eh,0e7h,098h,0ffh,07bh,039h,0dfh,0e7h,0f9h,0feh,07eh,01fh,081h	; b8ae  .......{9....~..
	defb 0f0h,0ffh,0f8h,0c0h,07fh,09ch,0e3h,098h,067h,0fdh,0beh,0d1h,08ch,062h,000h,0d7h	; b8be  ........g....b..
	defb 055h,0c0h,00dh,06dh,01bh,01bh,037h,037h,06fh,0fch,07fh,08fh,0f1h,0feh,0f8h,0c7h	; b8ce  U..m..77o.......
	defb 03fh,00fh,01fh,0c3h,0f8h,0feh,0f0h,00ch,018h,0ffh,0f8h,01fh,003h,03fh,08dh,0e6h	; b8de  ?............?..
	defb 0f1h,086h,0f8h,08fh,0f8h,0e0h,0ffh,0fch,0e0h,0c1h,07ch,0bbh,0f7h,0f7h,0bbh,000h	; b8ee  ..........|.....
	defb 000h,0f3h,01ch,0e3h,0f5h,055h,0e1h,002h,004h,04fh,0f8h,077h,0b7h,0b6h,0cch,010h	; b8fe  .....U...O.w....
	defb 000h,000h,0e0h,09ch,063h,01ch,030h,040h,080h,0e0h,000h,09bh,001h,002h,005h,00bh	; b90e  ....c.0@........
	defb 017h,02fh,09fh,0a7h,079h,0feh,0feh,0fbh,000h,0f0h,03dh,0beh,0cbh,07fh,09ch,0e3h	; b91e  ./..y.....=.....
	defb 098h,060h,0fdh,0beh,0d1h,08ch,060h,003h,000h,084h,0e7h,084h,06bh,068h,004h,000h	; b92e  .`....`.....kh..
	defb 083h,080h,000h,070h,005h,000h,000h	; b93e

; ----------------------------------------------------------------------
; DATOS dibujos_B945: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 64, ficha 3 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (334 bytes)
;   0xb945..0xba93  (334 bytes)
DATA_dibujos_B945:
	defb 088h,000h,0f0h,0b8h,04eh,0b1h,0beh,07fh,08fh,004h,000h,0a4h,080h,060h,098h,0e6h	; b945  ....N........`..
	defb 000h,000h,024h,020h,0dch,0dch,06bh,068h,040h,0bfh,0ffh,07fh,0ffh,000h,0ech,01fh	; b955  ..$ ..kh@.......
	defb 0f9h,08fh,073h,006h,0edh,0fdh,007h,0e0h,080h,060h,078h,082h,0fdh,0ffh,0ffh,038h	; b965  ..s......`x....8
	defb 003h,000h,002h,001h,083h,0ffh,00fh,0f0h,005h,000h,097h,0c0h,03ch,0e3h,033h,027h	; b975  ............<.3'
	defb 017h,027h,04bh,02bh,06bh,0dfh,013h,0c7h,0cfh,0bfh,040h,07fh,01fh,001h,0ffh,0deh	; b985  .'K+k.....@.....
	defb 0bfh,071h,005h,0ffh,0a7h,07fh,08fh,0f1h,0feh,0f8h,0c7h,03fh,017h,0ebh,0f4h,09bh	; b995  .q.........?....
	defb 0fdh,09eh,0c0h,002h,0f8h,0ffh,0c7h,0ffh,0ffh,080h,02ah,06bh,008h,06bh,01fh,0e0h	; b9a5  ..........*k.k..
	defb 01fh,01bh,0bfh,05fh,000h,080h,0fch,0c8h,0f0h,0ffh,07fh,07eh,003h,000h,0ffh,0f0h	; b9b5  ..._.......~....
	defb 0c0h,00fh,0f0h,00fh,0d7h,0d4h,0afh,0afh,02fh,05fh,0a0h,05fh,0ffh,0fch,087h,0ffh	; b9c5  ......../_._....
	defb 0deh,0bdh,07fh,0a3h,0a8h,0feh,0fdh,0fah,075h,0ebh,0d7h,0afh,05fh,0a7h,079h,0feh	; b9d5  ........u..._.y.
	defb 0feh,0fbh,0ffh,0f0h,0ffh,0f8h,0c0h,07fh,09ch,0e3h,098h,060h,0fdh,0beh,0d1h,08ch	; b9e5  ...........`....
	defb 060h,003h,001h,057h,0c0h,037h,081h,008h,035h,075h,0eah,01ah,03ch,0f8h,0f1h,001h	; b9f5  `..W.7..5u..<...
	defb 0f9h,0bch,0c6h,0feh,0f7h,063h,01ch,0b6h,01ch,063h,0f7h,06bh,0afh,0b7h,0c0h,0c7h	; ba05  .....c...c.k....
	defb 0dch,0bfh,0bfh,07fh,0fdh,03bh,0dbh,0f3h,0d6h,037h,0fbh,0fch,0f3h,0fch,07fh,0f9h	; ba15  .........7......
	defb 0ffh,0fah,0feh,080h,0ffh,000h,03fh,03fh,000h,03fh,0f0h,0f0h,04fh,0f8h,077h,0b7h	; ba25  ......??.?..O.w.
	defb 0b7h,0b0h,00fh,0f0h,0c0h,078h,0bdh,0c1h,0bfh,07ch,0c0h,080h,003h,0bch,08ah,09fh	; ba35  .....x...|......
	defb 0b0h,0fch,000h,0f8h,080h,0feh,004h,0f8h,0fbh,004h,000h,083h,05eh,0a0h,0a0h,005h	; ba45  ............^...
	defb 000h,082h,006h,088h,006h,000h,082h,030h,006h,006h,000h,085h,0fdh,01fh,0c3h,018h	; ba55  .......0........
	defb 003h,003h,000h,085h,07fh,007h,0feh,07ch,001h,003h,000h,09ah,02ah,055h,078h,08fh	; ba65  .......|....*Ux.
	defb 0f0h,0feh,03dh,00ah,07fh,03fh,0cfh,072h,0bdh,019h,000h,000h,0f9h,0f3h,0e0h,008h	; ba75  ..=..?.r........
	defb 0a8h,050h,010h,000h,0fbh,0fdh,006h,000h,082h,00fh,0c0h,006h,000h,000h	; ba85  .P............

; ----------------------------------------------------------------------
; DATOS dibujos_BA93: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 113, ficha 4 de la lista 0xA53D (p10:8107); lo leen
;   p10:8107 (82 bytes)
;   0xba93..0xbae5  (82 bytes)
DATA_dibujos_BA93:
	defb 002h,000h,0a2h,00eh,01dh,032h,026h,07ch,07eh,007h,01fh,03fh,07fh,07fh,003h,0f8h	; ba93  .....2&|~..?....
	defb 0f0h,0f0h,0fch,0feh,0fch,0f0h,0fch,078h,0feh,000h,004h,000h,001h,087h,01fh,07fh	; baa3  .......x........
	defb 03fh,008h,000h,01fh,0fch,003h,003h,093h,0ffh,000h,000h,0e2h,0f9h,0fch,0fch,0feh	; bab3  ?...............
	defb 0feh,000h,002h,000h,030h,001h,003h,01fh,07fh,018h,000h,003h,03fh,093h,007h,003h	; bac3  ....0.......?...
	defb 0ffh,00fh,007h,007h,0ffh,01fh,00fh,0ffh,0f0h,02ch,0d1h,0c4h,0e2h,0f8h,0feh,007h	; bad3  .........,......
	defb 0e3h,000h	; bae3

; ----------------------------------------------------------------------
; DATOS colores_BAE5: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 1, ficha 0 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (32 bytes)
;   0xbae5..0xbb05  (32 bytes)
DATA_colores_BAE5:
	defb 005h,030h,003h,0f0h,006h,060h,002h,0f0h,002h,0e0h,002h,0f5h,087h,0e0h,0f0h,0e0h	; bae5  .0...`..........
	defb 0e0h,0f0h,0f0h,0feh,004h,0f0h,082h,0feh,0f5h,003h,0feh,002h,0e0h,002h,0f0h,000h	; baf5  ................

; ----------------------------------------------------------------------
; DATOS colores_BB05: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 6, ficha 1 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (34 bytes)
;   0xbb05..0xbb27  (34 bytes)
DATA_colores_BB05:
	defb 005h,0f0h,083h,070h,0b0h,0b0h,006h,090h,002h,0b0h,002h,090h,002h,0b5h,083h,090h	; bb05  ...p............
	defb 0b0h,090h,003h,0b0h,081h,0b9h,004h,0b0h,082h,0b9h,0b5h,003h,0b9h,002h,090h,002h	; bb15  ................
	defb 0b0h,000h	; bb25

; ----------------------------------------------------------------------
; DATOS colores_BB27: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 16, ficha 2 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (219 bytes)
;   0xbb27..0xbc02  (219 bytes)
DATA_colores_BB27:
	defb 017h,0b0h,081h,090h,007h,0b0h,081h,090h,010h,0b0h,002h,090h,00eh,0b0h,081h,080h	; bb27  ................
	defb 004h,090h,084h,0b0h,080h,0b0h,090h,004h,0b0h,004h,090h,083h,0b9h,0b0h,0b0h,004h	; bb37  ................
	defb 0b9h,003h,0b0h,081h,090h,004h,0b9h,004h,0b0h,09ch,090h,080h,060h,090h,090h,0b0h	; bb47  ............`...
	defb 0b0h,090h,080h,060h,090h,0b9h,0b0h,0b0h,0b9h,0b8h,0b9h,0b0h,060h,090h,0b0h,0b0h	; bb57  ...`........`...
	defb 0b7h,095h,0b0h,0b0h,0a0h,0b0h,004h,070h,082h,0f5h,050h,004h,0b0h,002h,090h,084h	; bb67  .......p..P.....
	defb 080h,0b0h,0b0h,090h,006h,0b0h,083h,090h,0b9h,0b5h,004h,0b9h,087h,090h,0b9h,0b9h	; bb77  ................
	defb 0b0h,0b0h,090h,0b0h,003h,0b9h,081h,0b0h,003h,0b9h,002h,090h,002h,0b0h,083h,060h	; bb87  ...............`
	defb 090h,090h,005h,080h,084h,060h,080h,0b0h,090h,003h,0b0h,082h,0b8h,090h,003h,0b0h	; bb97  .....`..........
	defb 081h,090h,005h,0b9h,003h,090h,098h,0b0h,0b8h,0b9h,0b9h,0bah,0b4h,0b9h,0b9h,090h	; bba7  ................
	defb 090h,0b0h,090h,0a0h,0b0h,0b4h,0b4h,0b9h,098h,090h,080h,0a0h,0a0h,090h,090h,004h	; bbb7  ................
	defb 080h,002h,0a0h,086h,0b0h,090h,090h,080h,090h,080h,005h,0b0h,083h,080h,090h,090h	; bbc7  ................
	defb 003h,0b0h,081h,0b9h,003h,0b0h,082h,090h,060h,006h,0b0h,081h,090h,004h,0b0h,084h	; bbd7  ........`.......
	defb 0b9h,0b8h,0b9h,090h,003h,0b9h,004h,0b0h,081h,050h,003h,0b0h,081h,090h,004h,0b0h	; bbe7  .........P......
	defb 002h,080h,081h,0a0h,005h,090h,081h,080h,007h,0b0h,000h	; bbf7  ...........

; ----------------------------------------------------------------------
; DATOS colores_BC02: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 64, ficha 3 de la lista 0xA505 (p10:8107); lo leen
;   p10:8107, p10:8009 (263 bytes)
;   0xbc02..0xbd09  (263 bytes)
DATA_colores_BC02:
	defb 002h,060h,003h,0f0h,003h,0e0h,008h,0f0h,003h,060h,004h,0f0h,084h,0e0h,0feh,0e0h	; bc02  .`.......`......
	defb 000h,003h,0f0h,002h,0e0h,002h,0f0h,081h,0e0h,004h,0f0h,085h,0e0h,0f0h,0f0h,0e0h	; bc12  ................
	defb 060h,004h,0f0h,004h,080h,081h,050h,00bh,0f0h,081h,0e0h,004h,0f0h,003h,0e0h,008h	; bc22  `.....P.........
	defb 0feh,082h,0e0h,0feh,009h,0f0h,082h,0e0h,0f6h,003h,0feh,004h,0f0h,003h,0e0h,084h	; bc32  ................
	defb 040h,0e0h,0f0h,0f9h,005h,0e0h,08ch,080h,0f0h,0f6h,0f8h,0feh,0f6h,0e0h,0e0h,0f0h	; bc42  @...............
	defb 0f0h,0f5h,065h,003h,0f0h,081h,0e0h,004h,0b0h,084h,053h,0f0h,0f0h,0f5h,006h,0f0h	; bc52  ..e.......S.....
	defb 086h,0feh,050h,0e0h,0feh,0f0h,0ffh,003h,0f0h,002h,0e5h,081h,0e0h,005h,0f0h,081h	; bc62  ..P.............
	defb 0e0h,004h,0f0h,08ch,0f9h,0f8h,0e0h,0e0h,0f0h,0feh,0feh,0e0h,0e0h,0f0h,0f0h,050h	; bc72  ...............P
	defb 004h,0e0h,09bh,0f0h,050h,0e0h,050h,0e0h,040h,040h,050h,050h,0e0h,0e0h,0e5h,040h	; bc82  ....P.P.@@PP...@
	defb 050h,040h,0f0h,0e0h,0e0h,0f6h,0f0h,0f5h,0f5h,0feh,0e5h,0feh,0f5h,0f5h,005h,0e0h	; bc92  P@..............
	defb 09ch,050h,0e0h,050h,0f0h,0e0h,0e0h,050h,0e0h,050h,0e0h,0e0h,0f0h,0f5h,0f0h,0f0h	; bca2  .P.P...P.P......
	defb 0f4h,0f0h,0f4h,0e0h,060h,0f0h,0f0h,0f5h,050h,0e0h,0e0h,0e5h,050h,004h,0f0h,081h	; bcb2  ....`...P...P...
	defb 0e0h,003h,050h,003h,0f0h,081h,0e0h,003h,050h,086h,060h,0f0h,050h,0f5h,0e5h,050h	; bcc2  ..P.....P.`.P..P
	defb 003h,060h,002h,0f0h,081h,0e0h,005h,080h,082h,0e0h,0a0h,006h,050h,081h,040h,007h	; bcd2  .`..........P.@.
	defb 060h,008h,040h,081h,050h,007h,040h,084h,0f0h,0f5h,040h,040h,004h,050h,08ch,0e0h	; bce2  `.@.P.@...@@.P..
	defb 040h,050h,054h,054h,050h,050h,060h,0f0h,0e0h,050h,050h,004h,040h,002h,0f0h,084h	; bcf2  @PTTPP`..PP.@...
	defb 0e0h,040h,050h,060h,012h,050h,000h	; bd02

; ----------------------------------------------------------------------
; DATOS colores_BD09: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 113, ficha 4 de la lista 0xA53D (p10:8107); lo leen
;   p10:8107 (76 bytes)
;   0xbd09..0xbd55  (76 bytes)
DATA_colores_BD09:
	defb 004h,040h,094h,050h,070h,0e0h,0feh,060h,060h,080h,080h,090h,0b9h,0dbh,0dbh,060h	; bd09  .@.Pp..``......`
	defb 080h,080h,090h,0b9h,0b9h,0fbh,0f0h,005h,0c0h,083h,020h,030h,0b3h,003h,0c0h,085h	; bd19  .......... 0....
	defb 0c2h,032h,0b3h,0fbh,0f0h,003h,0c0h,085h,020h,030h,0b0h,0f0h,0f0h,005h,040h,083h	; bd29  .2...... 0....@.
	defb 070h,0b0h,0f0h,003h,040h,095h,054h,075h,0b7h,0fbh,0f0h,040h,054h,075h,077h,0b7h	; bd39  p...@.Tu...@Tuw.
	defb 0fbh,0f0h,0fbh,040h,040h,050h,070h,0b0h,0f0h,0fbh,0fbh,000h	; bd49  ...@@Pp.....

; ----------------------------------------------------------------------
; DATOS dibujos_BD55: rachas (p00:4D16, por p00:456D) con los dibujos de los
;   caracteres desde el 193, ficha 1 de la lista 0xA55C (p10:8107); lo leen
;   p10:8107 (367 bytes)
;   0xbd55..0xbec4  (367 bytes)
DATA_dibujos_BD55:
	defb 0aah,000h,00fh,03ch,07fh,07ch,0fch,0f8h,0fch,000h,0e0h,078h,0fch,07eh,07ah,0fdh	; bd55  ...<.|.....x.~z.
	defb 07dh,000h,000h,001h,002h,002h,003h,001h,000h,0b8h,0bch,087h,099h,041h,063h,07fh	; bd65  }............Ac.
	defb 07fh,03dh,077h,085h,032h,002h,00eh,01fh,01eh,000h,000h,004h,080h,009h,000h,091h	; bd75  .=w.2...........
	defb 00fh,03ch,04bh,058h,05dh,01fh,01dh,00bh,003h,008h,045h,025h,0c5h,005h,0d3h,0f3h	; bd85  .<KX].....E%....
	defb 0c7h,004h,000h,0bdh,080h,0c0h,0f0h,0c0h,000h,000h,001h,003h,005h,002h,01ah,03dh	; bd95  ...............=
	defb 07eh,0f8h,0f3h,0e6h,0eeh,0dch,0bdh,07ch,000h,080h,020h,010h,004h,0bah,07fh,01fh	; bda5  ~......|.. .....
	defb 00fh,01eh,038h,070h,0c0h,036h,0eeh,0ddh,007h,00fh,01eh,03dh,078h,0f9h,0fbh,0f7h	; bdb5  ..8p.6.....=x...
	defb 0e0h,01eh,03fh,07fh,0bfh,09fh,0dfh,0fch,000h,000h,080h,0c0h,0e0h,0e0h,090h,070h	; bdc5  ..?............p
	defb 03eh,003h,07eh,087h,038h,0eeh,075h,0bah,0fch,03eh,00fh,003h,07fh,0d2h,078h,060h	; bdd5  >.~.8.u..>....x`
	defb 03eh,078h,01ch,0e3h,07fh,00fh,003h,03fh,0bdh,07dh,0f9h,0f7h,0f7h,0efh,0eeh,0deh	; bde5  >x.....?.}......
	defb 0feh,0f8h,0e6h,098h,027h,05fh,03fh,03fh,003h,0fch,003h,0feh,0f8h,0feh,07dh,0ffh	; bdf5  ....'_??......}.
	defb 0f8h,038h,098h,050h,080h,0c0h,0c0h,0a0h,001h,000h,002h,005h,00dh,00dh,01bh,01bh	; be05  .8.P............
	defb 040h,08fh,07fh,007h,03fh,07fh,07eh,0ffh,007h,080h,0ffh,0e0h,0fch,0e0h,0ffh,03eh	; be15  @...?.~........>
	defb 01fh,0c7h,003h,0e0h,0f8h,0ech,0f4h,001h,0dch,0d8h,094h,0a8h,014h,028h,004h,0e8h	; be25  .............(..
	defb 003h,07fh,08dh,0fdh,0fbh,0f7h,0cfh,07fh,0feh,0feh,0ffh,0feh,0fch,0feh,0fdh,0fah	; be35  ................
	defb 003h,0a0h,002h,040h,088h,090h,010h,030h,019h,00ch,00ch,007h,003h,003h,000h,09ah	; be45  ...@...0........
	defb 0ffh,07fh,0ffh,00eh,0c0h,000h,005h,004h,0f8h,0e1h,0c7h,00fh,00fh,007h,041h,080h	; be55  ..............A.
	defb 01fh,07fh,0ffh,00fh,07fh,03fh,007h,07eh,0f6h,0f7h,005h,0fbh,0c1h,03bh,00fh,03fh	; be65  .....?.~.......?
	defb 0dfh,0c8h,0e3h,0f5h,03eh,0efh,0fah,0f4h,0e8h,011h,080h,0e1h,0c4h,085h,030h,070h	; be75  ....>.........0p
	defb 050h,078h,058h,078h,068h,068h,00ah,00ah,01ah,015h,031h,024h,000h,000h,08ch,087h	; be85  PxXxhh....1$....
	defb 087h,027h,064h,0c3h,000h,000h,00fh,003h,0e0h,0fch,07fh,09fh,000h,000h,0fdh,0e0h	; be95  .'d.............
	defb 03eh,007h,060h,0ffh,000h,000h,01fh,0feh,0fch,070h,088h,0f8h,000h,000h,003h,005h	; bea5  >.`......p......
	defb 08dh,004h,000h,010h,000h,000h,06ch,034h,024h,0a4h,098h,08ah,000h,000h,000h	; beb5  ......l4$......

; ----------------------------------------------------------------------
; DATOS colores_BEC4: rachas (p00:4D16, por p00:456D) con los colores de los
;   caracteres desde el 193, ficha 1 de la lista 0xA55C (p10:8107); lo leen
;   p10:8107 (197 bytes)
;   0xbec4..0xbf89  (197 bytes)
DATA_colores_BEC4:
	defb 002h,020h,004h,030h,084h,032h,030h,020h,020h,005h,030h,006h,020h,003h,0c0h,086h	; bec4  . .0.20  .0. ...
	defb 030h,020h,030h,0f0h,020h,020h,003h,030h,083h,020h,030h,0f0h,009h,020h,003h,0c0h	; bed4  0 0.  .0. 0.. ..
	defb 008h,060h,083h,030h,020h,020h,005h,030h,083h,020h,0c0h,0c0h,00ch,020h,081h,0c0h	; bee4  .`.0  .0. ... ..
	defb 003h,080h,002h,060h,005h,080h,002h,060h,004h,080h,002h,060h,003h,0c0h,002h,060h	; bef4  ...`...`...`...`
	defb 089h,096h,030h,030h,020h,020h,0c0h,060h,090h,090h,003h,080h,082h,090h,080h,003h	; bf04  ..00  .`........
	defb 090h,081h,080h,00fh,090h,003h,080h,002h,086h,003h,060h,083h,080h,086h,086h,005h	; bf14  ..........`.....
	defb 060h,002h,096h,086h,060h,090h,096h,086h,086h,060h,004h,090h,004h,080h,002h,090h	; bf24  `...`....`......
	defb 002h,080h,005h,090h,002h,060h,081h,080h,004h,098h,004h,090h,004h,080h,00bh,060h	; bf34  .....`.........`
	defb 004h,086h,004h,060h,003h,086h,081h,066h,008h,060h,081h,080h,007h,060h,003h,090h	; bf44  ...`...f.`...`..
	defb 081h,098h,004h,090h,003h,098h,083h,090h,098h,098h,003h,090h,007h,080h,019h,060h	; bf54  ...............`
	defb 002h,096h,082h,099h,098h,003h,086h,081h,060h,005h,090h,003h,080h,081h,098h,003h	; bf64  ........`.......
	defb 080h,002h,090h,081h,098h,004h,080h,082h,060h,090h,023h,060h,081h,080h,007h,060h	; bf74  ........`.#`...`
	defb 081h,080h,017h,060h,000h	; bf84

; ----------------------------------------------------------------------
; DATOS relleno_ff: 119 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (119 bytes)
;   0xbf89..0xc000  (119 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf89  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf99  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfa9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff9
