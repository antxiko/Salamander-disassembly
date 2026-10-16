; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 08 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS colores_7FEF_cola: rachas (p00:4D16) con los colores de los caracteres
;   desde el 161, ficha 3 de la lista 0x6DB5 (p00:4540) (sigue del banco 7);
;   lo leen p00:44DC (33 bytes)
;   0x8000..0x8021  (33 bytes)
DATA_colores_7FEF_cola:
	defb 0a9h,003h,096h,085h,098h,061h,0a6h,061h,096h,004h,061h,086h,096h,061h,061h,098h	; 8000  .....a.a..a..aa.
	defb 096h,096h,004h,061h,003h,096h,005h,061h,087h,081h,096h,096h,061h,096h,061h,061h	; 8010  ...a...a....a.aa
	defb 000h	; 8020

; ----------------------------------------------------------------------
; DATOS dibujos_8021: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 92, ficha 1 de la lista 0x6C9C (p00:4540); se solapan 2 bloques:
;   (colores_8021 8021-8024); lo leen p00:44DC (3 bytes)
;   0x8021..0x8024  (3 bytes)
DATA_dibujos_8021:
	defb 020h,000h,000h	; 8021

; ----------------------------------------------------------------------
; DATOS colores_8024: rachas (p00:4D16) con los colores de los caracteres
;   desde el 243, ficha 8 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (32
;   bytes)
;   0x8024..0x8044  (32 bytes)
DATA_colores_8024:
	defb 08bh,090h,0c0h,0c0h,0e0h,0e0h,0c0h,080h,0a0h,000h,0e0h,0e0h,003h,0c0h,08ch,020h	; 8024  ...............
	defb 070h,090h,080h,0c0h,0e0h,0e0h,0c0h,0c0h,090h,040h,020h,003h,0c0h,003h,0e0h,000h	; 8034  p........@ .....

; ----------------------------------------------------------------------
; DATOS dibujos_8044: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 243, ficha 8 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (34
;   bytes)
;   0x8044..0x8066  (34 bytes)
DATA_dibujos_8044:
	defb 0a0h,010h,030h,039h,030h,07ah,085h,032h,069h,0ffh,018h,0e4h,0bbh,00ch,0e0h,02ah	; 8044  ..090z.2i......*
	defb 053h,079h,032h,085h,07ah,030h,039h,030h,010h,053h,02ah,0e0h,00ch,0bbh,0e4h,018h	; 8054  Sy2.z090.S*.....
	defb 000h,000h	; 8064

; ----------------------------------------------------------------------
; DATOS dibujos_8066: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 167, ficha 6 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (59
;   bytes)
;   0x8066..0x80a1  (59 bytes)
DATA_dibujos_8066:
	defb 003h,000h,002h,0c0h,083h,01ch,07fh,03fh,006h,000h,085h,080h,0e0h,00fh,01fh,01fh	; 8066  .......?........
	defb 003h,03fh,09ah,077h,061h,0e0h,0d0h,0a8h,0d4h,0a8h,054h,0aah,086h,001h,001h,002h	; 8076  .?.wa.....T.....
	defb 003h,007h,007h,00fh,00fh,080h,080h,040h,0c0h,0e0h,0c0h,0e0h,0d0h,006h,000h,082h	; 8086  .......@........
	defb 001h,007h,003h,000h,002h,003h,083h,078h,0feh,0f4h,000h	; 8096  .......x...

; ----------------------------------------------------------------------
; DATOS dibujos_80A1: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 179, ficha 4 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (189
;   bytes)
;   0x80a1..0x815e  (189 bytes)
DATA_dibujos_80A1:
	defb 09fh,000h,003h,007h,033h,06dh,05eh,03dh,03bh,000h,000h,080h,0b8h,07ch,01ch,0ach	; 80a1  ....3m^=.....|..
	defb 0d0h,05bh,0c1h,0ech,056h,018h,00eh,007h,000h,0dah,08ah,070h,0f8h,0f8h,0f0h,060h	; 80b1  .[..V......p...`
	defb 007h,000h,082h,006h,00eh,004h,000h,084h,034h,06eh,0deh,018h,006h,000h,09eh,0c0h	; 80c1  ........4n......
	defb 0e0h,00ch,00dh,00bh,003h,014h,035h,033h,01bh,0e7h,0e3h,0dch,0beh,03eh,0deh,0dch	; 80d1  ......53.....>..
	defb 0e9h,060h,0a0h,0c0h,0c0h,050h,030h,070h,030h,009h,002h,003h,001h,004h,000h,085h	; 80e1  .`...P0p0.......
	defb 0e7h,0d7h,01bh,0dch,0e0h,003h,000h,084h,0a0h,090h,070h,0e0h,007h,000h,0a5h,007h	; 80f1  ..........p.....
	defb 00fh,01fh,01fh,01eh,01ch,00dh,041h,0eeh,0efh,0efh,0eeh,0f6h,0e0h,0efh,0dfh,09fh	; 8101  ......A.........
	defb 01fh,05fh,0efh,0efh,078h,03ah,0b3h,087h,09bh,0bah,0b8h,000h,0f0h,0e3h,0cbh,01bh	; 8111  ._..x:..........
	defb 0f1h,076h,00fh,08eh,003h,000h,085h,003h,007h,00fh,0cfh,0e7h,003h,000h,088h,0e0h	; 8121  .v..............
	defb 0f8h,0fdh,0fch,0feh,007h,00fh,00fh,003h,01eh,085h,008h,003h,081h,0bdh,07eh,003h	; 8131  ..............~.
	defb 0feh,08ch,07dh,03bh,0f0h,0f0h,0c0h,030h,0f8h,07ch,03ch,0bch,0c3h,0ddh,003h,0beh	; 8141  ..}....0.|<.....
	defb 002h,03eh,089h,01ch,003h,07bh,0fch,0fch,0f8h,070h,000h,000h,000h	; 8151  .>...{...p...

; ----------------------------------------------------------------------
; DATOS dibujos_815E: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 125, ficha 3 de la lista 0x6C9C (p00:4540); lo leen p00:44DC,
;   p00:4DE1 (131 bytes)
;   0x815e..0x81e1  (131 bytes)
DATA_dibujos_815E:
	defb 0ffh,01dh,02fh,07dh,018h,024h,077h,07bh,031h,0f0h,0dch,0feh,050h,0b2h,078h,080h	; 815e  ../}.$w{1...P.x.
	defb 098h,015h,026h,04ch,004h,07fh,03fh,00fh,000h,0feh,0ddh,0bfh,08ch,008h,0feh,0bch	; 816e  ..&L..?.........
	defb 070h,01dh,02fh,07dh,018h,0dbh,0f7h,07bh,031h,0f0h,0dch,0feh,050h,0b2h,078h,032h	; 817e  p./}...{1...P.x2
	defb 098h,0eah,02eh,04ch,0fbh,07fh,03fh,00fh,000h,0feh,0ddh,0bfh,08ch,008h,0feh,0bch	; 818e  ...L..?.........
	defb 070h,001h,000h,000h,01ch,00fh,007h,007h,043h,0e0h,078h,03ch,03eh,07fh,018h,0c0h	; 819e  p.......C.x<>...
	defb 0b6h,067h,077h,07fh,03fh,00fh,00fh,007h,000h,01ah,028h,0e8h,051h,0feh,0fch,0f8h	; 81ae  .gw.?.....(.Q...
	defb 0e0h,000h,000h,031h,061h,063h,0d3h,069h,022h,000h,080h,08ch,086h,0c7h,0cbh,093h	; 81be  ...1ac.i".......
	defb 09bh,020h,04ch,091h,06eh,025h,07fh,03fh,00fh,00ah,015h,01ah,0d4h,064h,0feh,0fch	; 81ce  . L.n%.?.....d..
	defb 081h,0f0h,000h	; 81de

; ----------------------------------------------------------------------
; DATOS dibujos_81E1: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 204, ficha 5 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (34
;   bytes)
;   0x81e1..0x8203  (34 bytes)
DATA_dibujos_81E1:
	defb 0a0h,000h,04fh,03dh,06bh,07fh,018h,043h,018h,000h,0e4h,078h,0ach,0fch,030h,084h	; 81e1  ..O=k..C...x..0.
	defb 030h,023h,00dh,00ah,031h,024h,024h,012h,002h,088h,060h,0a0h,018h,048h,048h,090h	; 81f1  0#..1$$...`..HH.
	defb 080h,000h	; 8201

; ----------------------------------------------------------------------
; DATOS dibujos_8203: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 125, ficha 2 de la lista 0x6CD9 (p00:4540); lo leen p00:44DC (50
;   bytes)
;   0x8203..0x8235  (50 bytes)
DATA_dibujos_8203:
	defb 0b0h,030h,050h,069h,01ch,01eh,00eh,00ch,011h,00eh,011h,01fh,01fh,00fh,007h,003h	; 8203  .0Pi............
	defb 000h,005h,075h,071h,085h,0f1h,075h,0b1h,0b5h,0b1h,0b5h,071h,0f5h,081h,075h,071h	; 8213  ..uq..u....q..uq
	defb 005h,000h,001h,007h,00fh,0ffh,00fh,060h,0beh,0beh,060h,00fh,000h,00fh,007h,001h	; 8223  .......`..`.....
	defb 000h,000h	; 8233

; ----------------------------------------------------------------------
; DATOS dibujos_8235: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 252, ficha 10 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (24
;   bytes)
;   0x8235..0x824d  (24 bytes)
DATA_dibujos_8235:
	defb 090h,003h,00fh,06ch,0e8h,0e8h,06ch,00fh,003h,059h,040h,09fh,0bfh,0bfh,09fh,040h	; 8235  ...l..l..Y@....@
	defb 059h,005h,000h,083h,005h,0dfh,0ddh,000h	; 8245  Y.......

; ----------------------------------------------------------------------
; DATOS dibujos_824D: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 248, ficha 9 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (26
;   bytes)
;   0x824d..0x8267  (26 bytes)
DATA_dibujos_824D:
	defb 098h,018h,03ch,03ch,018h,07eh,07eh,066h,066h,099h,0bdh,03ch,0bdh,07eh,066h,018h	; 824d  ..<<.~~ff..<.~f.
	defb 0bdh,003h,003h,000h,003h,003h,007h,002h,005h,000h	; 825d  ..........

; ----------------------------------------------------------------------
; DATOS dibujos_8267: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 162, ficha 2 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (34
;   bytes)
;   0x8267..0x8289  (34 bytes)
DATA_dibujos_8267:
	defb 081h,02ah,003h,0aah,090h,000h,01fh,0cfh,0e7h,03dh,09dh,0cfh,0e0h,07fh,03fh,080h	; 8267  .*.......=....?.
	defb 02bh,0e7h,0cfh,01fh,000h,003h,0aah,089h,02ah,02bh,080h,03fh,07fh,0e0h,0cfh,09dh	; 8277  +.......*+.?....
	defb 03dh,000h	; 8287

; ----------------------------------------------------------------------
; DATOS dibujos_8289: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 175, ficha 3 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (34
;   bytes)
;   0x8289..0x82ab  (34 bytes)
DATA_dibujos_8289:
	defb 093h,0bbh,0dbh,05dh,06dh,02eh,000h,01fh,01fh,075h,075h,0b5h,0b5h,0d5h,0c0h,0ffh	; 8289  ...]m....uu.....
	defb 0ffh,000h,000h,004h,003h,00dh,08ah,004h,000h,000h,0a7h,030h,0bbh,03bh,0bbh,030h	; 8299  ...........0...0
	defb 0a6h,000h	; 82a9

; ----------------------------------------------------------------------
; DATOS dibujos_82AB: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 191, ficha 4 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (65
;   bytes)
;   0x82ab..0x82ec  (65 bytes)
DATA_dibujos_82AB:
	defb 094h,00fh,06fh,0eah,0e0h,07fh,000h,056h,000h,0c0h,0cdh,0cdh,00dh,0fdh,000h,0efh	; 82ab  ..o....V........
	defb 000h,07fh,057h,07fh,000h,004h,0feh,089h,07fh,03fh,01fh,0c0h,07bh,0bch,0dfh,0dfh	; 82bb  ..W......?..{...
	defb 0feh,003h,0aah,09ch,000h,07fh,057h,07fh,0dfh,0dfh,0bch,073h,0c0h,01fh,03fh,07fh	; 82cb  ......W....s..?.
	defb 000h,056h,000h,07fh,0e0h,0eah,06fh,00fh,000h,0efh,000h,0fdh,01dh,0cdh,0cdh,0c0h	; 82db  .V....o.........
	defb 000h	; 82eb

; ----------------------------------------------------------------------
; DATOS dibujos_82EC: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 220, ficha 7 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (66
;   bytes)
;   0x82ec..0x832e  (66 bytes)
DATA_dibujos_82EC:
	defb 002h,000h,0beh,060h,010h,0c8h,028h,026h,09fh,000h,006h,00eh,017h,034h,069h,01dh	; 82ec  ...`..(&.....4i.
	defb 063h,060h,0f0h,078h,040h,026h,0b6h,0d8h,016h,000h,000h,004h,002h,00ah,094h,094h	; 82fc  c`.x@&..........
	defb 077h,003h,077h,064h,0c3h,0f3h,060h,000h,031h,09eh,0ddh,0cdh,0c0h,08ch,01bh,0cbh	; 830c  w.wd..`.1.......
	defb 0e7h,001h,007h,00fh,003h,034h,069h,01dh,063h,0c0h,0b0h,0d8h,0c0h,026h,0b6h,0d8h	; 831c  .....4i.c....&..
	defb 016h,000h	; 832c

; ----------------------------------------------------------------------
; DATOS dibujos_832E: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 228, ficha 8 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (18
;   bytes)
;   0x832e..0x8340  (18 bytes)
DATA_dibujos_832E:
	defb 090h,00bh,067h,084h,084h,0fbh,075h,010h,043h,09fh,018h,0deh,0cch,0c0h,08eh,01fh	; 832e  ..g...u.C.......
	defb 01fh,000h	; 833e

; ----------------------------------------------------------------------
; DATOS dibujos_8340: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 207, ficha 5 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (20
;   bytes)
;   0x8340..0x8354  (20 bytes)
DATA_dibujos_8340:
	defb 083h,07fh,0e5h,099h,003h,038h,081h,030h,009h,038h,088h,00eh,0bfh,00eh,000h,00eh	; 8340  .....8.0.8......
	defb 0bfh,00eh,000h,000h	; 8350

; ----------------------------------------------------------------------
; DATOS dibujos_8354: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 206, ficha 7 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (62
;   bytes)
;   0x8354..0x8392  (62 bytes)
DATA_dibujos_8354:
	defb 003h,000h,002h,018h,005h,000h,084h,018h,03ch,03ch,018h,003h,000h,0afh,018h,03ch	; 8354  ........<<.....<
	defb 07eh,07eh,03ch,018h,000h,03ch,07eh,0ffh,01ch,03ch,09bh,07eh,03ch,0c0h,040h,022h	; 8364  ~~<..<~..<.~<.@"
	defb 010h,003h,027h,007h,00bh,001h,002h,002h,044h,088h,0c0h,0d0h,0b8h,000h,007h,027h	; 8374  ..'.....D......'
	defb 00ah,010h,024h,040h,080h,050h,000h,064h,060h,008h,004h,082h,001h,000h	; 8384  ..$@.P.d`.....

; ----------------------------------------------------------------------
; DATOS dibujos_8392: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 180, ficha 0 de la lista 0x94B6 (p00:4540); lo leen p00:5CD5 (157
;   bytes)
;   0x8392..0x842f  (157 bytes)
DATA_dibujos_8392:
	defb 006h,0ffh,082h,001h,002h,005h,000h,083h,070h,07fh,034h,007h,000h,0cdh,0f0h,000h	; 8392  ........p.4.....
	defb 000h,001h,007h,01fh,03eh,02fh,03fh,005h,03fh,0feh,017h,090h,0fbh,0f1h,07eh,0e0h	; 83a2  ....>/?.?.....~.
	defb 078h,0fch,0dfh,0beh,064h,0d8h,018h,00fh,015h,016h,03fh,077h,0dfh,0feh,0fch,03eh	; 83b2  x...d.....?w...>
	defb 01ch,0f7h,0c7h,081h,000h,004h,008h,0feh,040h,094h,02fh,0f6h,07fh,01ah,007h,00fh	; 83c2  ........@./.....
	defb 0c1h,0f8h,050h,0a4h,0d2h,0feh,0efh,07fh,03fh,007h,085h,0e1h,0c2h,008h,004h,04ch	; 83d2  ..P.....?......L
	defb 0fah,0fbh,05fh,03eh,00ch,030h,07eh,0e8h,07bh,03fh,018h,004h,000h,0abh,03ah,01fh	; 83e2  .._>.0~.{?....:.
	defb 00bh,07fh,03fh,015h,00ah,005h,000h,000h,0a0h,024h,0f0h,0b4h,0cah,0e0h,0aah,032h	; 83f2  ..?......$.....2
	defb 004h,000h,000h,0a4h,0d0h,0e2h,004h,00ch,014h,00ch,034h,09ch,02ch,09ch,01bh,02ch	; 8402  ..........4.,..,
	defb 006h,000h,001h,000h,05ch,01fh,002h,003h,001h,005h,000h,090h,0feh,0fch,05ch,0a8h	; 8412  ....\.........\.
	defb 0d0h,060h,040h,000h,0edh,0a7h,0f6h,0efh,04fh,01fh,007h,003h,000h	; 8422  .`@.....O....

; ----------------------------------------------------------------------
; DATOS dibujos_842F: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 205, ficha 1 de la lista 0x94B6 (p00:4540); lo leen p00:5CD5 (45
;   bytes)
;   0x842f..0x845c  (45 bytes)
DATA_dibujos_842F:
	defb 08ch,03ch,05ch,0b8h,0fch,0f8h,0e8h,0f4h,0e0h,0b8h,0d8h,078h,030h,004h,000h,09ah	; 842f  .<\........x0...
	defb 004h,00ch,014h,00eh,036h,09eh,02fh,09eh,0edh,060h,0c0h,080h,000h,000h,001h,001h	; 843f  ....6./..`......
	defb 03fh,05fh,0bfh,0e8h,0fbh,0efh,0beh,01fh,00fh,003h,006h,000h,000h	; 844f  ?_...........

; ----------------------------------------------------------------------
; DATOS dibujos_845C: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 211, ficha 6 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (63
;   bytes)
;   0x845c..0x849b  (63 bytes)
DATA_dibujos_845C:
	defb 002h,000h,09eh,001h,006h,00fh,01fh,03fh,07fh,00fh,070h,08fh,0d8h,067h,0b6h,0d9h	; 845c  .......?..p..g..
	defb 0edh,000h,07fh,000h,05bh,000h,00fh,0ffh,0ffh,000h,007h,000h,077h,000h,00fh,02fh	; 846c  ....[.......w../
	defb 02fh,004h,000h,084h,00ch,016h,03bh,07dh,005h,000h,093h,00fh,070h,08fh,000h,07fh	; 847c  /......}....p...
	defb 000h,06dh,000h,00fh,0ffh,0ffh,000h,007h,000h,0bbh,000h,00fh,02fh,02fh,000h	; 848c  .m..........//.

; ----------------------------------------------------------------------
; DATOS dibujos_849B: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 83, ficha 0 de la lista 0x94A9 (p00:4540); lo leen p00:5CD5 (23
;   bytes)
;   0x849b..0x84b2  (23 bytes)
DATA_dibujos_849B:
	defb 08bh,000h,015h,035h,070h,000h,060h,000h,060h,000h,07eh,07eh,006h,000h,087h,040h	; 849b  ...5p.`.`.~~...@
	defb 060h,050h,050h,060h,040h,000h,000h	; 84ab

; ----------------------------------------------------------------------
; DATOS dibujos_84B2: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 181, ficha 1 de la lista 0x94A9 (p00:4540); lo leen p00:5CD5 (50
;   bytes)
;   0x84b2..0x84e4  (50 bytes)
DATA_dibujos_84B2:
	defb 0a8h,000h,015h,035h,070h,007h,06fh,00fh,06eh,000h,07eh,000h,03ch,0bdh,099h,0c3h	; 84b2  ...5p.o.n.~.<...
	defb 000h,000h,07eh,000h,03ch,099h,081h,0c3h,0c3h,00fh,043h,059h,05dh,05dh,059h,043h	; 84c2  ..~.<.....CY]]YC
	defb 00fh,00fh,043h,050h,058h,058h,050h,043h,00fh,008h,03ch,002h,0c3h,004h,000h,002h	; 84d2  ..CPXXPC..<.....
	defb 0c3h,000h	; 84e2

; ----------------------------------------------------------------------
; DATOS dibujos_84E4: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 211, ficha 6 de la lista 0x6CD9 (p00:4540); lo leen p00:44DC (63
;   bytes)
;   0x84e4..0x8523  (63 bytes)
DATA_dibujos_84E4:
	defb 091h,0e0h,0eah,0e2h,0eah,0eah,0e2h,0eah,0eah,000h,080h,0c0h,0e0h,0f0h,0f8h,0f8h	; 84e4  ................
	defb 0f4h,0e2h,003h,0eah,081h,0e2h,003h,0eah,09ah,0ech,0dah,0b2h,06ah,0cdh,0b5h,035h	; 84f4  ............j..5
	defb 0d5h,0e0h,0eah,0eah,0e2h,0eah,0eah,0e2h,0eah,000h,080h,0c0h,0e0h,0d0h,0b0h,060h	; 8504  ...............`
	defb 0c0h,0eah,0e2h,003h,0eah,084h,0e2h,0eah,0eah,080h,003h,040h,004h,0a0h,000h	; 8514  ...........@...

; ----------------------------------------------------------------------
; DATOS dibujos_8523: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 177, ficha 5 de la lista 0x6CD9 (p00:4540); lo leen p00:44DC (105
;   bytes)
;   0x8523..0x858c  (105 bytes)
DATA_dibujos_8523:
	defb 002h,000h,0dah,00eh,03fh,07fh,019h,004h,00fh,03eh,0ffh,01eh,07fh,080h,0cfh,038h	; 8523  ....?....>.....8
	defb 0ffh,000h,080h,0c0h,030h,0f8h,0fch,0fch,0f8h,000h,00dh,01bh,001h,019h,07bh,0e3h	; 8533  ....0.........{.
	defb 063h,03eh,0e0h,0cfh,01fh,01eh,0e0h,0f0h,0e7h,073h,0b7h,0c7h,0f3h,0fdh,0fdh,0fbh	; 8543  c>.......s......
	defb 0e0h,0f0h,0fch,0feh,09eh,038h,030h,060h,0e0h,081h,07eh,03ch,003h,007h,007h,003h	; 8553  .....80`..~<....
	defb 0ffh,00eh,03eh,0fch,0f0h,0e7h,0cfh,09fh,01fh,073h,007h,05fh,0dfh,0deh,0d9h,083h	; 8563  ..>......s._....
	defb 033h,0feh,0f8h,0f0h,082h,002h,01eh,0d4h,0d0h,04ch,060h,03dh,038h,004h,000h,088h	; 8573  3........L`=8...
	defb 079h,03dh,0c0h,0f9h,0f7h,066h,01ch,000h,000h	; 8583  y=...f...

; ----------------------------------------------------------------------
; DATOS dibujos_858C: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 144, ficha 7 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (83
;   bytes)
;   0x858c..0x85df  (83 bytes)
DATA_dibujos_858C:
	defb 088h,000h,038h,07ch,028h,07ch,038h,000h,000h,0a5h,02eh,0e2h,088h,031h,003h,006h	; 858c  ..8|(|8......1..
	defb 00ch,00fh,003h,0b5h,0cbh,0dbh,099h,00dh,007h,00fh,007h,001h,001h,000h,001h,001h	; 859c  ................
	defb 003h,007h,002h,000h,082h,042h,062h,0c2h,006h,0f2h,000h,077h,087h,017h,063h,003h	; 85ac  .....Bb....w..c.
	defb 000h,0a0h,010h,048h,02fh,012h,022h,044h,05fh,070h,099h,025h,025h,098h,040h,080h	; 85bc  ...H/."D_p.%%.@.
	defb 080h,0e0h,0f0h,0e0h,008h,0f4h,0fah,0e2h,080h,080h,01bh,0c8h,069h,0e2h,0c4h,0d8h	; 85cc  ............i...
	defb 0c6h,0c2h,000h	; 85dc

; ----------------------------------------------------------------------
; DATOS colores_85DF: rachas (p00:4D16) con los colores de los caracteres
;   desde el 240, ficha 9 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (50
;   bytes)
;   0x85df..0x8611  (50 bytes)
DATA_colores_85DF:
	defb 004h,090h,084h,080h,040h,050h,070h,008h,050h,002h,070h,002h,050h,004h,040h,085h	; 85df  ....@Pp.P.p.P.@.
	defb 0f0h,070h,070h,050h,050h,003h,040h,002h,090h,08eh,040h,050h,050h,070h,0f0h,0f0h	; 85ef  .ppPP.@...@PPp..
	defb 080h,080h,040h,040h,050h,050h,070h,0f0h,008h,050h,004h,090h,084h,080h,040h,050h	; 85ff  ..@@PPp..P....@P
	defb 070h,000h	; 860f

; ----------------------------------------------------------------------
; DATOS colores_8611: rachas (p00:4D16) con los colores de los caracteres
;   desde el 167, ficha 6 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (50
;   bytes)
;   0x8611..0x8643  (50 bytes)
DATA_colores_8611:
	defb 004h,070h,084h,040h,060h,090h,0a0h,008h,090h,002h,0a0h,002h,090h,004h,060h,085h	; 8611  .p.@`.........`.
	defb 0f0h,0a0h,0a0h,090h,090h,003h,060h,002h,090h,08eh,060h,090h,090h,0a0h,0f0h,0f0h	; 8621  ......`...`.....
	defb 090h,090h,060h,060h,090h,090h,0a0h,0f0h,008h,090h,004h,070h,084h,040h,060h,090h	; 8631  ..``.......p.@`.
	defb 0a0h,000h	; 8641

; ----------------------------------------------------------------------
; DATOS colores_8643: rachas (p00:4D16) con los colores de los caracteres
;   desde el 179, ficha 4 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (154
;   bytes)
;   0x8643..0x86dd  (154 bytes)
DATA_colores_8643:
	defb 08ch,090h,0a0h,090h,090h,060h,060h,090h,0a0h,060h,060h,090h,090h,004h,060h,081h	; 8643  .....``..``...`.
	defb 090h,004h,060h,081h,090h,004h,060h,083h,0a0h,090h,090h,00ah,060h,005h,090h,084h	; 8653  ..`...`.....`...
	defb 0a0h,090h,090h,060h,007h,0a0h,087h,090h,0a0h,090h,060h,060h,090h,090h,005h,060h	; 8663  ...`......``...`
	defb 084h,090h,0a0h,090h,090h,005h,060h,003h,090h,002h,060h,003h,090h,00ch,060h,002h	; 8673  ......`...`...`.
	defb 090h,006h,060h,004h,0a0h,08ah,0b0h,0a0h,090h,090h,060h,060h,090h,0a0h,090h,090h	; 8683  ..`.......``....
	defb 004h,060h,086h,090h,0a0h,0b0h,0a0h,090h,090h,003h,060h,003h,090h,002h,060h,081h	; 8693  .`........`...`.
	defb 0a0h,003h,090h,004h,060h,003h,090h,085h,0a0h,0b0h,0a0h,090h,060h,004h,090h,088h	; 86a3  ....`.......`...
	defb 0a0h,0b0h,0a0h,090h,090h,0a0h,090h,090h,003h,060h,087h,090h,060h,0a0h,0b0h,0a0h	; 86b3  .........`..`...
	defb 090h,090h,003h,060h,002h,090h,002h,060h,083h,090h,0a0h,090h,003h,060h,004h,090h	; 86c3  ...`...`.....`..
	defb 086h,060h,090h,0a0h,0a0h,090h,090h,00bh,060h,000h	; 86d3  .`......`.

; ----------------------------------------------------------------------
; DATOS colores_86DD: rachas (p00:4D16) con los colores de los caracteres
;   desde el 125, ficha 3 de la lista 0x6C9C (p00:4540); lo leen p00:44DC,
;   p00:4DE1 (119 bytes)
;   0x86dd..0x8754  (119 bytes)
DATA_colores_86DD:
	defb 098h,090h,080h,090h,0a9h,0b8h,090h,090h,0f8h,090h,080h,090h,0f9h,0fah,0a9h,0f9h	; 86dd  ................
	defb 0f8h,0b8h,0a9h,0f8h,0b9h,090h,080h,090h,090h,003h,080h,08dh,0a8h,0f9h,090h,080h	; 86ed  ................
	defb 080h,040h,040h,050h,075h,043h,040h,050h,0f4h,003h,040h,089h,0f5h,0f7h,075h,074h	; 86fd  .@@PuC@P..@...ut
	defb 0f4h,043h,074h,0f4h,043h,007h,040h,082h,074h,0f4h,003h,040h,004h,0f0h,08dh,0b0h	; 870d  .Ct.C.@.t..@....
	defb 0a0h,0a0h,0b0h,0f0h,0b0h,0a0h,090h,090h,098h,0a9h,098h,0a0h,003h,090h,004h,080h	; 871d  ................
	defb 088h,0a9h,0f9h,098h,098h,080h,080h,060h,080h,003h,0b0h,003h,0a0h,092h,0b6h,0a8h	; 872d  .......`........
	defb 0b0h,0e0h,0e0h,0f0h,0b0h,0b0h,0b6h,086h,0f9h,0f9h,0a9h,098h,096h,080h,080h,060h	; 873d  ...............`
	defb 004h,098h,081h,096h,003h,060h,000h	; 874d

; ----------------------------------------------------------------------
; DATOS colores_8754: rachas (p00:4D16) con los colores de los caracteres
;   desde el 204, ficha 5 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (31
;   bytes)
;   0x8754..0x8773  (31 bytes)
DATA_colores_8754:
	defb 088h,040h,040h,050h,050h,070h,070h,080h,080h,004h,040h,08ah,050h,070h,080h,080h	; 8754  .@@PPpp...@.Pp..
	defb 070h,050h,070h,070h,050h,040h,003h,050h,083h,040h,070h,050h,004h,040h,000h	; 8764  pPppP@.P.@pP.@.

; ----------------------------------------------------------------------
; DATOS colores_8773: rachas (p00:4D16) con los colores de los caracteres
;   desde el 125, ficha 2 de la lista 0x6CD9 (p00:4540); lo leen p00:44DC (37
;   bytes)
;   0x8773..0x8798  (37 bytes)
DATA_colores_8773:
	defb 085h,0f0h,0b0h,0a0h,090h,090h,004h,080h,002h,090h,009h,080h,087h,090h,0a0h,0f0h	; 8773  ................
	defb 0b0h,0a0h,090h,090h,005h,080h,08bh,0a0h,080h,080h,090h,000h,090h,0f0h,0b0h,0a0h	; 8783  ................
	defb 090h,090h,005h,080h,000h	; 8793

; ----------------------------------------------------------------------
; DATOS colores_8798: rachas (p00:4D16) con los colores de los caracteres
;   desde el 141, ficha 4 de la lista 0x6CD9 (p00:4540); lo leen p00:44DC (42
;   bytes)
;   0x8798..0x87c2  (42 bytes)
DATA_colores_8798:
	defb 085h,0f0h,0b0h,030h,020h,020h,004h,0c0h,002h,020h,004h,0c0h,081h,0b0h,004h,0c0h	; 8798  ...0  ... ......
	defb 087h,020h,030h,0f0h,0b0h,030h,020h,020h,005h,0c0h,08ch,030h,0c0h,0c0h,020h,000h	; 87a8  . 0..0  ...0.. .
	defb 020h,0f0h,0b0h,030h,020h,020h,050h,004h,0c0h,000h	; 87b8   ..0  P...

; ----------------------------------------------------------------------
; DATOS colores_87C2: rachas (p00:4D16) con los colores de los caracteres
;   desde el 252, ficha 10 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (23
;   bytes)
;   0x87c2..0x87d9  (23 bytes)
DATA_colores_87C2:
	defb 090h,070h,0b0h,0f0h,0b7h,0a5h,090h,090h,050h,070h,0f0h,040h,074h,040h,040h,070h	; 87c2  .p......Pp.@t@@p
	defb 050h,006h,070h,082h,050h,040h,000h	; 87d2

; ----------------------------------------------------------------------
; DATOS colores_87D9: rachas (p00:4D16) con los colores de los caracteres
;   desde el 248, ficha 9 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (26
;   bytes)
;   0x87d9..0x87f3  (26 bytes)
DATA_colores_87D9:
	defb 098h,0f0h,0b0h,0a0h,090h,0f0h,0a0h,097h,095h,074h,0f5h,070h,075h,054h,040h,0f0h	; 87d9  .........t.puT@.
	defb 070h,050h,040h,040h,050h,040h,050h,040h,050h,000h	; 87e9  pP@@P@P@P.

; ----------------------------------------------------------------------
; DATOS colores_87F3: rachas (p00:4D16) con los colores de los caracteres
;   desde el 162, ficha 2 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (34
;   bytes)
;   0x87f3..0x8815  (34 bytes)
DATA_colores_87F3:
	defb 0a0h,050h,070h,050h,040h,050h,050h,070h,0f0h,070h,050h,040h,040h,050h,070h,070h	; 87f3  .PpP@PPp.pP@@Ppp
	defb 050h,070h,050h,040h,050h,050h,070h,050h,040h,040h,050h,070h,050h,040h,040h,050h	; 8803  PpP@PPpP@@PpP@@P
	defb 070h,000h	; 8813

; ----------------------------------------------------------------------
; DATOS colores_8815: rachas (p00:4D16) con los colores de los caracteres
;   desde el 175, ficha 3 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (33
;   bytes)
;   0x8815..0x8836  (33 bytes)
DATA_colores_8815:
	defb 084h,040h,050h,070h,050h,003h,040h,002h,050h,087h,070h,0f0h,070h,050h,040h,050h	; 8815  .@PpP.@.P.p.pP@P
	defb 070h,003h,060h,081h,090h,003h,0a0h,003h,060h,002h,090h,084h,0a0h,0b0h,0b0h,0f0h	; 8825  p.`.....`.......
	defb 000h	; 8835

; ----------------------------------------------------------------------
; DATOS colores_8836: rachas (p00:4D16) con los colores de los caracteres
;   desde el 191, ficha 4 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (55
;   bytes)
;   0x8836..0x886d  (55 bytes)
DATA_colores_8836:
	defb 083h,0f0h,070h,050h,005h,040h,083h,0f0h,070h,050h,006h,040h,002h,050h,002h,040h	; 8836  ..pP.@..pP.@.P.@
	defb 086h,050h,070h,0f0h,050h,070h,0f0h,004h,040h,084h,020h,0f0h,070h,050h,003h,040h	; 8846  .Pp.Pp..@. .pP.@
	defb 002h,050h,081h,020h,004h,040h,082h,070h,050h,005h,040h,083h,050h,070h,050h,005h	; 8856  .P. .@.pP.@.PpP.
	defb 040h,084h,050h,070h,050h,040h,000h	; 8866

; ----------------------------------------------------------------------
; DATOS colores_886D: rachas (p00:4D16) con los colores de los caracteres
;   desde el 220, ficha 7 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (56
;   bytes)
;   0x886d..0x88a5  (56 bytes)
DATA_colores_886D:
	defb 003h,060h,095h,080h,060h,060h,080h,080h,0b0h,0b0h,090h,080h,0b0h,090h,080h,090h	; 886d  .`..``..........
	defb 0a0h,090h,080h,080h,0a0h,080h,060h,090h,00ah,060h,002h,086h,003h,080h,003h,060h	; 887d  ......`..`.....`
	defb 002h,080h,002h,060h,002h,080h,090h,0b0h,030h,020h,0c0h,0b0h,090h,080h,090h,020h	; 888d  ...`....0 .....
	defb 020h,0c0h,0c0h,0a0h,080h,060h,090h,000h	; 889d   ....`..

; ----------------------------------------------------------------------
; DATOS colores_88A5: rachas (p00:4D16) con los colores de los caracteres
;   desde el 228, ficha 8 de la lista 0x6C9C (p00:4540); lo leen p00:44DC (16
;   bytes)
;   0x88a5..0x88b5  (16 bytes)
DATA_colores_88A5:
	defb 084h,090h,080h,098h,086h,003h,060h,083h,090h,080h,086h,005h,060h,081h,080h,000h	; 88a5  ......`.....`...

; ----------------------------------------------------------------------
; DATOS colores_88B5: rachas (p00:4D16) con los colores de los caracteres
;   desde el 207, ficha 5 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (26
;   bytes)
;   0x88b5..0x88cf  (26 bytes)
DATA_colores_88B5:
	defb 098h,0c0h,0f9h,080h,060h,080h,090h,080h,090h,0a0h,0b0h,0f0h,090h,090h,0f0h,0b0h	; 88b5  ....`...........
	defb 0a0h,0c0h,030h,020h,020h,0c0h,0b0h,020h,020h,000h	; 88c5  ..0  ..  .

; ----------------------------------------------------------------------
; DATOS colores_88CF: rachas (p00:4D16) con los colores de los caracteres
;   desde el 206, ficha 7 de la lista 0x6D7E (p00:4540); lo leen p00:44DC (56
;   bytes)
;   0x88cf..0x8907  (56 bytes)
DATA_colores_88CF:
	defb 004h,030h,006h,0c0h,002h,030h,081h,020h,004h,0c0h,084h,0b0h,030h,020h,020h,003h	; 88cf  .0...0. ....0  .
	defb 0c0h,083h,0b0h,030h,020h,003h,0c2h,003h,0c0h,08ch,0b0h,0a0h,030h,070h,050h,040h	; 88df  ...0 .......0pP@
	defb 040h,030h,0b0h,020h,020h,050h,005h,040h,086h,050h,070h,020h,020h,030h,030h,003h	; 88ef  @0.  P.@.Pp  00.
	defb 040h,085h,050h,030h,020h,030h,030h,000h	; 88ff  @.P0 00.

; ----------------------------------------------------------------------
; DATOS colores_8907: rachas (p00:4D16) con los colores de los caracteres
;   desde el 180, ficha 0 de la lista 0x94B6 (p00:4540); lo leen p00:5CD5 (117
;   bytes)
;   0x8907..0x897c  (117 bytes)
DATA_colores_8907:
	defb 006h,000h,009h,080h,081h,098h,00eh,080h,002h,090h,003h,080h,085h,098h,0a9h,080h	; 8907  ................
	defb 080h,090h,004h,080h,083h,090h,0a0h,090h,003h,080h,082h,090h,080h,003h,090h,086h	; 8917  ................
	defb 0a0h,090h,098h,090h,0a0h,0a0h,004h,080h,002h,098h,085h,090h,098h,090h,0a0h,0a0h	; 8927  ................
	defb 003h,080h,004h,098h,082h,090h,0a8h,003h,090h,004h,080h,002h,0a0h,089h,090h,080h	; 8937  ................
	defb 090h,0a0h,090h,090h,0a0h,0a0h,090h,006h,080h,002h,098h,005h,090h,006h,080h,002h	; 8947  ................
	defb 098h,005h,0a0h,083h,080h,090h,0a0h,009h,080h,081h,090h,004h,080h,087h,090h,080h	; 8957  ................
	defb 0a0h,090h,0a0h,090h,0a0h,003h,000h,004h,090h,004h,0a0h,088h,090h,098h,080h,080h	; 8967  ................
	defb 090h,080h,090h,0a0h,000h	; 8977

; ----------------------------------------------------------------------
; DATOS colores_897C: rachas (p00:4D16) con los colores de los caracteres
;   desde el 205, ficha 1 de la lista 0x94B6 (p00:4540); lo leen p00:5CD5 (33
;   bytes)
;   0x897c..0x899d  (33 bytes)
DATA_colores_897C:
	defb 085h,080h,090h,0a0h,090h,080h,005h,090h,006h,0a0h,081h,090h,005h,080h,082h,090h	; 897c  ................
	defb 0a0h,006h,080h,08ah,090h,0a0h,090h,080h,080h,098h,090h,080h,090h,090h,008h,0a0h	; 898c  ................
	defb 000h	; 899c

; ----------------------------------------------------------------------
; DATOS colores_899D: rachas (p00:4D16) con los colores de los caracteres
;   desde el 211, ficha 6 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (51
;   bytes)
;   0x899d..0x89d0  (51 bytes)
DATA_colores_899D:
	defb 004h,070h,002h,050h,002h,040h,081h,070h,003h,050h,007h,040h,087h,050h,040h,054h	; 899d  .p.P.@.p.P.@.P@T
	defb 040h,040h,070h,075h,003h,070h,083h,075h,054h,054h,005h,070h,002h,050h,081h,040h	; 89ad  @@pu.p.uTT.p.P.@
	defb 006h,050h,005h,040h,087h,050h,040h,054h,040h,040h,070h,075h,003h,070h,083h,075h	; 89bd  .P.@.P@T@@pu.p.u
	defb 054h,054h,000h	; 89cd

; ----------------------------------------------------------------------
; DATOS sin_lector_89D0: 61 bytes entre bloques de rachas que no apunta
;   ninguna instruccion con el banco 8 puesto: SIN LECTOR a la vista; lo leen
;   nadie (61 bytes)
;   0x89d0..0x8a0d  (61 bytes)
DATA_sin_lector_89D0:
	defb 003h,030h,002h,020h,003h,0c0h,098h,030h,0f0h,0f0h,030h,030h,020h,020h,0c0h,030h	; 89d0  .0. ...0..00  .0
	defb 0f0h,030h,030h,020h,0c0h,030h,020h,020h,0f0h,030h,020h,020h,0c0h,020h,020h,003h	; 89e0  .00 .0  .0  .  .
	defb 030h,002h,020h,003h,0c0h,004h,030h,08ah,020h,0b0h,020h,0c0h,020h,0f0h,030h,020h	; 89f0  0. ...0. . . .0
	defb 020h,0c0h,003h,020h,087h,0f0h,030h,020h,020h,0c0h,020h,020h,000h	; 8a00   .. ..0  .  .

; ----------------------------------------------------------------------
; DATOS colores_8A0D: rachas (p00:4D16) con los colores de los caracteres
;   desde el 83, ficha 0 de la lista 0x94A9 (p00:4540); lo leen p00:5CD5 (18
;   bytes)
;   0x8a0d..0x8a1f  (18 bytes)
DATA_colores_8A0D:
	defb 083h,000h,070h,050h,006h,040h,081h,070h,008h,040h,086h,050h,070h,070h,050h,040h	; 8a0d  ..pP.@.p.@.PppP@
	defb 040h,000h	; 8a1d

; ----------------------------------------------------------------------
; DATOS colores_8A1F: rachas (p00:4D16) con los colores de los caracteres
;   desde el 181, ficha 1 de la lista 0x94A9 (p00:4540); lo leen p00:5CD5 (50
;   bytes)
;   0x8a1f..0x8a51  (50 bytes)
DATA_colores_8A1F:
	defb 002h,070h,081h,050h,006h,040h,087h,070h,040h,040h,050h,070h,040h,054h,003h,070h	; 8a1f  .p.P.@.p@@Pp@T.p
	defb 081h,040h,004h,050h,002h,040h,086h,050h,070h,070h,050h,040h,040h,003h,050h,002h	; 8a2f  .@.P.@.PppP@@.P.
	defb 070h,003h,050h,089h,054h,075h,075h,0f7h,0f7h,075h,075h,054h,070h,006h,0f0h,081h	; 8a3f  p.P.Tuu..uuTp...
	defb 070h,000h	; 8a4f

; ----------------------------------------------------------------------
; DATOS colores_8A51: rachas (p00:4D16) con los colores de los caracteres
;   desde el 211, ficha 6 de la lista 0x6CD9 (p00:4540); lo leen p00:44DC (49
;   bytes)
;   0x8a51..0x8a82  (49 bytes)
DATA_colores_8A51:
	defb 002h,040h,086h,050h,040h,050h,050h,070h,050h,008h,040h,005h,070h,083h,0f0h,070h	; 8a51  .@.P@PPpP.@.p..p
	defb 0f0h,003h,040h,002h,050h,002h,070h,089h,0f0h,040h,040h,050h,040h,050h,050h,070h	; 8a61  ..@.P.p..@@P@PPp
	defb 050h,008h,040h,005h,070h,083h,0f0h,070h,0f0h,003h,040h,003h,050h,082h,070h,0f0h	; 8a71  P.@.p..p..@.P.p.
	defb 000h	; 8a81

; ----------------------------------------------------------------------
; DATOS colores_8A82: rachas (p00:4D16) con los colores de los caracteres
;   desde el 177, ficha 5 de la lista 0x6CD9 (p00:4540); lo leen p00:44DC (97
;   bytes)
;   0x8a82..0x8ae3  (97 bytes)
DATA_colores_8A82:
	defb 004h,0f0h,08ch,070h,075h,075h,054h,0f0h,070h,054h,040h,070h,070h,075h,044h,003h	; 8a82  ...puuT.pT@ppuD.
	defb 040h,099h,0f0h,070h,050h,040h,040h,070h,070h,040h,040h,0f0h,0f0h,075h,075h,040h	; 8a92  @..pP@@pp@@..uu@
	defb 070h,0f5h,054h,040h,0f4h,070h,054h,0f4h,070h,050h,070h,003h,040h,087h,0f4h,050h	; 8aa2  p.T@.pT.pPp.@..P
	defb 040h,040h,0f4h,0f5h,075h,003h,074h,002h,040h,002h,070h,002h,040h,08dh,000h,0f4h	; 8ab2  @@..u.t.@.p.@...
	defb 0f4h,070h,070h,050h,050h,040h,040h,070h,070h,050h,050h,003h,040h,082h,0f0h,050h	; 8ac2  .ppPP@@ppPP.@..P
	defb 005h,040h,003h,050h,082h,070h,050h,005h,040h,084h,070h,040h,070h,050h,004h,040h	; 8ad2  .@.P.pP.@.p@pP.@
	defb 000h	; 8ae2

; ----------------------------------------------------------------------
; DATOS colores_8AE3: rachas (p00:4D16) con los colores de los caracteres
;   desde el 144, ficha 7 de la lista 0x6D3B (p00:4540); lo leen p00:44DC (69
;   bytes)
;   0x8ae3..0x8b28  (69 bytes)
DATA_colores_8AE3:
	defb 002h,090h,083h,0a0h,080h,090h,003h,080h,083h,070h,050h,050h,003h,040h,005h,050h	; 8ae3  .........pPP.@.P
	defb 003h,040h,081h,0f0h,007h,070h,081h,050h,003h,0f0h,085h,070h,050h,050h,040h,050h	; 8af3  .@...p.P...pPP@P
	defb 003h,070h,082h,0f0h,050h,004h,040h,002h,0f0h,084h,070h,0f0h,070h,070h,004h,050h	; 8b03  .p..P.@...p.pp.P
	defb 004h,040h,003h,050h,08fh,070h,050h,070h,050h,040h,0f0h,040h,054h,0f4h,070h,050h	; 8b13  .@.P.pPpP@.@T.pP
	defb 070h,040h,050h,054h,000h	; 8b23

; ----------------------------------------------------------------------
; DATOS sprites_por_fase: 7 punteros (fase 1 a 7; tabla en 0x8B26 + 2 x A):
;   las listas de dibujos de sprite de cada fase (p00:449E); lo leen p00:449A
;   (14 bytes)
;   0x8b28..0x8b36  (14 bytes)
DATA_sprites_por_fase:
	defw 08b36h,08b43h,08b5ch,08b78h,08b94h,08badh,06066h	; 8b28

; ----------------------------------------------------------------------
; DATOS sprites_8B36: lista [caracter][rachas] de la fase 1 (p00:449E): los
;   dibujos de sprite que se cargan; 0 acaba; lo leen p00:449A (13 bytes)
;   0x8b36..0x8b43  (13 bytes)
DATA_sprites_8B36:
	defb 084h,084h,091h	; 8b36
	defb 090h,03dh,08ch	; 8b39
	defb 0a0h,022h,090h	; 8b3c
	defb 0b0h,047h,092h	; 8b3f
	defb 000h	; 8b42

; ----------------------------------------------------------------------
; DATOS sprites_8B43: lista [caracter][rachas] de la fase 2 (p00:449E): los
;   dibujos de sprite que se cargan; 0 acaba; lo leen p00:449A (25 bytes)
;   0x8b43..0x8b5c  (25 bytes)
DATA_sprites_8B43:
	defb 080h,002h,091h	; 8b43
	defb 09ch,035h,093h	; 8b46
	defb 0a0h,0c6h,091h	; 8b49
	defb 0b0h,0c0h,08eh	; 8b4c
	defb 0c0h,099h,093h	; 8b4f
	defb 06ch,078h,093h	; 8b52
	defb 0c4h,001h,08dh	; 8b55
	defb 0c8h,03eh,094h	; 8b58
	defb 000h	; 8b5b

; ----------------------------------------------------------------------
; DATOS sprites_8B5C: lista [caracter][rachas] de la fase 3 (p00:449E): los
;   dibujos de sprite que se cargan; 0 acaba; lo leen p00:449A (28 bytes)
;   0x8b5c..0x8b78  (28 bytes)
DATA_sprites_8B5C:
	defb 060h,0bah,08dh	; 8b5c
	defb 070h,0c6h,092h	; 8b5f
	defb 080h,002h,091h	; 8b62
	defb 0a0h,07fh,08eh	; 8b65
	defb 0b0h,0c0h,08eh	; 8b68
	defb 0c0h,099h,093h	; 8b6b
	defb 0c4h,001h,08dh	; 8b6e
	defb 0d0h,0c0h,08fh	; 8b71
	defb 0c8h,0bbh,093h	; 8b74
	defb 000h	; 8b77

; ----------------------------------------------------------------------
; DATOS sprites_8B78: lista [caracter][rachas] de la fase 4 (p00:449E): los
;   dibujos de sprite que se cargan; 0 acaba; lo leen p00:449A (28 bytes)
;   0x8b78..0x8b94  (28 bytes)
DATA_sprites_8B78:
	defb 084h,084h,091h	; 8b78
	defb 0e0h,0a0h,090h	; 8b7b
	defb 0e8h,0e0h,090h	; 8b7e
	defb 090h,079h,08dh	; 8b81
	defb 09ch,035h,093h	; 8b84
	defb 0a0h,03dh,08eh	; 8b87
	defb 0b0h,047h,092h	; 8b8a
	defb 0c0h,03eh,08fh	; 8b8d
	defb 0d0h,099h,093h	; 8b90
	defb 000h	; 8b93

; ----------------------------------------------------------------------
; DATOS sprites_8B94: lista [caracter][rachas] de la fase 5 (p00:449E): los
;   dibujos de sprite que se cargan; 0 acaba; lo leen p00:449A (25 bytes)
;   0x8b94..0x8bad  (25 bytes)
DATA_sprites_8B94:
	defb 050h,0fdh,093h	; 8b94
	defb 060h,0bah,08dh	; 8b97
	defb 070h,0c6h,092h	; 8b9a
	defb 0a0h,022h,090h	; 8b9d
	defb 0b0h,047h,092h	; 8ba0
	defb 0c0h,03eh,08fh	; 8ba3
	defb 0e0h,0a0h,090h	; 8ba6
	defb 0e8h,0e0h,090h	; 8ba9
	defb 000h	; 8bac

; ----------------------------------------------------------------------
; DATOS sprites_8BAD: lista [caracter][rachas] de la fase 6 (p00:449E): los
;   dibujos de sprite que se cargan; 0 acaba; lo leen p00:449A (40 bytes)
;   0x8bad..0x8bd5  (40 bytes)
DATA_sprites_8BAD:
	defb 050h,0fdh,093h	; 8bad
	defb 058h,079h,08dh	; 8bb0
	defb 064h,057h,093h	; 8bb3
	defb 06ch,078h,093h	; 8bb6
	defb 070h,0c6h,092h	; 8bb9
	defb 080h,002h,091h	; 8bbc
	defb 090h,09fh,08ch	; 8bbf
	defb 09ch,035h,093h	; 8bc2
	defb 0a0h,07fh,08eh	; 8bc5
	defb 0b0h,0c0h,08eh	; 8bc8
	defb 0c0h,03eh,08fh	; 8bcb
	defb 0d0h,0c0h,08fh	; 8bce
	defb 058h,0bbh,093h	; 8bd1
	defb 000h	; 8bd4

; ----------------------------------------------------------------------
; DATOS fichas_por_fase: 7 punteros (fase 1 a 7; tabla en 0x8BD3 + 2 x A):
;   fichas de dibujos de sprite de cada fase (p00:43A7); lo leen p00:43A1 (14
;   bytes)
;   0x8bd5..0x8be3  (14 bytes)
DATA_fichas_por_fase:
	defw 08be3h,08bf0h,08bf1h,08c02h,08c13h,08c1ch,08c2ch	; 8bd5

; ----------------------------------------------------------------------
; DATOS fichas_8BE3: fichas de 4 bytes [tipo][cuantos][a][b] de la fase 1
;   (p00:43A7: tipo 1 copia sprites 0x1800 + 8 x a -> b, los demas p00:442B);
;   un tipo 0 acaba; lo leen p00:43A1 (13 bytes)
;   0x8be3..0x8bf0  (13 bytes)
DATA_fichas_8BE3:
	defb 001h,001h,088h,08ch	; 8be3
	defb 001h,004h,0a0h,0d0h	; 8be7
	defb 002h,002h,0e0h,0e8h	; 8beb
	defb 000h	; 8bef

; ----------------------------------------------------------------------
; DATOS fichas_8BF0: fichas de 4 bytes [tipo][cuantos][a][b] de la fase 2
;   (p00:43A7: tipo 1 copia sprites 0x1800 + 8 x a -> b, los demas p00:442B);
;   un tipo 0 acaba; lo leen p00:43A1 (1 bytes)
;   0x8bf0..0x8bf1  (1 bytes)
DATA_fichas_8BF0:
	defb 000h	; 8bf0

; ----------------------------------------------------------------------
; DATOS fichas_8BF1: fichas de 4 bytes [tipo][cuantos][a][b] de la fase 3
;   (p00:43A7: tipo 1 copia sprites 0x1800 + 8 x a -> b, los demas p00:442B);
;   un tipo 0 acaba; lo leen p00:43A1 (17 bytes)
;   0x8bf1..0x8c02  (17 bytes)
DATA_fichas_8BF1:
	defb 002h,002h,0a0h,0a8h	; 8bf1
	defb 001h,003h,0d0h,0dch	; 8bf5
	defb 002h,003h,0d0h,0e8h	; 8bf9
	defb 002h,003h,0dch,0f4h	; 8bfd
	defb 000h	; 8c01

; ----------------------------------------------------------------------
; DATOS fichas_8C02: fichas de 4 bytes [tipo][cuantos][a][b] de la fase 4
;   (p00:43A7: tipo 1 copia sprites 0x1800 + 8 x a -> b, los demas p00:442B);
;   un tipo 0 acaba; lo leen p00:43A1 (17 bytes)
;   0x8c02..0x8c13  (17 bytes)
DATA_fichas_8C02:
	defb 001h,001h,088h,08ch	; 8c02
	defb 002h,001h,0e8h,0ech	; 8c06
	defb 001h,002h,0a0h,0a8h	; 8c0a
	defb 001h,001h,090h,098h	; 8c0e
	defb 000h	; 8c12

; ----------------------------------------------------------------------
; DATOS fichas_8C13: fichas de 4 bytes [tipo][cuantos][a][b] de la fase 5
;   (p00:43A7: tipo 1 copia sprites 0x1800 + 8 x a -> b, los demas p00:442B);
;   un tipo 0 acaba; lo leen p00:43A1 (9 bytes)
;   0x8c13..0x8c1c  (9 bytes)
DATA_fichas_8C13:
	defb 001h,004h,0a0h,0d0h	; 8c13
	defb 002h,001h,0e8h,0ech	; 8c17
	defb 000h	; 8c1b

; ----------------------------------------------------------------------
; DATOS fichas_8C1C: fichas de 4 bytes [tipo][cuantos][a][b] de la fase 6
;   (p00:43A7: tipo 1 copia sprites 0x1800 + 8 x a -> b, los demas p00:442B);
;   un tipo 0 acaba; se solapan 2 bloques: (fichas_8C2C 8C2C-8C3D); lo leen
;   p00:43A1 (33 bytes)
;   0x8c1c..0x8c3d  (33 bytes)
DATA_fichas_8C1C:
	defb 002h,002h,0a0h,0a8h	; 8c1c
	defb 001h,003h,0d0h,0dch	; 8c20
	defb 002h,003h,0d0h,0e8h	; 8c24
	defb 002h,003h,0dch,0f4h	; 8c28
	defb 001h,001h,088h,08ch	; 8c2c
	defb 001h,003h,0d0h,0dch	; 8c30
	defb 002h,003h,0d0h,0e8h	; 8c34
	defb 002h,003h,0dch,0f4h	; 8c38
	defb 000h	; 8c3c

; ----------------------------------------------------------------------
; DATOS rachas_8C3D: rachas (p00:4D16) con los dibujos de sprite desde el 144
;   (0x1800 + 8 x 144), de la lista 0x8B36 (p00:449E); lo leen p00:449A (98
;   bytes)
;   0x8c3d..0x8c9f  (98 bytes)
DATA_rachas_8C3D:
	defb 0ceh,003h,006h,066h,0d6h,0ceh,066h,030h,01ah,008h,008h,010h,027h,04fh,098h,0f0h	; 8c3d  ...f..f0....'O..
	defb 060h,00ch,096h,0a6h,0ech,0d8h,018h,008h,068h,026h,0c1h,0dfh,01eh,090h,0d0h,0f0h	; 8c4d  `.......h&......
	defb 060h,000h,003h,007h,004h,00ch,03ch,060h,063h,01ah,018h,018h,033h,067h,07fh,039h	; 8c5d  `.....<`c...3g.9
	defb 000h,000h,018h,0a8h,0cch,01ch,018h,038h,00ch,032h,022h,04ch,018h,020h,020h,0a0h	; 8c6d  .......8.2"L.  .
	defb 0c0h,000h,003h,00fh,01ch,030h,060h,044h,060h,070h,033h,030h,021h,027h,01fh,003h	; 8c7d  .....0`D`p30!'..
	defb 000h,08fh,0c0h,0f8h,0fch,00ch,09eh,0deh,066h,006h,016h,01ch,018h,090h,0d0h,0e0h	; 8c8d  ........f.......
	defb 000h,000h	; 8c9d

; ----------------------------------------------------------------------
; DATOS rachas_8C9F: rachas (p00:4D16) con los dibujos de sprite desde el 144
;   (0x1800 + 8 x 144), de la lista 0x8BAD (p00:449E); lo leen p00:449A (98
;   bytes)
;   0x8c9f..0x8d01  (98 bytes)
DATA_rachas_8C9F:
	defb 0e0h,000h,008h,018h,050h,021h,053h,061h,02bh,005h,04bh,0c6h,0c9h,0c2h,0c1h,042h	; 8c9f  ....P!Sa+.K....B
	defb 041h,000h,010h,018h,00ah,084h,0cah,086h,0d4h,0a0h,0d2h,063h,093h,043h,083h,042h	; 8caf  A..........c.C.B
	defb 082h,000h,004h,00ch,028h,011h,02bh,031h,013h,005h,01bh,032h,039h,032h,031h,012h	; 8cbf  ....(.+1...2921.
	defb 011h,000h,020h,030h,014h,088h,0d4h,08ch,0c8h,0a0h,0d8h,04ch,09ch,04ch,08ch,048h	; 8ccf  .. 0.......L.L.H
	defb 088h,000h,001h,003h,00ah,005h,00ah,00dh,006h,001h,005h,00ah,00dh,00ch,00dh,004h	; 8cdf  ................
	defb 005h,000h,080h,0c0h,050h,0a0h,050h,0b0h,060h,080h,0a0h,050h,0b0h,030h,0b0h,020h	; 8cef  ....P.P.`..P.0.
	defb 0a0h,000h	; 8cff

; ----------------------------------------------------------------------
; DATOS rachas_8D01: rachas (p00:4D16) con los dibujos de sprite desde el 196
;   (0x1800 + 8 x 196), de la lista 0x8B43 (p00:449E); lo leen p00:449A (34
;   bytes)
;   0x8d01..0x8d23  (34 bytes)
DATA_rachas_8D01:
	defb 0a0h,000h,001h,005h,01fh,02eh,027h,037h,07eh,05fh,05dh,063h,064h,05fh,022h,02ch	; 8d01  ......'7~_]cd_",
	defb 017h,030h,0eeh,095h,0c3h,0c1h,0a6h,04ah,04ah,0d4h,082h,004h,044h,014h,028h,0d0h	; 8d11  .0.....JJ...D.(.
	defb 000h,000h	; 8d21

; ----------------------------------------------------------------------
; DATOS rachas_8D23: rachas (p00:4D16) con los dibujos de sprite desde el 88
;   (0x1800 + 8 x 88), de la lista 0x6066 (p00:449E); lo leen p00:449A (86
;   bytes)
;   0x8d23..0x8d79  (86 bytes)
DATA_rachas_8D23:
	defb 0aeh,000h,008h,00eh,03fh,070h,009h,003h,0d3h,0d2h,002h,009h,070h,03fh,00eh,008h	; 8d23  ....?p......p?..
	defb 000h,048h,058h,050h,054h,026h,09eh,0c7h,0e8h,0e8h,0c7h,09eh,026h,054h,050h,058h	; 8d33  .HXPT&......&TPX
	defb 048h,000h,000h,008h,00eh,03fh,07fh,008h,0d2h,0d2h,003h,009h,070h,01fh,008h,003h	; 8d43  H....?......p...
	defb 000h,08dh,008h,048h,050h,054h,06eh,027h,088h,0e8h,0c7h,09ch,020h,058h,048h,007h	; 8d53  ...HPTn'.... XH.
	defb 000h,087h,001h,03ah,0d1h,0ffh,05fh,02fh,004h,009h,000h,087h,0c0h,027h,0c8h,0efh	; 8d63  ...:.._/.....'..
	defb 0d6h,058h,048h,004h,000h,000h	; 8d73

; ----------------------------------------------------------------------
; DATOS rachas_8D79: rachas (p00:4D16) con los dibujos de sprite desde el 144
;   (0x1800 + 8 x 144), de la lista 0x8B78 (p00:449E); lo leen p00:449A (65
;   bytes)
;   0x8d79..0x8dba  (65 bytes)
DATA_rachas_8D79:
	defb 0a0h,000h,023h,014h,09bh,0d5h,02eh,0edh,074h,052h,085h,0c6h,084h,042h,00eh,03ch	; 8d79  ..#.....tR...B.<
	defb 052h,000h,0c4h,028h,0d9h,0abh,074h,037h,02eh,04ah,0a1h,063h,021h,042h,070h,03ch	; 8d89  R..(..t7.J.c!Bp<
	defb 04ah,003h,000h,09ah,023h,094h,0dbh,035h,0eeh,06dh,094h,0c2h,089h,04ah,006h,03ch	; 8d99  J...#..5.m...J.<
	defb 052h,04ah,03ch,060h,0d4h,029h,0dbh,0ach,077h,036h,029h,043h,081h,002h,003h,000h	; 8da9  RJ<`.)..w6)C....
	defb 000h	; 8db9

; ----------------------------------------------------------------------
; DATOS rachas_8DBA: rachas (p00:4D16) con los dibujos de sprite desde el 96
;   (0x1800 + 8 x 96), de la lista 0x8B5C (p00:449E); lo leen p00:449A (131
;   bytes)
;   0x8dba..0x8e3d  (131 bytes)
DATA_rachas_8DBA:
	defb 0ffh,001h,004h,015h,030h,065h,0d4h,02bh,0b4h,0b4h,02bh,0d4h,065h,030h,015h,004h	; 8dba  ....0e.+..+.e0..
	defb 001h,080h,020h,0a8h,00ch,0a6h,02bh,0d4h,02dh,02dh,0d4h,02bh,0a6h,00ch,0a8h,020h	; 8dca  .. ...+.--.+...
	defb 080h,000h,004h,015h,034h,04bh,074h,0b4h,0abh,014h,065h,0b0h,055h,024h,015h,005h	; 8dda  ....4Kt...e.U$..
	defb 001h,000h,020h,0a8h,02ch,0d2h,02eh,02dh,0d5h,028h,0a6h,00dh,0aah,024h,0a8h,0a0h	; 8dea  .. .,..-.(...$..
	defb 080h,000h,003h,014h,023h,00ch,0d5h,080h,035h,074h,0b5h,0d4h,065h,031h,005h,001h	; 8dfa  ....#...5t..e1..
	defb 000h,000h,0c0h,028h,0e4h,030h,0abh,001h,0ach,02eh,0adh,02bh,0a6h,08ch,0a0h,080h	; 8e0a  ...(.0.....+....
	defb 000h,001h,004h,011h,024h,055h,0b4h,0b5h,075h,075h,0b5h,0b4h,055h,024h,011h,004h	; 8e1a  ....$U..uu..U$..
	defb 001h,080h,020h,088h,024h,0aah,02dh,0adh,0aeh,0aeh,0adh,02dh,0aah,024h,088h,020h	; 8e2a  .. .$.-....-.$.
	defb 081h,080h,000h	; 8e3a

; ----------------------------------------------------------------------
; DATOS rachas_8E3D: rachas (p00:4D16) con los dibujos de sprite desde el 160
;   (0x1800 + 8 x 160), de la lista 0x8B78 (p00:449E); lo leen p00:449A (66
;   bytes)
;   0x8e3d..0x8e7f  (66 bytes)
DATA_rachas_8E3D:
	defb 0c0h,004h,00dh,00ch,01dh,000h,016h,002h,02ah,02ah,0a9h,0aeh,0aeh,0a2h,020h,01bh	; 8e3d  ........**.... .
	defb 078h,020h,0b0h,030h,0b8h,000h,068h,040h,054h,054h,095h,075h,075h,045h,004h,0d8h	; 8e4d  x .0..h@TT.uuE..
	defb 01eh,000h,004h,00dh,00ch,01dh,000h,016h,002h,02ah,02ah,0a9h,0aeh,0aeh,0a2h,018h	; 8e5d  .........**.....
	defb 07bh,000h,020h,0b0h,030h,0b8h,000h,068h,040h,054h,054h,095h,075h,075h,045h,018h	; 8e6d  {. .0..h@TT.uuE.
	defb 0deh,000h	; 8e7d

; ----------------------------------------------------------------------
; DATOS rachas_8E7F: rachas (p00:4D16) con los dibujos de sprite desde el 160
;   (0x1800 + 8 x 160), de la lista 0x8B5C (p00:449E); lo leen p00:449A (65
;   bytes)
;   0x8e7f..0x8ec0  (65 bytes)
DATA_rachas_8E7F:
	defb 0b0h,01eh,080h,0bfh,0c0h,0cfh,00ch,05dh,042h,042h,05dh,00ch,0cfh,0c0h,0bfh,080h	; 8e7f  .......]BB].....
	defb 01eh,000h,000h,080h,028h,08eh,02fh,0e0h,00ah,00ah,0e0h,02fh,08eh,028h,080h,000h	; 8e8f  ....(./..../.(..
	defb 000h,03ch,080h,0bfh,0c0h,0dfh,018h,0bbh,084h,084h,0bbh,018h,0dfh,0c0h,0bfh,080h	; 8e9f  .<..............
	defb 03ch,003h,000h,08ah,050h,01ch,05eh,0c0h,014h,014h,0c0h,05eh,01ch,050h,003h,000h	; 8eaf  <...P.^....^.P..
	defb 000h	; 8ebf

; ----------------------------------------------------------------------
; DATOS rachas_8EC0: rachas (p00:4D16) con los dibujos de sprite desde el 176
;   (0x1800 + 8 x 176), de la lista 0x8B43 (p00:449E); lo leen p00:449A (126
;   bytes)
;   0x8ec0..0x8f3e  (126 bytes)
DATA_rachas_8EC0:
	defb 0afh,012h,036h,064h,00bh,037h,036h,0c1h,01ch,040h,0c1h,036h,037h,00bh,064h,036h	; 8ec0  ..6d.76..@.67.d6
	defb 012h,048h,06ch,026h,0d0h,0ech,06ch,083h,038h,002h,083h,06ch,0ech,0d0h,026h,06ch	; 8ed0  .Hl&..l.8..l..&l
	defb 048h,000h,000h,012h,034h,06bh,036h,01dh,0c1h,0f2h,037h,04bh,064h,076h,036h,012h	; 8ee0  H...4k6...7Kdv6.
	defb 003h,000h,08dh,048h,02ch,0d6h,06ch,0b8h,083h,04fh,0ech,0d2h,026h,06eh,06ch,048h	; 8ef0  ...H,.l..O..&nlH
	defb 004h,000h,08ch,014h,028h,041h,036h,0fbh,0c7h,04bh,06ch,066h,076h,036h,012h,004h	; 8f00  ....(A6..Klfv6..
	defb 000h,08ch,028h,014h,082h,06ch,0dfh,0e1h,0d2h,036h,066h,06eh,06ch,048h,004h,000h	; 8f10  ..(..l...6fnlH..
	defb 08ch,024h,05ah,047h,057h,0d9h,0ceh,06eh,06eh,066h,036h,012h,012h,004h,000h,08dh	; 8f20  .$ZGW..nnf6.....
	defb 024h,05ah,0e2h,0eah,09bh,073h,076h,076h,06eh,06ch,048h,048h,000h,000h	; 8f30  $Z...svvnlHH..

; ----------------------------------------------------------------------
; DATOS rachas_8F3E: rachas (p00:4D16) con los dibujos de sprite desde el 192
;   (0x1800 + 8 x 192), de la lista 0x8B78 (p00:449E); lo leen p00:449A (130
;   bytes)
;   0x8f3e..0x8fc0  (130 bytes)
DATA_rachas_8F3E:
	defb 0dfh,041h,02eh,01dh,001h,03dh,004h,039h,0f7h,039h,004h,03dh,001h,01dh,02eh,041h	; 8f3e  .A...=.9.9.=...A
	defb 000h,082h,074h,0b8h,080h,0bch,020h,09ch,0efh,09ch,020h,0bch,080h,0b8h,074h,082h	; 8f4e  ..t... ... ...t.
	defb 000h,021h,017h,00eh,000h,01eh,002h,01ch,07bh,01ch,002h,01eh,000h,00eh,017h,021h	; 8f5e  .!......{......!
	defb 000h,088h,078h,030h,0c8h,0f0h,020h,0b0h,0fch,0b0h,020h,0f0h,0c8h,030h,078h,088h	; 8f6e  ..x0.. ... ..0x.
	defb 000h,008h,007h,005h,010h,007h,001h,006h,01dh,006h,001h,007h,010h,007h,005h,008h	; 8f7e  ................
	defb 000h,0a0h,060h,020h,0c4h,0f8h,000h,0c0h,0f0h,0c0h,000h,0f8h,0c4h,020h,060h,0a0h	; 8f8e  ..` ......... `.
	defb 003h,000h,08bh,001h,020h,01dh,000h,005h,00dh,005h,000h,01dh,020h,001h,003h,000h	; 8f9e  .... ....... ...
	defb 002h,080h,08eh,040h,082h,0dch,000h,0d0h,0d8h,0d0h,000h,0dch,082h,040h,080h,080h	; 8fae  ...@.........@..
	defb 000h,000h	; 8fbe

; ----------------------------------------------------------------------
; DATOS rachas_8FC0: rachas (p00:4D16) con los dibujos de sprite desde el 208
;   (0x1800 + 8 x 208), de la lista 0x8B5C (p00:449E); lo leen p00:449A (98
;   bytes)
;   0x8fc0..0x9022  (98 bytes)
DATA_rachas_8FC0:
	defb 08dh,000h,005h,02eh,036h,011h,0b1h,0b6h,022h,020h,040h,0c0h,080h,080h,003h,000h	; 8fc0  ....6..." @.....
	defb 0d0h,002h,062h,0b6h,0b6h,0a6h,08ch,04eh,0a0h,04eh,090h,0dah,09ah,0dah,09ah,030h	; 8fd0  ..b....N.N.....0
	defb 022h,000h,001h,000h,086h,0d6h,0d9h,060h,0c0h,0cdh,082h,086h,006h,004h,008h,000h	; 8fe0  "......`........
	defb 000h,001h,0b1h,0dbh,0dbh,0d3h,086h,027h,050h,027h,048h,06dh,04dh,06dh,04dh,018h	; 8ff0  .......'P'HmMmM.
	defb 011h,004h,00ah,01ah,096h,0d5h,063h,04eh,0d5h,0cah,085h,08ch,00ah,008h,00bh,000h	; 9000  ......cN........
	defb 000h,080h,080h,040h,040h,060h,040h,070h,040h,098h,020h,0c4h,064h,062h,062h,040h	; 9010  ...@@`@p@. .dbb@
	defb 081h,000h	; 9020

; ----------------------------------------------------------------------
; DATOS rachas_9022: rachas (p00:4D16) con los dibujos de sprite desde el 160
;   (0x1800 + 8 x 160), de la lista 0x8B36 (p00:449E); lo leen p00:449A (126
;   bytes)
;   0x9022..0x90a0  (126 bytes)
DATA_rachas_9022:
	defb 004h,000h,002h,001h,09ah,003h,00bh,03bh,0f7h,0ffh,0d7h,06ah,035h,01ah,00fh,000h	; 9022  ...........j5...
	defb 030h,040h,0d8h,040h,030h,000h,040h,060h,0f0h,0b8h,058h,0a8h,058h,0f0h,080h,003h	; 9032  0@.@0.@`..X.X...
	defb 000h,09eh,001h,003h,003h,00bh,03bh,07bh,0fdh,0dfh,06fh,03eh,01fh,00fh,003h,060h	; 9042  .......{..o>...`
	defb 080h,0b0h,080h,060h,000h,040h,060h,0b0h,0f8h,0ech,0f6h,0abh,057h,0feh,0c0h,000h	; 9052  ...`.@`.....W...
	defb 005h,001h,09bh,00dh,01dh,03dh,07fh,0bdh,0ceh,07dh,00eh,00fh,007h,0c0h,000h,060h	; 9062  .....=...}.....`
	defb 000h,0c0h,000h,080h,0a0h,0b0h,0d8h,0f8h,0ech,056h,0abh,0ddh,087h,001h,003h,002h	; 9072  .........V......
	defb 002h,001h,09ah,00dh,01dh,03dh,07bh,03fh,01fh,017h,037h,03bh,01eh,080h,000h,0c0h	; 9082  .....={?..7.....
	defb 000h,080h,000h,0b0h,0b8h,0bch,0fch,0ech,0f4h,0aeh,0d6h,0ach,018h,000h	; 9092  ..............

; ----------------------------------------------------------------------
; DATOS rachas_90A0: rachas (p00:4D16) con los dibujos de sprite desde el 224
;   (0x1800 + 8 x 224), de la lista 0x8B78 (p00:449E); se solapan 6 bloques:
;   (rachas_90E0 90E0-9102) (rachas_90E0 90E0-9102) (rachas_9102 9102-9184)
;   (rachas_9102 9102-9184) (rachas_9102 9102-9184); lo leen p00:449A (228
;   bytes)
;   0x90a0..0x9184  (228 bytes)
DATA_rachas_90A0:
	defb 0a6h,003h,006h,011h,038h,017h,04ch,0d8h,0a8h,0a8h,0d8h,04ch,017h,038h,011h,006h	; 90a0  ....8.L....L.8..
	defb 003h,0c0h,060h,088h,01ch,0e8h,032h,01bh,055h,055h,09bh,032h,0e8h,01ch,088h,060h	; 90b0  ..`...2.UU.2...`
	defb 0c0h,003h,00bh,014h,02fh,03fh,05fh,004h,0efh,08ch,05fh,03fh,02fh,014h,00bh,003h	; 90c0  ..../?_..._?/...
	defb 0c0h,0d0h,028h,0f4h,0fch,0fah,004h,0f7h,085h,0fah,0fch,0f4h,028h,0d0h,0c0h,000h	; 90d0  ..(.........(...
	defb 0a0h,001h,005h,00ch,01bh,026h,019h,00dh,04ah,04ah,00dh,019h,026h,01bh,00ch,005h	; 90e0  .....&..JJ..&...
	defb 001h,080h,0a0h,038h,0bch,03ch,0deh,0eeh,0efh,0efh,0eeh,0deh,03ch,0bch,038h,0a0h	; 90f0  ...8.<......<.8.
	defb 080h,000h,0a3h,000h,007h,00dh,01fh,03fh,07fh,07fh,07eh,07ch,06bh,03eh,02bh,034h	; 9100  .......?..~|k>+4
	defb 01fh,00eh,005h,000h,0c0h,0b0h,0a8h,0c6h,09ah,092h,019h,0b9h,075h,0d8h,0eah,0e2h	; 9110  ............u...
	defb 00ch,018h,080h,000h,005h,01ch,003h,03fh,0dah,07fh,07eh,057h,06eh,070h,022h,016h	; 9120  .......?..~Wnp".
	defb 018h,00fh,001h,000h,0f0h,098h,0fch,0c4h,072h,0bah,08bh,09bh,07dh,094h,00ah,030h	; 9130  ........r...}..0
	defb 0aah,0c4h,090h,000h,007h,00eh,035h,062h,057h,05dh,059h,0cdh,069h,06ah,011h,028h	; 9140  ......5bW]Y.ij.(
	defb 006h,009h,003h,000h,0c0h,0f8h,0bch,0bch,0feh,078h,0fah,0feh,03ah,0fah,0beh,06ch	; 9150  .........x..:..l
	defb 018h,0e0h,080h,005h,00eh,01fh,034h,02bh,03eh,06bh,07ch,07eh,07fh,07fh,03fh,01fh	; 9160  ......4+>k|~..?.
	defb 00dh,007h,000h,080h,018h,00ch,0e2h,0eah,0d8h,075h,0b9h,019h,092h,09ah,0c6h,0a8h	; 9170  .........u......
	defb 0b0h,0c0h,000h,000h	; 9180

; ----------------------------------------------------------------------
; DATOS rachas_9184: rachas (p00:4D16) con los dibujos de sprite desde el 132
;   (0x1800 + 8 x 132), de la lista 0x6066 (p00:449E); lo leen p00:449A (66
;   bytes)
;   0x9184..0x91c6  (66 bytes)
DATA_rachas_9184:
	defb 0c0h,001h,007h,020h,012h,01eh,030h,0eah,01ah,01ah,0eah,030h,01eh,012h,020h,007h	; 9184  ... ..0....0.. .
	defb 001h,0f8h,026h,0c8h,0e8h,0c3h,01ah,0c0h,0b8h,0b8h,0c0h,01ah,0c3h,0e8h,0c8h,026h	; 9194  ..&............&
	defb 0f8h,00ch,01bh,015h,036h,026h,00ah,00dh,019h,0f6h,023h,039h,02ch,045h,00fh,011h	; 91a4  ....6&....#9,E..
	defb 001h,090h,020h,030h,040h,035h,076h,068h,081h,0c6h,03ah,05dh,0e3h,08eh,018h,000h	; 91b4  .. 0@5vh..:]....
	defb 000h,000h	; 91c4

; ----------------------------------------------------------------------
; DATOS rachas_91C6: rachas (p00:4D16) con los dibujos de sprite desde el 160
;   (0x1800 + 8 x 160), de la lista 0x8B43 (p00:449E); lo leen p00:449A (129
;   bytes)
;   0x91c6..0x9247  (129 bytes)
DATA_rachas_91C6:
	defb 0adh,002h,004h,005h,02ch,02ah,074h,0b5h,0cch,0edh,05eh,059h,055h,04ch,005h,005h	; 91c6  ....,*t...^YUL..
	defb 001h,040h,020h,0a0h,034h,054h,02eh,0adh,023h,0b7h,07ah,09ah,0aah,032h,0a0h,0a0h	; 91d6  .@ .4T..#.z..2..
	defb 080h,001h,000h,003h,008h,00dh,008h,013h,018h,01bh,015h,010h,013h,004h,003h,001h	; 91e6  ................
	defb 002h,040h,0a5h,060h,068h,028h,054h,04ch,05ch,05ch,0a8h,048h,0e8h,068h,040h,040h	; 91f6  .@.`h(TL\\.H.h@@
	defb 000h,001h,001h,003h,003h,008h,004h,004h,002h,006h,002h,005h,007h,009h,003h,003h	; 9206  ................
	defb 001h,000h,000h,040h,050h,0e0h,0a0h,040h,003h,0e0h,085h,0c0h,040h,050h,040h,040h	; 9216  ...@P..@....@P@@
	defb 003h,000h,08eh,001h,005h,00dh,003h,002h,001h,003h,001h,003h,002h,00dh,005h,000h	; 9226  ................
	defb 000h,003h,080h,084h,090h,0d8h,060h,080h,004h,0c0h,085h,0a0h,0d8h,090h,080h,080h	; 9236  ......`.........
	defb 000h	; 9246

; ----------------------------------------------------------------------
; DATOS rachas_9247: rachas (p00:4D16) con los dibujos de sprite desde el 176
;   (0x1800 + 8 x 176), de la lista 0x8B36 (p00:449E); lo leen p00:449A (127
;   bytes)
;   0x9247..0x92c6  (127 bytes)
DATA_rachas_9247:
	defb 0aeh,001h,01bh,018h,06fh,020h,005h,062h,065h,062h,065h,002h,030h,06fh,018h,01bh	; 9247  ....o .bebe.0o..
	defb 001h,080h,0d8h,018h,0f6h,004h,0a0h,046h,0a6h,046h,0a6h,040h,00ch,0f6h,018h,0d8h	; 9257  .......F.F.@....
	defb 080h,000h,000h,010h,015h,02fh,072h,025h,06ah,065h,000h,06fh,018h,01bh,009h,004h	; 9267  ...../r%je.o....
	defb 000h,08ch,008h,0a8h,0f4h,04eh,0a0h,056h,0a6h,000h,0f6h,018h,0d8h,090h,004h,000h	; 9277  .....N.V........
	defb 08ch,010h,020h,023h,018h,065h,020h,00fh,058h,053h,019h,00ch,010h,004h,000h,08ch	; 9287  .. #.e .XS......
	defb 008h,004h,0c4h,018h,0a6h,004h,0f0h,01ah,0cah,098h,030h,008h,003h,000h,002h,008h	; 9297  ..........0.....
	defb 09dh,010h,038h,007h,019h,053h,053h,019h,007h,038h,010h,008h,008h,000h,000h,010h	; 92a7  ..8..SS..8......
	defb 010h,008h,01ch,0e0h,098h,0cah,0cah,098h,0e0h,01ch,008h,010h,010h,000h,000h	; 92b7  ...............

; ----------------------------------------------------------------------
; DATOS rachas_92C6: rachas (p00:4D16) con los dibujos de sprite desde el 112
;   (0x1800 + 8 x 112), de la lista 0x8B5C (p00:449E); lo leen p00:449A (111
;   bytes)
;   0x92c6..0x9335  (111 bytes)
DATA_rachas_92C6:
	defb 005h,000h,086h,004h,001h,003h,003h,001h,004h,00ah,000h,086h,020h,080h,0c0h,0c0h	; 92c6  ............ ...
	defb 080h,020h,008h,000h,08ah,011h,004h,00bh,006h,015h,015h,006h,00bh,004h,011h,006h	; 92d6  . ..............
	defb 000h,08ah,088h,020h,0d0h,060h,0a8h,0a8h,060h,0d0h,020h,088h,004h,000h,0bfh,001h	; 92e6  ... .`..`. .....
	defb 025h,014h,006h,03ch,00ah,063h,063h,00ah,03ch,006h,014h,025h,001h,000h,000h,080h	; 92f6  %..<.cc.<..%....
	defb 0a4h,028h,060h,03ch,050h,0c6h,0c6h,050h,038h,060h,028h,0a4h,080h,000h,003h,04ah	; 9306  .(`<P..P8`(....J
	defb 029h,00dh,078h,011h,0c4h,0b5h,0b5h,0c4h,011h,078h,00dh,029h,04ah,003h,0c0h,052h	; 9316  ).x......x.)J..R
	defb 094h,0b0h,01eh,088h,023h,0adh,0adh,023h,088h,01ch,0b0h,094h,052h,0c0h,000h	; 9326  ....#..#....R..

; ----------------------------------------------------------------------
; DATOS rachas_9335: rachas (p00:4D16) con los dibujos de sprite desde el 156
;   (0x1800 + 8 x 156), de la lista 0x8B43 (p00:449E); lo leen p00:449A (34
;   bytes)
;   0x9335..0x9357  (34 bytes)
DATA_rachas_9335:
	defb 0a0h,003h,00bh,010h,02eh,060h,076h,039h,059h,0c2h,0d5h,014h,053h,027h,01eh,00dh	; 9335  .....`v9Y...S'..
	defb 000h,000h,0b0h,078h,0e4h,0cah,028h,0abh,043h,09ah,09ch,06ch,006h,074h,008h,0d0h	; 9345  ...x..(.C..l.t..
	defb 0c0h,000h	; 9355

; ----------------------------------------------------------------------
; DATOS rachas_9357: rachas (p00:4D16) con los dibujos de sprite desde el 100
;   (0x1800 + 8 x 100), de la lista 0x8BAD (p00:449E); lo leen p00:449A (33
;   bytes)
;   0x9357..0x9378  (33 bytes)
DATA_rachas_9357:
	defb 086h,007h,01fh,03fh,07ch,073h,0f4h,004h,0e8h,096h,0f4h,071h,07ch,03fh,01ch,007h	; 9357  ...?|s.....q|?..
	defb 0e0h,0f8h,0fch,03eh,0ceh,02fh,005h,017h,005h,005h,00dh,00ah,03ah,0e4h,098h,0e0h	; 9367  ...>./......:...
	defb 000h	; 9377

; ----------------------------------------------------------------------
; DATOS rachas_9378: rachas (p00:4D16) con los dibujos de sprite desde el 108
;   (0x1800 + 8 x 108), de la lista 0x8B43 (p00:449E); lo leen p00:449A (33
;   bytes)
;   0x9378..0x9399  (33 bytes)
DATA_rachas_9378:
	defb 08dh,008h,022h,05dh,0b5h,0b5h,059h,02ah,02bh,008h,00bh,005h,004h,006h,003h,002h	; 9378  .."]..Y*+.......
	defb 08dh,020h,088h,074h,05ah,05ah,034h,0a8h,0a8h,020h,0a0h,040h,040h,0c0h,003h,080h	; 9388  . .tZZ4.. .@@...
	defb 000h	; 9398

; ----------------------------------------------------------------------
; DATOS rachas_9399: rachas (p00:4D16) con los dibujos de sprite desde el 192
;   (0x1800 + 8 x 192), de la lista 0x8B43 (p00:449E); lo leen p00:449A (34
;   bytes)
;   0x9399..0x93bb  (34 bytes)
DATA_rachas_9399:
	defb 0a0h,008h,011h,035h,016h,04dh,06bh,06ah,035h,014h,02ah,015h,038h,030h,010h,018h	; 9399  ...5.Mkj5.*.80..
	defb 004h,010h,088h,0ach,068h,0b2h,0d6h,056h,02ch,028h,054h,0a8h,01ch,00ch,008h,018h	; 93a9  ....h..V,(T.....
	defb 020h,000h	; 93b9

; ----------------------------------------------------------------------
; DATOS rachas_93BB: rachas (p00:4D16) con los dibujos de sprite desde el 200
;   (0x1800 + 8 x 200), de la lista 0x8B5C (p00:449E); lo leen p00:449A (66
;   bytes)
;   0x93bb..0x93fd  (66 bytes)
DATA_rachas_93BB:
	defb 0c0h,003h,00ch,011h,023h,043h,041h,080h,080h,090h,080h,048h,044h,022h,010h,00ch	; 93bb  ....#CA....HD"..
	defb 003h,0c0h,030h,0c8h,0e4h,0e2h,0c2h,011h,031h,001h,001h,002h,002h,084h,008h,030h	; 93cb  ..0.....1......0
	defb 0c0h,000h,003h,00eh,01ch,03ch,03eh,07fh,07fh,06fh,07fh,037h,03bh,01dh,00fh,003h	; 93db  .....<>..o.7....
	defb 000h,000h,0c0h,030h,018h,01ch,03ch,0eeh,0ceh,0feh,0feh,0fch,0fch,078h,0f0h,0c0h	; 93eb  ...0..<......x..
	defb 000h,000h	; 93fb

; ----------------------------------------------------------------------
; DATOS rachas_93FD: rachas (p00:4D16) con los dibujos de sprite desde el 80
;   (0x1800 + 8 x 80), de la lista 0x6066 (p00:449E); lo leen p00:449A (65
;   bytes)
;   0x93fd..0x943e  (65 bytes)
DATA_rachas_93FD:
	defb 0bdh,000h,000h,040h,032h,02dh,01dh,01ah,03fh,002h,038h,01ch,01dh,02dh,022h,040h	; 93fd  ...@2-..?.8..-"@
	defb 000h,000h,000h,004h,0d8h,0b0h,080h,0c0h,078h,000h,078h,0c0h,090h,0b0h,088h,004h	; 940d  ........x.x.....
	defb 000h,001h,001h,003h,002h,00ch,017h,01ah,03fh,0dah,038h,017h,014h,00bh,003h,001h	; 941d  ........?.8.....
	defb 001h,000h,000h,080h,000h,0e0h,090h,070h,074h,06fh,070h,0b8h,0d0h,060h,003h,000h	; 942d  .......ptop..`..
	defb 000h	; 943d

; ----------------------------------------------------------------------
; DATOS rachas_943E: rachas (p00:4D16) con los dibujos de sprite desde el 200
;   (0x1800 + 8 x 200), de la lista 0x8B43 (p00:449E); lo leen p00:449A (87
;   bytes)
;   0x943e..0x9495  (87 bytes)
DATA_rachas_943E:
	defb 007h,000h,089h,007h,01eh,03ah,03ch,07ah,078h,0f3h,0cfh,09fh,008h,000h,0c5h,080h	; 943e  .....:<zx.......
	defb 040h,0bch,07eh,07dh,02bh,0d5h,0a3h,006h,01ch,01ah,031h,02bh,021h,014h,00eh,00fh	; 944e  @.~}+.....1+!...
	defb 00dh,00ah,00ch,007h,003h,000h,000h,0bfh,03fh,0b5h,0dah,0ech,0c2h,0a0h,002h,08fh	; 945e  ........?.......
	defb 05eh,03fh,02eh,03dh,05eh,01ch,007h,0c0h,011h,04ch,006h,00eh,02ah,015h,023h,007h	; 946e  ^?.=^....L..*.#.
	defb 0a7h,005h,021h,016h,060h,080h,000h,080h,0e0h,0b0h,078h,018h,08ch,0ach,0dch,0c8h	; 947e  ..!.`.....x.....
	defb 0d0h,0c0h,0c0h,080h,003h,000h,000h	; 948e

; ----------------------------------------------------------------------
; DATOS caracteres_9495: lista de caracteres (p00:4546) del cambio 0 de mitad
;   de fase (0x5CFA): fichas de 6 bytes, 0 acaba; lo leen p00:5CD5 (7 bytes)
;   0x9495..0x949c  (7 bytes)
DATA_caracteres_9495:
	defb 007h,01ah,095h,0a7h,0cbh,095h	; 9495
	defb 000h	; 949b

; ----------------------------------------------------------------------
; DATOS caracteres_949C: lista de caracteres (p00:4546) del cambio 1 de mitad
;   de fase (0x5D00): fichas de 6 bytes, 0 acaba; lo leen p00:5CD5 (13 bytes)
;   0x949c..0x94a9  (13 bytes)
DATA_caracteres_949C:
	defb 007h,0c5h,069h,0a4h,09eh,06bh	; 949c
	defb 007h,0c1h,068h,09dh,0c9h,068h	; 94a2
	defb 000h	; 94a8

; ----------------------------------------------------------------------
; DATOS caracteres_94A9: lista de caracteres (p00:4546) del cambio 2 de mitad
;   de fase (0x5D06): fichas de 6 bytes, 0 acaba; lo leen p00:5CD5 (13 bytes)
;   0x94a9..0x94b6  (13 bytes)
DATA_caracteres_94A9:
	defb 007h,09bh,084h,053h,00dh,08ah	; 94a9
	defb 007h,0b2h,084h,0b5h,01fh,08ah	; 94af
	defb 000h	; 94b5

; ----------------------------------------------------------------------
; DATOS caracteres_94B6: lista de caracteres (p00:4546) del cambio 3 de mitad
;   de fase (0x5D0C): fichas de 6 bytes, 0 acaba; lo leen p00:5CD5 (13 bytes)
;   0x94b6..0x94c3  (13 bytes)
DATA_caracteres_94B6:
	defb 007h,092h,083h,0b4h,007h,089h	; 94b6
	defb 007h,02fh,084h,0cdh,07ch,089h	; 94bc
	defb 000h	; 94c2

; ----------------------------------------------------------------------
; DATOS caracteres_94C3: lista de caracteres (p00:4546) del cambio 4 de mitad
;   de fase (0x5D12): fichas de 6 bytes, 0 acaba; lo leen p00:5CD5 (25 bytes)
;   0x94c3..0x94dc  (25 bytes)
DATA_caracteres_94C3:
	defb 007h,0d1h,068h,040h,0f3h,068h	; 94c3
	defb 007h,0a7h,099h,052h,0d7h,09ah	; 94c9
	defb 007h,0a9h,09ah,06fh,0c2h,09bh	; 94cf
	defb 007h,0c5h,09ah,06fh,0dbh,09bh	; 94d5
	defb 000h	; 94db

; ----------------------------------------------------------------------
; DATOS copias_94DC: lista de copias VRAM -> VRAM en espejo (p00:44F9) del
;   cambio 2 de mitad de fase (0x5D06); se solapan 2 bloques: (copias_94EC
;   94EC-94ED); lo leen p00:5CE5 (17 bytes)
;   0x94dc..0x94ed  (17 bytes)
DATA_copias_94DC:
	defb 053h,052h,03fh,001h	; 94dc
	defb 055h,059h,03fh,001h	; 94e0
	defb 0b5h,0b4h,03fh,001h	; 94e4
	defb 0b8h,0c0h,03fh,002h	; 94e8
	defb 000h	; 94ec

; ----------------------------------------------------------------------
; DATOS copias_94ED: lista de copias VRAM -> VRAM en espejo (p00:44F9) del
;   cambio 3 de mitad de fase (0x5D0C); lo leen p00:5CE5 (9 bytes)
;   0x94ed..0x94f6  (9 bytes)
DATA_copias_94ED:
	defb 0b4h,0d3h,03fh,015h	; 94ed
	defb 0cdh,0e8h,03fh,006h	; 94f1
	defb 000h	; 94f5

; ----------------------------------------------------------------------
; DATOS copias_94F6: lista de copias VRAM -> VRAM en espejo (p00:44F9) del
;   cambio 1 de mitad de fase (0x5D00); se solapan 2 bloques: (copias_9506
;   9506-9507); lo leen p00:5CE5 (17 bytes)
;   0x94f6..0x9507  (17 bytes)
DATA_copias_94F6:
	defb 0a4h,0bbh,03fh,017h	; 94f6
	defb 0a4h,0d2h,03fh,020h	; 94fa
	defb 0c5h,09eh,03fh,001h	; 94fe
	defb 0c7h,0f5h,03fh,00bh	; 9502
	defb 000h	; 9506

; ----------------------------------------------------------------------
; DATOS copias_9507: lista de copias VRAM -> VRAM cabeza abajo (p00:44F9) del
;   cambio 0 de mitad de fase (0x5CFA); se solapan 2 bloques: (copias_950B
;   950B-950C); lo leen p00:5CE5 (5 bytes)
;   0x9507..0x950c  (5 bytes)
DATA_copias_9507:
	defb 0a7h,0beh,03fh,017h	; 9507
	defb 000h	; 950b

; ----------------------------------------------------------------------
; DATOS copias_950C: lista de copias VRAM -> VRAM cabeza abajo (p00:44F9) del
;   cambio 2 de mitad de fase (0x5D06); se solapan 2 bloques: (copias_9514
;   9514-9515); lo leen p00:5CE5 (9 bytes)
;   0x950c..0x9515  (9 bytes)
DATA_copias_950C:
	defb 052h,056h,03fh,003h	; 950c
	defb 0b4h,0bch,03fh,004h	; 9510
	defb 000h	; 9514

; ----------------------------------------------------------------------
; DATOS copias_9515: lista de copias VRAM -> VRAM cabeza abajo (p00:44F9) del
;   cambio 4 de mitad de fase (0x5D12); lo leen p00:5CE5 (5 bytes)
;   0x9515..0x951a  (5 bytes)
DATA_copias_9515:
	defb 052h,082h,03fh,021h	; 9515
	defb 000h	; 9519

; ----------------------------------------------------------------------
; DATOS dibujos_951A: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 167, ficha 0 de la lista 0x9495 (p00:4540); lo leen p00:5CD5 (177
;   bytes)
;   0x951a..0x95cb  (177 bytes)
DATA_dibujos_951A:
	defb 088h,080h,060h,038h,01eh,00fh,007h,003h,001h,005h,000h,08bh,080h,0e0h,0c0h,058h	; 951a  ..`8...........X
	defb 01ch,04eh,027h,036h,018h,01dh,00eh,005h,000h,002h,0c0h,092h,0e0h,00eh,007h,003h	; 952a  .N'6............
	defb 003h,001h,001h,000h,000h,070h,078h,078h,03ch,03eh,09eh,0c7h,001h,0f8h,003h,07ch	; 953a  .....pxx<>.....|
	defb 081h,07eh,003h,03eh,08bh,040h,0e0h,070h,0f0h,0f8h,07ch,03ch,01eh,01fh,01fh,00fh	; 954a  .~.>.@.p..|<....
	defb 003h,00eh,08ah,00ch,003h,01fh,05fh,04fh,001h,03eh,00fh,00fh,03fh,003h,000h,086h	; 955a  ......_O.>..?...
	defb 080h,000h,080h,0c0h,0c0h,00fh,003h,007h,087h,003h,001h,005h,004h,00fh,01fh,01fh	; 956a  ................
	defb 003h,03fh,002h,01fh,002h,0e0h,002h,0f0h,084h,0e0h,0e8h,0e0h,0c8h,003h,006h,092h	; 957a  .?..............
	defb 005h,001h,001h,000h,000h,00eh,000h,07fh,03fh,01eh,0ffh,0ffh,0feh,098h,0bch,03ch	; 958a  ........?......<
	defb 07eh,07eh,003h,07fh,091h,0feh,07ch,071h,005h,081h,0b9h,07ch,07eh,07fh,03fh,01fh	; 959a  ~~....|q...|~.?.
	defb 00fh,007h,00bh,001h,03fh,000h,003h,080h,003h,0c0h,084h,0e0h,03eh,07fh,07fh,003h	; 95aa  ....?.......>...
	defb 03fh,082h,03eh,00ch,003h,0e0h,085h,0f0h,070h,090h,0c0h,0e0h,003h,0f0h,005h,0f8h	; 95ba  ?.>.....p.......
	defb 000h	; 95ca

; ----------------------------------------------------------------------
; DATOS colores_95CB: rachas (p00:4D16) con los colores de los caracteres
;   desde el 167, ficha 0 de la lista 0x9495 (p00:4540); lo leen p00:5CD5 (117
;   bytes)
;   0x95cb..0x9640  (117 bytes)
DATA_colores_95CB:
	defb 004h,0b0h,081h,0a0h,003h,090h,007h,0b0h,002h,090h,083h,0b0h,0a0h,0a0h,00ah,090h	; 95cb  ................
	defb 002h,0b0h,008h,090h,005h,0b0h,085h,0a0h,090h,090h,060h,080h,006h,090h,002h,0a0h	; 95db  ..........`.....
	defb 082h,0b0h,0a0h,004h,0b0h,003h,090h,003h,080h,002h,060h,088h,0b0h,0a0h,090h,090h	; 95eb  ..........`.....
	defb 060h,086h,098h,098h,005h,090h,083h,060h,090h,0b0h,006h,080h,082h,060h,080h,008h	; 95fb  `......`.....`..
	defb 0a9h,006h,0b0h,08ch,0a0h,090h,080h,080h,060h,060h,080h,060h,080h,080h,0a9h,0a9h	; 960b  ........``.`....
	defb 003h,098h,003h,080h,082h,090h,0a0h,004h,0b0h,002h,0bah,088h,080h,060h,060h,090h	; 961b  .............``.
	defb 090h,060h,060h,080h,007h,0bah,081h,0a0h,008h,0b0h,008h,098h,004h,0a0h,003h,090h	; 962b  .``.............
	defb 081h,0a0h,008h,0b0h,000h	; 963b

; ----------------------------------------------------------------------
; DATOS dibujos_9640: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 82, ficha 0 de la lista 0x6802 (p00:4540); lo leen p00:4DE1 (590
;   bytes)
;   0x9640..0x988e  (590 bytes)
DATA_dibujos_9640:
	defb 004h,000h,084h,007h,03fh,03eh,078h,004h,000h,084h,080h,0c0h,0efh,01fh,004h,000h	; 9640  ....?>x.........
	defb 084h,070h,0e7h,05fh,001h,005h,000h,083h,0b8h,0feh,078h,003h,000h,08ah,00eh,01fh	; 9650  .p._......x.....
	defb 07fh,02ah,054h,003h,000h,019h,033h,063h,003h,067h,0a8h,0c0h,03ch,070h,0c0h,0f8h	; 9660  .*T...3c.g..<p..
	defb 0e7h,0c3h,0b9h,03fh,01ch,069h,077h,0efh,0dfh,0bch,03dh,03ch,038h,0feh,0e0h,0e3h	; 9670  ...?.iw...=<8...
	defb 00fh,01eh,07fh,03eh,07ch,0bbh,0c7h,0efh,0c2h,0bch,07eh,0c0h,0e0h,0e0h,0d0h,03ch	; 9680  ...>|.....~....<
	defb 07eh,038h,07ch,004h,000h,002h,001h,0efh,005h,028h,000h,01eh,07fh,054h,0aah,055h	; 9690  ~8|......(...T.U
	defb 0a8h,050h,02ah,07fh,03bh,0b9h,0dch,0d9h,0c1h,083h,073h,0b8h,0c6h,01ch,079h,0f3h	; 96a0  .P*.......s...y.
	defb 0e7h,0e7h,0bch,0deh,03eh,03ch,0feh,0feh,08ch,0deh,07dh,07dh,078h,074h,06eh,07eh	; 96b0  ....><....}}xtn~
	defb 07eh,07ch,0feh,054h,02ah,07eh,00eh,046h,0f0h,0f9h,038h,07ch,07eh,07eh,074h,02ah	; 96c0  ~|.T*~.F..8|~~t*
	defb 014h,028h,09fh,03fh,0cfh,03ch,02ah,054h,0fch,0cbh,0e0h,05ch,00ah,0b5h,0b8h,07bh	; 96d0  .(.?.<*T...\...{
	defb 0fbh,01ch,000h,000h,080h,040h,0a0h,050h,0a0h,0c8h,054h,02eh,07fh,0ffh,02ah,054h	; 96e0  .....@.P..T...*T
	defb 0a3h,04ah,07bh,010h,047h,0efh,0e7h,0e7h,0c3h,09dh,023h,057h,0a7h,0f6h,0efh,08fh	; 96f0  .J{.G.....#W....
	defb 02fh,0e7h,0e7h,083h,079h,0fch,01ch,003h,07eh,0ffh,0a0h,0d4h,0fah,074h,03ah,0b4h	; 9700  /...y...~....t:.
	defb 0b8h,078h,079h,0fbh,003h,03fh,07fh,03fh,07fh,01eh,0fdh,0fch,0f0h,0f8h,0e0h,0e0h	; 9710  .xy..?.?........
	defb 00fh,03fh,004h,077h,033h,0bdh,07eh,0feh,0fdh,0e1h,000h,0f9h,0fdh,0feh,01eh,0fdh	; 9720  .?.w3.~.........
	defb 0fdh,0f9h,03eh,054h,028h,07dh,09bh,0e7h,0f8h,078h,0c0h,0d4h,0cah,0e4h,0f2h,054h	; 9730  ..>T(}...x.....T
	defb 06ah,095h,015h,02ah,015h,008h,001h,00bh,007h,00fh,0f3h,0e1h,0cdh,0deh,09eh,0bch	; 9740  j..*............
	defb 07ch,07ch,07eh,07ah,054h,028h,014h,07fh,03bh,09dh,0e1h,0cfh,0bfh,05fh,00fh,015h	; 9750  ||~zT(......._..
	defb 0aah,050h,0c0h,0f1h,0ffh,03eh,0ffh,0dfh,0efh,0f3h,03ch,03fh,087h,0c3h,0cbh,0d4h	; 9760  .P...>....<?....
	defb 0cah,09fh,0cah,0e0h,0feh,0f5h,0eah,0d5h,0aah,014h,005h,000h,002h,001h,000h,001h	; 9770  ................
	defb 000h,000h,0f3h,0a7h,04fh,01fh,0bfh,073h,0b1h,0ceh,052h,031h,00fh,01fh,09fh,0dfh	; 9780  ....O..s..R1....
	defb 0e7h,0f1h,0fbh,0c9h,0f2h,0e6h,0eeh,0e6h,0c8h,0dch,014h,0f8h,0e7h,0cfh,03fh,07fh	; 9790  ..............?.
	defb 0f9h,07eh,03eh,030h,084h,0deh,0dfh,00eh,07fh,055h,02ah,00fh,0e1h,0fch,07eh,0bfh	; 97a0  .~>0.....U*...~.
	defb 09eh,06bh,014h,0f7h,01eh,03ch,07fh,0bfh,09eh,0c0h,081h,0cfh,0ceh,09fh,09fh,05fh	; 97b0  .k...<........._
	defb 04fh,0a0h,098h,03fh,01ch,078h,0feh,0e1h,08ah,035h,00ah,080h,08ah,014h,028h,054h	; 97c0  O..?.x...5....(T
	defb 0a8h,040h,000h,001h,008h,006h,00bh,005h,003h,000h,0adh,053h,0abh,001h,08eh,0fdh	; 97d0  .@.........S....
	defb 0aah,014h,000h,02ah,055h,02ah,07fh,007h,010h,02ah,015h,0bfh,054h,0aah,054h,028h	; 97e0  ...*U*...*..T.T(
	defb 07eh,081h,02ah,07ch,0b8h,081h,08ah,015h,028h,050h,080h,03eh,081h,050h,029h,054h	; 97f0  ~.*|....(P.>.P)T
	defb 02ah,014h,000h,02ah,050h,0aah,054h,0a8h,007h,000h,002h,001h,082h,005h,028h,003h	; 9800  *..*P.T.......(.
	defb 000h,090h,009h,03ah,065h,09bh,0f4h,000h,000h,080h,070h,0c0h,098h,07ch,0fch,000h	; 9810  ...:e.....p..|..
	defb 00fh,003h,003h,000h,0afh,040h,060h,000h,080h,033h,066h,00eh,00dh,000h,000h,021h	; 9820  .....@`..3f....!
	defb 012h,061h,0d3h,0d6h,0d0h,000h,038h,03fh,0e0h,0cbh,01dh,006h,0c1h,072h,039h,0cbh	; 9830  .a....8?.....r9.
	defb 067h,017h,0efh,048h,087h,038h,09fh,0e0h,0d6h,0ach,058h,0b4h,02ch,0d8h,038h,001h	; 9840  g..H.8....X.,.8.
	defb 008h,006h,00bh,005h,003h,000h,095h,020h,00ch,086h,0e3h,078h,03eh,001h,000h,0c0h	; 9850  ....... ...x>...
	defb 01fh,063h,0bch,0cfh,0f2h,078h,000h,0f0h,0e0h,0c0h,000h,080h,003h,000h,086h,027h	; 9860  .c...x.........'
	defb 007h,001h,00eh,007h,001h,003h,000h,08ah,0e0h,0f0h,038h,0dch,0eeh,0f6h,07bh,00eh	; 9870  ..........8...{.
	defb 002h,003h,005h,000h,088h,0c0h,060h,010h,0c0h,040h,020h,010h,010h,000h	; 9880  ......`..@ ...

; ----------------------------------------------------------------------
; DATOS dibujos_988E: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 189, ficha 2 de la lista 0x6802 (p00:4540); lo leen p00:4DE1 (74
;   bytes)
;   0x988e..0x98d8  (74 bytes)
DATA_dibujos_988E:
	defb 0c8h,000h,01eh,07fh,054h,0aah,005h,00fh,0f0h,0b8h,0bfh,07fh,01fh,0bfh,073h,0b1h	; 988e  ....T.........s.
	defb 052h,015h,02ah,015h,008h,003h,005h,000h,004h,000h,01eh,07fh,054h,080h,0e0h,0f0h	; 989e  R.*.........T...
	defb 0e0h,004h,002h,005h,003h,001h,001h,000h,000h,0f8h,0e0h,0d0h,0e0h,0c0h,073h,0b1h	; 98ae  ..............s.
	defb 052h,015h,02ah,007h,00fh,013h,001h,000h,010h,000h,01eh,07fh,080h,0c0h,0e0h,0f0h	; 98be  R.*.............
	defb 080h,010h,008h,001h,013h,00fh,007h,000h,000h,000h	; 98ce  ..........

; ----------------------------------------------------------------------
; DATOS colores_98D8: rachas (p00:4D16) con los colores de los caracteres
;   desde el 82, ficha 0 de la lista 0x6802 (p00:4540); lo leen p00:4DE1 (170
;   bytes)
;   0x98d8..0x9982  (170 bytes)
DATA_colores_98D8:
	defb 006h,060h,002h,096h,017h,060h,081h,096h,006h,060h,002h,096h,00ah,060h,002h,096h	; 98d8  .`...`...`...`..
	defb 00dh,060h,003h,096h,002h,060h,003h,096h,00dh,060h,002h,096h,00bh,060h,006h,096h	; 98e8  .`...`...`...`..
	defb 012h,060h,004h,096h,009h,060h,003h,096h,005h,060h,008h,096h,003h,060h,003h,096h	; 98f8  .`...`...`...`..
	defb 009h,060h,081h,096h,00bh,060h,083h,066h,096h,096h,016h,060h,004h,096h,00ah,060h	; 9908  .`...`.f...`...`
	defb 004h,096h,004h,060h,003h,096h,003h,060h,081h,096h,00fh,060h,003h,096h,004h,060h	; 9918  ...`...`...`...`
	defb 081h,096h,018h,060h,005h,096h,007h,060h,004h,096h,002h,060h,087h,066h,096h,096h	; 9928  ...`...`...`.f..
	defb 090h,060h,060h,096h,02eh,060h,081h,096h,00ch,060h,004h,096h,005h,060h,003h,096h	; 9938  .``..`...`...`..
	defb 083h,060h,096h,096h,00eh,060h,002h,096h,01dh,060h,003h,096h,006h,060h,004h,096h	; 9948  .`...`...`...`..
	defb 023h,060h,005h,090h,003h,060h,004h,090h,082h,060h,090h,01ch,060h,002h,090h,004h	; 9958  #`...`...`..`...
	defb 060h,081h,090h,003h,060h,083h,090h,060h,090h,011h,060h,002h,090h,00ch,060h,081h	; 9968  `...`..`..`...`.
	defb 090h,003h,060h,083h,090h,060h,090h,023h,060h,000h	; 9978  ..`..`.#`.

; ----------------------------------------------------------------------
; DATOS colores_9982: rachas (p00:4D16) con los colores de los caracteres
;   desde el 189, ficha 2 de la lista 0x6802 (p00:4540); lo leen p00:4DE1 (37
;   bytes)
;   0x9982..0x99a7  (37 bytes)
DATA_colores_9982:
	defb 003h,060h,003h,096h,083h,060h,0f0h,0f6h,00bh,060h,004h,0f0h,003h,060h,081h,096h	; 9982  .`...`...`...`..
	defb 004h,0f6h,005h,0f0h,083h,060h,0f0h,0f0h,005h,0f6h,005h,060h,006h,0f0h,003h,060h	; 9992  .....`.....`...`
	defb 005h,0f6h,008h,0f0h,000h	; 99a2

; ----------------------------------------------------------------------
; DATOS dibujos_99A7: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 82, ficha 2 de la lista 0x6853 (p00:4540); lo leen p00:4DE1,
;   p00:5CD5 (258 bytes)
;   0x99a7..0x9aa9  (258 bytes)
DATA_dibujos_99A7:
	defb 004h,000h,002h,080h,082h,070h,078h,006h,000h,08ah,006h,081h,000h,000h,001h,002h	; 99a7  .....px.........
	defb 00eh,03ch,000h,080h,004h,000h,003h,094h,086h,080h,006h,000h,00eh,040h,03fh,003h	; 99b7  .<...........@?.
	defb 0ffh,08ah,080h,081h,07ch,006h,0fch,0ffh,000h,06ch,0c0h,080h,003h,000h,083h,00bh	; 99c7  ....|....l......
	defb 03bh,07bh,003h,000h,088h,040h,01eh,051h,01eh,051h,040h,020h,010h,005h,018h,098h	; 99d7  .{...@.Q.Q@ ....
	defb 0c0h,030h,007h,077h,007h,007h,070h,002h,008h,008h,00ch,00fh,0f0h,0f0h,0a8h,057h	; 99e7  .0.w..p........W
	defb 000h,000h,060h,078h,000h,0d8h,0dah,0d8h,005h,000h,093h,001h,003h,006h,000h,030h	; 99f7  ..`x...........0
	defb 070h,033h,0d7h,0eeh,037h,0f7h,0c0h,060h,03fh,0c0h,0c7h,040h,0c7h,0c0h,003h,0ffh	; 9a07  p3..7..`?..@....
	defb 005h,07fh,081h,000h,004h,06ch,093h,000h,0ffh,0e0h,07bh,00bh,000h,080h,0f0h,0d7h	; 9a17  .....l....{.....
	defb 0d7h,00fh,01eh,051h,01eh,040h,000h,040h,000h,0ffh,003h,000h,095h,0bfh,07fh,000h	; 9a27  ...Q.@.@........
	defb 0ffh,0ffh,000h,060h,018h,006h,001h,001h,0fbh,0c0h,057h,000h,000h,007h,0f8h,0f1h	; 9a37  ...`......W.....
	defb 0e0h,0e0h,003h,008h,086h,0c8h,0e7h,070h,01dh,000h,0c0h,005h,000h,0b6h,0f0h,000h	; 9a47  .......p........
	defb 007h,003h,019h,01ch,03eh,03eh,07eh,0c6h,0e3h,0c3h,083h,00ch,003h,01ch,0f3h,03eh	; 9a57  ....>>~........>
	defb 0c3h,0e0h,0ffh,000h,0ffh,0ffh,07fh,07dh,0e0h,018h,0cfh,007h,0f0h,0f7h,0f7h,057h	; 9a67  .......}.......W
	defb 0e0h,0c0h,003h,00fh,01fh,01fh,03fh,03fh,008h,007h,0c0h,0f0h,0f8h,0f8h,0fch,0fch	; 9a77  ......??........
	defb 0feh,0f8h,004h,003h,004h,054h,088h,001h,000h,003h,0e0h,0e3h,0e0h,0e3h,0e3h,003h	; 9a87  .....T..........
	defb 021h,003h,020h,002h,0a0h,003h,080h,085h,0c1h,0a0h,092h,082h,082h,003h,002h,005h	; 9a97  !. .............
	defb 03ch,000h	; 9aa7

; ----------------------------------------------------------------------
; DATOS dibujos_9AA9: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 117, ficha 4 de la lista 0x6853 (p00:4540); lo leen p00:4DE1,
;   p00:5CD5 (28 bytes)
;   0x9aa9..0x9ac5  (28 bytes)
DATA_dibujos_9AA9:
	defb 005h,000h,002h,001h,08bh,006h,000h,010h,034h,073h,0d7h,0aeh,0d7h,0e7h,003h,001h	; 9aa9  ........4s......
	defb 006h,000h,088h,073h,0a3h,083h,00ch,003h,01ch,0f3h,03eh,000h	; 9ab9  ...s......>.

; ----------------------------------------------------------------------
; DATOS dibujos_9AC5: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 121, ficha 5 de la lista 0x6853 (p00:4540); lo leen p00:4DE1,
;   p00:5CD5 (18 bytes)
;   0x9ac5..0x9ad7  (18 bytes)
DATA_dibujos_9AC5:
	defb 090h,000h,004h,00eh,0a7h,0e7h,038h,011h,011h,080h,001h,014h,021h,000h,050h,014h	; 9ac5  ......8.....!.P.
	defb 000h,000h	; 9ad5

; ----------------------------------------------------------------------
; DATOS colores_9AD7: rachas (p00:4D16) con los colores de los caracteres
;   desde el 82, ficha 2 de la lista 0x6853 (p00:4540); lo leen p00:4DE1,
;   p00:5CD5 (235 bytes)
;   0x9ad7..0x9bc2  (235 bytes)
DATA_colores_9AD7:
	defb 006h,060h,002h,040h,008h,060h,005h,040h,083h,050h,060h,064h,005h,060h,003h,064h	; 9ad7  .`.@.`.@.P`d.`.d
	defb 003h,040h,002h,060h,002h,040h,087h,050h,065h,065h,076h,060h,060h,040h,007h,060h	; 9ae7  .@.`.@.Peev``@.`
	defb 083h,040h,050h,070h,005h,040h,092h,050h,070h,070h,060h,060h,064h,064h,065h,060h	; 9af7  .@Pp.@.Ppp``dde`
	defb 065h,060h,040h,050h,040h,040h,050h,054h,0a5h,003h,060h,086h,064h,065h,076h,054h	; 9b07  e`@P@@PT..`.devT
	defb 065h,076h,003h,040h,085h,070h,040h,040h,054h,070h,007h,040h,084h,050h,060h,0a0h	; 9b17  ev.@.p@@Tp.@.P`.
	defb 060h,003h,040h,002h,050h,002h,065h,081h,064h,005h,040h,083h,050h,070h,050h,005h	; 9b27  `.@.P.e.d.@.PpP.
	defb 076h,003h,060h,086h,090h,0a0h,070h,070h,075h,050h,003h,040h,086h,050h,070h,070h	; 9b37  v.`...ppuP.@.Ppp
	defb 075h,070h,050h,005h,040h,004h,070h,081h,040h,004h,070h,003h,060h,085h,064h,065h	; 9b47  upP.@.p.@.p.`.de
	defb 060h,065h,076h,003h,040h,08dh,064h,050h,050h,070h,074h,065h,060h,064h,065h,076h	; 9b57  `ev.@.dPPpte`dev
	defb 065h,040h,040h,006h,050h,081h,040h,003h,050h,002h,040h,002h,050h,082h,070h,060h	; 9b67  e@@.P.@.P.@.P.p`
	defb 003h,070h,002h,060h,083h,040h,065h,070h,005h,040h,084h,050h,075h,070h,065h,004h	; 9b77  .p.`.@ep.@.Pupe.
	defb 040h,08bh,050h,070h,070h,050h,040h,080h,080h,090h,090h,0a0h,0f0h,003h,060h,086h	; 9b87  @.PppP@.......`.
	defb 080h,090h,090h,0a0h,0f0h,050h,003h,060h,002h,040h,092h,050h,074h,040h,040h,050h	; 9b97  .....P.`.@.Pt@@P
	defb 040h,050h,070h,076h,076h,060h,060h,064h,064h,095h,095h,0a7h,0a7h,006h,060h,082h	; 9ba7  @Ppvv``dd.....`.
	defb 064h,065h,003h,060h,085h,040h,074h,040h,074h,040h,000h	; 9bb7  de.`.@t@t@.

; ----------------------------------------------------------------------
; DATOS colores_9BC2: rachas (p00:4D16) con los colores de los caracteres
;   desde el 117, ficha 4 de la lista 0x6853 (p00:4540); lo leen p00:4DE1,
;   p00:5CD5 (25 bytes)
;   0x9bc2..0x9bdb  (25 bytes)
DATA_colores_9BC2:
	defb 006h,040h,084h,050h,060h,040h,090h,004h,040h,002h,050h,002h,060h,006h,050h,088h	; 9bc2  .@.P`@..@.P.`.P.
	defb 070h,050h,050h,060h,060h,040h,065h,070h,000h	; 9bd2  pPP``@ep.

; ----------------------------------------------------------------------
; DATOS colores_9BDB: rachas (p00:4D16) con los colores de los caracteres
;   desde el 121, ficha 5 de la lista 0x6853 (p00:4540); lo leen p00:4DE1,
;   p00:5CD5 (13 bytes)
;   0x9bdb..0x9be8  (13 bytes)
DATA_colores_9BDB:
	defb 007h,040h,083h,050h,060h,060h,003h,040h,083h,060h,040h,040h,000h	; 9bdb  .@.P``.@.`@@.

; ----------------------------------------------------------------------
; DATOS dibujos_9BE8: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 82, ficha 0 de la lista 0x6815 (p00:4540); lo leen p00:4DE1 (228
;   bytes)
;   0x9be8..0x9ccc  (228 bytes)
DATA_dibujos_9BE8:
	defb 085h,040h,020h,010h,000h,004h,004h,000h,09ah,040h,060h,020h,040h,060h,020h,080h	; 9be8  .@ ......@` @` .
	defb 000h,04fh,06fh,020h,040h,060h,020h,080h,000h,04fh,06fh,020h,040h,06fh,02fh,080h	; 9bf8  .Oo @` ..Oo @o/.
	defb 01fh,000h,01fh,003h,05fh,08eh,01fh,010h,0f0h,000h,0f0h,0f0h,0f6h,0f0h,0f6h,020h	; 9c08  ...._..........
	defb 000h,000h,010h,010h,004h,054h,0e2h,001h,007h,080h,083h,00bh,09bh,0ddh,0dbh,007h	; 9c18  .....T..........
	defb 080h,047h,027h,017h,008h,003h,000h,09ch,018h,0d2h,0c4h,0cbh,016h,02ch,018h,054h	; 9c28  .G'..........,.T
	defb 054h,050h,010h,006h,00ch,01ch,038h,0dbh,0cbh,0ebh,0ebh,0efh,0efh,0c7h,0c3h,000h	; 9c38  TP....8.........
	defb 03dh,07ah,075h,050h,023h,027h,00fh,018h,0fch,0a8h,054h,008h,014h,088h,0c0h,080h	; 9c48  =zuP#'....T.....
	defb 080h,0a2h,0ffh,0ffh,0f3h,0f3h,0ffh,00fh,038h,060h,0c0h,080h,001h,006h,00fh,00fh	; 9c58  ........8`......
	defb 027h,023h,050h,04ch,07fh,03fh,000h,0c0h,088h,014h,028h,054h,0e8h,0f4h,018h,050h	; 9c68  '#PL.?....(T...P
	defb 066h,06eh,06ch,069h,063h,047h,00eh,01fh,01fh,004h,03fh,002h,01fh,09bh,05ch,06eh	; 9c78  fnlicG....?...\n
	defb 077h,07bh,071h,060h,044h,022h,00fh,006h,001h,0e0h,034h,000h,034h,003h,007h,00ch	; 9c88  w{q`D"....4.4...
	defb 017h,00ch,017h,00ch,017h,00ch,091h,089h,09ch,003h,0bdh,085h,0bch,080h,0feh,038h	; 9c98  ...............8
	defb 006h,005h,056h,098h,00dh,00eh,007h,007h,003h,003h,001h,001h,006h,001h,0c4h,0feh	; 9ca8  ..V.............
	defb 056h,056h,000h,0fch,060h,0e0h,000h,0e0h,000h,040h,000h,040h,003h,004h,003h,001h	; 9cb8  VV..`....@.@....
	defb 082h,000h,002h,000h	; 9cc8

; ----------------------------------------------------------------------
; DATOS dibujos_9CCC: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 111, ficha 1 de la lista 0x6815 (p00:4540); lo leen p00:4DE1 (10
;   bytes)
;   0x9ccc..0x9cd6  (10 bytes)
DATA_dibujos_9CCC:
	defb 088h,03ch,07eh,0e7h,0dbh,0dbh,0e7h,07eh,03ch,000h	; 9ccc  .<~....~<.

; ----------------------------------------------------------------------
; DATOS colores_9CD6: rachas (p00:4D16) con los colores de los caracteres
;   desde el 82, ficha 0 de la lista 0x6815 (p00:4540); lo leen p00:4DE1 (193
;   bytes)
;   0x9cd6..0x9d97  (193 bytes)
DATA_colores_9CD6:
	defb 081h,050h,003h,040h,081h,050h,003h,040h,097h,010h,070h,0e0h,040h,040h,070h,0e0h	; 9cd6  .P.@.P.@..p.@@p.
	defb 040h,010h,070h,0e0h,040h,040h,070h,0e0h,040h,070h,070h,0e0h,040h,040h,070h,0e0h	; 9ce6  @.p.@@p.@pp.@@p.
	defb 004h,040h,083h,050h,070h,050h,005h,040h,085h,050h,070h,050h,040h,040h,005h,060h	; 9cf6  .@.PpP.@.PpP@@.`
	defb 083h,090h,0a0h,0a0h,003h,040h,083h,050h,070h,050h,003h,040h,081h,060h,004h,040h	; 9d06  .....@.PpP.@.`.@
	defb 081h,050h,009h,040h,081h,090h,003h,060h,005h,040h,08ah,050h,040h,050h,050h,070h	; 9d16  .P.@...`.@.P@PPp
	defb 0a0h,090h,040h,070h,050h,003h,040h,085h,020h,030h,040h,050h,050h,003h,040h,08ch	; 9d26  ..@pP.@. 0@PP.@.
	defb 020h,030h,060h,060h,054h,050h,050h,076h,074h,050h,0a0h,0a0h,004h,0e0h,084h,0a0h	; 9d36   0``TPPvtP......
	defb 090h,030h,020h,006h,040h,082h,030h,020h,006h,040h,081h,060h,005h,040h,082h,050h	; 9d46  .0 .@.0 .@.`.@.P
	defb 070h,008h,060h,008h,040h,090h,090h,0a0h,0e0h,050h,040h,040h,060h,090h,040h,060h	; 9d56  p.`.@....P@@`.@`
	defb 040h,060h,040h,060h,040h,060h,003h,040h,087h,050h,070h,050h,040h,040h,054h,064h	; 9d66  @`@`@`.@.PpP@@Td
	defb 006h,050h,004h,040h,088h,0d0h,040h,0d0h,0d0h,060h,060h,050h,050h,003h,040h,002h	; 9d76  .P.@..@..``PP.@.
	defb 060h,081h,090h,003h,060h,083h,090h,060h,090h,003h,020h,003h,070h,082h,010h,070h	; 9d86  `...`..`.. .p..p
	defb 000h	; 9d96

; ----------------------------------------------------------------------
; DATOS colores_9D97: rachas (p00:4D16) con los colores de los caracteres
;   desde el 111, ficha 1 de la lista 0x6815 (p00:4540); lo leen p00:4DE1 (10
;   bytes)
;   0x9d97..0x9da1  (10 bytes)
DATA_colores_9D97:
	defb 088h,040h,050h,040h,050h,050h,070h,070h,0f0h,000h	; 9d97  .@P@PPpp..

; ----------------------------------------------------------------------
; DATOS dibujos_9DA1: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 82, ficha 0 de la lista 0x687E (p00:4540); lo leen p00:4DE1 (85
;   bytes)
;   0x9da1..0x9df6  (85 bytes)
DATA_dibujos_9DA1:
	defb 090h,000h,080h,040h,020h,010h,008h,004h,002h,040h,020h,020h,010h,010h,008h,004h	; 9da1  ...@ ....@  ....
	defb 002h,005h,000h,08bh,003h,01ch,060h,000h,000h,001h,002h,004h,004h,008h,010h,003h	; 9db1  ......`.........
	defb 000h,089h,003h,004h,008h,010h,020h,002h,000h,000h,004h,003h,008h,084h,010h,030h	; 9dc1  ...... ........0
	defb 00ch,003h,006h,000h,091h,080h,040h,030h,00ch,002h,001h,000h,004h,004h,002h,002h	; 9dd1  ......@0........
	defb 001h,001h,000h,000h,010h,010h,003h,008h,08bh,004h,000h,004h,000h,000h,080h,070h	; 9de1  ...............p
	defb 00eh,001h,000h,000h,000h	; 9df1

; ----------------------------------------------------------------------
; DATOS dibujos_9DF6: rachas (p00:4D16) con los dibujos de los caracteres
;   desde el 144, ficha 1 de la lista 0x687E (p00:4540); lo leen p00:4DE1 (304
;   bytes)
;   0x9df6..0x9f26  (304 bytes)
DATA_dibujos_9DF6:
	defb 089h,0f8h,0e0h,0c0h,081h,003h,001h,000h,001h,007h,003h,00fh,094h,08fh,0c7h,0e1h	; 9df6  ................
	defb 0f8h,080h,070h,00ch,02fh,005h,038h,0e0h,05bh,06ch,082h,010h,00ch,030h,040h,040h	; 9e06  ..p./.8.[l...0@@
	defb 080h,006h,000h,089h,080h,07fh,031h,042h,080h,000h,010h,020h,040h,005h,000h,084h	; 9e16  ......1B... @...
	defb 03fh,0c0h,018h,060h,003h,000h,082h,07fh,080h,003h,000h,090h,001h,006h,018h,061h	; 9e26  ?..`...........a
	defb 084h,000h,020h,040h,020h,020h,040h,040h,080h,080h,000h,000h,003h,010h,005h,020h	; 9e36  .. @  @@.......
	defb 008h,040h,095h,001h,002h,058h,000h,000h,0e0h,01fh,000h,040h,087h,01fh,03eh,03eh	; 9e46  .@...X.....@..>>
	defb 07ch,078h,060h,000h,000h,030h,060h,040h,006h,000h,0cdh,004h,000h,01ah,024h,015h	; 9e56  |x`..0`@......$.
	defb 04fh,027h,0adh,0f7h,002h,0bfh,0ffh,019h,050h,000h,025h,084h,03ah,0c1h,017h,010h	; 9e66  O'......P.%.:...
	defb 0bah,0fdh,07fh,0e9h,0dfh,01fh,0edh,0ffh,090h,042h,019h,005h,097h,00bh,057h,01bh	; 9e76  .........B....W.
	defb 031h,01fh,007h,027h,09fh,00bh,03fh,01fh,03fh,007h,003h,029h,00fh,001h,006h,001h	; 9e86  1..'..?.?..)....
	defb 05fh,088h,005h,00eh,08fh,05bh,0f6h,079h,02fh,01dh,07bh,0c0h,060h,030h,030h,018h	; 9e96  _....[.y/.{.`00.
	defb 0cch,0bbh,0b6h,04bh,019h,00eh,0c3h,027h,006h,020h,002h,010h,0aah,001h,09fh,001h	; 9ea6  ...K...'. ......
	defb 037h,08fh,003h,02fh,003h,007h,081h,067h,03bh,0dfh,067h,021h,01bh,007h,03ch,0e0h	; 9eb6  7../...g..g!..<.
	defb 006h,02bh,00fh,001h,016h,001h,002h,0a5h,063h,010h,007h,020h,060h,0c0h,0c0h,060h	; 9ec6  .+......c.. `..`
	defb 020h,020h,001h,018h,00ch,018h,046h,003h,030h,0a9h,007h,018h,0c7h,0c0h,030h,008h	; 9ed6    ....F.0.....0.
	defb 00ch,00ch,004h,006h,003h,000h,001h,002h,002h,004h,018h,026h,0e1h,080h,040h,020h	; 9ee6  ...........&..@
	defb 0a0h,0e0h,030h,0f8h,00fh,004h,004h,002h,002h,00ch,030h,040h,080h,0c0h,060h,018h	; 9ef6  ..0.......0@..`.
	defb 00fh,002h,004h,003h,008h,08fh,004h,002h,081h,060h,01ch,003h,000h,001h,002h,00ch	; 9f06  .........`......
	defb 010h,020h,040h,040h,080h,003h,040h,002h,080h,002h,040h,081h,031h,008h,000h,000h	; 9f16  . @@..@...@.1...

; ----------------------------------------------------------------------
; DATOS colores_9F26: rachas (p00:4D16) con los colores de los caracteres
;   desde el 82, ficha 0 de la lista 0x687E (p00:4540); lo leen p00:4DE1 (40
;   bytes)
;   0x9f26..0x9f4e  (40 bytes)
DATA_colores_9F26:
	defb 002h,091h,081h,081h,00dh,091h,013h,0f1h,083h,0b1h,0a1h,0a1h,007h,0f1h,085h,0a1h	; 9f26  ................
	defb 0f1h,0a1h,091h,081h,00eh,091h,002h,0a1h,006h,091h,088h,0a1h,091h,0a1h,091h,091h	; 9f36  ................
	defb 0a1h,091h,091h,006h,081h,002h,080h,000h	; 9f46  ........

; ----------------------------------------------------------------------
; DATOS colores_9F4E: rachas (p00:4D16) con los colores de los caracteres
;   desde el 144, ficha 1 de la lista 0x687E (p00:4540) (sigue en el banco 9,
;   en 0xA000); lo leen p00:4DE1 (178 bytes)
;   0x9f4e..0xa000  (178 bytes)
DATA_colores_9F4E:
	defb 004h,0b1h,082h,0f1h,051h,003h,041h,08eh,051h,071h,0f1h,0f1h,0b1h,0b1h,0a1h,0cah	; 9f4e  ....Q.A.Qq......
	defb 0cah,0c9h,098h,098h,0c8h,0c8h,004h,061h,002h,0c1h,083h,021h,0c1h,021h,008h,081h	; 9f5e  .......a...!.!..
	defb 002h,0f1h,082h,0a1h,011h,003h,0b1h,081h,011h,019h,0f1h,017h,0a1h,002h,021h,081h	; 9f6e  ..............!.
	defb 0c1h,005h,081h,08ch,0f1h,0a1h,0b1h,0f1h,0f1h,0b1h,0a1h,091h,011h,011h,0b1h,0f1h	; 9f7e  ................
	defb 004h,0a1h,00ch,061h,083h,096h,081h,088h,008h,098h,006h,0a9h,003h,0bah,003h,061h	; 9f8e  ...a...........a
	defb 081h,081h,006h,061h,003h,081h,081h,096h,003h,061h,088h,091h,081h,061h,081h,081h	; 9f9e  ...a.....a...a..
	defb 061h,061h,098h,003h,0a9h,081h,0b9h,006h,0a9h,004h,0cah,002h,0cbh,083h,0b2h,0cbh	; 9fae  aa..............
	defb 0cah,003h,0a9h,081h,096h,003h,0a1h,081h,091h,003h,0a1h,083h,091h,0a9h,098h,004h	; 9fbe  ................
	defb 0a9h,008h,098h,002h,0a9h,086h,0c6h,0c8h,0c6h,081h,061h,061h,004h,0c1h,002h,061h	; 9fce  ..........aa...a
	defb 084h,0c1h,061h,0c6h,0c6h,005h,0c8h,08bh,098h,0c8h,0c8h,0cah,0bah,0cbh,0cbh,0cah	; 9fde  ..a.............
	defb 0bah,0cah,0a2h,003h,021h,01ah,0c1h,009h,021h,081h,0c1h,006h,021h,005h,0c1h,002h	; 9fee  ....!...!...!...
	defb 021h,004h	; 9ffe
