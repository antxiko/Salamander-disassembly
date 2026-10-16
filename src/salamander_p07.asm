; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 07 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS caracteres_6000: lista de caracteres (p00:4540) de la fase 7: fichas
;   de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; lo leen
;   p00:44DC (55 bytes)
;   0x6000..0x6037  (55 bytes)
DATA_caracteres_6000:
	defb 006h,000h,0c1h,0a2h,0c6h,0c2h	; 6000
	defb 007h,028h,0c1h,0ach,0eeh,0c2h	; 6006
	defb 007h,0cfh,0c1h,052h,080h,0c3h	; 600c
	defb 006h,0efh,0c1h,051h,0bch,0c3h	; 6012
	defb 007h,0ffh,0c1h,0fah,0ceh,0c3h	; 6018
	defb 007h,02dh,0c2h,061h,0fah,0c3h	; 601e
	defb 007h,08ah,0c2h,091h,044h,0c4h	; 6024
	defb 007h,09bh,0c2h,099h,056h,0c4h	; 602a
	defb 007h,061h,074h,052h,07bh,074h	; 6030
	defb 000h	; 6036

; ----------------------------------------------------------------------
; DATOS copias_6037: lista de copias de caracteres VRAM -> VRAM en espejo
;   (0xF000 = 0) (p00:44F3) de la fase 7: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44E6 (15 bytes)
;   0x6037..0x6046  (15 bytes)
DATA_copias_6037:
	defb 0b2h,0c2h,039h,010h	; 6037
	defb 061h,06dh,039h,00ch	; 603b
	defb 0ffh,093h,079h,052h	; 603f
	defb 055h,0f9h,000h	; 6043

; ----------------------------------------------------------------------
; DATOS copias_6046: lista de copias de caracteres VRAM -> VRAM cabeza abajo
;   (0xF000 = 1) (p00:44F3) de la fase 7: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44F0 (32 bytes)
;   0x6046..0x6066  (32 bytes)
DATA_copias_6046:
	defb 0b2h,0d2h,039h,020h	; 6046
	defb 0ach,0f2h,039h,006h	; 604a
	defb 052h,058h,039h,006h	; 604e
	defb 0a2h,09fh,0f2h,0a5h	; 6052
	defb 0a7h,0b2h,0fah,0a9h	; 6056
	defb 0f1h,061h,079h,039h	; 605a
	defb 018h,0fdh,094h,0f9h	; 605e
	defb 091h,097h,0f9h,000h	; 6062

; ----------------------------------------------------------------------
; DATOS sprites_6066: lista [caracter][rachas] de la fase 7 (p00:449E): los
;   dibujos de sprite que se cargan; 0 acaba; lo leen p00:449A (19 bytes)
;   0x6066..0x6079  (19 bytes)
DATA_sprites_6066:
	defb 0b4h,0eeh,0c4h	; 6066
	defb 0a0h,078h,0c4h	; 6069
	defb 0d0h,010h,0c5h	; 606c
	defb 084h,084h,091h	; 606f
	defb 050h,0fdh,093h	; 6072
	defb 058h,023h,08dh	; 6075
	defb 000h	; 6078

; ----------------------------------------------------------------------
; DATOS formas_jefe: 38 punteros (p11:B717, B793, B7D2: 0x6079 + 2 x A) a las
;   piezas de los jefes; lo leen p11:B71A (76 bytes)
;   0x6079..0x60c5  (76 bytes)
DATA_formas_jefe:
	defw 060c5h,060c9h,060cdh,060d1h,060d5h,060d9h,060e7h,060ebh	; 6079
	defw 060f1h,060f7h,060fdh,06103h,06109h,06189h,061e3h,06587h	; 6089
	defw 06265h,066f9h,062a7h,06322h,0637ch,06382h,06388h,0638eh	; 6099
	defw 06394h,0639ah,0639ah,063c9h,063ceh,063ceh,063d8h,063e2h	; 60a9
	defw 063eah,063f2h,063fah,0640ah,06402h,0640ah	; 60b9

; ----------------------------------------------------------------------
; DATOS pieza2x2_60C5: bloque de 2 x 2 caracteres (entrada 0 de 0x6079) que
;   p11:B799 copia con B = C = 2; lo leen p11:B7A7 (4 bytes)
;   0x60c5..0x60c9  (4 bytes)
DATA_pieza2x2_60C5:
	defb 053h,073h,053h,073h	; 60c5

; ----------------------------------------------------------------------
; DATOS pieza2x2_60C9: bloque de 2 x 2 caracteres (entrada 1 de 0x6079) que
;   p11:B799 copia con B = C = 2; lo leen p11:B7A7 (4 bytes)
;   0x60c9..0x60cd  (4 bytes)
DATA_pieza2x2_60C9:
	defb 054h,074h,053h,073h	; 60c9

; ----------------------------------------------------------------------
; DATOS pieza2x2_60CD: bloque de 2 x 2 caracteres (entrada 2 de 0x6079) que
;   p11:B799 copia con B = C = 2; lo leen p11:B7A7 (4 bytes)
;   0x60cd..0x60d1  (4 bytes)
DATA_pieza2x2_60CD:
	defb 055h,075h,053h,073h	; 60cd

; ----------------------------------------------------------------------
; DATOS pieza2x2_60D1: bloque de 2 x 2 caracteres (entrada 3 de 0x6079) que
;   p11:B799 copia con B = C = 2; lo leen p11:B7A7 (4 bytes)
;   0x60d1..0x60d5  (4 bytes)
DATA_pieza2x2_60D1:
	defb 055h,075h,054h,074h	; 60d1

; ----------------------------------------------------------------------
; DATOS forma_60D5: forma de 2 columnas x 1 filas (entrada 4 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (4 bytes)
;   0x60d5..0x60d9  (4 bytes)
DATA_forma_60D5:
	defb 002h,001h	; 60d5
	defb 07ch,0ach	; 60d7

; ----------------------------------------------------------------------
; DATOS forma_60D9: forma de 2 columnas x 6 filas (entrada 5 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (14 bytes)
;   0x60d9..0x60e7  (14 bytes)
DATA_forma_60D9:
	defb 002h,006h	; 60d9
	defb 05bh,05fh	; 60db
	defb 06ch,06ch	; 60dd
	defb 06dh,062h	; 60df
	defb 08bh,08fh	; 60e1
	defb 09ch,09ch	; 60e3
	defb 09dh,092h	; 60e5

; ----------------------------------------------------------------------
; DATOS forma_60E7: forma de 2 columnas x 1 filas (entrada 6 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (4 bytes)
;   0x60e7..0x60eb  (4 bytes)
DATA_forma_60E7:
	defb 002h,001h	; 60e7
	defb 092h,062h	; 60e9

; ----------------------------------------------------------------------
; DATOS forma_60EB: forma de 2 columnas x 2 filas (entrada 7 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (6 bytes)
;   0x60eb..0x60f1  (6 bytes)
DATA_forma_60EB:
	defb 002h,002h	; 60eb
	defb 06eh,06fh	; 60ed
	defb 09eh,09fh	; 60ef

; ----------------------------------------------------------------------
; DATOS forma_60F1: forma de 2 columnas x 2 filas (entrada 8 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (6 bytes)
;   0x60f1..0x60f7  (6 bytes)
DATA_forma_60F1:
	defb 002h,002h	; 60f1
	defb 080h,081h	; 60f3
	defb 0b0h,0b1h	; 60f5

; ----------------------------------------------------------------------
; DATOS forma_60F7: forma de 2 columnas x 2 filas (entrada 9 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (6 bytes)
;   0x60f7..0x60fd  (6 bytes)
DATA_forma_60F7:
	defb 002h,002h	; 60f7
	defb 07eh,07fh	; 60f9
	defb 0aeh,0afh	; 60fb

; ----------------------------------------------------------------------
; DATOS forma_60FD: forma de 2 columnas x 2 filas (entrada 10 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (6 bytes)
;   0x60fd..0x6103  (6 bytes)
DATA_forma_60FD:
	defb 002h,002h	; 60fd
	defb 0b4h,0b5h	; 60ff
	defb 0b9h,0bah	; 6101

; ----------------------------------------------------------------------
; DATOS forma_6103: forma de 2 columnas x 2 filas (entrada 11 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (6 bytes)
;   0x6103..0x6109  (6 bytes)
DATA_forma_6103:
	defb 002h,002h	; 6103
	defb 0b2h,0b3h	; 6105
	defb 0b7h,0b8h	; 6107

; ----------------------------------------------------------------------
; DATOS forma_6109: forma de 21 columnas x 6 filas (entrada 12 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (128
;   bytes)
;   0x6109..0x6189  (128 bytes)
DATA_forma_6109:
	defb 015h,006h,0a4h,08fh,090h,08bh,092h,06dh,000h,000h,085h,086h,087h,09dh,000h,000h,000h,000h,082h,060h,000h	; 6109  .......m...........`.
	defb 000h,000h,000h,000h,070h,000h,000h,000h,000h,000h,065h,000h,000h,000h,000h,000h,06ch,000h,000h,000h,000h	; 611e  ....p.....e.....l....
	defb 000h,09ch,000h,000h,054h,058h,059h,074h,000h,054h,090h,063h,064h,072h,000h,078h,063h,064h,065h,070h,000h	; 6133  ....TXYt.T.cdr.xcdep.
	defb 06eh,07dh,06fh,09ah,071h,000h,09eh,0adh,09fh,06ah,0a1h,000h,0a8h,093h,094h,095h,0a0h,000h,084h,060h,093h	; 6148  n}o.q....j.........`.
	defb 094h,0a2h,000h,000h,084h,088h,089h,0a4h,000h,000h,000h,000h,000h,06ch,000h,000h,000h,000h,000h,09ch,000h	; 615d  .............l.......
	defb 000h,000h,000h,000h,095h,000h,000h,000h,000h,052h,090h,000h,000h,055h,056h,057h,06dh,074h,05fh,060h,05bh	; 6172  .........R...UVWmt_`[
	defb 062h,09dh	; 6187

; ----------------------------------------------------------------------
; DATOS forma_6189: forma de 8 columnas x 11 filas (entrada 13 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (90 bytes)
;   0x6189..0x61e3  (90 bytes)
DATA_forma_6189:
	defb 008h,00bh,000h,084h,089h,08bh,090h,08bh	; 6189  ........
	defb 09dh,090h,072h,05dh,000h,000h,000h,054h	; 6191  ..r]...T
	defb 062h,064h,064h,065h,06ch,06dh,071h,05dh	; 6199  bddelmq]
	defb 054h,084h,064h,065h,065h,065h,062h,09ch	; 61a1  T.deeeb.
	defb 09dh,0a1h,08dh,000h,000h,000h,000h,000h	; 61a9  ........
	defb 000h,000h,000h,06ah,084h,000h,000h,000h	; 61b1  ...j....
	defb 000h,000h,000h,000h,000h,000h,09ah,054h	; 61b9  .......T
	defb 000h,084h,054h,094h,095h,095h,095h,092h	; 61c1  ..T.....
	defb 06ch,06dh,071h,05dh,000h,000h,084h,092h	; 61c9  lmq]....
	defb 094h,094h,095h,09ch,09dh,0a1h,08dh,000h	; 61d1  ........
	defb 054h,059h,05bh,060h,05bh,06dh,060h,0a2h	; 61d9  TY[`[m`.
	defb 08dh,000h	; 61e1

; ----------------------------------------------------------------------
; DATOS forma_61E3: forma de 16 columnas x 8 filas (entrada 14 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (130
;   bytes)
;   0x61e3..0x6265  (130 bytes)
DATA_forma_61E3:
	defb 010h,008h,000h,000h,000h,000h,000h,054h,096h,097h,000h,000h,000h,000h,098h,0b8h	; 61e3  .......T........
	defb 0b6h,0b8h,000h,000h,056h,095h,0b8h,0b6h,0b8h,0b8h,000h,055h,09dh,0b8h,0b8h,0b7h	; 61f3  ....V......U....
	defb 0b8h,0b8h,000h,099h,09eh,0b7h,0b0h,0b3h,0b8h,0b8h,057h,0b7h,09eh,0b4h,0b8h,0b0h	; 6203  ..........W.....
	defb 0b1h,0b8h,09ah,0b5h,0b2h,0b3h,0b8h,0b6h,0b8h,09fh,09bh,0b8h,0b8h,0b0h,0b8h,0b0h	; 6213  ................
	defb 0a3h,0a0h,09bh,0b0h,0b1h,0b6h,0b0h,0adh,0a0h,0a1h,0a9h,0b7h,0b8h,0b8h,0a3h,0aeh	; 6223  ................
	defb 0abh,0a6h,05bh,0b5h,0b2h,0b8h,0a4h,0abh,0a7h,0a2h,05ah,0b8h,0b6h,0b0h,0a5h,0aah	; 6233  ..[.......Z.....
	defb 0afh,090h,000h,053h,0b8h,0b8h,0b4h,0ach,0a8h,091h,000h,000h,052h,0b8h,0b3h,0b1h	; 6243  ...S........R...
	defb 0ach,092h,000h,000h,000h,059h,0b8h,0b6h,0b8h,093h,000h,000h,000h,000h,058h,05ch	; 6253  .....Y........X\
	defb 09ch,094h	; 6263

; ----------------------------------------------------------------------
; DATOS forma_6265: forma de 8 columnas x 8 filas (entrada 16 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (66 bytes)
;   0x6265..0x62a7  (66 bytes)
DATA_forma_6265:
	defb 008h,008h,056h,057h,058h,059h,079h,078h	; 6265  ..VWXYyx
	defb 077h,076h,05ah,05bh,05ch,05dh,07dh,07ch	; 626d  wvZ[\]}|
	defb 07bh,07ah,05eh,05fh,060h,061h,081h,080h	; 6275  {z^_`a..
	defb 07fh,07eh,062h,063h,064h,065h,085h,084h	; 627d  .~bcde..
	defb 083h,082h,05ah,05bh,066h,067h,087h,086h	; 6285  ..Z[fg..
	defb 07bh,07ah,068h,069h,06ah,000h,000h,08ah	; 628d  {zhij...
	defb 089h,088h,06bh,066h,06ch,000h,000h,08ch	; 6295  ..kfl...
	defb 086h,08bh,000h,06dh,06eh,052h,072h,08eh	; 629d  ...mnRr.
	defb 08dh,000h	; 62a5

; ----------------------------------------------------------------------
; DATOS forma_62A7: forma de 11 columnas x 11 filas (entrada 18 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (123
;   bytes)
;   0x62a7..0x6322  (123 bytes)
DATA_forma_62A7:
	defb 00bh,00bh,000h,000h,000h,000h,052h,053h,054h,055h,000h	; 62a7  ......RSTU.
	defb 000h,000h,000h,000h,056h,057h,058h,059h,05ah,05bh,05ch	; 62b2  ....VWXYZ[\
	defb 000h,000h,05dh,05eh,05fh,060h,061h,062h,063h,064h,065h	; 62bd  ..]^_`abcde
	defb 066h,067h,068h,069h,06ah,06bh,06ch,06dh,06eh,06fh,070h	; 62c8  fghijklmnop
	defb 071h,072h,073h,05eh,074h,075h,076h,077h,060h,065h,074h	; 62d3  qrs^tuvw`et
	defb 078h,079h,07ah,07bh,07ch,07dh,07eh,07fh,080h,081h,082h	; 62de  xyz{|}~....
	defb 083h,084h,000h,085h,086h,086h,088h,089h,08ah,08bh,08ch	; 62e9  ...........
	defb 08dh,08eh,000h,000h,000h,000h,000h,08fh,090h,091h,092h	; 62f4  ...........
	defb 093h,094h,000h,000h,000h,000h,000h,095h,096h,08fh,090h	; 62ff  ...........
	defb 097h,098h,000h,000h,000h,000h,000h,000h,000h,099h,09ah	; 630a  ...........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,09bh	; 6315  ...........
	defb 09ch,000h	; 6320

; ----------------------------------------------------------------------
; DATOS forma_6322: forma de 8 columnas x 11 filas (entrada 19 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (90 bytes)
;   0x6322..0x637c  (90 bytes)
DATA_forma_6322:
	defb 008h,00bh,000h,000h,000h,052h,000h,000h	; 6322  .....R..
	defb 053h,054h,000h,000h,000h,000h,055h,056h	; 632a  ST....UV
	defb 057h,058h,059h,05ah,05ah,05bh,05ch,05dh	; 6332  WXYZZ[\]
	defb 079h,060h,061h,062h,063h,064h,065h,066h	; 633a  y`abcdef
	defb 067h,068h,069h,07ah,06ch,06dh,06eh,06fh	; 6342  ghizlmno
	defb 070h,071h,072h,073h,074h,000h,0aah,09ch	; 634a  pqrst...
	defb 09dh,09eh,09fh,0a0h,0a1h,0a2h,0a3h,0a4h	; 6352  ........
	defb 000h,0a9h,090h,091h,092h,093h,094h,095h	; 635a  ........
	defb 096h,097h,098h,099h,000h,085h,086h,087h	; 6362  ........
	defb 088h,089h,08ah,08ah,08bh,08ch,08dh,000h	; 636a  ........
	defb 000h,000h,082h,000h,000h,083h,084h,000h	; 6372  ........
	defb 000h,000h	; 637a

; ----------------------------------------------------------------------
; DATOS forma_637C: forma de 2 columnas x 2 filas (entrada 20 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (6 bytes)
;   0x637c..0x6382  (6 bytes)
DATA_forma_637C:
	defb 002h,002h	; 637c
	defb 073h,05eh	; 637e
	defb 07ah,07bh	; 6380

; ----------------------------------------------------------------------
; DATOS forma_6382: forma de 2 columnas x 2 filas (entrada 21 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (6 bytes)
;   0x6382..0x6388  (6 bytes)
DATA_forma_6382:
	defb 002h,002h	; 6382
	defb 073h,0bdh	; 6384
	defb 07ah,0beh	; 6386

; ----------------------------------------------------------------------
; DATOS forma_6388: forma de 2 columnas x 2 filas (entrada 22 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (6 bytes)
;   0x6388..0x638e  (6 bytes)
DATA_forma_6388:
	defb 002h,002h	; 6388
	defb 0bfh,0c0h	; 638a
	defb 0c1h,0c2h	; 638c

; ----------------------------------------------------------------------
; DATOS forma_638E: forma de 2 columnas x 2 filas (entrada 23 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (6 bytes)
;   0x638e..0x6394  (6 bytes)
DATA_forma_638E:
	defb 002h,002h	; 638e
	defb 0c3h,0c4h	; 6390
	defb 0c5h,0c2h	; 6392

; ----------------------------------------------------------------------
; DATOS forma_6394: forma de 2 columnas x 2 filas (entrada 24 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (6 bytes)
;   0x6394..0x639a  (6 bytes)
DATA_forma_6394:
	defb 002h,002h	; 6394
	defb 000h,000h	; 6396
	defb 000h,000h	; 6398

; ----------------------------------------------------------------------
; DATOS forma_639A: forma de 9 columnas x 5 filas (entrada 25, 26 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (47 bytes)
;   0x639a..0x63c9  (47 bytes)
DATA_forma_639A:
	defb 009h,005h,0f9h,09eh,0dfh,0dch,0e2h,0d8h,0f5h	; 639a  .........
	defb 0ffh,0deh,0efh,0edh,0fdh,0feh,0e6h,0d6h,0ebh	; 63a3  .........
	defb 000h,000h,000h,0d4h,0eah,000h,000h,000h,0d3h	; 63ac  .........
	defb 0eah,000h,000h,000h,0d3h,0eah,000h,000h,000h	; 63b5  .........
	defb 0d3h,0ebh,000h,000h,000h,0d4h,0d2h,000h,000h	; 63be  .........
	defb 000h,0e9h	; 63c7

; ----------------------------------------------------------------------
; DATOS forma_63C9: forma de 1 columnas x 3 filas (entrada 27 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (5 bytes)
;   0x63c9..0x63ce  (5 bytes)
DATA_forma_63C9:
	defb 001h,003h	; 63c9
	defb 0b6h,0b7h	; 63cb
	defb 0cdh	; 63cd

; ----------------------------------------------------------------------
; DATOS forma_63CE: forma de 4 columnas x 2 filas (entrada 28, 29 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (10 bytes)
;   0x63ce..0x63d8  (10 bytes)
DATA_forma_63CE:
	defb 004h,002h,05eh,05fh	; 63ce
	defb 06ah,06bh,09ah,09bh	; 63d2
	defb 08eh,08fh	; 63d6

; ----------------------------------------------------------------------
; DATOS forma_63D8: forma de 4 columnas x 2 filas (entrada 30 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (10 bytes)
;   0x63d8..0x63e2  (10 bytes)
DATA_forma_63D8:
	defb 004h,002h,075h,076h	; 63d8
	defb 077h,078h,0a7h,0a8h	; 63dc
	defb 0a5h,0a6h	; 63e0

; ----------------------------------------------------------------------
; DATOS forma_63E2: forma de 2 columnas x 3 filas (entrada 31 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (8 bytes)
;   0x63e2..0x63ea  (8 bytes)
DATA_forma_63E2:
	defb 002h,003h	; 63e2
	defb 066h,067h	; 63e4
	defb 068h,069h	; 63e6
	defb 06ah,06bh	; 63e8

; ----------------------------------------------------------------------
; DATOS forma_63EA: forma de 2 columnas x 3 filas (entrada 32 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (8 bytes)
;   0x63ea..0x63f2  (8 bytes)
DATA_forma_63EA:
	defb 002h,003h	; 63ea
	defb 06ch,06dh	; 63ec
	defb 06eh,06fh	; 63ee
	defb 070h,071h	; 63f0

; ----------------------------------------------------------------------
; DATOS forma_63F2: forma de 2 columnas x 3 filas (entrada 33 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (8 bytes)
;   0x63f2..0x63fa  (8 bytes)
DATA_forma_63F2:
	defb 002h,003h	; 63f2
	defb 072h,073h	; 63f4
	defb 074h,075h	; 63f6
	defb 076h,077h	; 63f8

; ----------------------------------------------------------------------
; DATOS forma_63FA: forma de 2 columnas x 3 filas (entrada 34 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (8 bytes)
;   0x63fa..0x6402  (8 bytes)
DATA_forma_63FA:
	defb 002h,003h	; 63fa
	defb 078h,079h	; 63fc
	defb 07ah,07bh	; 63fe
	defb 07ch,07dh	; 6400

; ----------------------------------------------------------------------
; DATOS forma_6402: forma de 2 columnas x 3 filas (entrada 36 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (8 bytes)
;   0x6402..0x640a  (8 bytes)
DATA_forma_6402:
	defb 002h,003h	; 6402
	defb 000h,000h	; 6404
	defb 000h,000h	; 6406
	defb 000h,000h	; 6408

; ----------------------------------------------------------------------
; DATOS forma_640A: forma de 5 columnas x 3 filas (entrada 35, 37 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (17 bytes)
;   0x640a..0x641b  (17 bytes)
DATA_forma_640A:
	defb 005h,003h,0b8h,000h,0cfh	; 640a
	defb 0bfh,0a7h,0a8h,0aeh,0a5h	; 640f
	defb 0c5h,0c2h,0a6h,0abh,064h	; 6414
	defb 0adh,060h	; 6419

; ----------------------------------------------------------------------
; DATOS bloques_giro: 20 punteros a bloques de 2 x 2: p11:AABA los elige con A
;   = C / 2, y C = ((angulo + 8) >> 3) & 0x1E llega a 15; las palabras 16 a 19
;   no las alcanza ese calculo; lo leen p11:AABD (40 bytes)
;   0x641b..0x6443  (40 bytes)
DATA_bloques_giro:
	defw 06443h,06447h,06447h,0644bh,0644bh,0644bh,0644fh,0644fh	; 641b
	defw 0644fh,06453h,06453h,06457h,06457h,06457h,06443h,06443h	; 642b
	defw 0644bh,0644bh,06457h,06457h	; 643b  -> DATA_bloque_644B DATA_bloque_644B DATA_bloque_6457 DATA_bloque_6457

; ----------------------------------------------------------------------
; DATOS bloque_6443: bloque de 2 x 2 caracteres de 0x641B (B = C = 2,
;   p11:AAC1); lo leen p11:AAC1 (4 bytes)
;   0x6443..0x6447  (4 bytes)
DATA_bloque_6443:
	defb 0b3h,0b4h,0b1h,0b2h	; 6443

; ----------------------------------------------------------------------
; DATOS bloque_6447: bloque de 2 x 2 caracteres de 0x641B (B = C = 2,
;   p11:AAC1); lo leen p11:AAC1 (4 bytes)
;   0x6447..0x644b  (4 bytes)
DATA_bloque_6447:
	defb 0a5h,0a6h,0a7h,0a8h	; 6447

; ----------------------------------------------------------------------
; DATOS bloque_644B: bloque de 2 x 2 caracteres de 0x641B (B = C = 2,
;   p11:AAC1); lo leen p11:AAC1 (4 bytes)
;   0x644b..0x644f  (4 bytes)
DATA_bloque_644B:
	defb 0a9h,0aah,0abh,0ach	; 644b

; ----------------------------------------------------------------------
; DATOS bloque_644F: bloque de 2 x 2 caracteres de 0x641B (B = C = 2,
;   p11:AAC1); lo leen p11:AAC1 (4 bytes)
;   0x644f..0x6453  (4 bytes)
DATA_bloque_644F:
	defb 0aeh,0adh,0b0h,0afh	; 644f

; ----------------------------------------------------------------------
; DATOS bloque_6453: bloque de 2 x 2 caracteres de 0x641B (B = C = 2,
;   p11:AAC1); lo leen p11:AAC1 (4 bytes)
;   0x6453..0x6457  (4 bytes)
DATA_bloque_6453:
	defb 0bch,0bbh,0bah,0b9h	; 6453

; ----------------------------------------------------------------------
; DATOS bloque_6457: bloque de 2 x 2 caracteres de 0x641B (B = C = 2,
;   p11:AAC1); lo leen p11:AAC1 (4 bytes)
;   0x6457..0x645b  (4 bytes)
DATA_bloque_6457:
	defb 0b7h,0b8h,0b5h,0b6h	; 6457

; ----------------------------------------------------------------------
; DATOS bloque_645B: bloque de 2 x 2 caracteres que p11:AAB3 pone en DE (B = C
;   = 2, p11:AAC1); lo leen p11:AAC1 (4 bytes)
;   0x645b..0x645f  (4 bytes)
DATA_bloque_645B:
	defb 0a1h,0a2h,0a3h,0a4h	; 645b

; ----------------------------------------------------------------------
; DATOS giro_16: 16 pares (x, y) de desplazamiento, uno por direccion de las
;   16 de un circulo: p11:AA89 lee 0x6460 + C (y) y, con `dec hl`, 0x645F + C
;   (x); lo leen p11:AA93 (32 bytes)
;   0x645f..0x647f  (32 bytes)
DATA_giro_16:
	defb 000h,0f0h	; 645f
	defb 0f8h,0f0h	; 6461
	defb 0f0h,0f0h	; 6463
	defb 0f0h,0f8h	; 6465
	defb 0f0h,000h	; 6467
	defb 0f0h,008h	; 6469
	defb 0f0h,010h	; 646b
	defb 0f8h,010h	; 646d
	defb 000h,010h	; 646f
	defb 008h,010h	; 6471
	defb 010h,010h	; 6473
	defb 010h,008h	; 6475
	defb 010h,000h	; 6477
	defb 010h,0f8h	; 6479
	defb 010h,0f0h	; 647b
	defb 008h,0f0h	; 647d

; ----------------------------------------------------------------------
; DATOS detras_de_giro_16: 8 bytes entre los 16 pares de 0x645F y la tabla de
;   0x6487: p11:AA89 solo llega a 0x647E (C <= 0x1E) y nadie mas los apunta:
;   SIN LECTOR a la vista; lo leen nadie (8 bytes)
;   0x647f..0x6487  (8 bytes)
DATA_detras_de_giro_16:
	defb 000h,000h,0f0h,0f8h,000h,000h,010h,008h	; 647f  ........

; ----------------------------------------------------------------------
; DATOS piezas_6487: 16 punteros (p11:A829: A & 0x0F, p00:4E28) a piezas sin
;   cabecera; sus columnas y filas las da la ficha de 0x6547 con el mismo
;   indice; lo leen p11:A82C (32 bytes)
;   0x6487..0x64a7  (32 bytes)
DATA_piezas_6487:
	defw 064a7h,064b3h,064bbh,064c3h,064cfh,064dbh,064e3h,064ebh	; 6487
	defw 064f7h,06503h,0650bh,06513h,0651fh,0652bh,06533h,0653bh	; 6497

; ----------------------------------------------------------------------
; DATOS pieza_64A7: pieza 0 de 0x6487: 4 columnas x 3 filas (de la ficha 0 de
;   0x6547) que p11:B73A copia; lo leen p11:A830 (12 bytes)
;   0x64a7..0x64b3  (12 bytes)
DATA_pieza_64A7:
	defb 06fh,000h,000h,000h	; 64a7
	defb 06fh,000h,000h,000h	; 64ab
	defb 06fh,000h,000h,06fh	; 64af

; ----------------------------------------------------------------------
; DATOS pieza_64B3: pieza 1 de 0x6487: 4 columnas x 2 filas (de la ficha 1 de
;   0x6547) que p11:B73A copia; lo leen p11:A830 (8 bytes)
;   0x64b3..0x64bb  (8 bytes)
DATA_pieza_64B3:
	defb 06fh,000h,000h,06fh	; 64b3
	defb 000h,06fh,000h,06fh	; 64b7

; ----------------------------------------------------------------------
; DATOS pieza_64BB: pieza 2 de 0x6487: 4 columnas x 2 filas (de la ficha 2 de
;   0x6547) que p11:B73A copia; lo leen p11:A830 (8 bytes)
;   0x64bb..0x64c3  (8 bytes)
DATA_pieza_64BB:
	defb 000h,06fh,000h,06fh	; 64bb
	defb 000h,06fh,06fh,000h	; 64bf

; ----------------------------------------------------------------------
; DATOS pieza_64C3: pieza 3 de 0x6487: 4 columnas x 3 filas (de la ficha 3 de
;   0x6547) que p11:B73A copia; lo leen p11:A830 (12 bytes)
;   0x64c3..0x64cf  (12 bytes)
DATA_pieza_64C3:
	defb 000h,000h,06fh,000h	; 64c3
	defb 000h,06fh,000h,06fh	; 64c7
	defb 000h,06fh,000h,000h	; 64cb

; ----------------------------------------------------------------------
; DATOS pieza_64CF: pieza 4 de 0x6487: 3 columnas x 4 filas (de la ficha 4 de
;   0x6547) que p11:B73A copia; lo leen p11:A830 (12 bytes)
;   0x64cf..0x64db  (12 bytes)
DATA_pieza_64CF:
	defb 000h,000h,000h	; 64cf
	defb 06fh,000h,000h	; 64d2
	defb 06fh,000h,06fh	; 64d5
	defb 06fh,000h,000h	; 64d8

; ----------------------------------------------------------------------
; DATOS pieza_64DB: pieza 5 de 0x6487: 2 columnas x 4 filas (de la ficha 5 de
;   0x6547) que p11:B73A copia; lo leen p11:A830 (8 bytes)
;   0x64db..0x64e3  (8 bytes)
DATA_pieza_64DB:
	defb 000h,000h	; 64db
	defb 000h,06fh	; 64dd
	defb 06fh,06fh	; 64df
	defb 06fh,000h	; 64e1

; ----------------------------------------------------------------------
; DATOS pieza_64E3: pieza 6 de 0x6487: 2 columnas x 4 filas (de la ficha 6 de
;   0x6547) que p11:B73A copia; lo leen p11:A830 (8 bytes)
;   0x64e3..0x64eb  (8 bytes)
DATA_pieza_64E3:
	defb 06fh,000h	; 64e3
	defb 000h,000h	; 64e5
	defb 000h,06fh	; 64e7
	defb 06fh,06fh	; 64e9

; ----------------------------------------------------------------------
; DATOS pieza_64EB: pieza 7 de 0x6487: 3 columnas x 4 filas (de la ficha 7 de
;   0x6547) que p11:B73A copia; lo leen p11:A830 (12 bytes)
;   0x64eb..0x64f7  (12 bytes)
DATA_pieza_64EB:
	defb 06fh,000h,000h	; 64eb
	defb 000h,000h,06fh	; 64ee
	defb 000h,000h,000h	; 64f1
	defb 000h,06fh,06fh	; 64f4

; ----------------------------------------------------------------------
; DATOS pieza_64F7: pieza 8 de 0x6487: 4 columnas x 3 filas (de la ficha 8 de
;   0x6547) que p11:B73A copia; lo leen p11:A830 (12 bytes)
;   0x64f7..0x6503  (12 bytes)
DATA_pieza_64F7:
	defb 06fh,000h,000h,06fh	; 64f7
	defb 000h,000h,000h,06fh	; 64fb
	defb 000h,000h,000h,06fh	; 64ff

; ----------------------------------------------------------------------
; DATOS pieza_6503: pieza 9 de 0x6487: 4 columnas x 2 filas (de la ficha 9 de
;   0x6547) que p11:B73A copia; lo leen p11:A830 (8 bytes)
;   0x6503..0x650b  (8 bytes)
DATA_pieza_6503:
	defb 06fh,000h,06fh,000h	; 6503
	defb 06fh,000h,000h,06fh	; 6507

; ----------------------------------------------------------------------
; DATOS pieza_650B: pieza 10 de 0x6487: 4 columnas x 2 filas (de la ficha 10
;   de 0x6547) que p11:B73A copia; lo leen p11:A830 (8 bytes)
;   0x650b..0x6513  (8 bytes)
DATA_pieza_650B:
	defb 000h,06fh,06fh,000h	; 650b
	defb 06fh,000h,06fh,000h	; 650f

; ----------------------------------------------------------------------
; DATOS pieza_6513: pieza 11 de 0x6487: 4 columnas x 3 filas (de la ficha 11
;   de 0x6547) que p11:B73A copia; lo leen p11:A830 (12 bytes)
;   0x6513..0x651f  (12 bytes)
DATA_pieza_6513:
	defb 000h,000h,06fh,000h	; 6513
	defb 06fh,000h,06fh,000h	; 6517
	defb 000h,06fh,000h,000h	; 651b

; ----------------------------------------------------------------------
; DATOS pieza_651F: pieza 12 de 0x6487: 3 columnas x 4 filas (de la ficha 12
;   de 0x6547) que p11:B73A copia; lo leen p11:A830 (12 bytes)
;   0x651f..0x652b  (12 bytes)
DATA_pieza_651F:
	defb 000h,000h,06fh	; 651f
	defb 06fh,000h,06fh	; 6522
	defb 000h,000h,06fh	; 6525
	defb 000h,000h,000h	; 6528

; ----------------------------------------------------------------------
; DATOS pieza_652B: pieza 13 de 0x6487: 2 columnas x 4 filas (de la ficha 13
;   de 0x6547) que p11:B73A copia; lo leen p11:A830 (8 bytes)
;   0x652b..0x6533  (8 bytes)
DATA_pieza_652B:
	defb 000h,06fh	; 652b
	defb 06fh,06fh	; 652d
	defb 06fh,000h	; 652f
	defb 000h,000h	; 6531

; ----------------------------------------------------------------------
; DATOS pieza_6533: pieza 14 de 0x6487: 2 columnas x 4 filas (de la ficha 14
;   de 0x6547) que p11:B73A copia; lo leen p11:A830 (8 bytes)
;   0x6533..0x653b  (8 bytes)
DATA_pieza_6533:
	defb 06fh,06fh	; 6533
	defb 06fh,000h	; 6535
	defb 000h,000h	; 6537
	defb 000h,06fh	; 6539

; ----------------------------------------------------------------------
; DATOS pieza_653B: pieza 15 de 0x6487: 3 columnas x 4 filas (de la ficha 15
;   de 0x6547) que p11:B73A copia; lo leen p11:A830 (12 bytes)
;   0x653b..0x6547  (12 bytes)
DATA_pieza_653B:
	defb 06fh,06fh,000h	; 653b
	defb 000h,000h,000h	; 653e
	defb 06fh,000h,000h	; 6541
	defb 000h,000h,06fh	; 6544

; ----------------------------------------------------------------------
; DATOS piezas_6547: 16 fichas de 4 bytes [columnas][filas][dx][dy] que
;   p11:A84A elige con A x 4; lo leen p11:A84F (64 bytes)
;   0x6547..0x6587  (64 bytes)
DATA_piezas_6547:
	defb 004h,003h,010h,0e0h	; 6547
	defb 004h,002h,028h,0e0h	; 654b
	defb 004h,002h,040h,0e8h	; 654f
	defb 004h,003h,040h,0f8h	; 6553
	defb 003h,004h,040h,010h	; 6557
	defb 002h,004h,040h,028h	; 655b
	defb 002h,004h,038h,040h	; 655f
	defb 003h,004h,028h,040h	; 6563
	defb 004h,003h,018h,040h	; 6567
	defb 004h,002h,008h,040h	; 656b
	defb 004h,002h,0f0h,038h	; 656f
	defb 004h,003h,0e8h,028h	; 6573
	defb 003h,004h,0e0h,018h	; 6577
	defb 002h,004h,0e0h,008h	; 657b
	defb 002h,004h,0e8h,0f0h	; 657f
	defb 003h,004h,0f8h,0e8h	; 6583

; ----------------------------------------------------------------------
; DATOS forma_6587: forma de 23 columnas x 16 filas (entrada 15 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (370
;   bytes)
;   0x6587..0x66f9  (370 bytes)
DATA_forma_6587:
	defb 017h,010h,000h,000h,000h,000h,000h,05fh,05eh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6587  ......._^..............
	defb 000h,0a9h,061h,000h,062h,061h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,062h,0b4h,0aeh,0c8h,0c5h,0cbh,05eh	; 659e  ..a.ba..........b.....^
	defb 000h,000h,000h,000h,000h,05eh,000h,000h,065h,065h,0c0h,000h,000h,000h,0a9h,0bfh,05eh,000h,000h,000h,000h,0cbh,05eh	; 65b5  .....^..ee......^.....^
	defb 000h,0a9h,0a9h,0abh,000h,000h,000h,0c2h,060h,000h,000h,000h,000h,062h,0b4h,0aeh,0b1h,0c5h,0cbh,0b4h,060h,000h,064h	; 65cc  ........`....b......`.d
	defb 0cbh,063h,000h,000h,000h,000h,0cbh,0c0h,000h,000h,000h,0a9h,0a5h,0b6h,0b7h,0cdh,0bch,061h,000h,062h,05eh,000h,0b3h	; 65e3  .c...............a.b^..
	defb 0abh,000h,000h,000h,0c2h,0b3h,0b6h,0b7h,0cdh,0bch,0cah,0c0h,062h,0c0h,000h,064h,0b4h,060h,000h,064h,0cbh,0a5h,0b6h	; 65fa  ............b..d.`.d...
	defb 0b7h,0cdh,0bch,0b4h,0cbh,0cah,060h,000h,000h,0a5h,0b6h,0b7h,0cdh,0bch,0a6h,0b6h,0b7h,0cdh,0bdh,0c0h,0a9h,0c0h,061h	; 6611  ......`...............a
	defb 000h,000h,0a5h,0b6h,0b7h,0cdh,0bch,060h,0b6h,0b7h,0cdh,064h,0c3h,0bfh,0cah,0b0h,0bah,062h,0a5h,0b6h,0b7h,0cdh,0bch	; 6628  .......`...d.....b.....
	defb 05eh,000h,000h,000h,062h,0aeh,0b4h,065h,0b8h,0b9h,05fh,0a5h,0b6h,0b7h,0cdh,0bch,000h,000h,000h,05fh,0b6h,0cch,0c2h	; 663f  ^...b..e.._........_...
	defb 0b4h,060h,000h,062h,0a6h,0b6h,0b7h,0cdh,0bdh,000h,000h,000h,000h,062h,064h,0cbh,0b4h,0b6h,0b7h,064h,0aeh,000h,000h	; 6656  .`.b.........bd....d...
	defb 05fh,0a4h,000h,000h,000h,062h,0cbh,061h,064h,0c0h,0b6h,0b7h,05fh,0b4h,000h,000h,000h,000h,000h,000h,000h,064h,0b3h	; 666d  _....b.ad..._........d.
	defb 0a8h,05eh,0a6h,0b6h,0b7h,000h,0a7h,000h,000h,000h,000h,000h,000h,000h,000h,064h,0cbh,0b4h,0c1h,0b6h,0b7h,000h,000h	; 6684  .^.............d.......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,062h,0c2h,0c0h,0b3h,0b6h,0b7h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 669b  ........b..............
	defb 000h,0a7h,0c5h,0cbh,0a5h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0b3h,0a5h,000h,000h	; 66b2  .......................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,064h,0a5h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 66c9  ............d..........
	defb 000h,000h,000h,000h,000h,05fh,0a6h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0a7h	; 66e0  ....._.................
	defb 000h,000h	; 66f7

; ----------------------------------------------------------------------
; DATOS forma_66F9: forma de 17 columnas x 13 filas (entrada 17 de 0x6079):
;   [columnas][filas] y los caracteres (p11:B71E); lo leen p11:B71E (223
;   bytes)
;   0x66f9..0x67d8  (223 bytes)
DATA_forma_66F9:
	defb 011h,00dh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,05eh,000h,000h,000h,000h	; 66f9  ............^....
	defb 000h,062h,061h,000h,000h,000h,000h,065h,0cbh,05eh,000h,000h,000h,000h,000h,064h,0c0h	; 670a  .ba....e.^.....d.
	defb 061h,000h,000h,062h,0b4h,0aeh,0b1h,000h,000h,000h,000h,065h,0cbh,0cch,0c0h,000h,0cbh	; 671b  a..b.......e.....
	defb 0c0h,0b0h,0bah,000h,000h,000h,000h,062h,0b4h,0aeh,0b1h,0c5h,0cbh,0cah,0b8h,0b9h,000h	; 672c  .......b.........
	defb 000h,000h,000h,0cbh,0c0h,000h,000h,000h,0a9h,0c0h,060h,000h,000h,000h,000h,062h,0cah	; 673d  ..........`....b.
	defb 0abh,000h,000h,000h,0c0h,0b3h,0b6h,0b7h,062h,061h,000h,000h,064h,0b4h,060h,000h,064h	; 674e  ........ba..d.`.d
	defb 0bch,0a5h,0b6h,0b7h,000h,064h,0c0h,061h,05eh,0a5h,0b6h,0b7h,0cdh,0bch,0a5h,0b6h,0b7h	; 675f  .....d.a^........
	defb 000h,000h,064h,0c0h,0cbh,0a5h,0b6h,0b7h,0cdh,0bch,0a5h,0b6h,0b7h,000h,000h,065h,0cbh	; 6770  ..d............e.
	defb 0c0h,0a5h,0b6h,0b7h,0cdh,0bch,0a5h,0b6h,0b7h,000h,000h,062h,0cah,0aeh,0a5h,0b6h,0b7h	; 6781  ...........b.....
	defb 0cdh,0bch,0a5h,000h,000h,000h,000h,000h,064h,0b3h,0a6h,0b6h,0b7h,0cdh,0bdh,0a5h,000h	; 6792  ........d........
	defb 000h,000h,000h,000h,000h,064h,0b4h,000h,000h,000h,064h,0a5h,000h,000h,000h,000h,000h	; 67a3  .....d....d......
	defb 000h,000h,0bbh,000h,000h,000h,062h,0a5h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 67b4  ......b..........
	defb 000h,000h,05fh,0a6h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0bbh	; 67c5  .._..............
	defb 063h,000h	; 67d6

; ----------------------------------------------------------------------
; DATOS caracteres_jefe: 7 punteros (0xE640 = 1 a 7; tabla en 0x67D6 + 2 x A):
;   listas de caracteres al llegar el jefe; p00:4DC8 las pide con 0xE640 = 1,
;   2 o 7; con 3 y 6 p00:4E08 pone 0x6822 en 0xE220 (la misma lista que las
;   entradas 3 y 6), con 8 no carga nada, y 4 y 5 no los pone nadie
;   (p02:8591-86AF); lo leen p00:4DE1 (14 bytes)
;   0x67d8..0x67e6  (14 bytes)
DATA_caracteres_jefe:
	defw 06802h,06815h,06822h,0685fh,06853h,06822h,0687eh	; 67d8

; ----------------------------------------------------------------------
; DATOS copias_jefe_a: 7 punteros (0xE640 = 1 a 7; tabla en 0x67E4 + 2 x A):
;   copias en espejo al llegar el jefe; lo leen p00:4DEE (14 bytes)
;   0x67e6..0x67f4  (14 bytes)
DATA_copias_jefe_a:
	defw 0688bh,06890h,06895h,068aeh,068aeh,06895h,068a6h	; 67e6

; ----------------------------------------------------------------------
; DATOS copias_jefe_b: 7 punteros (0xE640 = 1 a 7; tabla en 0x67F2 + 2 x A):
;   copias cabeza abajo al llegar el jefe; lo leen p00:4DFB (14 bytes)
;   0x67f4..0x6802  (14 bytes)
DATA_copias_jefe_b:
	defw 068afh,068c0h,068c0h,068bch,068b4h,068c0h,068c0h	; 67f4

; ----------------------------------------------------------------------
; DATOS caracteres_6802: lista de caracteres (p00:4540) de 0xE640 = 1: fichas
;   de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; lo leen
;   p00:4DE1 (19 bytes)
;   0x6802..0x6815  (19 bytes)
DATA_caracteres_6802:
	defb 007h,040h,096h,052h,0d8h,098h	; 6802
	defb 007h,05eh,081h,09dh,0ddh,086h	; 6808
	defb 007h,08eh,098h,0bdh,082h,099h	; 680e
	defb 000h	; 6814

; ----------------------------------------------------------------------
; DATOS caracteres_6815: lista de caracteres (p00:4540) de 0xE640 = 2: fichas
;   de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; lo leen
;   p00:4DE1 (13 bytes)
;   0x6815..0x6822  (13 bytes)
DATA_caracteres_6815:
	defb 007h,0e8h,09bh,052h,0d6h,09ch	; 6815
	defb 007h,0cch,09ch,06fh,097h,09dh	; 681b
	defb 000h	; 6821

; ----------------------------------------------------------------------
; DATOS caracteres_6822: lista de caracteres (p00:4540) de 0xE640 = 3, 6:
;   fichas de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; lo leen
;   p00:4DE1, p00:4E0E (49 bytes)
;   0x6822..0x6853  (49 bytes)
DATA_caracteres_6822:
	defb 007h,06eh,069h,05eh,04ch,06bh	; 6822
	defb 007h,0c5h,069h,0a4h,09eh,06bh	; 6828
	defb 007h,0d1h,068h,0a0h,0f3h,068h	; 682e
	defb 007h,0c1h,068h,09dh,0c9h,068h	; 6834
	defb 007h,03ch,069h,066h,099h,06ah	; 683a
	defb 007h,03ch,069h,06ch,0c6h,06ah	; 6840
	defb 007h,03ch,069h,072h,0f3h,06ah	; 6846
	defb 007h,03ch,069h,078h,020h,06bh	; 684c
	defb 000h	; 6852

; ----------------------------------------------------------------------
; DATOS caracteres_6853: lista de caracteres (p00:4540) de 0xE640 = 5: fichas
;   de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; se solapan 2
;   bloques: (caracteres_685F 685F-687E); lo leen p00:4DE1 (43 bytes)
;   0x6853..0x687e  (43 bytes)
DATA_caracteres_6853:
	defb 007h,08dh,069h,07bh,064h,06bh	; 6853
	defb 007h,013h,069h,0b2h,072h,06ah	; 6859
	defb 007h,0a7h,099h,052h,0d7h,09ah	; 685f
	defb 007h,01eh,074h,0c0h,040h,074h	; 6865
	defb 007h,0a9h,09ah,075h,0c2h,09bh	; 686b
	defb 007h,0c5h,09ah,079h,0dbh,09bh	; 6871
	defb 007h,0d1h,068h,0bch,0f3h,068h	; 6877
	defb 000h	; 687d

; ----------------------------------------------------------------------
; DATOS caracteres_687E: lista de caracteres (p00:4540) de 0xE640 = 7: fichas
;   de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; lo leen
;   p00:4DE1 (13 bytes)
;   0x687e..0x688b  (13 bytes)
DATA_caracteres_687E:
	defb 007h,0a1h,09dh,052h,026h,09fh	; 687e
	defb 007h,0f6h,09dh,090h,04eh,09fh	; 6884
	defb 000h	; 688a

; ----------------------------------------------------------------------
; DATOS copias_688B: lista de copias de caracteres VRAM -> VRAM en espejo
;   (p00:44F3) de 0xE640 = 1: 4 bytes, 3 si el tercero lleva los bits altos; 0
;   acaba; lo leen p00:4DEE (5 bytes)
;   0x688b..0x6890  (5 bytes)
DATA_copias_688B:
	defb 0a5h,0adh,03fh,004h	; 688b
	defb 000h	; 688f

; ----------------------------------------------------------------------
; DATOS copias_6890: lista de copias de caracteres VRAM -> VRAM en espejo
;   (p00:44F3) de 0xE640 = 2: 4 bytes, 3 si el tercero lleva los bits altos; 0
;   acaba; lo leen p00:4DEE (5 bytes)
;   0x6890..0x6895  (5 bytes)
DATA_copias_6890:
	defb 052h,072h,03fh,01dh	; 6890
	defb 000h	; 6894

; ----------------------------------------------------------------------
; DATOS copias_6895: lista de copias de caracteres VRAM -> VRAM en espejo
;   (p00:44F3) de 0xE640 = 3, 6: 4 bytes, 3 si el tercero lleva los bits
;   altos; 0 acaba; lo leen p00:4DEE, p00:4E14 (17 bytes)
;   0x6895..0x68a6  (17 bytes)
DATA_copias_6895:
	defb 05eh,062h,03fh,004h	; 6895
	defb 05eh,08ch,03fh,008h	; 6899
	defb 0a4h,0bbh,03fh,017h	; 689d
	defb 0a4h,0d2h,03fh,02eh	; 68a1
	defb 000h	; 68a5

; ----------------------------------------------------------------------
; DATOS copias_68A6: lista de copias de caracteres VRAM -> VRAM en espejo
;   (p00:44F3) de 0xE640 = 7: 4 bytes, 3 si el tercero lleva los bits altos; 0
;   acaba; se solapan 2 bloques: (copias_68AE 68AE-68AF); lo leen p00:4DEE (9
;   bytes)
;   0x68a6..0x68af  (9 bytes)
DATA_copias_68A6:
	defb 052h,082h,03fh,00bh	; 68a6
	defb 090h,0c0h,03fh,029h	; 68aa
	defb 000h	; 68ae

; ----------------------------------------------------------------------
; DATOS copias_68AF: lista de copias de caracteres VRAM -> VRAM cabeza abajo
;   (p00:44F3) de 0xE640 = 1: 4 bytes, 3 si el tercero lleva los bits altos; 0
;   acaba; lo leen p00:4DFB (5 bytes)
;   0x68af..0x68b4  (5 bytes)
DATA_copias_68AF:
	defb 0a5h,0b1h,03fh,00ch	; 68af
	defb 000h	; 68b3

; ----------------------------------------------------------------------
; DATOS copias_68B4: lista de copias de caracteres VRAM -> VRAM cabeza abajo
;   (p00:44F3) de 0xE640 = 5: 4 bytes, 3 si el tercero lleva los bits altos; 0
;   acaba; se solapan 4 bloques: (copias_68BC 68BC-68C1) (copias_68C0
;   68C0-68C1) (copias_68C0 68C0-68C1); lo leen p00:4DFB, p00:4E1A (13 bytes)
;   0x68b4..0x68c1  (13 bytes)
DATA_copias_68B4:
	defb 07bh,0abh,03fh,007h	; 68b4
	defb 0b2h,0b7h,03fh,005h	; 68b8
	defb 052h,082h,03fh,029h	; 68bc
	defb 000h	; 68c0

; ----------------------------------------------------------------------
; DATOS dibujos_68C1: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 157, ficha 3 de la lista 0x6822 (p00:4540); lo leen p00:4DE1,
;   p00:4E0E, p00:5CD5 (8 bytes)
;   0x68c1..0x68c9  (8 bytes)
DATA_dibujos_68C1:
	defb 084h,03ch,0ffh,0ffh,03ch,004h,000h,000h	; 68c1  .<..<...

; ----------------------------------------------------------------------
; DATOS colores_68C9: rachas (p00:4D16) con los colores de los caracteres
;   desde el 157, ficha 3 de la lista 0x6822 (p00:4540); lo leen p00:4DE1,
;   p00:4E0E, p00:5CD5 (8 bytes)
;   0x68c9..0x68d1  (8 bytes)
DATA_colores_68C9:
	defb 084h,0f4h,0f0h,0f0h,0feh,004h,0f0h,000h	; 68c9  ........

; ----------------------------------------------------------------------
; DATOS dibujos_68D1: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 200, ficha 3 de la lista 0x6CD9 (p00:4540); lo leen p00:44DC,
;   p00:4DE1, p00:4E0E, p00:5CD5 (34 bytes)
;   0x68d1..0x68f3  (34 bytes)
DATA_dibujos_68D1:
	defb 002h,000h,085h,022h,099h,057h,0fah,024h,003h,000h,096h,088h,066h,0d5h,0beh,009h	; 68d1  ...".W.$....f...
	defb 000h,028h,030h,064h,038h,028h,050h,034h,018h,034h,018h,028h,030h,064h,038h,028h	; 68e1  .(0d8(P4.4.(0d8(
	defb 050h,000h	; 68f1

; ----------------------------------------------------------------------
; DATOS colores_68F3: rachas (p00:4D16) con los colores de los caracteres
;   desde el 200, ficha 3 de la lista 0x6CD9 (p00:4540); lo leen p00:44DC,
;   p00:4DE1, p00:4E0E, p00:5CD5 (32 bytes)
;   0x68f3..0x6913  (32 bytes)
DATA_colores_68F3:
	defb 003h,050h,084h,040h,070h,040h,050h,004h,080h,095h,060h,090h,060h,080h,080h,050h	; 68f3  .P.@p@P...`.`..P
	defb 070h,040h,070h,050h,040h,040h,070h,060h,090h,080h,090h,060h,090h,080h,060h,000h	; 6903  p@pP@@p`...`..`.

; ----------------------------------------------------------------------
; DATOS dibujos_6913: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 178, ficha 1 de la lista 0x6853 (p00:4540); lo leen p00:4DE1 (41
;   bytes)
;   0x6913..0x693c  (41 bytes)
DATA_dibujos_6913:
	defb 0a3h,0e0h,0c0h,003h,00fh,01fh,01fh,03fh,03fh,008h,007h,0c0h,0f0h,0f8h,0f8h,0fch	; 6913  .......??.......
	defb 0fch,0e0h,0c0h,003h,00fh,01fh,01fh,03fh,03fh,008h,007h,0c0h,0f0h,0f8h,0f8h,0fch	; 6923  .......??.......
	defb 0fch,0e0h,0ffh,0ffh,004h,00ch,081h,0ffh,000h	; 6933  .........

; ----------------------------------------------------------------------
; DATOS dibujos_693C: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 102, ficha 4 de la lista 0x6822 (p00:4540); lo leen p00:4DE1,
;   p00:4E0E (50 bytes)
;   0x693c..0x696e  (50 bytes)
DATA_dibujos_693C:
	defb 098h,0b4h,082h,0f4h,0f1h,0f3h,026h,0ech,001h,03ch,0ffh,000h,03ch,000h,07eh,018h	; 693c  ......&..<..<.~.
	defb 03ch,02dh,041h,02fh,08fh,0cfh,064h,037h,080h,003h,001h,08dh,080h,0c0h,0d0h,0d4h	; 694c  <-A/..d7........
	defb 0fch,03ch,018h,07eh,03ch,0ffh,07eh,03ch,000h,003h,080h,085h,001h,003h,00bh,02bh	; 695c  .<.~<.~<.......+
	defb 03fh,000h	; 696c

; ----------------------------------------------------------------------
; DATOS dibujos_696E: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 94, ficha 0 de la lista 0x6822 (p00:4540); lo leen p00:4DE1,
;   p00:4E0E (31 bytes)
;   0x696e..0x698d  (31 bytes)
DATA_dibujos_696E:
	defb 002h,0ffh,003h,040h,091h,060h,00ah,07ah,0ffh,001h,003h,001h,0ffh,001h,006h,001h	; 696e  ...@.`.z........
	defb 038h,018h,010h,050h,040h,040h,005h,000h,085h,080h,0c0h,030h,0cch,0f3h,000h	; 697e  8..P@@.....0...

; ----------------------------------------------------------------------
; DATOS dibujos_698D: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 123, ficha 0 de la lista 0x6853 (p00:4540); lo leen p00:4DE1 (56
;   bytes)
;   0x698d..0x69c5  (56 bytes)
DATA_dibujos_698D:
	defb 084h,0ffh,066h,0cch,0ffh,004h,006h,084h,0ffh,066h,0cch,000h,004h,066h,081h,000h	; 698d  ..f......f...f..
	defb 003h,07eh,0a4h,03ch,018h,07eh,0ffh,0e0h,0c0h,003h,00fh,01fh,01fh,03fh,03fh,008h	; 699d  .~.<.~.......??.
	defb 007h,0c0h,0f0h,0f8h,0f8h,0fch,0fch,0e0h,0c0h,003h,00fh,01fh,01fh,03fh,03fh,008h	; 69ad  .............??.
	defb 007h,0c0h,0f0h,0f8h,0f8h,0fch,0fch,000h	; 69bd  ........

; ----------------------------------------------------------------------
; DATOS dibujos_69C5: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 164, ficha 1 de la lista 0x6822 (p00:4540); lo leen p00:4DE1,
;   p00:4E0E, p00:5CD5 (173 bytes)
;   0x69c5..0x6a72  (173 bytes)
DATA_dibujos_69C5:
	defb 089h,03eh,073h,065h,04ah,0d4h,048h,090h,020h,0aah,004h,0bah,087h,0b9h,082h,0bah	; 69c5  .>seJ.H. .......
	defb 0aah,0bah,082h,038h,004h,0bah,084h,0bdh,0a5h,03ch,03ch,004h,018h,0b3h,030h,0b7h	; 69d5  ...8.....<<...0.
	defb 0b4h,0b5h,035h,085h,0b5h,0b5h,003h,01bh,034h,037h,06ch,06dh,0ddh,000h,000h,040h	; 69e5  ..5.....47lm...@
	defb 020h,04fh,029h,04dh,02dh,04dh,000h,0bbh,0b6h,036h,0ech,02ch,0d8h,0c0h,0dfh,0dfh	; 69f5   O)M-M...6.,....
	defb 01fh,0c7h,0d7h,0c7h,0dch,003h,000h,03ch,07eh,07eh,000h,000h,07ah,000h,086h,0b6h	; 6a05  .......<~~..z...
	defb 000h,004h,0beh,095h,0ffh,000h,0fch,03fh,000h,020h,0cah,02ah,0ffh,0b4h,082h,0f4h	; 6a15  .......?. .*....
	defb 0f1h,0f3h,026h,0ech,001h,099h,000h,0efh,000h,00ch,07fh,081h,08ah,003h,0eah,002h	; 6a25  ..&.............
	defb 07ah,002h,03ah,0a0h,0feh,03ch,0d8h,0d0h,069h,060h,0b0h,0b8h,0ffh,0feh,080h,0dfh	; 6a35  z.:..<..i`......
	defb 0ffh,060h,0ffh,0ffh,050h,029h,009h,04bh,02bh,009h,009h,010h,0ffh,0ffh,07eh,0ffh	; 6a45  .`..P).K+.....~.
	defb 07eh,099h,000h,000h,003h,001h,095h,080h,0c0h,0d0h,0d4h,0fch,03ch,018h,07eh,03ch	; 6a55  ~...........<.~<
	defb 03ch,07eh,03ch,000h,03ch,0ffh,0ffh,03ch,0ffh,07eh,018h,03ch,000h	; 6a65  <~<.<..<.~.<.

; ----------------------------------------------------------------------
; DATOS colores_6A72: rachas (p00:4D16) con los colores de los caracteres
;   desde el 178, ficha 1 de la lista 0x6853 (p00:4540); lo leen p00:4DE1 (39
;   bytes)
;   0x6a72..0x6a99  (39 bytes)
DATA_colores_6A72:
	defb 082h,050h,040h,003h,0a0h,002h,0b0h,083h,0f0h,060h,060h,003h,0a0h,002h,0b0h,083h	; 6a72  .P@......``.....
	defb 0f0h,050h,040h,003h,0e0h,003h,0f0h,002h,060h,003h,0e0h,003h,0f0h,088h,075h,070h	; 6a82  .P@.....`.....up
	defb 000h,0a0h,090h,060h,060h,000h,000h	; 6a92

; ----------------------------------------------------------------------
; DATOS colores_6A99: rachas (p00:4D16) con los colores de los caracteres
;   desde el 102, ficha 4 de la lista 0x6822 (p00:4540); lo leen p00:4DE1,
;   p00:4E0E (45 bytes)
;   0x6a99..0x6ac6  (45 bytes)
DATA_colores_6A99:
	defb 002h,0f0h,095h,0e0h,0f0h,050h,050h,0e0h,040h,0f4h,0f0h,0f0h,0feh,0f0h,040h,074h	; 6a99  .....PP.@.....@t
	defb 074h,0f0h,0f0h,0e0h,0f0h,050h,050h,0e0h,004h,040h,089h,030h,0e0h,0e0h,0f0h,040h	; 6aa9  t....PP..@.0...@
	defb 075h,0f5h,054h,054h,007h,040h,085h,030h,0e0h,0e0h,0f0h,040h,000h	; 6ab9  u.TT.@.0...@.

; ----------------------------------------------------------------------
; DATOS colores_6AC6: rachas (p00:4D16) con los colores de los caracteres
;   desde el 108, ficha 5 de la lista 0x6822 (p00:4540); lo leen p00:4DE1,
;   p00:4E0E (45 bytes)
;   0x6ac6..0x6af3  (45 bytes)
DATA_colores_6AC6:
	defb 002h,0f0h,095h,0e0h,0f0h,050h,050h,0e0h,0c0h,0f4h,0f0h,0f0h,0feh,0c0h,0c0h,0ach	; 6ac6  .....PP.........
	defb 0ach,0f0h,0f0h,0e0h,0f0h,050h,050h,0e0h,004h,0c0h,089h,030h,0e0h,0e0h,0f0h,040h	; 6ad6  .....PP....0...@
	defb 0b2h,0f2h,0c2h,0c2h,007h,0c0h,085h,030h,0e0h,0e0h,0f0h,040h,000h	; 6ae6  .......0...@.

; ----------------------------------------------------------------------
; DATOS colores_6AF3: rachas (p00:4D16) con los colores de los caracteres
;   desde el 114, ficha 6 de la lista 0x6822 (p00:4540); lo leen p00:4DE1,
;   p00:4E0E (45 bytes)
;   0x6af3..0x6b20  (45 bytes)
DATA_colores_6AF3:
	defb 002h,0f0h,095h,0e0h,0f0h,050h,050h,0e0h,090h,0f4h,0f0h,0f0h,0feh,050h,0a0h,0fah	; 6af3  .....PP......P..
	defb 0fah,0f0h,0f0h,0e0h,0f0h,050h,050h,0e0h,004h,090h,089h,030h,0e0h,0e0h,0f0h,040h	; 6b03  .....PP....0...@
	defb 0fah,0fah,0a9h,0a9h,007h,090h,085h,030h,0e0h,0e0h,0f0h,040h,000h	; 6b13  .......0...@.

; ----------------------------------------------------------------------
; DATOS colores_6B20: rachas (p00:4D16) con los colores de los caracteres
;   desde el 120, ficha 7 de la lista 0x6822 (p00:4540); lo leen p00:4DE1,
;   p00:4E0E (44 bytes)
;   0x6b20..0x6b4c  (44 bytes)
DATA_colores_6B20:
	defb 002h,0f0h,094h,0e0h,0f0h,050h,050h,0e0h,0e0h,0f4h,0f0h,000h,0feh,050h,0e0h,0feh	; 6b20  .....PP......P..
	defb 0feh,0f0h,0f0h,0e0h,0f0h,050h,050h,005h,0e0h,089h,030h,0e0h,0e0h,0f0h,040h,0feh	; 6b30  .....PP...0...@.
	defb 0feh,0eeh,0eeh,007h,0e0h,085h,030h,0e0h,0e0h,0f0h,040h,000h	; 6b40  ......0...@.

; ----------------------------------------------------------------------
; DATOS colores_6B4C: rachas (p00:4D16) con los colores de los caracteres
;   desde el 94, ficha 0 de la lista 0x6822 (p00:4540); lo leen p00:4DE1,
;   p00:4E0E (24 bytes)
;   0x6b4c..0x6b64  (24 bytes)
DATA_colores_6B4C:
	defb 002h,000h,081h,080h,003h,0e0h,08ah,080h,0e0h,000h,080h,090h,060h,000h,080h,090h	; 6b4c  ............`...
	defb 060h,008h,0e0h,004h,080h,004h,0e0h,000h	; 6b5c  `.......

; ----------------------------------------------------------------------
; DATOS colores_6B64: rachas (p00:4D16) con los colores de los caracteres
;   desde el 123, ficha 0 de la lista 0x6853 (p00:4540); lo leen p00:4DE1 (58
;   bytes)
;   0x6b64..0x6b9e  (58 bytes)
DATA_colores_6B64:
	defb 0b8h,000h,050h,040h,000h,0c0h,020h,030h,0a0h,000h,050h,040h,090h,0c0h,020h,030h	; 6b64  ..P@.. 0..P@.. 0
	defb 0a0h,050h,080h,098h,0a9h,0bah,0fbh,0fbh,0f0h,050h,040h,040h,050h,070h,070h,0e0h	; 6b74  .P.......P@@Ppp.
	defb 0f0h,060h,060h,040h,050h,070h,070h,0e0h,0f0h,050h,040h,0c0h,020h,030h,030h,0a0h	; 6b84  .``@Ppp..P@. 00.
	defb 0f0h,060h,060h,0c0h,020h,030h,030h,0a0h,0f0h,000h	; 6b94  .``. 00...

; ----------------------------------------------------------------------
; DATOS colores_6B9E: rachas (p00:4D16) con los colores de los caracteres
;   desde el 164, ficha 1 de la lista 0x6822 (p00:4540); lo leen p00:4DE1,
;   p00:4E0E, p00:5CD5 (155 bytes)
;   0x6b9e..0x6c39  (155 bytes)
DATA_colores_6B9E:
	defb 081h,0f0h,003h,0e0h,004h,050h,004h,0f0h,09ah,0e0h,050h,0f0h,0f0h,070h,050h,070h	; 6b9e  .....P....P..pPp
	defb 0f0h,0e4h,080h,0f8h,0f0h,040h,050h,0d0h,0e0h,060h,0e0h,080h,0f0h,0e0h,0f0h,0f0h	; 6bae  .....@P..`......
	defb 0e0h,0e0h,0e4h,00dh,0e0h,081h,0f0h,005h,0e0h,002h,0f0h,003h,0e0h,081h,0f0h,005h	; 6bbe  ................
	defb 0e0h,003h,0f0h,002h,040h,083h,085h,0e0h,040h,004h,050h,09dh,040h,050h,050h,0e0h	; 6bce  ....@...@.P.@PP.
	defb 0f0h,0e0h,050h,000h,0f0h,0e0h,0e5h,0f5h,050h,040h,080h,000h,0f0h,0f0h,0e0h,0f0h	; 6bde  ..P.....P@......
	defb 050h,050h,0e0h,060h,0e5h,050h,0f5h,050h,0f5h,00ah,0e5h,085h,050h,0e0h,0e5h,0e4h	; 6bee  PP.`.P.P....P...
	defb 0e4h,004h,0e0h,09eh,0e9h,0e0h,0f0h,0e0h,0e5h,0e0h,0e0h,0e5h,000h,0e9h,050h,0c0h	; 6bfe  ..............P.
	defb 000h,040h,050h,000h,040h,050h,080h,0e0h,050h,080h,040h,050h,000h,000h,098h,0f3h	; 6c0e  .@P.@P..P.@P....
	defb 0e2h,086h,005h,080h,095h,030h,0e0h,0e0h,0f0h,040h,0b9h,0f9h,098h,098h,086h,060h	; 6c1e  .....0...@.....`
	defb 060h,080h,0f4h,0f0h,000h,0feh,000h,080h,0a8h,0a8h,000h	; 6c2e  `..........

; ----------------------------------------------------------------------
; DATOS caracteres_por_fase: 7 punteros (fase 1 a 7; tabla en 0x6C37 + 2 x A):
;   las listas de caracteres de cada fase (p00:4540); lo leen p00:44DC (14
;   bytes)
;   0x6c39..0x6c47  (14 bytes)
DATA_caracteres_por_fase:
	defw 06c9ch,06cd9h,06d04h,06d3bh,06d7eh,06db5h,06000h	; 6c39

; ----------------------------------------------------------------------
; DATOS copias_por_fase_a: 7 punteros (fase 1 a 7; tabla en 0x6C45 + 2 x A):
;   copias en espejo de cada fase (p00:44F3); lo leen p00:44E6 (14 bytes)
;   0x6c47..0x6c55  (14 bytes)
DATA_copias_por_fase_a:
	defw 06dech,06df1h,06e06h,06e2fh,06e54h,06e69h,06037h	; 6c47

; ----------------------------------------------------------------------
; DATOS copias_por_fase_b: 7 punteros (fase 1 a 7; tabla en 0x6C53 + 2 x A):
;   copias cabeza abajo de cada fase (p00:44F3); lo leen p00:44F0 (14 bytes)
;   0x6c55..0x6c63  (14 bytes)
DATA_copias_por_fase_b:
	defw 06e82h,06ea3h,06eb8h,06ec9h,06ee2h,06efbh,06046h	; 6c55

; ----------------------------------------------------------------------
; DATOS caracteres_6C63: lista de caracteres (p00:4546) de todas las fases
;   (p00:44B7): fichas de 6 bytes, 0 acaba; lo leen p00:44BB (43 bytes)
;   0x6c63..0x6c8e  (43 bytes)
DATA_caracteres_6C63:
	defb 001h,010h,06fh,00bh,06ah,06fh	; 6c63
	defb 006h,010h,06fh,01ah,06ah,06fh	; 6c69
	defb 001h,01ah,06fh,00ch,06dh,06fh	; 6c6f
	defb 007h,061h,071h,020h,083h,071h	; 6c75
	defb 007h,0a5h,071h,028h,0c7h,071h	; 6c7b
	defb 007h,0cfh,072h,038h,0e1h,072h	; 6c81
	defb 007h,0ech,072h,03ah,097h,073h	; 6c87
	defb 000h	; 6c8d

; ----------------------------------------------------------------------
; DATOS caracteres_6C8E: lista de caracteres (p00:4546) si p00:4835 no da
;   acarreo (bit fase de 0x26: fases 1, 4, 5 y 7): fichas de 6 bytes, 0 acaba;
;   lo leen p00:44CB (7 bytes)
;   0x6c8e..0x6c95  (7 bytes)
DATA_caracteres_6C8E:
	defb 007h,0e9h,071h,02ch,01ch,072h	; 6c8e
	defb 000h	; 6c94

; ----------------------------------------------------------------------
; DATOS caracteres_6C95: lista de caracteres (p00:4546) si p00:4835 da acarreo
;   (fases 2, 3 y 6, las verticales): fichas de 6 bytes, 0 acaba; lo leen
;   p00:44CB (7 bytes)
;   0x6c95..0x6c9c  (7 bytes)
DATA_caracteres_6C95:
	defb 007h,04ah,072h,02ch,092h,072h	; 6c95
	defb 000h	; 6c9b

; ----------------------------------------------------------------------
; DATOS caracteres_6C9C: lista de caracteres (p00:4540) de la fase 1: fichas
;   de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; lo leen
;   p00:44DC (61 bytes)
;   0x6c9c..0x6cd9  (61 bytes)
DATA_caracteres_6C9C:
	defb 007h,095h,074h,052h,03dh,075h	; 6c9c
	defb 007h,021h,080h,05ch,021h,080h	; 6ca2
	defb 007h,0c3h,074h,060h,05bh,075h	; 6ca8
	defb 007h,05eh,081h,07dh,0ddh,086h	; 6cae
	defb 007h,0a1h,080h,0b3h,043h,086h	; 6cb4
	defb 007h,0e1h,081h,0cch,054h,087h	; 6cba
	defb 007h,066h,080h,0a7h,011h,086h	; 6cc0
	defb 007h,0ech,082h,0dch,06dh,088h	; 6cc6
	defb 007h,02eh,083h,0e4h,0a5h,088h	; 6ccc
	defb 007h,066h,080h,0f0h,0dfh,085h	; 6cd2
	defb 000h	; 6cd8

; ----------------------------------------------------------------------
; DATOS caracteres_6CD9: lista de caracteres (p00:4540) de la fase 2: fichas
;   de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; lo leen
;   p00:44DC (43 bytes)
;   0x6cd9..0x6d04  (43 bytes)
DATA_caracteres_6CD9:
	defb 007h,0d2h,075h,053h,0cbh,076h	; 6cd9
	defb 007h,0e1h,081h,0cch,054h,087h	; 6cdf
	defb 007h,003h,082h,07dh,073h,087h	; 6ce5
	defb 007h,0d1h,068h,0c8h,0f3h,068h	; 6ceb
	defb 007h,003h,082h,08dh,098h,087h	; 6cf1
	defb 007h,023h,085h,0b1h,082h,08ah	; 6cf7
	defb 007h,0e4h,084h,0d3h,051h,08ah	; 6cfd
	defb 000h	; 6d03

; ----------------------------------------------------------------------
; DATOS caracteres_6D04: lista de caracteres (p00:4540) de la fase 3: fichas
;   de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; lo leen
;   p00:44DC (55 bytes)
;   0x6d04..0x6d3b  (55 bytes)
DATA_caracteres_6D04:
	defb 007h,0cah,077h,061h,057h,079h	; 6d04
	defb 007h,0b5h,077h,077h,0c7h,077h	; 6d0a
	defb 007h,059h,078h,088h,0a7h,079h	; 6d10
	defb 007h,0e6h,078h,0a1h,0c9h,079h	; 6d16
	defb 007h,023h,085h,0b1h,082h,08ah	; 6d1c
	defb 007h,0d1h,068h,0c8h,0f3h,068h	; 6d22
	defb 007h,045h,079h,0c6h,022h,07ah	; 6d28
	defb 007h,0e1h,081h,0cch,054h,087h	; 6d2e
	defb 007h,0e4h,084h,0d3h,051h,08ah	; 6d34
	defb 000h	; 6d3a

; ----------------------------------------------------------------------
; DATOS caracteres_6D3B: lista de caracteres (p00:4540) de la fase 4: fichas
;   de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; lo leen
;   p00:44DC (67 bytes)
;   0x6d3b..0x6d7e  (67 bytes)
DATA_caracteres_6D3B:
	defb 007h,056h,07ah,052h,00ah,07bh	; 6d3b
	defb 007h,0d1h,068h,0c8h,0f3h,068h	; 6d41
	defb 007h,067h,082h,0a2h,0f3h,087h	; 6d47
	defb 007h,089h,082h,0afh,015h,088h	; 6d4d
	defb 007h,0abh,082h,0bfh,036h,088h	; 6d53
	defb 007h,040h,083h,0cfh,0b5h,088h	; 6d59
	defb 007h,05ch,084h,0d3h,09dh,089h	; 6d5f
	defb 007h,08ch,085h,090h,0e3h,08ah	; 6d65
	defb 007h,044h,080h,0f3h,024h,080h	; 6d6b
	defb 007h,04dh,082h,0f8h,0d9h,087h	; 6d71
	defb 007h,035h,082h,0fch,0c2h,087h	; 6d77
	defb 000h	; 6d7d

; ----------------------------------------------------------------------
; DATOS caracteres_6D7E: lista de caracteres (p00:4540) de la fase 5: fichas
;   de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; lo leen
;   p00:44DC (55 bytes)
;   0x6d7e..0x6db5  (55 bytes)
DATA_caracteres_6D7E:
	defb 007h,09ch,07bh,052h,023h,07dh	; 6d7e
	defb 007h,0cch,07bh,066h,035h,07dh	; 6d84
	defb 007h,0ddh,07bh,070h,044h,07dh	; 6d8a
	defb 007h,0ddh,07bh,092h,044h,07dh	; 6d90
	defb 007h,0b2h,07ch,082h,0b4h,07dh	; 6d96
	defb 007h,0dfh,07ch,06ah,0ceh,07dh	; 6d9c
	defb 007h,001h,07dh,0f7h,0ech,07dh	; 6da2
	defb 007h,054h,083h,0ceh,0cfh,088h	; 6da8
	defb 007h,044h,080h,0f3h,024h,080h	; 6dae
	defb 000h	; 6db4

; ----------------------------------------------------------------------
; DATOS caracteres_6DB5: lista de caracteres (p00:4540) de la fase 6: fichas
;   de 6 bytes [tercios][dibujos][caracter][colores], 0 acaba; lo leen
;   p00:44DC (55 bytes)
;   0x6db5..0x6dec  (55 bytes)
DATA_caracteres_6DB5:
	defb 007h,008h,07eh,052h,029h,07fh	; 6db5
	defb 007h,04ah,07eh,05dh,060h,07fh	; 6dbb
	defb 007h,0e0h,07eh,09dh,0deh,07fh	; 6dc1
	defb 007h,0efh,07eh,0a1h,0efh,07fh	; 6dc7
	defb 007h,0d1h,068h,0c8h,0f3h,068h	; 6dcd
	defb 007h,044h,080h,0f3h,024h,080h	; 6dd3
	defb 007h,023h,085h,0b1h,082h,08ah	; 6dd9
	defb 007h,0e4h,084h,0d3h,051h,08ah	; 6ddf
	defb 007h,035h,082h,0fch,0c2h,087h	; 6de5
	defb 000h	; 6deb

; ----------------------------------------------------------------------
; DATOS copias_6DEC: lista de copias de caracteres VRAM -> VRAM en espejo
;   (0xF000 = 0) (p00:44F3) de la fase 1: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44E6 (5 bytes)
;   0x6dec..0x6df1  (5 bytes)
DATA_copias_6DEC:
	defb 085h,08eh,03fh,004h	; 6dec
	defb 000h	; 6df0

; ----------------------------------------------------------------------
; DATOS copias_6DF1: lista de copias de caracteres VRAM -> VRAM en espejo
;   (0xF000 = 0) (p00:44F3) de la fase 2: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44E6 (21 bytes)
;   0x6df1..0x6e06  (21 bytes)
DATA_copias_6DF1:
	defb 055h,052h,03fh,001h	; 6df1
	defb 056h,072h,03fh,00bh	; 6df5
	defb 07dh,083h,03fh,006h	; 6df9
	defb 08dh,093h,03fh,006h	; 6dfd
	defb 0d3h,0dbh,03fh,008h	; 6e01
	defb 000h	; 6e05

; ----------------------------------------------------------------------
; DATOS copias_6E06: lista de copias de caracteres VRAM -> VRAM en espejo
;   (0xF000 = 0) (p00:44F3) de la fase 3: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44E6 (41 bytes)
;   0x6e06..0x6e2f  (41 bytes)
DATA_copias_6E06:
	defb 062h,052h,03fh,00fh	; 6e06
	defb 071h,074h,03fh,003h	; 6e0a
	defb 088h,0f3h,03fh,002h	; 6e0e
	defb 08ah,079h,03fh,00fh	; 6e12
	defb 0a4h,0a0h,03fh,001h	; 6e16
	defb 0a0h,09ah,03fh,006h	; 6e1a
	defb 0a5h,0beh,03fh,001h	; 6e1e
	defb 0c0h,0c2h,03fh,001h	; 6e22
	defb 0c6h,0d0h,03fh,002h	; 6e26
	defb 0d3h,0dbh,03fh,008h	; 6e2a
	defb 000h	; 6e2e

; ----------------------------------------------------------------------
; DATOS copias_6E2F: lista de copias de caracteres VRAM -> VRAM en espejo
;   (0xF000 = 0) (p00:44F3) de la fase 4: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44E6 (37 bytes)
;   0x6e2f..0x6e54  (37 bytes)
DATA_copias_6E2F:
	defb 0a2h,0a6h,03fh,004h	; 6e2f
	defb 0afh,0b3h,03fh,004h	; 6e33
	defb 0bfh,0c7h,03fh,001h	; 6e37
	defb 0c4h,0cch,03fh,003h	; 6e3b
	defb 0d3h,0dbh,03fh,008h	; 6e3f
	defb 060h,069h,03fh,009h	; 6e43
	defb 0c0h,09ch,03fh,004h	; 6e47
	defb 0fah,0fbh,03fh,001h	; 6e4b
	defb 0fch,0f7h,03fh,001h	; 6e4f
	defb 000h	; 6e53

; ----------------------------------------------------------------------
; DATOS copias_6E54: lista de copias de caracteres VRAM -> VRAM en espejo
;   (0xF000 = 0) (p00:44F3) de la fase 5: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44E6 (21 bytes)
;   0x6e54..0x6e69  (21 bytes)
DATA_copias_6E54:
	defb 052h,058h,03fh,002h	; 6e54
	defb 066h,068h,03fh,002h	; 6e58
	defb 082h,088h,03fh,006h	; 6e5c
	defb 0a4h,0adh,03fh,003h	; 6e60
	defb 0f7h,0fbh,03fh,004h	; 6e64
	defb 000h	; 6e68

; ----------------------------------------------------------------------
; DATOS copias_6E69: lista de copias de caracteres VRAM -> VRAM en espejo
;   (0xF000 = 0) (p00:44F3) de la fase 6: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44E6 (25 bytes)
;   0x6e69..0x6e82  (25 bytes)
DATA_copias_6E69:
	defb 058h,05bh,03fh,002h	; 6e69
	defb 05dh,07dh,03fh,012h	; 6e6d
	defb 0a1h,0a8h,03fh,007h	; 6e71
	defb 06fh,08fh,03fh,002h	; 6e75
	defb 0d3h,0dbh,03fh,008h	; 6e79
	defb 0fch,0f7h,03fh,001h	; 6e7d
	defb 000h	; 6e81

; ----------------------------------------------------------------------
; DATOS copias_6E82: lista de copias de caracteres VRAM -> VRAM cabeza abajo
;   (0xF000 = 1) (p00:44F3) de la fase 1: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44F0 (33 bytes)
;   0x6e82..0x6ea3  (33 bytes)
DATA_copias_6E82:
	defb 052h,058h,03fh,004h	; 6e82
	defb 064h,073h,03fh,00ah	; 6e86
	defb 0f0h,06fh,03fh,004h	; 6e8a
	defb 0f4h,0afh,03fh,004h	; 6e8e
	defb 085h,0d0h,03fh,008h	; 6e92
	defb 08eh,0d8h,03fh,004h	; 6e96
	defb 0dch,0e6h,03fh,00ah	; 6e9a
	defb 0a7h,0f8h,03fh,008h	; 6e9e
	defb 000h	; 6ea2

; ----------------------------------------------------------------------
; DATOS copias_6EA3: lista de copias de caracteres VRAM -> VRAM cabeza abajo
;   (0xF000 = 1) (p00:44F3) de la fase 2: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44F0 (21 bytes)
;   0x6ea3..0x6eb8  (21 bytes)
DATA_copias_6EA3:
	defb 07dh,089h,03fh,002h	; 6ea3
	defb 083h,08bh,03fh,002h	; 6ea7
	defb 08dh,099h,03fh,002h	; 6eab
	defb 093h,09bh,03fh,002h	; 6eaf
	defb 0d3h,0e3h,03fh,010h	; 6eb3
	defb 000h	; 6eb7

; ----------------------------------------------------------------------
; DATOS copias_6EB8: lista de copias de caracteres VRAM -> VRAM cabeza abajo
;   (0xF000 = 1) (p00:44F3) de la fase 3: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44F0 (17 bytes)
;   0x6eb8..0x6ec9  (17 bytes)
DATA_copias_6EB8:
	defb 09ah,09ah,03fh,006h	; 6eb8
	defb 0a5h,0bfh,03fh,001h	; 6ebc
	defb 0c0h,0c3h,03fh,003h	; 6ec0
	defb 0d3h,0e3h,03fh,010h	; 6ec4
	defb 000h	; 6ec8

; ----------------------------------------------------------------------
; DATOS copias_6EC9: lista de copias de caracteres VRAM -> VRAM cabeza abajo
;   (0xF000 = 1) (p00:44F3) de la fase 4: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44F0 (25 bytes)
;   0x6ec9..0x6ee2  (25 bytes)
DATA_copias_6EC9:
	defb 056h,072h,03fh,01ch	; 6ec9
	defb 0afh,0b7h,03fh,008h	; 6ecd
	defb 0cfh,0d2h,03fh,001h	; 6ed1
	defb 0d3h,0e2h,03fh,010h	; 6ed5
	defb 0feh,0ffh,03fh,001h	; 6ed9
	defb 0f8h,0aah,03fh,004h	; 6edd
	defb 000h	; 6ee1

; ----------------------------------------------------------------------
; DATOS copias_6EE2: lista de copias de caracteres VRAM -> VRAM cabeza abajo
;   (0xF000 = 1) (p00:44F3) de la fase 5: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44F0 (25 bytes)
;   0x6ee2..0x6efb  (25 bytes)
DATA_copias_6EE2:
	defb 052h,05ah,03fh,002h	; 6ee2
	defb 058h,05ch,03fh,002h	; 6ee6
	defb 054h,060h,03fh,004h	; 6eea
	defb 092h,0b0h,03fh,01eh	; 6eee
	defb 0adh,0cbh,03fh,003h	; 6ef2
	defb 0f7h,0e7h,03fh,008h	; 6ef6
	defb 000h	; 6efa

; ----------------------------------------------------------------------
; DATOS copias_6EFB: lista de copias de caracteres VRAM -> VRAM cabeza abajo
;   (0xF000 = 1) (p00:44F3) de la fase 6: 4 bytes, 3 si el tercero lleva los
;   bits altos; 0 acaba; lo leen p00:44F0 (21 bytes)
;   0x6efb..0x6f10  (21 bytes)
DATA_copias_6EFB:
	defb 05dh,071h,03fh,00ch	; 6efb
	defb 09dh,09fh,03fh,002h	; 6eff
	defb 07dh,091h,03fh,00ch	; 6f03
	defb 08fh,08fh,03fh,002h	; 6f07
	defb 0d3h,0e3h,03fh,010h	; 6f0b
	defb 000h	; 6f0f

; ----------------------------------------------------------------------
; DATOS dibujos_6F10: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 11, ficha 0 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (10
;   bytes)
;   0x6f10..0x6f1a  (10 bytes)
DATA_dibujos_6F10:
	defb 088h,000h,003h,007h,00fh,01fh,03fh,07fh,0ffh,000h	; 6f10  ......?...

; ----------------------------------------------------------------------
; DATOS dibujos_6F1A: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 12, ficha 2 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (80
;   bytes)
;   0x6f1a..0x6f6a  (80 bytes)
DATA_dibujos_6F1A:
	defb 085h,000h,07eh,042h,042h,07eh,003h,060h,09ah,010h,028h,028h,038h,07ch,06ch,0eeh	; 6f1a  ..~BB~.`..((8|l.
	defb 0d6h,010h,038h,028h,028h,054h,0d6h,0bah,0d6h,000h,0feh,082h,09eh,082h,09eh,082h	; 6f2a  ..8((T..........
	defb 0feh,000h,050h,004h,05fh,084h,050h,000h,000h,00ah,004h,0fah,0a2h,00ah,000h,000h	; 6f3a  ..P._.P.........
	defb 050h,05fh,07fh,07fh,05fh,050h,000h,000h,00ah,0fah,0feh,0feh,0fah,00ah,000h,000h	; 6f4a  P_.._P..........
	defb 073h,04ch,043h,043h,04ch,073h,000h,000h,0ceh,032h,0c2h,0c2h,032h,0ceh,000h,000h	; 6f5a  sLCCLs...2..2...

; ----------------------------------------------------------------------
; DATOS colores_6F6A: rachas (p00:4D16) con los colores de los caracteres
;   desde el 11, ficha 0 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (3
;   bytes)
;   0x6f6a..0x6f6d  (3 bytes)
DATA_colores_6F6A:
	defb 008h,0a0h,000h	; 6f6a

; ----------------------------------------------------------------------
; DATOS colores_6F6D: rachas (p00:4D16) con los colores de los caracteres
;   desde el 12, ficha 2 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (73
;   bytes)
;   0x6f6d..0x6fb6  (73 bytes)
DATA_colores_6F6D:
	defb 008h,0f0h,002h,070h,002h,0f0h,003h,070h,097h,050h,080h,080h,090h,0b0h,0a0h,090h	; 6f6d  ...p...p.P......
	defb 090h,080h,0d0h,0d0h,090h,0d0h,090h,0d0h,090h,0d0h,040h,040h,050h,070h,070h,050h	; 6f7d  ..........@@PppP
	defb 004h,040h,084h,050h,070h,070h,050h,003h,040h,085h,0a0h,0b0h,0f0h,0f0h,0b0h,004h	; 6f8d  .@.PppP.@.......
	defb 0a0h,084h,0b0h,0f0h,0f0h,0b0h,003h,0a0h,085h,080h,090h,0d0h,090h,080h,003h,060h	; 6f9d  ...............`
	defb 087h,080h,090h,0d0h,090h,080h,060h,060h,000h	; 6fad  ......``.

; ----------------------------------------------------------------------
; DATOS resto_6FB6: lo apuntan con el banco puesto p00:4185 (0x7000), p00:41F1
;   (0x7000), p00:5BBD (0x7000); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p00:4185, p00:41F1, p00:5BBD (427 bytes)
;   0x6fb6..0x7161  (427 bytes)
DATA_resto_6FB6:
	defb 09ah,080h,040h,000h,000h,013h,00bh,0c3h,0c1h,040h,030h,030h,000h,00ch,08eh,0cfh	; 6fb6  ..@......@00....
	defb 0e3h,060h,0f0h,0f0h,060h,000h,000h,0e3h,0f7h,003h,003h,003h,070h,002h,000h,003h	; 6fc6  .`..`.......p...
	defb 007h,002h,00fh,098h,007h,003h,007h,00fh,08bh,0d3h,0d3h,056h,063h,0c1h,03ch,09dh	; 6fd6  ...........Vc.<.
	defb 0e9h,0e3h,0c0h,0c9h,001h,070h,0f8h,0f8h,00fh,00fh,0c7h,0e0h,003h,0f0h,0c0h,0e0h	; 6fe6  .....p..........
	defb 01fh,01fh,03fh,03fh,01fh,01fh,00dh,001h,01dh,03fh,03fh,00eh,03eh,040h,03ah,01eh	; 6ff6  ..??.....??.>@:.
	defb 03fh,03bh,0fch,07ch,079h,0c3h,007h,083h,008h,0ddh,0e9h,0c6h,086h,0cfh,0efh,0c6h	; 7006  ?..|y...........
	defb 007h,007h,003h,011h,038h,010h,000h,000h,0bfh,07eh,07fh,07fh,07eh,01ch,03eh,01ch	; 7016  ....8....~..~.>.
	defb 071h,0f8h,070h,0f8h,070h,000h,003h,001h,0c6h,080h,000h,010h,038h,010h,080h,006h	; 7026  q.p.p.......8...
	defb 000h,083h,060h,0f0h,0feh,006h,000h,002h,060h,083h,010h,03bh,017h,003h,007h,0abh	; 7036  ..`.....`.......
	defb 033h,078h,06fh,09fh,0eeh,0ceh,0d1h,01dh,01fh,07eh,000h,003h,063h,0f0h,0d0h,0c0h	; 7046  3xo......~..c...
	defb 0f0h,0f8h,079h,033h,003h,003h,001h,000h,000h,001h,010h,076h,07fh,07eh,0f6h,07fh	; 7056  ..y3.......v.~..
	defb 039h,03eh,0ceh,0c4h,0c0h,0cch,09eh,01eh,00ch,000h,001h,003h,003h,081h,001h,003h	; 7066  9>..............
	defb 000h,09ah,03eh,07eh,0fch,0f4h,0eeh,0c4h,000h,000h,003h,007h,007h,0bfh,07fh,019h	; 7076  ..>~............
	defb 03ch,03bh,080h,0c0h,0c0h,0c4h,080h,0e0h,0f0h,0fah,01fh,03fh,003h,07eh,08bh,03eh	; 7086  <..........?.~.>
	defb 00ch,03ch,0f8h,0f0h,0f6h,0efh,0cfh,006h,080h,080h,000h,081h,0f0h,004h,040h,096h	; 7096  .<............@.
	defb 0f0h,070h,040h,070h,070h,040h,000h,070h,040h,040h,0f0h,070h,0f0h,070h,040h,000h	; 70a6  .p@pp@.p@@.p.p@.
	defb 000h,070h,0f0h,070h,040h,040h,005h,070h,083h,040h,0f0h,0f0h,003h,070h,002h,040h	; 70b6  .p.p@@.p.@...p.@
	defb 002h,0f4h,081h,0f7h,004h,074h,003h,0f7h,093h,0f4h,074h,074h,0f7h,0f4h,0f4h,0f0h	; 70c6  .....t....tt....
	defb 040h,040h,0f0h,0f0h,070h,070h,040h,070h,0f0h,0f0h,070h,070h,003h,040h,004h,0f7h	; 70d6  @@..pp@p..pp.@..
	defb 085h,074h,0f4h,0f7h,0f7h,074h,005h,0f7h,002h,0f4h,084h,0f0h,070h,040h,040h,004h	; 70e6  .t...t......p@@.
	defb 0f0h,081h,070h,003h,040h,084h,070h,040h,000h,000h,004h,0f4h,002h,074h,002h,040h	; 70f6  ..p.@.p@.....t.@
	defb 087h,074h,0f4h,0f4h,040h,040h,000h,070h,003h,040h,084h,000h,040h,070h,040h,009h	; 7106  .t..@@.p.@..@p@.
	defb 0f0h,004h,070h,004h,0f0h,003h,070h,005h,040h,003h,070h,002h,0f4h,004h,074h,082h	; 7116  ..p...p.@.p...t.
	defb 000h,0f0h,003h,070h,003h,040h,081h,070h,007h,040h,004h,0f7h,08ah,074h,040h,074h	; 7126  ...p.@.p.@...t@t
	defb 0f7h,0f0h,070h,040h,0f0h,070h,070h,00ah,040h,002h,0f4h,003h,070h,005h,040h,002h	; 7136  ..p@.pp.@...p.@.
	defb 0f0h,081h,070h,003h,0f4h,004h,040h,084h,070h,040h,070h,0f0h,005h,0f4h,002h,074h	; 7146  ..p...@.p@p....t
	defb 081h,040h,003h,0f0h,081h,070h,003h,040h,081h,0f0h,000h	; 7156  .@...p.@...

; ----------------------------------------------------------------------
; DATOS dibujos_7161: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 32, ficha 3 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (34
;   bytes)
;   0x7161..0x7183  (34 bytes)
DATA_dibujos_7161:
	defb 0a0h,061h,08bh,09ch,023h,04ch,060h,0c0h,0c1h,086h,0d1h,039h,0c4h,032h,006h,003h	; 7161  .a..#L`....9.2..
	defb 083h,0c0h,060h,04ch,023h,09ch,08bh,061h,000h,003h,006h,032h,0c4h,039h,0d1h,086h	; 7171  ..`L#..a...2.9..
	defb 000h,000h	; 7181

; ----------------------------------------------------------------------
; DATOS colores_7183: rachas (p00:4D16) con los colores de los caracteres
;   desde el 32, ficha 3 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (34
;   bytes)
;   0x7183..0x71a5  (34 bytes)
DATA_colores_7183:
	defb 0a0h,0e0h,0f0h,0f0h,0e0h,0e0h,0e6h,0f9h,0fah,0e0h,0f0h,0f0h,0e0h,0e0h,0e6h,0f9h	; 7183  ................
	defb 0fah,0e9h,0e6h,0e0h,0f0h,0e0h,0f0h,0e0h,0e0h,0e9h,0e6h,0e0h,0f0h,0e0h,0f0h,0e0h	; 7193  ................
	defb 0e0h,000h	; 71a3

; ----------------------------------------------------------------------
; DATOS dibujos_71A5: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 40, ficha 4 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (34
;   bytes)
;   0x71a5..0x71c7  (34 bytes)
DATA_dibujos_71A5:
	defb 0a0h,021h,01bh,07ch,061h,08eh,003h,0c2h,0a3h,084h,0d8h,03eh,086h,071h,0c0h,003h	; 71a5  .!.|a......>.q..
	defb 0c5h,0c2h,003h,08eh,061h,07ch,01bh,021h,0ffh,003h,0c0h,071h,086h,03eh,0d8h,084h	; 71b5  ....a|.!...q.>..
	defb 0ffh,000h	; 71c5

; ----------------------------------------------------------------------
; DATOS colores_71C7: rachas (p00:4D16) con los colores de los caracteres
;   desde el 40, ficha 4 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (34
;   bytes)
;   0x71c7..0x71e9  (34 bytes)
DATA_colores_71C7:
	defb 0a0h,0f0h,0b0h,0a0h,090h,060h,0f0h,0f6h,0f8h,0f0h,0b0h,0a0h,090h,060h,0f0h,0f6h	; 71c7  .....`.......`..
	defb 0f8h,0e6h,0f0h,060h,090h,0a0h,0b0h,0f0h,000h,0e6h,0f0h,060h,090h,0a0h,0b0h,0f0h	; 71d7  ...`.......`....
	defb 000h,000h	; 71e7

; ----------------------------------------------------------------------
; DATOS dibujos_71E9: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 44, ficha 0 de la lista 0x6C8E (p00:4540); lo leen p00:44CB (51
;   bytes)
;   0x71e9..0x721c  (51 bytes)
DATA_dibujos_71E9:
	defb 002h,066h,008h,000h,002h,066h,008h,000h,002h,066h,008h,000h,002h,066h,083h,010h	; 71e9  .f...f...f...f..
	defb 028h,028h,003h,044h,00ch,082h,003h,044h,002h,028h,08bh,010h,000h,00eh,01ch,01dh	; 71f9  ((.D...D.(......
	defb 0bbh,039h,070h,000h,0ffh,0ffh,008h,000h,002h,0ffh,008h,000h,002h,0ffh,008h,000h	; 7209  .9p.............
	defb 002h,0ffh,000h	; 7219

; ----------------------------------------------------------------------
; DATOS colores_721C: rachas (p00:4D16) con los colores de los caracteres
;   desde el 44, ficha 0 de la lista 0x6C8E (p00:4540); lo leen p00:44CB (46
;   bytes)
;   0x721c..0x724a  (46 bytes)
DATA_colores_721C:
	defb 081h,0f1h,009h,071h,081h,0f1h,009h,071h,081h,0f1h,009h,071h,083h,0f1h,071h,051h	; 721c  ...q...q...q..qQ
	defb 003h,071h,010h,0f1h,003h,071h,003h,051h,087h,071h,0f1h,071h,051h,041h,051h,071h	; 722c  .q...q.Q.q.qQAQq
	defb 009h,051h,081h,071h,009h,051h,081h,071h,009h,051h,082h,071h,051h,000h	; 723c  .Q.q.Q.q.Q.qQ.

; ----------------------------------------------------------------------
; DATOS dibujos_724A: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 44, ficha 0 de la lista 0x6C95 (p00:4540); lo leen p00:44CB (72
;   bytes)
;   0x724a..0x7292  (72 bytes)
DATA_dibujos_724A:
	defb 0aah,000h,0c0h,0c0h,000h,000h,0c0h,0c0h,000h,000h,030h,030h,000h,000h,030h,030h	; 724a  ..........00..00
	defb 000h,000h,00ch,00ch,000h,000h,00ch,00ch,000h,000h,003h,003h,000h,000h,003h,003h	; 725a  ................
	defb 000h,000h,003h,01ch,060h,080h,060h,01ch,003h,000h,0ffh,005h,000h,091h,0ffh,000h	; 726a  ....`.`.........
	defb 0c0h,038h,006h,001h,006h,038h,0c0h,01ch,048h,070h,07ch,03eh,00eh,002h,008h,008h	; 727a  .8...8..Hp|>....
	defb 0c0h,008h,030h,008h,00ch,008h,003h,000h	; 728a  ..0.....

; ----------------------------------------------------------------------
; DATOS colores_7292: rachas (p00:4D16) con los colores de los caracteres
;   desde el 44, ficha 0 de la lista 0x6C95 (p00:4540); lo leen p00:44CB (61
;   bytes)
;   0x7292..0x72cf  (61 bytes)
DATA_colores_7292:
	defb 082h,071h,0f1h,003h,071h,085h,0f1h,071h,071h,011h,0f1h,003h,071h,081h,0f1h,003h	; 7292  .q..q..qq...q...
	defb 071h,081h,0f1h,003h,071h,081h,0f1h,003h,071h,081h,0f1h,003h,071h,081h,0f1h,005h	; 72a2  q...q...q...q...
	defb 071h,082h,051h,071h,003h,0f1h,007h,071h,081h,0ffh,003h,071h,082h,051h,071h,003h	; 72b2  q.Qq...q...q.Qq.
	defb 0f1h,002h,051h,086h,071h,0f1h,071h,051h,051h,041h,020h,071h,000h	; 72c2  ..Q.q.qQQA q.

; ----------------------------------------------------------------------
; DATOS dibujos_72CF: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 56, ficha 5 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (18
;   bytes)
;   0x72cf..0x72e1  (18 bytes)
DATA_dibujos_72CF:
	defb 090h,001h,006h,00ch,008h,010h,030h,060h,080h,080h,060h,030h,010h,008h,00ch,006h	; 72cf  ......0`..`0....
	defb 001h,000h	; 72df

; ----------------------------------------------------------------------
; DATOS colores_72E1: rachas (p00:4D16) con los colores de los caracteres
;   desde el 56, ficha 5 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (11
;   bytes)
;   0x72e1..0x72ec  (11 bytes)
DATA_colores_72E1:
	defb 087h,071h,051h,041h,041h,051h,071h,071h,009h,0f1h,000h	; 72e1  .qQAAQqq...

; ----------------------------------------------------------------------
; DATOS dibujos_72EC: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 58, ficha 6 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (171
;   bytes)
;   0x72ec..0x7397  (171 bytes)
DATA_dibujos_72EC:
	defb 0bch,060h,0f0h,0f0h,060h,000h,003h,003h,007h,040h,030h,030h,000h,00ch,08eh,0cfh	; 72ec  .`..`....@00....
	defb 0e3h,060h,0f0h,0f0h,060h,000h,000h,0e3h,0f7h,000h,003h,063h,0f0h,0d0h,0c0h,0f0h	; 72fc  .`..`......c....
	defb 0f8h,007h,007h,00fh,00fh,007h,003h,007h,00fh,08bh,0d3h,0d3h,056h,063h,0c1h,03ch	; 730c  ............Vc.<
	defb 09dh,06fh,09fh,0eeh,0ceh,0d1h,01dh,01fh,07eh,00fh,00fh,0c7h,0e0h,003h,0f0h,0abh	; 731c  .o......~.......
	defb 0e0h,01fh,01fh,03fh,03fh,01fh,01fh,00dh,001h,01dh,03fh,03fh,00eh,03eh,040h,03ah	; 732c  ...??.....??.>@:
	defb 01eh,010h,076h,07fh,07eh,0f6h,07fh,039h,03eh,0f8h,0f0h,0f6h,0efh,0cfh,006h,080h	; 733c  ..v.~..9>.......
	defb 080h,079h,033h,003h,003h,001h,000h,000h,001h,01fh,03fh,003h,07eh,089h,03eh,00ch	; 734c  .y3.......?.~.>.
	defb 03ch,03eh,07eh,0fch,0f4h,0eeh,0c4h,007h,000h,083h,060h,0f0h,0feh,006h,000h,002h	; 735c  <>~.......`.....
	defb 060h,083h,010h,03bh,017h,003h,007h,08bh,033h,078h,0ceh,0c4h,0c0h,0cch,09eh,01eh	; 736c  `.......3x......
	defb 00ch,000h,001h,003h,003h,081h,001h,003h,000h,090h,003h,007h,007h,0bfh,07fh,019h	; 737c  ................
	defb 03ch,03bh,080h,0c0h,0c0h,0c4h,080h,0e0h,0f0h,0fah,000h	; 738c  <..........

; ----------------------------------------------------------------------
; DATOS colores_7397: rachas (p00:4D16) con los colores de los caracteres
;   desde el 58, ficha 6 de la lista 0x6C63 (p00:4540); lo leen p00:44BB (135
;   bytes)
;   0x7397..0x741e  (135 bytes)
DATA_colores_7397:
	defb 093h,0a1h,0f1h,0a1h,091h,0f1h,0f1h,091h,091h,0a1h,0a1h,091h,0a1h,0a1h,091h,091h	; 7397  ................
	defb 0f1h,0a1h,0f1h,0a1h,003h,091h,081h,0a1h,003h,0f1h,003h,0a1h,004h,091h,002h,0f1h	; 73a7  ................
	defb 003h,0a1h,002h,091h,002h,0f9h,081h,0fah,004h,0a9h,085h,0fah,0a1h,0a1h,0f9h,0f9h	; 73b7  ................
	defb 004h,0a9h,08dh,0f1h,091h,091h,0f1h,0f1h,0a1h,0a1h,091h,0a1h,0f1h,0f1h,0a1h,0a1h	; 73c7  ................
	defb 003h,091h,004h,0fah,082h,0a9h,0f9h,006h,0fah,084h,0a9h,091h,0a9h,0fah,003h,0f1h	; 73d7  ................
	defb 081h,0a1h,003h,091h,082h,0f1h,0a1h,007h,091h,005h,0f9h,002h,0a9h,083h,091h,0f9h	; 73e7  ................
	defb 0f9h,003h,0a1h,008h,091h,002h,0f1h,081h,0a1h,007h,0f1h,003h,0a1h,005h,091h,087h	; 73f7  ................
	defb 0a1h,0f1h,0a1h,091h,0f1h,0a1h,0a1h,00ch,091h,002h,0f1h,081h,0a1h,003h,0f9h,004h	; 7407  ................
	defb 091h,084h,0a1h,091h,0a1h,0f1h,000h	; 7417

; ----------------------------------------------------------------------
; DATOS dibujos_741E: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 192, ficha 3 de la lista 0x6853 (p00:4540); lo leen p00:4DE1 (34
;   bytes)
;   0x741e..0x7440  (34 bytes)
DATA_dibujos_741E:
	defb 0a0h,05ch,0cch,076h,03fh,0dfh,023h,01dh,017h,000h,080h,05ch,030h,0e0h,098h,0f4h	; 741e  .\.v?.#....\0...
	defb 0b8h,01dh,023h,0dfh,03fh,076h,0cch,05ch,000h,0f4h,098h,0e0h,030h,05ch,080h,000h	; 742e  ..#.?v.\....0\..
	defb 000h,000h	; 743e

; ----------------------------------------------------------------------
; DATOS colores_7440: rachas (p00:4D16) con los colores de los caracteres
;   desde el 192, ficha 3 de la lista 0x6853 (p00:4540); lo leen p00:4DE1 (33
;   bytes)
;   0x7440..0x7461  (33 bytes)
DATA_colores_7440:
	defb 09dh,050h,054h,040h,040h,050h,080h,0c0h,040h,070h,070h,050h,050h,070h,040h,040h	; 7440  .PT@@P..@ppPPp@@
	defb 085h,0c0h,080h,050h,040h,040h,054h,050h,050h,040h,040h,070h,050h,050h,003h,070h	; 7450  ...P@@TPP@@pPP.p
	defb 000h	; 7460

; ----------------------------------------------------------------------
; DATOS dibujos_7461: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 82, ficha 8 de la lista 0x6000 (p00:4540); lo leen p00:44DC (26
;   bytes)
;   0x7461..0x747b  (26 bytes)
DATA_dibujos_7461:
	defb 098h,006h,060h,006h,066h,0dch,05bh,05bh,02dh,03bh,077h,0f8h,0b7h,0b4h,035h,0b5h	; 7461  ..`.f.[[-.w...5.
	defb 000h,006h,060h,006h,066h,0dch,05bh,05bh,02dh,000h	; 7471  ..`.f.[[-.

; ----------------------------------------------------------------------
; DATOS colores_747B: rachas (p00:4D16) con los colores de los caracteres
;   desde el 82, ficha 8 de la lista 0x6000 (p00:4540); lo leen p00:44DC (26
;   bytes)
;   0x747b..0x7495  (26 bytes)
DATA_colores_747B:
	defb 098h,090h,080h,090h,0b0h,0b6h,090h,080h,060h,0c0h,030h,0f0h,030h,020h,020h,0c0h	; 747b  ........`.0.0  .
	defb 0c0h,070h,050h,070h,0f0h,0f4h,070h,050h,040h,000h	; 748b  .pPp..pP@.

; ----------------------------------------------------------------------
; DATOS dibujos_7495: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 82, ficha 0 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (46
;   bytes)
;   0x7495..0x74c3  (46 bytes)
DATA_dibujos_7495:
	defb 090h,081h,042h,03ch,0ffh,06dh,0bah,055h,008h,0eeh,05bh,0b5h,012h,0a9h,002h,010h	; 7495  ..B<.m.U..[.....
	defb 081h,003h,000h,085h,018h,07ch,07eh,0dch,033h,004h,000h,089h,060h,0f7h,02fh,0efh	; 74a5  .....|~.3...`./.
	defb 018h,07fh,0beh,0fch,028h,003h,000h,083h,07eh,05dh,039h,005h,000h,000h	; 74b5  ....(...~]9...

; ----------------------------------------------------------------------
; DATOS dibujos_74C3: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 96, ficha 2 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (122
;   bytes)
;   0x74c3..0x753d  (122 bytes)
DATA_dibujos_74C3:
	defb 0f1h,018h,061h,05dh,0beh,0beh,0bch,01dh,071h,000h,0cch,0e0h,04eh,00fh,01fh,0eeh	; 74c3  ..a]....q...N...
	defb 0f0h,078h,0f9h,070h,00eh,027h,073h,07ch,039h,0f2h,0f0h,0e7h,04fh,0cfh,086h,06eh	; 74d3  .x.p.'s|9...O..n
	defb 0c0h,07bh,020h,0fdh,0feh,06ah,0bch,07eh,0beh,04fh,0eeh,0f6h,0f4h,0f2h,061h,09eh	; 74e3  .{ ..j.~.O....a.
	defb 01ch,096h,0cah,050h,046h,0bdh,07eh,01ch,03eh,044h,0beh,00ch,00ch,038h,0deh,07eh	; 74f3  ...PF.~.>D...8.~
	defb 092h,0dfh,0edh,0e5h,0f9h,07eh,03ch,024h,04eh,004h,006h,002h,017h,002h,016h,02ch	; 7503  .....~<$N......,
	defb 03ch,008h,05ch,03eh,054h,028h,014h,0beh,0ddh,062h,01ch,0beh,004h,016h,0beh,01ch	; 7513  <.\>T(...b......
	defb 0feh,007h,06eh,0f6h,0e4h,0f2h,060h,09eh,09ch,0e0h,0f6h,0fbh,0c9h,07eh,03ch,006h	; 7523  ..n...`......~<.
	defb 00eh,03ch,003h,07eh,084h,03ch,07ch,07eh,03ch,000h	; 7533  .<.~.<|~<.

; ----------------------------------------------------------------------
; DATOS colores_753D: rachas (p00:4D16) con los colores de los caracteres
;   desde el 82, ficha 0 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (30
;   bytes)
;   0x753d..0x755b  (30 bytes)
DATA_colores_753D:
	defb 084h,070h,074h,075h,050h,004h,054h,008h,040h,005h,060h,081h,080h,006h,060h,087h	; 753d  .ptuP.T.@.`...`.
	defb 080h,060h,086h,060h,086h,060h,080h,006h,060h,081h,086h,006h,080h,000h	; 754d  .`.`.`..`.....

; ----------------------------------------------------------------------
; DATOS colores_755B: rachas (p00:4D16) con los colores de los caracteres
;   desde el 96, ficha 2 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (119
;   bytes)
;   0x755b..0x75d2  (119 bytes)
DATA_colores_755B:
	defb 08fh,090h,0b6h,0a6h,0b6h,0a6h,096h,060h,0b0h,060h,0a0h,090h,096h,0a6h,0b0h,096h	; 755b  .......`.`......
	defb 003h,0a6h,002h,096h,086h,0a0h,060h,090h,0a0h,0a0h,0a6h,003h,096h,086h,0a6h,060h	; 756b  ......`........`
	defb 090h,080h,0f8h,080h,004h,060h,08ch,080h,060h,060h,080h,086h,090h,060h,060h,096h	; 757b  .....`..``...``.
	defb 086h,096h,086h,003h,060h,002h,086h,08ah,096h,086h,098h,098h,086h,060h,060h,086h	; 758b  ....`........``.
	defb 060h,080h,003h,060h,08dh,086h,098h,098h,0f8h,0b8h,0a8h,098h,0a8h,098h,098h,086h	; 759b  `..`............
	defb 0f9h,098h,004h,086h,002h,060h,003h,086h,08fh,0a8h,098h,086h,086h,060h,060h,080h	; 75ab  .....`.......``.
	defb 060h,080h,080h,060h,060h,086h,060h,080h,003h,060h,085h,086h,098h,098h,0f0h,0f0h	; 75bb  `..``.`..`......
	defb 003h,075h,083h,054h,040h,040h,000h	; 75cb

; ----------------------------------------------------------------------
; DATOS dibujos_75D2: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 83, ficha 0 de la lista 0x6CD9 (p00:4540); lo leen p00:44DC (249
;   bytes)
;   0x75d2..0x76cb  (249 bytes)
DATA_dibujos_75D2:
	defb 085h,0fah,0e4h,05ch,0b8h,0c0h,003h,000h,085h,0b0h,0f8h,0f0h,0f0h,060h,003h,000h	; 75d2  ...\.........`..
	defb 085h,01dh,03eh,01dh,007h,003h,005h,000h,0b1h,001h,007h,00fh,00fh,017h,03eh,03eh	; 75e2  ..>...........>>
	defb 0ffh,01eh,0ffh,080h,0cfh,038h,000h,003h,00fh,01fh,00fh,01dh,07bh,0e3h,063h,073h	; 75f2  .....8......{.cs
	defb 0b7h,0c7h,0f3h,063h,002h,004h,0e0h,00eh,03eh,0fch,0f0h,0e7h,0cfh,09fh,01fh,073h	; 7602  ...c....>......s
	defb 007h,05fh,0dfh,007h,0dfh,0abh,033h,000h,000h,0e0h,003h,0f0h,0ffh,0e8h,0dch,000h	; 7612  ._....3.........
	defb 080h,0c0h,0f0h,0f8h,0fch,0fch,0f8h,03fh,03eh,01dh,003h,03eh,07fh,0ffh,0feh,0dch	; 7622  .......?>..>....
	defb 0deh,0bch,0deh,076h,078h,0fch,07eh,083h,036h,010h,019h,0cch,0b8h,060h,0c0h,05eh	; 7632  ...vx.~.6....`.^
	defb 07ch,03ah,03ah,007h,00fh,006h,000h,03fh,03eh,05dh,022h,072h,0ech,070h,000h,0feh	; 7642  |::....?>]"r.p..
	defb 0fah,0e7h,08fh,027h,03eh,0d4h,0d0h,079h,0c2h,0c6h,0f9h,008h,099h,01ch,000h,03eh	; 7652  ...'>..y.......>
	defb 0deh,0cfh,01fh,0bfh,0e0h,0f3h,0e7h,000h,0e0h,0f0h,0b8h,07ch,0feh,07ch,0b8h,081h	; 7662  ...........|.|..
	defb 081h,03dh,003h,007h,007h,003h,000h,0f0h,0fch,0feh,09eh,038h,030h,060h,0e0h,000h	; 7672  .=.........80`..
	defb 000h,00eh,03fh,07fh,019h,004h,00fh,00ch,007h,0b3h,019h,0ech,034h,010h,014h,028h	; 7682  ..?.........4..(
	defb 008h,02ch,037h,018h,08dh,0c0h,0c0h,014h,010h,034h,0ech,019h,0abh,0b3h,001h,008h	; 7692  .,7......4......
	defb 0f0h,0e0h,0cdh,098h,037h,02ch,008h,028h,00ch,06ch,0f0h,0f3h,0f3h,060h,006h,004h	; 76a2  ....7,.(.l...`..
	defb 018h,03ch,018h,006h,04fh,00fh,026h,020h,002h,098h,03ch,03eh,01eh,05ch,060h,000h	; 76b2  .<..O.& ..<>.\`.
	defb 03ch,07eh,05dh,009h,062h,018h,07ch,000h,000h	; 76c2  <~].b.|..

; ----------------------------------------------------------------------
; DATOS colores_76CB: rachas (p00:4D16) con los colores de los caracteres
;   desde el 83, ficha 0 de la lista 0x6CD9 (p00:4540); lo leen p00:44DC (234
;   bytes)
;   0x76cb..0x77b5  (234 bytes)
DATA_colores_76CB:
	defb 002h,060h,002h,090h,005h,060h,002h,090h,005h,060h,084h,0b0h,0a0h,090h,090h,004h	; 76cb  .`...`...`......
	defb 060h,004h,0b0h,002h,0a0h,002h,090h,094h,0b0h,0a0h,096h,060h,0a6h,0a6h,0a9h,096h	; 76db  `..........`....
	defb 0a0h,0a0h,060h,060h,0b0h,0b0h,0a9h,0a9h,0b6h,0a6h,096h,0a6h,003h,096h,003h,0b6h	; 76eb  ..``............
	defb 002h,0a6h,086h,096h,0a6h,060h,060h,0a6h,0a6h,003h,096h,002h,060h,081h,0b6h,003h	; 76fb  .....``.....`...
	defb 0b0h,002h,0a0h,002h,090h,004h,060h,096h,0b0h,0a0h,090h,060h,060h,0a0h,090h,060h	; 770b  ......`....``..`
	defb 060h,0b0h,0a0h,0a0h,090h,090h,0a0h,090h,060h,060h,0b0h,0a0h,0a0h,0a9h,004h,096h	; 771b  `.......``......
	defb 08ch,060h,090h,060h,080h,098h,0a6h,060h,090h,0a0h,060h,060h,090h,003h,096h,08fh	; 772b  .`.`...`..``....
	defb 0a0h,090h,060h,060h,090h,060h,096h,0b6h,096h,080h,080h,090h,0a6h,096h,0a9h,003h	; 773b  ..``.`..........
	defb 096h,003h,060h,087h,0a6h,0b9h,096h,060h,0b6h,0a6h,096h,003h,0a0h,002h,090h,003h	; 774b  ..`....`........
	defb 060h,090h,0a6h,096h,060h,0a0h,0a0h,060h,060h,0a0h,090h,060h,060h,0b6h,0b9h,0a9h	; 775b  `...`..``..``...
	defb 0a6h,0a6h,004h,0b0h,0a9h,0a0h,0a9h,0a9h,096h,060h,0a0h,060h,090h,0c0h,020h,030h	; 776b  .........`.`.. 0
	defb 0f0h,0f0h,030h,020h,0c0h,090h,060h,0a0h,0b0h,0f0h,030h,020h,0c0h,090h,060h,0a0h	; 777b  ..0 ..`...0 ..`.
	defb 060h,0b0h,0a0h,060h,090h,0c0h,020h,030h,0f0h,0e0h,050h,0e0h,070h,050h,003h,040h	; 778b  `..`.. 0..P.pP.@
	defb 08dh,0f0h,070h,050h,0f0h,070h,050h,040h,050h,070h,0f0h,070h,050h,050h,003h,040h	; 779b  ..pP.pP@Pp.pPP.@
	defb 088h,0f0h,0f4h,075h,075h,054h,054h,040h,040h,000h	; 77ab  ...uuTT@@.

; ----------------------------------------------------------------------
; DATOS dibujos_77B5: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 119, ficha 1 de la lista 0x6D04 (p00:4540); lo leen p00:44DC (18
;   bytes)
;   0x77b5..0x77c7  (18 bytes)
DATA_dibujos_77B5:
	defb 090h,0c5h,0bbh,056h,000h,004h,002h,000h,010h,000h,000h,06bh,054h,009h,002h,009h	; 77b5  ...V.......kT...
	defb 042h,000h	; 77c5

; ----------------------------------------------------------------------
; DATOS colores_77C7: rachas (p00:4D16) con los colores de los caracteres
;   desde el 119, ficha 1 de la lista 0x6D04 (p00:4540); lo leen p00:44DC (3
;   bytes)
;   0x77c7..0x77ca  (3 bytes)
DATA_colores_77C7:
	defb 010h,060h,000h	; 77c7

; ----------------------------------------------------------------------
; DATOS dibujos_77CA: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 97, ficha 0 de la lista 0x6D04 (p00:4540); lo leen p00:44DC (143
;   bytes)
;   0x77ca..0x7859  (143 bytes)
DATA_dibujos_77CA:
	defb 082h,0feh,0f7h,004h,000h,08ah,018h,081h,0c0h,080h,000h,000h,080h,0e0h,078h,0bch	; 77ca  ..............x.
	defb 005h,000h,09bh,080h,0c0h,0e0h,0c2h,0fch,0f0h,0e8h,090h,0e0h,0c0h,0c0h,07fh,0deh	; 77da  ................
	defb 010h,0feh,0ech,0f8h,070h,080h,000h,080h,0c0h,0f0h,0f8h,0fch,0feh,07eh,005h,000h	; 77ea  ....p........~..
	defb 0a3h,048h,040h,0a2h,094h,048h,072h,0a9h,0f0h,0d2h,06dh,0bbh,00eh,058h,0a2h,054h	; 77fa  .H@..Hr...m..X.T
	defb 0d8h,068h,075h,032h,024h,0a6h,0d9h,0bah,094h,092h,0b9h,0f2h,0ach,092h,0aah,004h	; 780a  .hu2$...........
	defb 000h,020h,091h,0c2h,003h,003h,09ch,006h,00eh,01dh,02ah,050h,074h,048h,000h,002h	; 781a  . ........*PtH..
	defb 048h,020h,002h,000h,00ah,054h,0b0h,049h,000h,088h,010h,000h,07dh,0cah,0e5h,03bh	; 782a  H ...T.I....}...
	defb 019h,00ch,006h,003h,003h,006h,001h,089h,080h,0c0h,0e0h,0e0h,0c0h,080h,080h,040h	; 783a  ...............@
	defb 080h,005h,0c0h,002h,0e0h,088h,0c0h,0e0h,0e0h,0f0h,0f0h,0f8h,0fch,0feh,000h	; 784a  ...............

; ----------------------------------------------------------------------
; DATOS dibujos_7859: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 136, ficha 2 de la lista 0x6D04 (p00:4540); lo leen p00:44DC (141
;   bytes)
;   0x7859..0x78e6  (141 bytes)
DATA_dibujos_7859:
	defb 0ffh,03fh,098h,015h,0cfh,0e6h,072h,078h,0b8h,07eh,037h,01bh,06dh,030h,0bch,0dfh	; 7859  .?....rx.~7.m0..
	defb 0e7h,0bch,0ddh,0eeh,0ffh,0ffh,07fh,0bfh,09fh,01dh,051h,0a6h,002h,002h,0feh,0fch	; 7869  ..........Q.....
	defb 0f8h,0ebh,0ffh,0fbh,07dh,0bdh,0deh,0efh,077h,08fh,0c3h,0c4h,0e1h,072h,0f9h,0fah	; 7879  ....}...w....r..
	defb 0fdh,0fch,0fch,0feh,07fh,0bfh,09fh,0cfh,0e7h,0fbh,07dh,03eh,0bfh,0dfh,0dfh,0efh	; 7889  ..........}>....
	defb 0fbh,07eh,03fh,0dfh,0afh,0d7h,0e3h,011h,08ch,0f0h,0f8h,0fch,0feh,03eh,00fh,0a7h	; 7899  .~?..........>..
	defb 051h,093h,0cdh,0fah,07ch,03eh,01fh,0c7h,033h,07fh,03dh,01eh,047h,0c3h,0e1h,0f0h	; 78a9  Q...|>..3.=.G...
	defb 0f8h,0fbh,07dh,03ch,03fh,01fh,01fh,0e7h,0f8h,08ch,030h,0cch,046h,023h,0f7h,079h	; 78b9  ..}<?.....0.F#.y
	defb 0feh,0fch,0fch,0eeh,0f3h,07dh,03eh,08fh,0c1h,0b1h,083h,05ch,0f9h,006h,0b2h,0c0h	; 78c9  .....}>....\....
	defb 089h,031h,0fch,0feh,0ffh,07eh,03fh,01fh,0c7h,033h,008h,0ffh,000h	; 78d9  .1...~?..3...

; ----------------------------------------------------------------------
; DATOS dibujos_78E6: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 161, ficha 3 de la lista 0x6D04 (p00:4540); lo leen p00:44DC (95
;   bytes)
;   0x78e6..0x7945  (95 bytes)
DATA_dibujos_78E6:
	defb 09ch,09eh,094h,079h,055h,055h,079h,094h,077h,025h,05ah,025h,066h,07eh,011h,012h	; 78e6  ...yUUy.w%Z%f~..
	defb 00ah,0e0h,01dh,023h,0ddh,0ddh,023h,01dh,0feh,007h,00fh,017h,03fh,003h,059h,0abh	; 78f6  ...#..#.....?.Y.
	defb 000h,040h,060h,070h,050h,050h,054h,055h,07eh,0feh,0c3h,000h,07eh,081h,07eh,018h	; 7906  .@`pPPTU~...~.~.
	defb 081h,0c3h,0c3h,0dbh,0c3h,018h,03ch,042h,000h,03ch,098h,040h,032h,018h,03ch,042h	; 7916  ......<B.<.@2.<B
	defb 000h,01ah,03dh,07eh,019h,03ch,03ch,018h,07eh,0c3h,0dbh,006h,0c3h,090h,000h,03ch	; 7926  ..=~.<<.~......<
	defb 07eh,018h,076h,03ch,07eh,018h,081h,018h,042h,000h,081h,000h,042h,081h,000h	; 7936  ~.v<~...B...B..

; ----------------------------------------------------------------------
; DATOS dibujos_7945: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 198, ficha 6 de la lista 0x6D04 (p00:4540); lo leen p00:44DC (18
;   bytes)
;   0x7945..0x7957  (18 bytes)
DATA_dibujos_7945:
	defb 090h,0c9h,093h,097h,097h,005h,097h,097h,097h,0d7h,0c7h,0c3h,061h,070h,0b8h,054h	; 7945  ............ap.T
	defb 00ah,000h	; 7955

; ----------------------------------------------------------------------
; DATOS colores_7957: rachas (p00:4D16) con los colores de los caracteres
;   desde el 97, ficha 0 de la lista 0x6D04 (p00:4540); lo leen p00:44DC (80
;   bytes)
;   0x7957..0x79a7  (80 bytes)
DATA_colores_7957:
	defb 006h,090h,002h,040h,081h,090h,004h,080h,00bh,090h,081h,096h,003h,060h,003h,080h	; 7957  ...@.........`..
	defb 081h,060h,003h,096h,085h,060h,080h,060h,080h,060h,007h,090h,081h,096h,008h,090h	; 7967  .`...`.`.`......
	defb 083h,060h,090h,060h,005h,090h,003h,060h,002h,090h,081h,060h,003h,090h,002h,060h	; 7977  .`.`...`...`...`
	defb 004h,080h,009h,060h,006h,080h,082h,090h,080h,010h,060h,009h,090h,007h,080h,08bh	; 7987  ...`......`.....
	defb 060h,090h,060h,090h,080h,060h,080h,080h,060h,060h,090h,003h,080h,00ah,090h,000h	; 7997  `.`..`..``......

; ----------------------------------------------------------------------
; DATOS colores_79A7: rachas (p00:4D16) con los colores de los caracteres
;   desde el 136, ficha 2 de la lista 0x6D04 (p00:4540); lo leen p00:44DC (34
;   bytes)
;   0x79a7..0x79c9  (34 bytes)
DATA_colores_79A7:
	defb 01dh,096h,002h,060h,083h,080h,096h,099h,00eh,096h,083h,080h,090h,090h,015h,096h	; 79a7  ...`............
	defb 004h,090h,02ch,096h,004h,086h,082h,096h,086h,004h,096h,081h,090h,005h,096h,008h	; 79b7  ..,.............
	defb 090h,000h	; 79c7

; ----------------------------------------------------------------------
; DATOS colores_79C9: rachas (p00:4D16) con los colores de los caracteres
;   desde el 161, ficha 3 de la lista 0x6D04 (p00:4540); lo leen p00:44DC (89
;   bytes)
;   0x79c9..0x7a22  (89 bytes)
DATA_colores_79C9:
	defb 0b5h,0c2h,030h,0b0h,0f8h,0a8h,030h,030h,020h,020h,0c0h,062h,020h,030h,0c0h,062h	; 79c9  ..0...00  .b 0.b
	defb 020h,020h,0c0h,042h,0b6h,0b8h,042h,0c0h,0c0h,090h,020h,060h,020h,0c0h,020h,030h	; 79d9    .B..B... ` . 0
	defb 030h,020h,0c0h,0c0h,020h,0b0h,020h,0c0h,0c0h,090h,096h,060h,090h,090h,080h,060h	; 79e9  0 .. . ....`...`
	defb 0d6h,090h,080h,060h,060h,096h,003h,060h,08bh,0b8h,0a8h,0a6h,096h,096h,060h,060h	; 79f9  ...``..`......``
	defb 020h,096h,0b9h,0b9h,004h,0fbh,086h,0b2h,060h,090h,0a0h,0a0h,0f0h,003h,0a0h,002h	; 7a09   .......`.......
	defb 050h,084h,074h,0f7h,0f7h,075h,00ah,040h,000h	; 7a19  P.t..u.@.

; ----------------------------------------------------------------------
; DATOS colores_7A22: rachas (p00:4D16) con los colores de los caracteres
;   desde el 198, ficha 6 de la lista 0x6D04 (p00:4540); lo leen p00:44DC (16
;   bytes)
;   0x7a22..0x7a32  (16 bytes)
DATA_colores_7A22:
	defb 08ch,080h,090h,080h,090h,0a0h,090h,090h,080h,060h,090h,060h,080h,004h,060h,000h	; 7a22  .........`.`..`.

; ----------------------------------------------------------------------
; DATOS sin_lector_7A32: 36 bytes entre listas de caracteres que no apunta
;   ninguna instruccion con el banco 7 puesto: SIN LECTOR a la vista; lo leen
;   nadie (36 bytes)
;   0x7a32..0x7a56  (36 bytes)
DATA_sin_lector_7A32:
	defb 090h,002h,00eh,02dh,019h,026h,036h,073h,02dh,031h,086h,068h,005h,099h,0b4h,001h	; 7a32  ...-.&6s-1.h....
	defb 050h,000h,090h,040h,040h,040h,050h,050h,050h,070h,080h,050h,070h,070h,0e0h,0f0h	; 7a42  P..@@@PPPp.Ppp..
	defb 070h,050h,050h,000h	; 7a52

; ----------------------------------------------------------------------
; DATOS dibujos_7A56: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 82, ficha 0 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (180
;   bytes)
;   0x7a56..0x7b0a  (180 bytes)
DATA_dibujos_7A56:
	defb 003h,000h,002h,018h,003h,000h,08ch,03ch,07eh,03ch,07eh,03ch,07eh,03ch,07eh,0ddh	; 7a56  .......<~<~<~<~.
	defb 022h,0ddh,0ddh,006h,000h,002h,055h,002h,0aah,0aah,055h,000h,000h,007h,0cfh,0bfh	; 7a66  ".....U...U.....
	defb 07fh,0fch,0f0h,0e3h,000h,0e0h,0f3h,0fdh,0feh,03fh,00fh,0c7h,055h,0ffh,0ffh,000h	; 7a76  .........?..U...
	defb 0bbh,0bbh,000h,000h,0ffh,055h,0a8h,055h,055h,000h,0aah,0ffh,000h,000h,0ffh,018h	; 7a86  .....U.UU.......
	defb 0dbh,0d9h,0e1h,0f3h,003h,0ffh,095h,000h,055h,02ah,0ffh,0ffh,027h,013h,030h,053h	; 7a96  ........U*..'.0S
	defb 0b0h,066h,0c0h,018h,0e4h,0c8h,0c8h,048h,08ah,005h,0a3h,050h,003h,0ffh,085h,000h	; 7aa6  .f.....H...P....
	defb 0f0h,0f6h,0f0h,0f6h,004h,0ffh,08ch,013h,048h,04bh,048h,023h,07eh,000h,02ch,051h	; 7ab6  ........HKH#~.,Q
	defb 052h,051h,02ch,003h,07eh,002h,03eh,0bbh,01eh,006h,000h,035h,01fh,000h,007h,01fh	; 7ac6  RQ,.~.>....5....
	defb 03ch,071h,0e3h,039h,0ffh,0feh,000h,0b0h,0ffh,0b1h,0b7h,0ffh,080h,07fh,0ffh,0ffh	; 7ad6  <q.9............
	defb 080h,02ah,055h,039h,0e7h,0b1h,0b7h,0f1h,0f7h,0b1h,000h,000h,095h,0d5h,0d5h,0e0h	; 7ae6  .*U9............
	defb 0e0h,0f5h,0ffh,01ch,078h,030h,0fah,00ah,00dh,00ah,074h,0f0h,0f6h,0f0h,0f6h,0f0h	; 7af6  ....x0....t.....
	defb 0f6h,0f0h,000h,000h	; 7b06

; ----------------------------------------------------------------------
; DATOS colores_7B0A: rachas (p00:4D16) con los colores de los caracteres
;   desde el 82, ficha 0 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (146
;   bytes)
;   0x7b0a..0x7b9c  (146 bytes)
DATA_colores_7B0A:
	defb 093h,010h,070h,050h,040h,040h,050h,070h,010h,040h,0c0h,040h,0c0h,040h,0c0h,040h	; 7b0a  ..pP@@Pp.@.@.@.@
	defb 0c0h,020h,0c3h,020h,008h,0c0h,088h,0c4h,043h,042h,0c0h,0c0h,0f0h,0f3h,0c0h,003h	; 7b1a  . . ....CB......
	defb 020h,088h,030h,0f0h,0f0h,0fbh,0c0h,0c0h,020h,020h,003h,0c0h,093h,020h,0c0h,0c0h	; 7b2a   .0.....  ... ..
	defb 030h,0c0h,040h,0c3h,0c0h,0c0h,0c3h,020h,020h,0c0h,043h,0c0h,0c0h,0c3h,0cch,0fch	; 7b3a  0.@....  .C.....
	defb 014h,0c0h,082h,030h,020h,00bh,0c0h,098h,020h,030h,0f0h,0c0h,020h,0b0h,020h,0c0h	; 7b4a  ...0 ... 0.. . .
	defb 030h,074h,0c0h,040h,020h,020h,060h,090h,0a0h,090h,060h,0f0h,0f0h,030h,030h,020h	; 7b5a  0t.@  `...`..00
	defb 006h,0c0h,082h,030h,020h,004h,0c0h,081h,020h,004h,0c0h,081h,020h,003h,0c0h,081h	; 7b6a  ...0 ... ... ...
	defb 030h,003h,020h,003h,0c0h,002h,030h,002h,020h,005h,0c0h,093h,0c6h,0c0h,0c0h,0c3h	; 7b7a  0. ...0. .......
	defb 0c0h,0c0h,040h,0c0h,040h,0c0h,0c4h,042h,0c0h,0c0h,0f0h,030h,030h,020h,020h,003h	; 7b8a  ..@.@..B...00  .
	defb 0c0h,000h	; 7b9a

; ----------------------------------------------------------------------
; DATOS dibujos_7B9C: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 82, ficha 0 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (48
;   bytes)
;   0x7b9c..0x7bcc  (48 bytes)
DATA_dibujos_7B9C:
	defb 088h,08ch,030h,0c0h,080h,080h,010h,040h,080h,004h,000h,084h,001h,003h,08fh,03ch	; 7b9c  ..0....@.......<
	defb 003h,000h,085h,060h,018h,0c4h,026h,013h,004h,000h,084h,040h,004h,000h,0d2h,003h	; 7bac  ...`..&....@....
	defb 000h,085h,02ch,003h,0f0h,01eh,0c3h,003h,000h,085h,044h,000h,002h,050h,084h,000h	; 7bbc  ..,.......D..P..

; ----------------------------------------------------------------------
; DATOS dibujos_7BCC: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 102, ficha 1 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (17
;   bytes)
;   0x7bcc..0x7bdd  (17 bytes)
DATA_dibujos_7BCC:
	defb 088h,001h,002h,002h,001h,001h,002h,01ch,0a0h,004h,000h,084h,01ch,062h,002h,081h	; 7bcc  .............b..
	defb 000h	; 7bdc

; ----------------------------------------------------------------------
; DATOS dibujos_7BDD: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 112, ficha 2 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (213
;   bytes)
;   0x7bdd..0x7cb2  (213 bytes)
DATA_dibujos_7BDD:
	defb 084h,091h,090h,010h,008h,004h,000h,0a4h,0f7h,0c4h,0a8h,092h,0b4h,0f6h,020h,024h	; 7bdd  .............. $
	defb 031h,063h,0c6h,0ach,059h,0b9h,033h,033h,00eh,038h,071h,0c0h,0eeh,098h,034h,049h	; 7bed  1c..Y.33.8q...4I
	defb 000h,018h,0e1h,0ceh,085h,038h,0e1h,08bh,037h,093h,0c8h,067h,004h,000h,08ch,044h	; 7bfd  .....8..7..g...D
	defb 010h,060h,0d7h,08eh,014h,038h,0c3h,03bh,013h,0c9h,0c0h,004h,000h,08ch,00ah,070h	; 7c0d  .`...8.........p
	defb 0a3h,003h,01eh,078h,0e2h,088h,0f9h,01fh,081h,030h,004h,000h,0ach,019h,013h,026h	; 7c1d  ...x.....0.....&
	defb 01ch,0f3h,08ah,036h,04ch,019h,053h,009h,00fh,043h,03eh,0d4h,0ebh,017h,00fh,07ch	; 7c2d  ...6L.S..C>....|
	defb 0e1h,007h,01ch,030h,0c2h,078h,007h,038h,076h,0c1h,096h,021h,0d8h,037h,06eh,09dh	; 7c3d  ...0.x.8v..!.7n.
	defb 03fh,037h,06eh,04ch,04dh,0d3h,0ceh,0f3h,018h,004h,000h,0d8h,03bh,0cdh,076h,01ah	; 7c4d  ?7nLM.........v.
	defb 0cch,064h,010h,010h,073h,0bbh,0b4h,0abh,0a6h,025h,0abh,002h,089h,013h,036h,06ch	; 7c5d  .d..s....%....6l
	defb 05dh,091h,034h,060h,0c3h,08eh,01ch,079h,0f3h,08fh,05ch,0f0h,0cch,091h,0b4h,0c8h	; 7c6d  ].4`...y..\.....
	defb 090h,0a4h,040h,088h,01ch,01fh,04fh,017h,012h,020h,08ch,063h,038h,089h,0b4h,072h	; 7c7d  ..@...O.. .c8..r
	defb 0e9h,044h,00fh,0e1h,0c8h,043h,027h,00fh,02fh,00fh,087h,00bh,01ch,01fh,04fh,017h	; 7c8d  .D...C'./.....O.
	defb 012h,024h,044h,080h,011h,0a2h,0e2h,0c4h,0e8h,0ech,0cbh,09ch,038h,089h,0b4h,072h	; 7c9d  .$D.........8..r
	defb 0e9h,044h,002h,001h,000h	; 7cad

; ----------------------------------------------------------------------
; DATOS dibujos_7CB2: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 130, ficha 4 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (45
;   bytes)
;   0x7cb2..0x7cdf  (45 bytes)
DATA_dibujos_7CB2:
	defb 086h,000h,020h,000h,004h,000h,001h,008h,000h,0a2h,0e1h,038h,02eh,017h,049h,006h	; 7cb2  .. ........8..I.
	defb 003h,019h,005h,006h,002h,001h,023h,005h,002h,005h,013h,026h,000h,000h,001h,002h	; 7cc2  ......#....&....
	defb 001h,002h,008h,000h,05eh,018h,067h,0d8h,0a0h,040h,000h,000h,000h	; 7cd2  ....^.g..@...

; ----------------------------------------------------------------------
; DATOS dibujos_7CDF: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 106, ficha 5 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (34
;   bytes)
;   0x7cdf..0x7d01  (34 bytes)
DATA_dibujos_7CDF:
	defb 0a0h,001h,002h,004h,010h,020h,020h,000h,040h,080h,040h,020h,008h,004h,004h,000h	; 7cdf  .....  .@.@ ....
	defb 002h,001h,001h,002h,004h,004h,002h,000h,001h,080h,080h,040h,020h,020h,040h,000h	; 7cef  ...........@  @.
	defb 080h,000h	; 7cff

; ----------------------------------------------------------------------
; DATOS dibujos_7D01: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 247, ficha 6 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (34
;   bytes)
;   0x7d01..0x7d23  (34 bytes)
DATA_dibujos_7D01:
	defb 0a0h,078h,003h,00ch,019h,01eh,06eh,06eh,05ch,039h,064h,00eh,01dh,08ch,003h,021h	; 7d01  .x....nn\9d....!
	defb 0b4h,068h,0ebh,070h,000h,0c0h,080h,0c0h,000h,000h,078h,0e5h,0ebh,0e8h,007h,0dfh	; 7d11  .h.p......x.....
	defb 000h,000h	; 7d21

; ----------------------------------------------------------------------
; DATOS colores_7D23: rachas (p00:4D16) con los colores de los caracteres
;   desde el 82, ficha 0 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (18
;   bytes)
;   0x7d23..0x7d35  (18 bytes)
DATA_colores_7D23:
	defb 003h,041h,081h,051h,00ah,041h,082h,051h,054h,006h,041h,017h,051h,083h,041h,051h	; 7d23  .A.Q.A.QT.A.Q.AQ
	defb 051h,000h	; 7d33

; ----------------------------------------------------------------------
; DATOS colores_7D35: rachas (p00:4D16) con los colores de los caracteres
;   desde el 102, ficha 1 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (15
;   bytes)
;   0x7d35..0x7d44  (15 bytes)
DATA_colores_7D35:
	defb 088h,051h,041h,051h,041h,041h,051h,041h,061h,006h,041h,082h,051h,061h,000h	; 7d35  .QAQAAQAa.A.Qa.

; ----------------------------------------------------------------------
; DATOS colores_7D44: rachas (p00:4D16) con los colores de los caracteres
;   desde el 112, ficha 2 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (112
;   bytes)
;   0x7d44..0x7db4  (112 bytes)
DATA_colores_7D44:
	defb 00eh,041h,00eh,054h,008h,041h,007h,054h,008h,051h,082h,041h,051h,006h,054h,008h	; 7d44  .A.T.A.T.Q.AQ.T.
	defb 041h,008h,054h,007h,051h,082h,054h,051h,006h,041h,082h,051h,041h,003h,054h,002h	; 7d54  A.T.Q.TQ.A.QA.T.
	defb 041h,083h,054h,051h,051h,006h,054h,003h,051h,002h,041h,082h,051h,054h,003h,051h	; 7d64  A.TQQ.T.Q.A.QT.Q
	defb 004h,054h,083h,041h,054h,054h,015h,041h,005h,051h,00eh,054h,002h,051h,003h,041h	; 7d74  .T.ATT.A.Q.T.Q.A
	defb 002h,0c1h,083h,021h,031h,021h,003h,041h,081h,021h,003h,0c1h,08ah,031h,021h,041h	; 7d84  ...!1!.A.!...1!A
	defb 041h,0c1h,0b1h,0a1h,031h,021h,021h,004h,0c1h,084h,021h,031h,021h,021h,003h,031h	; 7d94  A...1!!...!1!!.1
	defb 083h,0b1h,021h,021h,003h,0c1h,002h,021h,003h,0c1h,084h,031h,021h,031h,031h,000h	; 7da4  ..!!...!...1!11.

; ----------------------------------------------------------------------
; DATOS colores_7DB4: rachas (p00:4D16) con los colores de los caracteres
;   desde el 130, ficha 4 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (26
;   bytes)
;   0x7db4..0x7dce  (26 bytes)
DATA_colores_7DB4:
	defb 005h,041h,00ah,051h,081h,054h,006h,051h,082h,041h,051h,006h,041h,002h,051h,004h	; 7db4  .A.Q.T.Q.AQ.A.Q.
	defb 041h,005h,051h,002h,054h,081h,051h,004h,041h,000h	; 7dc4  A.Q.T.Q.A.

; ----------------------------------------------------------------------
; DATOS colores_7DCE: rachas (p00:4D16) con los colores de los caracteres
;   desde el 106, ficha 5 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (30
;   bytes)
;   0x7dce..0x7dec  (30 bytes)
DATA_colores_7DCE:
	defb 081h,051h,004h,041h,002h,051h,082h,061h,051h,004h,041h,002h,051h,084h,061h,041h	; 7dce  .Q.A.Q.aQ.A.Q.aA
	defb 041h,051h,004h,041h,084h,061h,041h,041h,051h,004h,041h,081h,061h,000h	; 7dde  AQ.A.aAAQ.A.a.

; ----------------------------------------------------------------------
; DATOS colores_7DEC: rachas (p00:4D16) con los colores de los caracteres
;   desde el 247, ficha 6 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (28
;   bytes)
;   0x7dec..0x7e08  (28 bytes)
DATA_colores_7DEC:
	defb 084h,011h,021h,0c1h,021h,003h,031h,003h,021h,088h,0c1h,021h,051h,021h,051h,051h	; 7dec  ..!.!.1.!..!Q!QQ
	defb 0c1h,031h,008h,0f1h,086h,021h,031h,021h,0c1h,021h,021h,000h	; 7dfc  .1...!1!.!!.

; ----------------------------------------------------------------------
; DATOS dibujos_7E08: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 82, ficha 0 de la lista 0x6DB5 (p00:4540); lo leen p00:44DC (66
;   bytes)
;   0x7e08..0x7e4a  (66 bytes)
DATA_dibujos_7E08:
	defb 089h,080h,000h,020h,000h,000h,004h,000h,001h,0a4h,007h,000h,090h,001h,002h,000h	; 7e08  ... ............
	defb 004h,000h,020h,040h,000h,004h,048h,010h,042h,010h,0a1h,066h,080h,004h,000h,093h	; 7e18  .. @..H.B..f....
	defb 002h,002h,001h,016h,001h,008h,008h,000h,002h,002h,001h,004h,0c6h,014h,038h,0a0h	; 7e28  ..............8.
	defb 0c0h,0c0h,080h,005h,000h,089h,080h,0c0h,0c0h,080h,000h,000h,02ah,000h,02ah,003h	; 7e38  ............*.*.
	defb 000h,000h	; 7e48

; ----------------------------------------------------------------------
; DATOS dibujos_7E4A: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 93, ficha 1 de la lista 0x6DB5 (p00:4540); lo leen p00:44DC (150
;   bytes)
;   0x7e4a..0x7ee0  (150 bytes)
DATA_dibujos_7E4A:
	defb 085h,000h,0d0h,07fh,0ffh,0ffh,003h,0d0h,0b1h,001h,003h,007h,00ch,001h,03ch,07fh	; 7e4a  ..............<.
	defb 02ah,000h,000h,0ffh,0fdh,0ffh,000h,0ffh,000h,000h,07fh,07dh,07dh,07ch,07fh,07fh	; 7e5a  *..........}}|..
	defb 02ah,0d1h,0d0h,0d1h,080h,02ah,028h,080h,0b4h,0a8h,007h,03bh,061h,0aeh,0adh,003h	; 7e6a  *....*(.....a...
	defb 08ch,01ah,0b4h,076h,076h,0fah,070h,0bah,0f8h,0eah,003h,0ffh,086h,07fh,00fh,06fh	; 7e7a  ...vv.p........o
	defb 06fh,012h,000h,004h,017h,002h,00bh,098h,024h,000h,0bdh,05eh,05fh,05fh,02fh,030h	; 7e8a  o.......$..^__/0
	defb 04bh,045h,024h,063h,050h,04ch,03bh,000h,00fh,0ffh,0ffh,01fh,0e0h,01fh,000h,000h	; 7e9a  KE$cPL..........
	defb 008h,00bh,008h,038h,002h,00bh,081h,000h,003h,00bh,0aah,000h,00bh,038h,078h,038h	; 7eaa  ...8.........8x8
	defb 0c5h,058h,0c5h,038h,0f8h,000h,037h,037h,012h,012h,037h,037h,000h,0ffh,03ah,03ah	; 7eba  .X.8..77..77..::
	defb 024h,024h,03ah,03ah,000h,000h,046h,018h,027h,029h,05eh,01eh,05fh,000h,062h,018h	; 7eca  $$::..F.')^._.b.
	defb 0e4h,0f4h,0eah,0e8h,01ah,000h	; 7eda

; ----------------------------------------------------------------------
; DATOS dibujos_7EE0: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 157, ficha 2 de la lista 0x6DB5 (p00:4540); lo leen p00:44DC (15
;   bytes)
;   0x7ee0..0x7eef  (15 bytes)
DATA_dibujos_7EE0:
	defb 002h,000h,087h,0ffh,000h,000h,0ffh,067h,0ffh,01fh,005h,0ffh,002h,000h,000h	; 7ee0  .......g.......

; ----------------------------------------------------------------------
; DATOS dibujos_7EEF: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 161, ficha 3 de la lista 0x6DB5 (p00:4540); lo leen p00:44DC (58
;   bytes)
;   0x7eef..0x7f29  (58 bytes)
DATA_dibujos_7EEF:
	defb 0b8h,0e0h,078h,0fch,07eh,005h,03fh,00ah,03ch,036h,03fh,03fh,017h,04dh,01ah,05fh	; 7eef  ..x.~.?.<6??.M._
	defb 07fh,038h,046h,011h,0feh,07fh,0bah,00ch,0fch,004h,0fdh,001h,053h,003h,071h,0feh	; 7eff  .8F.........S.q.
	defb 0d8h,0d3h,02fh,007h,00bh,003h,07fh,01fh,027h,0eah,0c0h,0e0h,0c4h,0feh,0f8h,0c5h	; 7f0f  ../.....'.......
	defb 052h,03fh,0bfh,001h,003h,0bfh,001h,0bfh,07fh,000h	; 7f1f  R?........

; ----------------------------------------------------------------------
; DATOS colores_7F29: rachas (p00:4D16) con los colores de los caracteres
;   desde el 82, ficha 0 de la lista 0x6DB5 (p00:4540); lo leen p00:44DC (55
;   bytes)
;   0x7f29..0x7f60  (55 bytes)
DATA_colores_7F29:
	defb 002h,041h,081h,071h,00eh,041h,081h,071h,003h,041h,081h,071h,003h,041h,002h,0f1h	; 7f29  .A.q.A.q.A.q.A..
	defb 081h,081h,003h,041h,081h,071h,005h,0f1h,088h,041h,071h,081h,0f1h,041h,051h,061h	; 7f39  ...A.q...Aq..AQa
	defb 071h,003h,041h,081h,081h,005h,061h,006h,091h,08ch,0b1h,0a1h,091h,061h,041h,051h	; 7f49  q.A...a......aAQ
	defb 071h,0f1h,071h,051h,041h,041h,000h	; 7f59

; ----------------------------------------------------------------------
; DATOS colores_7F60: rachas (p00:4D16) con los colores de los caracteres
;   desde el 93, ficha 1 de la lista 0x6DB5 (p00:4540); lo leen p00:44DC (126
;   bytes)
;   0x7f60..0x7fde  (126 bytes)
DATA_colores_7F60:
	defb 088h,001h,051h,041h,071h,051h,074h,051h,054h,004h,041h,084h,0f1h,041h,041h,074h	; 7f60  ..QAqQtQT.A..AAt
	defb 003h,041h,082h,074h,051h,003h,041h,088h,054h,041h,071h,0f1h,071h,041h,041h,074h	; 7f70  .A.tQ.A.TAq.qAAt
	defb 003h,054h,08ah,041h,071h,051h,051h,041h,021h,041h,071h,051h,0f4h,004h,051h,084h	; 7f80  .T.AqQQA!AqQ..Q.
	defb 071h,041h,051h,041h,003h,075h,081h,074h,003h,041h,087h,051h,071h,051h,0f1h,081h	; 7f90  qAQA.u.t.A.QqQ..
	defb 081h,051h,005h,041h,002h,091h,081h,0f5h,005h,074h,006h,041h,002h,051h,081h,074h	; 7fa0  .Q.A.....t.A.Q.t
	defb 003h,041h,004h,051h,008h,041h,008h,075h,008h,041h,003h,075h,094h,051h,075h,051h	; 7fb0  .A.Q.A.u.A.u.QuQ
	defb 075h,075h,051h,051h,041h,081h,061h,041h,051h,051h,011h,0f7h,075h,081h,061h,075h	; 7fc0  uuQQA.aAQQ..u.au
	defb 0f7h,003h,071h,081h,051h,005h,041h,002h,071h,081h,051h,005h,041h,000h	; 7fd0  ..q.Q.A.q.Q.A.

; ----------------------------------------------------------------------
; DATOS colores_7FDE: rachas (p00:4D16) con los colores de los caracteres
;   desde el 157, ficha 2 de la lista 0x6DB5 (p00:4540); lo leen p00:44DC (17
;   bytes)
;   0x7fde..0x7fef  (17 bytes)
DATA_colores_7FDE:
	defb 002h,051h,08bh,057h,051h,054h,044h,054h,071h,054h,071h,0f1h,071h,051h,003h,041h	; 7fde  .Q.WQTDTqTq.qQ.A
	defb 000h	; 7fee

; ----------------------------------------------------------------------
; DATOS colores_7FEF: rachas (p00:4D16) con los colores de los caracteres
;   desde el 161, ficha 3 de la lista 0x6DB5 (p00:4540) (sigue en el banco 8,
;   en 0x8000); lo leen p00:44DC (17 bytes)
;   0x7fef..0x8000  (17 bytes)
DATA_colores_7FEF:
	defb 089h,0b1h,0a1h,091h,096h,0a9h,096h,098h,061h,096h,003h,091h,004h,061h,083h,0b6h	; 7fef  ........a....a..
	defb 0a9h	; 7fff
