; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 15 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS destinos_jp: 3 direcciones de la VRAM, de 0xE6D1 = 2 a 4 (p01:7B39:
;   0x9FFC + 2 x B, version japonesa); lo leen p01:7B42 (6 bytes)
;   0xa000..0xa006  (6 bytes)
DATA_destinos_jp:
	defw 0398bh,03990h,0398dh	; a000

; ----------------------------------------------------------------------
; DATOS cifras_jp: 4 fichas de 6 bytes, de las que la version japonesa copia 3
;   (p01:7B58: 0xA006 + 6 x 0xE309[B], LDIRVM de 3); lo leen p01:7B6D (24
;   bytes)
;   0xa006..0xa01e  (24 bytes)
DATA_cifras_jp:
	defb 0b3h,042h,000h,000h,000h,000h	; a006
	defb 0b4h,042h,000h,000h,000h,000h	; a00c
	defb 0b5h,0b6h,050h,000h,000h,000h	; a012
	defb 0f7h,050h,000h,000h,000h,000h	; a018

; ----------------------------------------------------------------------
; DATOS destinos_en: 3 direcciones de la VRAM, de 0xE6D1 = 2 a 4 (p01:7B3E:
;   0xA01A + 2 x B, version inglesa); las dos palabras de delante son la
;   ultima ficha japonesa; lo leen p01:7B42 (6 bytes)
;   0xa01e..0xa024  (6 bytes)
DATA_destinos_en:
	defw 039c9h,039cfh,03a0ch	; a01e

; ----------------------------------------------------------------------
; DATOS cifras_en: 4 fichas de 6 letras que copia la version inglesa
;   (p01:7B5D: 0xA024 + 6 x 0xE309[B], LDIRVM de 6); lo leen p01:7B6D (24
;   bytes)
;   0xa024..0xa03c  (24 bytes)
DATA_cifras_en:
	defb 000h,019h,023h,02ch,01ch,000h	; a024
	defb 02eh,01fh,020h,02bh,01ch,000h	; a02a
	defb 030h,01ch,023h,023h,026h,02eh	; a030
	defb 01eh,029h,01ch,01ch,025h,000h	; a036

; ----------------------------------------------------------------------
; DATOS rachas3_A03C: rachas a la VRAM en los tres tercios (p00:4CE5 ->
;   p00:4D16); lo leen p10:80C7 (1081 bytes)
;   0xa03c..0xa475  (1081 bytes)
DATA_rachas3_A03C:
	defb 004h,000h,084h,00fh,01fh,01fh,00fh,004h,000h,084h,080h,0c0h,0f0h,0f8h,003h,000h	; a03c  ................
	defb 0adh,060h,078h,07ah,07ah,074h,000h,007h,00fh,00fh,00eh,00eh,007h,007h,000h,0c0h	; a04c  .`xzzt..........
	defb 03ah,003h,0fdh,081h,003h,0ffh,000h,000h,0ffh,0c1h,0beh,0a0h,081h,0ffh,000h,000h	; a05c  :...............
	defb 0ffh,0e0h,0efh,0d0h,0c0h,0ffh,000h,000h,0f0h,078h,0bah,03ah,074h,0e8h,003h,000h	; a06c  .........x.:t...
	defb 003h,001h,004h,000h,08dh,0e6h,0e0h,0efh,0e8h,0ffh,0f0h,000h,000h,0ffh,000h,0ffh	; a07c  ................
	defb 000h,0ffh,003h,000h,086h,0feh,01eh,0ceh,01eh,0fdh,03dh,004h,000h,087h,001h,003h	; a08c  ..........=.....
	defb 003h,001h,000h,000h,040h,005h,0d0h,002h,000h,088h,020h,038h,03ch,03dh,01ah,01ah	; a09c  ....@..... 8<=..
	defb 000h,007h,004h,000h,085h,03eh,07fh,074h,088h,070h,003h,001h,082h,000h,080h,003h	; a0ac  .....>.t.p......
	defb 000h,085h,0c0h,0e0h,0f0h,0fah,004h,003h,074h,005h,068h,004h,000h,002h,060h,0a7h	; a0bc  ........t.h...`.
	defb 070h,0f0h,007h,003h,001h,001h,003h,00eh,03dh,07ah,0ffh,0c0h,0bfh,0c0h,0a0h,048h	; a0cc  p.......=z.....H
	defb 08ch,00eh,0ffh,000h,0ffh,000h,000h,003h,01eh,07dh,0ffh,000h,0ffh,000h,083h,0a3h	; a0dc  .........}......
	defb 043h,083h,0e8h,0d0h,020h,0c0h,000h,003h,040h,006h,000h,09ah,007h,00fh,0f7h,07ah	; a0ec  C... ...@......z
	defb 07fh,078h,003h,03ch,080h,068h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,0dah,03ah	; a0fc  .x.<.h.........:
	defb 0fah,034h,088h,070h,003h,0ffh,006h,000h,082h,080h,0c0h,003h,001h,085h,0e1h,0ffh	; a10c  .4.p............
	defb 0f1h,0edh,069h,003h,0d0h,092h,0e3h,0ffh,0ffh,0c6h,0dah,030h,03fh,03fh,01eh,01dh	; a11c  ..i........0??..
	defb 01ah,09ah,09ah,038h,0ffh,0ffh,000h,0ffh,003h,000h,085h,01ch,0ffh,0ffh,007h,0fbh	; a12c  ...8............
	defb 003h,003h,002h,000h,006h,040h,084h,07fh,001h,03eh,001h,004h,000h,089h,0e0h,0e8h	; a13c  .....@...>......
	defb 010h,0e0h,000h,000h,005h,01dh,078h,007h,000h,002h,068h,08dh,069h,02bh,013h,027h	; a14c  ......x...h.i+.'
	defb 00eh,03dh,0fch,0feh,0cfh,0b7h,043h,041h,080h,003h,000h,0aeh,0c0h,0f8h,0f4h,0e8h	; a15c  .=....CA........
	defb 010h,0e0h,07ch,03fh,00fh,017h,00eh,01dh,03dh,07eh,01fh,0f8h,0e7h,098h,060h,086h	; a16c  ..|?....=~....`.
	defb 007h,00fh,0feh,0dfh,02eh,0cdh,00dh,00eh,00fh,04eh,007h,0ffh,007h,0fbh,003h,007h	; a17c  .........N......
	defb 0ffh,007h,030h,0f8h,082h,07ch,040h,000h,0fch,000h,003h,00fh,002h,007h,0a8h,000h	; a18c  ..0..|@.........
	defb 003h,000h,081h,0bdh,0c3h,0ffh,0c0h,01fh,0e0h,007h,0c3h,0bdh,081h,0ffh,000h,0ffh	; a19c  ................
	defb 000h,0f0h,083h,0bdh,083h,0ffh,006h,0f8h,003h,000h,0d0h,0d0h,0a0h,0a0h,040h,080h	; a1ac  ..............@.
	defb 000h,000h,075h,075h,079h,03fh,031h,003h,001h,002h,0d2h,08bh,0c7h,0ffh,0c6h,0d9h	; a1bc  ..uuy?1.........
	defb 0d6h,0d0h,0bah,0bah,01ah,00ah,084h,005h,000h,08eh,0c1h,0f7h,0ffh,0e0h,0efh,0e8h	; a1cc  ................
	defb 041h,0c1h,0e9h,0e8h,088h,070h,080h,000h,003h,040h,081h,080h,004h,000h,081h,00fh	; a1dc  A....p...@......
	defb 004h,01fh,0dbh,000h,00fh,000h,0fdh,0fah,0f4h,0e8h,090h,060h,081h,007h,000h,000h	; a1ec  ...........`....
	defb 003h,007h,01fh,07eh,0f9h,0f6h,07ah,0f4h,0e8h,090h,060h,080h,000h,000h,07fh,007h	; a1fc  ...~..z...`.....
	defb 03bh,001h,000h,00ah,01ah,074h,01fh,0f8h,0f7h,0e8h,0e8h,0ebh,0ebh,0e9h,04dh,085h	; a20c  .....t........M.
	defb 006h,007h,007h,006h,0c6h,0d7h,0fbh,003h,007h,0ffh,007h,0fbh,083h,006h,0f8h,000h	; a21c  ................
	defb 000h,0f0h,000h,070h,040h,040h,01fh,00fh,000h,007h,070h,01fh,000h,00fh,0ffh,003h	; a22c  ...p@@....p.....
	defb 0fdh,001h,003h,0c6h,0ffh,03fh,080h,0c0h,0d0h,0a0h,040h,080h,000h,080h,004h,001h	; a23c  .....?....@.....
	defb 08ch,003h,01fh,07fh,0f8h,0d0h,0d0h,0d7h,0c3h,0e7h,0ffh,003h,0fdh,003h,000h,081h	; a24c  ................
	defb 080h,004h,0a0h,002h,0e8h,002h,068h,084h,070h,030h,038h,01eh,003h,000h,099h,004h	; a25c  ......h.p08.....
	defb 00dh,01dh,03dh,07dh,000h,000h,007h,00fh,007h,001h,002h,001h,01fh,0ffh,0ffh,0fch	; a26c  ..=}............
	defb 0fbh,0e4h,018h,0e0h,0e8h,090h,060h,080h,004h,000h,002h,003h,081h,001h,005h,000h	; a27c  ......`.........
	defb 085h,0f4h,0e8h,0d1h,021h,0c1h,003h,000h,006h,0e8h,08fh,010h,060h,0d7h,027h,0c7h	; a28c  ....!.......`.'.
	defb 00fh,00eh,01eh,01eh,00eh,0ffh,080h,07dh,043h,083h,003h,080h,081h,0c0h,003h,0ffh	; a29c  .......}C.......
	defb 08ah,007h,078h,007h,000h,000h,080h,0d0h,0a0h,040h,080h,004h,000h,092h,070h,07fh	; a2ac  ..x......@....p.
	defb 07fh,03ch,003h,01ch,000h,007h,07eh,0f1h,08eh,070h,080h,000h,0f0h,0cfh,030h,0c0h	; a2bc  .<....~..p....0.
	defb 004h,000h,086h,0e0h,038h,0dfh,00fh,003h,001h,005h,000h,086h,0e0h,0fch,0ffh,07fh	; a2cc  ....8...........
	defb 038h,001h,004h,000h,086h,0d0h,020h,0c0h,0c7h,038h,0c0h,005h,000h,002h,0a0h,081h	; a2dc  8..... ..8......
	defb 040h,005h,000h,084h,00fh,003h,004h,001h,004h,000h,002h,0ffh,086h,07fh,087h,078h	; a2ec  @..............x
	defb 007h,000h,000h,004h,0fdh,083h,0fah,004h,0f8h,003h,000h,085h,028h,07ch,028h,008h	; a2fc  ............(|(.
	defb 030h,003h,000h,088h,00fh,000h,00fh,001h,00eh,000h,011h,00eh,008h,000h,088h,0f8h	; a30c  0...............
	defb 008h,050h,020h,010h,000h,007h,018h,008h,000h,08fh,064h,004h,004h,008h,070h,000h	; a31c  .P .......d...p.
	defb 000h,005h,010h,01eh,02ah,006h,01ch,000h,0ffh,007h,000h,083h,0ffh,000h,03eh,005h	; a32c  ....*.........>.
	defb 008h,085h,0ffh,000h,088h,0d8h,0a8h,003h,088h,002h,000h,0a2h,01fh,060h,09fh,0beh	; a33c  .............`..
	defb 0beh,05fh,000h,000h,0feh,002h,0fah,002h,0feh,040h,000h,000h,01fh,020h,02fh,05fh	; a34c  ._.......@... /_
	defb 05fh,0bbh,000h,000h,00fh,088h,08bh,04bh,04bh,0abh,000h,000h,0e0h,020h,004h,0a0h	; a35c  _......KK.... ..
	defb 002h,000h,0e6h,003h,004h,005h,00bh,00bh,017h,000h,000h,0e1h,011h,0d1h,0e9h,0e9h	; a36c  ................
	defb 075h,000h,000h,0f0h,008h,074h,07ah,07dh,07eh,000h,000h,00fh,010h,02fh,05fh,0bfh	; a37c  u....tz}~..../_.
	defb 07fh,000h,000h,0c3h,044h,045h,04bh,04bh,057h,000h,000h,0fch,006h,07bh,07dh,07eh	; a38c  ....DEKKW....{}~
	defb 07fh,000h,000h,03fh,021h,02dh,0adh,0edh,06dh,000h,000h,07fh,040h,05fh,05fh,05ch	; a39c  ...?!-..m...@__\
	defb 05dh,000h,000h,0f8h,006h,0f9h,0feh,01eh,0efh,000h,000h,03fh,020h,02fh,0afh,0aeh	; a3ac  ]..........? /..
	defb 06eh,000h,000h,0ffh,000h,0feh,0feh,000h,0ffh,000h,000h,0bfh,0a0h,0afh,0aeh,0aeh	; a3bc  n...............
	defb 02eh,000h,000h,0feh,001h,0feh,00fh,0f7h,08bh,004h,000h,081h,080h,003h,040h,0a0h	; a3cc  ..............@.
	defb 027h,019h,006h,0ffh,080h,0bfh,080h,0ffh,0b0h,0c9h,0f5h,07ah,0fah,0f9h,004h,0ffh	; a3dc  '..........z....
	defb 0bbh,075h,071h,0ffh,0e0h,0dfh,020h,0c0h,0abh,0dbh,0dbh,0ebh,0ebh,073h,080h,07fh	; a3ec  .uq... ......s..
	defb 003h,0a0h,0bdh,0bfh,081h,0fdh,0ffh,0ffh,017h,02eh,02eh,05fh,05ch,0bbh,004h,0f8h	; a3fc  ..........._\...
	defb 075h,0bbh,03bh,0fdh,01dh,0eeh,010h,00fh,067h,06bh,06dh,06ah,069h,068h,008h,0f8h	; a40c  u.......gkmjih..
	defb 0e7h,0d7h,0b7h,057h,097h,017h,010h,01fh,057h,06eh,06eh,05fh,05ch,0bbh,004h,0f8h	; a41c  ...W....Wnn_\...
	defb 07fh,073h,075h,076h,075h,074h,004h,0fch,0adh,0cdh,0fdh,0fdh,07dh,0bdh,041h,03fh	; a42c  .suvut......}.A?
	defb 003h,05dh,098h,05ch,05fh,05fh,040h,07fh,017h,017h,0efh,01fh,0feh,0f9h,006h,0f8h	; a43c  .].\__@.........
	defb 06eh,06fh,06eh,06eh,0aeh,02fh,020h,03fh,001h,0fdh,001h,003h,0ffh,096h,000h,0ffh	; a44c  nonn./ ?........
	defb 02eh,02eh,02fh,0aeh,06eh,06eh,060h,0ffh,0f7h,00eh,0fdh,01eh,0efh,097h,090h,09fh	; a45c  ../.nn`.........
	defb 040h,080h,000h,080h,003h,040h,081h,0c0h,000h	; a46c  @....@...

; ----------------------------------------------------------------------
; DATOS rachas3_A475: rachas a la VRAM en los tres tercios (p00:4CE5 ->
;   p00:4D16); lo leen p10:80D0 (720 bytes)
;   0xa475..0xa745  (720 bytes)
DATA_rachas3_A475:
	defb 005h,0f0h,003h,040h,005h,0f0h,003h,040h,004h,0f0h,004h,040h,002h,0f0h,008h,040h	; a475  ...@...@...@...@
	defb 081h,0f4h,025h,040h,002h,0f0h,081h,0f4h,00dh,040h,003h,0f0h,00dh,040h,003h,0f0h	; a485  ..%@.....@...@..
	defb 005h,040h,003h,0f0h,00bh,040h,002h,050h,002h,040h,086h,050h,0f0h,050h,040h,050h	; a495  .@...@.P.@.P.P@P
	defb 050h,004h,040h,08ch,050h,040h,050h,050h,040h,040h,050h,040h,050h,040h,050h,050h	; a4a5  P.@.P@PP@@P@P@PP
	defb 005h,0f0h,095h,040h,050h,050h,040h,040h,050h,040h,050h,040h,050h,050h,040h,040h	; a4b5  ...@PP@@P@P@PP@@
	defb 050h,040h,050h,040h,050h,050h,040h,040h,003h,050h,08bh,040h,050h,050h,040h,040h	; a4c5  P@P@PP@@.P.@PP@@
	defb 050h,040h,050h,040h,050h,050h,006h,040h,002h,050h,006h,040h,08ch,0f0h,050h,040h	; a4d5  P@P@PP.@.P.@..P@
	defb 040h,050h,040h,050h,040h,050h,0f5h,040h,040h,006h,050h,002h,040h,085h,050h,040h	; a4e5  @P@P@P.@@.P.@.P@
	defb 050h,040h,0f0h,009h,050h,002h,040h,098h,050h,0f0h,050h,040h,050h,050h,040h,040h	; a4f5  P@..P.@.P.P@PP@@
	defb 050h,040h,050h,040h,050h,050h,0f0h,040h,050h,040h,050h,040h,050h,050h,040h,040h	; a505  P@P@PP.@P@P@PP@@
	defb 006h,050h,086h,0f0h,040h,050h,040h,050h,040h,005h,050h,083h,040h,050h,040h,010h	; a515  .P..@P@P@.P.@P@.
	defb 050h,081h,070h,00fh,050h,081h,070h,017h,050h,081h,070h,007h,050h,081h,070h,007h	; a525  P.p.P.p.P.p.P.p.
	defb 050h,084h,070h,050h,050h,055h,004h,050h,081h,070h,007h,050h,002h,070h,006h,050h	; a535  P.pPPU.P.p.P.p.P
	defb 081h,070h,004h,050h,084h,055h,050h,050h,070h,00fh,050h,081h,070h,00fh,050h,081h	; a545  .p.P.UPPp.P.p.P.
	defb 070h,007h,050h,081h,070h,007h,050h,081h,070h,007h,050h,081h,070h,007h,050h,002h	; a555  p.P.p.P.p.P.p.P.
	defb 070h,008h,050h,003h,070h,082h,0f0h,070h,003h,0f0h,003h,070h,085h,0f0h,070h,0f0h	; a565  p.P.p..p...p..p.
	defb 0f0h,0b0h,003h,070h,085h,0f0h,070h,0f0h,0f0h,0b0h,003h,070h,082h,0f0h,070h,003h	; a575  ...p..p....p..p.
	defb 0f0h,003h,070h,004h,0f0h,081h,0b0h,003h,070h,085h,0f0h,070h,0f0h,0f0h,0b0h,003h	; a585  ..p.....p..p....
	defb 070h,085h,0f0h,070h,0f0h,0f0h,0b0h,003h,070h,085h,0f0h,070h,0f0h,0f0h,0b0h,003h	; a595  p..p....p..p....
	defb 070h,004h,0f0h,081h,0b0h,003h,070h,085h,0f0h,070h,0f0h,0f0h,0b0h,003h,070h,085h	; a5a5  p.....p..p....p.
	defb 0f0h,070h,0f0h,0f0h,0b0h,003h,070h,085h,0f0h,070h,0f0h,0f0h,0b0h,003h,070h,085h	; a5b5  .p....p..p....p.
	defb 0f0h,070h,0f0h,0f0h,0b0h,003h,070h,085h,0f0h,070h,0f0h,0f0h,0b0h,004h,0f0h,084h	; a5c5  .p....p..p......
	defb 070h,0f0h,0f0h,0b0h,003h,070h,085h,0f0h,070h,0f0h,0f0h,0b0h,004h,0f0h,081h,070h	; a5d5  p....p..p......p
	defb 003h,0f0h,002h,0a0h,002h,090h,004h,060h,084h,0a0h,0aah,090h,090h,004h,060h,002h	; a5e5  .......`......`.
	defb 0a0h,006h,090h,002h,0a0h,006h,090h,002h,0a0h,002h,090h,004h,060h,002h,0a0h,002h	; a5f5  ............`...
	defb 090h,004h,060h,002h,0a0h,002h,090h,081h,080h,003h,060h,002h,0a0h,002h,090h,004h	; a605  ..`.......`.....
	defb 080h,002h,0a0h,002h,090h,081h,060h,003h,080h,002h,0a0h,002h,090h,004h,080h,004h	; a615  ......`.........
	defb 090h,004h,060h,002h,0a0h,002h,090h,004h,060h,002h,0a0h,006h,090h,002h,0a0h,003h	; a625  ..`.....`.......
	defb 090h,003h,060h,005h,090h,003h,060h,005h,0a0h,003h,060h,002h,0a0h,006h,090h,002h	; a635  ..`...`...`.....
	defb 0a0h,006h,090h,002h,0a0h,006h,090h,002h,0a0h,002h,090h,004h,060h,002h,0a0h,002h	; a645  ............`...
	defb 090h,004h,060h,010h,0c0h,002h,080h,00eh,0c0h,008h,060h,010h,0c0h,018h,040h,007h	; a655  ..`.......`...@.
	defb 0c0h,081h,020h,007h,0c0h,081h,020h,007h,0c0h,081h,020h,007h,0c0h,081h,020h,007h	; a665  .. ... ... ... .
	defb 0c0h,081h,020h,007h,0c0h,081h,020h,007h,0c0h,081h,020h,007h,0c0h,081h,020h,007h	; a675  .. ... ... ... .
	defb 0c0h,081h,020h,007h,0c0h,081h,020h,007h,0c0h,081h,020h,007h,0c0h,081h,020h,007h	; a685  .. ... ... ... .
	defb 0c0h,081h,020h,007h,0c0h,081h,020h,007h,0c0h,081h,020h,007h,0c0h,081h,020h,007h	; a695  .. ... ... ... .
	defb 0c0h,081h,020h,007h,0c0h,081h,020h,007h,0c0h,002h,020h,002h,030h,002h,0b0h,003h	; a6a5  .. ... ... .0...
	defb 0f0h,085h,020h,030h,030h,0b0h,0b0h,003h,0f0h,085h,020h,030h,030h,0bbh,0b0h,003h	; a6b5  .. 00..... 00...
	defb 0f0h,085h,020h,030h,030h,0b0h,0b0h,003h,0f0h,08dh,020h,030h,030h,0b0h,0b0h,0f0h	; a6c5  .. 00..... 00...
	defb 000h,0f0h,020h,030h,030h,0b0h,0b0h,003h,0f0h,085h,020h,030h,030h,0b0h,0b0h,003h	; a6d5  .. 00..... 00...
	defb 0f0h,085h,020h,030h,030h,0b0h,0b0h,003h,0f0h,085h,020h,030h,030h,0b0h,0b0h,003h	; a6e5  .. 00..... 00...
	defb 0f0h,085h,020h,030h,030h,0b0h,0b0h,003h,0f0h,085h,020h,030h,030h,0b0h,0b0h,003h	; a6f5  .. 00..... 00...
	defb 0f0h,085h,020h,030h,030h,0b0h,0b0h,003h,0f0h,084h,020h,030h,030h,0b0h,004h,0f0h	; a705  .. 00..... 00...
	defb 085h,020h,030h,030h,0b0h,0b0h,003h,0f0h,085h,020h,030h,030h,0b0h,0b0h,003h,0f0h	; a715  . 00..... 00....
	defb 095h,020h,030h,030h,0bbh,000h,0f0h,0f0h,0ffh,020h,030h,030h,0b0h,0b0h,0f0h,0f0h	; a725  . 00..... 00....
	defb 0ffh,020h,030h,030h,0b0h,0b0h,003h,0f0h,082h,020h,030h,003h,0b0h,003h,0f0h,000h	; a735  . 00..... 0.....

; ----------------------------------------------------------------------
; DATOS rachas_A745: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); lo leen p10:80D9 (437 bytes)
;   0xa745..0xa8fa  (437 bytes)
DATA_rachas_A745:
	defb 010h,000h,088h,001h,002h,004h,004h,008h,000h,000h,020h,00fh,000h,090h,001h,000h	; a745  .......... .....
	defb 006h,00ch,018h,030h,060h,040h,080h,002h,004h,008h,010h,020h,040h,080h,022h,000h	; a755  ...0`@..... @.".
	defb 086h,001h,003h,00ch,010h,060h,080h,007h,000h,084h,003h,00ch,070h,0c0h,009h,000h	; a765  .....`......p...
	defb 084h,007h,01eh,0e0h,080h,009h,000h,084h,001h,00fh,07fh,0f0h,00ch,000h,003h,0ffh	; a775  ................
	defb 081h,007h,00ch,000h,08ah,0c0h,0f0h,0f8h,0fch,07eh,03fh,00fh,003h,001h,001h,00ch	; a785  .........~?.....
	defb 000h,08ah,080h,0c0h,0e0h,0e0h,0f0h,070h,078h,078h,038h,038h,010h,000h,09ah,02ch	; a795  .......pxx88...,
	defb 03ch,034h,024h,034h,024h,02ch,028h,028h,038h,070h,050h,070h,060h,0e0h,0c0h,001h	; a7a5  <4$4$,((8pPp`...
	defb 003h,003h,007h,00ah,006h,01ch,038h,070h,0e0h,006h,000h,082h,0c0h,080h,02bh,000h	; a7b5  ......8p......+.
	defb 08dh,008h,01ch,038h,000h,000h,001h,003h,006h,01ch,028h,000h,000h,080h,006h,000h	; a7c5  ...8......(.....
	defb 083h,070h,0e0h,0c0h,01ch,000h,081h,003h,009h,000h,002h,003h,085h,006h,01ch,070h	; a7d5  .p.............p
	defb 0a0h,0c0h,003h,000h,085h,001h,03ch,0e3h,01ch,0f0h,008h,000h,084h,00dh,000h,038h	; a7e5  ......<........8
	defb 080h,00ch,000h,086h,016h,01ah,00dh,006h,003h,001h,00ch,000h,086h,080h,060h,09ch	; a7f5  ..............`.
	defb 0e7h,078h,007h,018h,000h,084h,00ch,018h,018h,010h,003h,030h,081h,060h,004h,070h	; a805  .x.........0.`.p
	defb 084h,078h,028h,028h,004h,01ah,000h,092h,001h,003h,003h,007h,006h,00eh,007h,00eh	; a815  .x((............
	defb 01eh,01ch,038h,078h,060h,0e0h,0c0h,0c0h,080h,080h,021h,000h,083h,001h,003h,003h	; a825  ..8x`.....!.....
	defb 004h,000h,092h,001h,003h,007h,00eh,01eh,03ch,078h,070h,0e0h,0c0h,0c0h,080h,01bh	; a835  ........<xp.....
	defb 03eh,07ch,0f0h,0e0h,0c0h,020h,000h,08ah,003h,00ch,070h,0c0h,000h,000h,001h,003h	; a845  >|... ....p.....
	defb 006h,00fh,003h,000h,091h,007h,01eh,0e1h,083h,007h,00fh,03fh,07bh,0efh,09eh,038h	; a855  ...........?{..8
	defb 0f0h,0c0h,000h,003h,00fh,03fh,004h,0ffh,084h,0feh,0f0h,0c0h,080h,004h,000h,005h	; a865  .....?..........
	defb 0ffh,083h,0fch,0f0h,080h,014h,000h,084h,001h,007h,01fh,03fh,008h,000h,083h,001h	; a875  ...........?....
	defb 007h,03fh,007h,0ffh,088h,0fch,0e0h,00eh,03fh,00fh,003h,001h,001h,006h,000h,082h	; a885  .?......?.......
	defb 0e0h,080h,004h,000h,092h,080h,0c0h,0e0h,0e0h,0f0h,070h,078h,078h,038h,038h,000h	; a895  ..........pxx88.
	defb 000h,00ch,000h,000h,007h,01fh,07fh,007h,0ffh,085h,0fch,000h,001h,007h,03fh,008h	; a8a5  ..............?.
	defb 0ffh,083h,0feh,0f0h,080h,00eh,000h,082h,006h,010h,00ch,000h,086h,03fh,0ffh,007h	; a8b5  .............?..
	defb 007h,01fh,07fh,009h,0ffh,082h,0f8h,0c0h,004h,000h,008h,0ffh,081h,0fch,010h,000h	; a8c5  ................
	defb 083h,00fh,0deh,07fh,004h,0ffh,008h,000h,083h,0c3h,01fh,07fh,00ch,0ffh,081h,0f0h	; a8d5  ................
	defb 008h,000h,002h,0ffh,002h,0feh,083h,0fch,0f0h,080h,011h,000h,083h,0e0h,0fch,0feh	; a8e5  ................
	defb 005h,0ffh,010h,000h,000h	; a8f5

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa8fa..0xa912  (24 bytes)
DATA_A8FA:
	defb 0feh,0a8h,005h,0a9h,002h,001h,041h,0ach,003h,00dh,0ech,002h,002h,022h,0ach,003h	; a8fa  ......A......"..
	defb 00dh,0ech,08ah,0ach,08ah,0aeh,09ah,0afh	; a90a  ........

; ----------------------------------------------------------------------
; DATOS rachas_A912: rachas a la VRAM (p00:4D16: <0x80 repite, 0x80 destino,
;   >0x80 copia, 0 acaba); se solapan 2 bloques: (rachas3_A912 A912-AC8A); lo
;   leen p10:806A, p00:56FD, p01:7BB0 (888 bytes)
;   0xa912..0xac8a  (888 bytes)
DATA_rachas_A912:
	defb 006h,000h,002h,018h,006h,000h,082h,010h,008h,004h,000h,002h,018h,003h,000h,003h	; a912  ................
	defb 018h,002h,010h,08ch,000h,010h,000h,038h,04ch,04ch,018h,010h,000h,010h,000h,03ch	; a922  .......8LL.....<
	defb 004h,020h,005h,000h,004h,004h,081h,03ch,004h,000h,081h,07fh,004h,000h,092h,001h	; a932  . .....<........
	defb 002h,004h,008h,010h,020h,040h,010h,03eh,010h,01eh,033h,055h,059h,02ah,000h,000h	; a942  .... @.>..3UY*..
	defb 042h,003h,041h,0b5h,050h,020h,000h,03ch,000h,07ch,002h,002h,004h,018h,000h,008h	; a952  B.A.P .<.|......
	defb 03eh,004h,008h,014h,024h,043h,000h,010h,03ah,011h,03ch,052h,052h,024h,000h,020h	; a962  >...$C..:.<RR$.
	defb 024h,07ah,029h,029h,028h,050h,000h,010h,07eh,008h,07eh,004h,040h,03ch,000h,004h	; a972  $z))(P..~.~.@<..
	defb 008h,010h,020h,010h,008h,004h,000h,044h,05eh,004h,044h,092h,028h,000h,03ch,002h	; a982  .. ....D^.D.(.<.
	defb 004h,000h,000h,020h,01eh,000h,010h,07eh,008h,03ch,046h,040h,038h,000h,003h,020h	; a992  ... ...~.<F@8..
	defb 002h,021h,0b6h,022h,01ch,000h,008h,07eh,004h,01ch,01ch,004h,018h,000h,024h,024h	; a9a2  .!."...~......$$
	defb 07fh,024h,024h,020h,01eh,000h,012h,014h,07fh,008h,010h,010h,00ch,000h,020h,070h	; a9b2  .$$ .......... p
	defb 027h,020h,020h,028h,047h,000h,008h,07eh,010h,03ch,062h,002h,01ch,000h,000h,01eh	; a9c2  '  (G..~.<b.....
	defb 061h,001h,001h,002h,00ch,000h,07fh,004h,008h,003h,010h,094h,00eh,000h,020h,026h	; a9d2  a............. &
	defb 018h,020h,040h,040h,03eh,000h,022h,071h,024h,024h,04ch,016h,00ch,000h,040h,04fh	; a9e2  . @@>."q$$L...@O
	defb 003h,040h,08dh,048h,027h,000h,020h,02eh,071h,021h,027h,069h,026h,000h,01ch,02ah	; a9f2  .@.H'. .q!'i&..*
	defb 003h,049h,0d3h,051h,022h,000h,044h,05eh,044h,044h,04ch,056h,02ch,000h,05eh,044h	; aa02  .I.Q".D^DDLV,.^D
	defb 05eh,044h,04ch,056h,02ch,000h,03eh,004h,03eh,004h,01ch,026h,018h,000h,030h,012h	; aa12  ^DLV,.>.>..&..0.
	defb 012h,03eh,053h,052h,024h,000h,022h,02eh,033h,055h,055h,059h,02ah,000h,010h,078h	; aa22  .>SR$.".3UUY*..x
	defb 020h,078h,022h,022h,01ch,000h,024h,01fh,075h,011h,012h,008h,008h,000h,008h,05eh	; aa32   x""..$.u......^
	defb 055h,065h,045h,04eh,024h,000h,010h,00eh,008h,008h,038h,04ch,032h,000h,008h,004h	; aa42  UeEN$.....8L2...
	defb 010h,01eh,021h,001h,00eh,000h,004h,022h,0b3h,002h,004h,018h,000h,03ch,008h,010h	; aa52  ..!....".....<..
	defb 03ch,042h,01ah,01ch,000h,020h,028h,074h,024h,024h,065h,022h,000h,03ch,008h,010h	; aa62  <B... (t$$e".<..
	defb 03ch,042h,002h,01ch,000h,020h,02eh,071h,021h,021h,061h,022h,000h,008h,03eh,010h	; aa72  <B... .q!!a"..>.
	defb 03ah,00ch,030h,01eh,000h,008h,010h,020h,038h,024h,045h,042h,003h,000h,0b1h,01ch	; aa82  :.0.... 8$EB....
	defb 062h,002h,004h,008h,00ah,025h,024h,07ah,029h,029h,028h,050h,00ah,025h,020h,020h	; aa92  b....%$z))(P.%
	defb 021h,021h,022h,01ch,002h,015h,07eh,008h,038h,038h,008h,030h,005h,012h,014h,07fh	; aaa2  !!"...~.88.0....
	defb 008h,010h,010h,00ch,00ah,025h,070h,027h,020h,020h,028h,047h,00ah,07dh,004h,008h	; aab2  .....%p'  (G.}..
	defb 003h,010h,0aeh,00eh,00ah,025h,020h,016h,018h,020h,040h,03eh,00ah,045h,05eh,044h	; aac2  .....% .. @>.E^D
	defb 044h,04ch,056h,02ch,00ah,005h,010h,028h,044h,002h,001h,000h,00ah,05dh,044h,05eh	; aad2  DLV,...(D....]D^
	defb 044h,04ch,056h,02ch,000h,07fh,001h,00ah,00ch,008h,010h,020h,000h,003h,00ch,018h	; aae2  DLV,....... ....
	defb 068h,003h,008h,0b3h,000h,008h,07fh,041h,042h,002h,004h,018h,000h,004h,07fh,00ch	; aaf2  h......AB.......
	defb 00ch,014h,024h,04ch,000h,008h,07fh,009h,009h,011h,011h,022h,000h,008h,07eh,008h	; ab02  ..$L......."..~.
	defb 008h,07fh,004h,004h,000h,01fh,011h,021h,002h,002h,004h,018h,000h,020h,03fh,024h	; ab12  .......!..... ?$
	defb 044h,004h,008h,010h,000h,000h,03fh,004h,001h,0b5h,03fh,000h,022h,07fh,022h,022h	; ab22  D.....?...?.".""
	defb 002h,004h,018h,000h,060h,011h,061h,012h,002h,00ch,070h,000h,07eh,002h,004h,008h	; ab32  ....`.a...p.~...
	defb 014h,022h,041h,000h,020h,07fh,021h,022h,020h,020h,01fh,000h,01fh,011h,029h,006h	; ab42  ."A. .!"  ....).
	defb 002h,004h,018h,000h,006h,038h,008h,07fh,008h,008h,010h,000h,03eh,000h,07fh,003h	; ab52  .....8......>...
	defb 008h,08ch,010h,000h,020h,020h,038h,024h,022h,020h,020h,000h,004h,07fh,003h,004h	; ab62  ....  8$"  .....
	defb 085h,008h,030h,000h,000h,03eh,004h,000h,096h,07fh,000h,008h,07fh,002h,00ch,01ah	; ab72  ..0..>..........
	defb 069h,008h,000h,002h,002h,004h,004h,008h,010h,060h,000h,000h,024h,022h,022h,003h	; ab82  i........`..$"".
	defb 041h,082h,000h,07eh,003h,002h,09fh,004h,008h,030h,000h,07fh,001h,002h,024h,018h	; ab92  A..~.....0....$.
	defb 008h,004h,000h,008h,008h,010h,014h,022h,02fh,071h,000h,002h,002h,012h,00ch,004h	; aba2  ......."/q......
	defb 00ah,031h,000h,03eh,010h,07fh,003h,010h,08ah,00fh,000h,03eh,000h,07fh,001h,002h	; abb2  .1.>.......>....
	defb 00ch,030h,000h,003h,028h,002h,029h,083h,04ah,04ch,000h,003h,020h,086h,021h,022h	; abc2  .0..(.).JL.. .!"
	defb 02ch,030h,000h,07fh,004h,041h,09ah,07fh,041h,000h,07eh,042h,042h,002h,004h,008h	; abd2  ,0...A..A.~BB...
	defb 030h,000h,07eh,002h,03eh,002h,002h,004h,038h,000h,060h,011h,001h,002h,002h,00ch	; abe2  0.~.>...8.`.....
	defb 070h,003h,000h,085h,002h,00ch,034h,004h,004h,004h,000h,084h,01fh,004h,004h,01fh	; abf2  p.....4.........
	defb 003h,000h,085h,004h,03eh,00ch,014h,02ch,003h,000h,002h,015h,083h,001h,002h,00ch	; ac02  ....>..,........
	defb 003h,000h,085h,008h,01fh,009h,004h,004h,004h,000h,084h,01ch,004h,004h,03fh,003h	; ac12  ..............?.
	defb 000h,0c9h,01eh,002h,01eh,002h,01eh,00ah,009h,07eh,041h,042h,002h,004h,018h,00ah	; ac22  .........~AB....
	defb 015h,010h,07eh,012h,022h,022h,044h,000h,000h,010h,028h,044h,002h,001h,000h,002h	; ac32  ..~.""D...(D....
	defb 005h,017h,028h,044h,002h,001h,000h,00ah,005h,07eh,004h,008h,014h,022h,041h,00ah	; ac42  ..(D.....~..."A.
	defb 025h,020h,07fh,022h,024h,020h,01fh,00ah,005h,042h,042h,022h,004h,008h,030h,00ah	; ac52  % ."$ ...BB"..0.
	defb 005h,03eh,022h,052h,00ch,008h,030h,00ah,03dh,000h,07fh,003h,008h,08eh,010h,00ah	; ac62  .>"R..0.=.......
	defb 025h,020h,038h,024h,022h,020h,020h,00ah,005h,020h,020h,022h,003h,041h,083h,002h	; ac72  % 8$"  ..  ".A..
	defb 005h,07bh,003h,004h,082h,008h,030h,000h	; ac82  .{....0.

; ----------------------------------------------------------------------
; DATOS copia3_AC8A: 0x200 bytes que p00:4CC1 copia tal cual (LDIRVM) a 0x2560
;   (si 0xE6D1 = 5, en lugar de 0xAE8A) en los tres tercios; lo leen p01:7BCF
;   (512 bytes)
;   0xac8a..0xae8a  (512 bytes)
DATA_copia3_AC8A:
	defb 06fh,055h,076h,009h,034h,01eh,02ah,049h,03eh,044h,03eh,01eh,03eh,009h,055h,04eh	; ac8a  oUv.4.*I>D>.>.UN
	defb 02ch,03fh,05eh,0deh,040h,05eh,052h,05eh,03eh,022h,03eh,010h,07fh,022h,002h,00ch	; ac9a  ,?^.@^R^>">.."..
	defb 07eh,034h,0ffh,081h,0bdh,02ch,018h,0e7h,010h,010h,07fh,014h,03eh,024h,064h,0bfh	; acaa  ~4...,......>$d.
	defb 025h,0a4h,07fh,024h,064h,0aah,02ah,031h,09eh,052h,092h,05eh,008h,02ch,055h,057h	; acba  %..$d.*1.R.^.,UW
	defb 008h,07fh,01ch,07fh,029h,066h,02ah,031h,000h,03eh,000h,07fh,008h,02ah,049h,018h	; acca  ....)f*1.>...*I.
	defb 000h,005h,05eh,0e4h,05ah,05bh,066h,0d9h,001h,05eh,004h,05fh,004h,01fh,031h,05fh	; acda  ..^.Z[f..^._..1_
	defb 008h,07fh,041h,03eh,008h,07fh,008h,018h,008h,07fh,049h,03eh,02ah,03eh,02ah,03eh	; acea  ..A>......I>*>*>
	defb 008h,07fh,055h,024h,043h,03eh,008h,07fh,000h,07bh,021h,079h,05fh,07ch,04ch,07bh	; acfa  ..U$C>...{!y_|L{
	defb 004h,07fh,034h,032h,07dh,000h,055h,04eh,03eh,03eh,03eh,028h,03eh,07eh,008h,07fh	; ad0a  ..42}.UN>>>(>~..
	defb 000h,038h,017h,07dh,035h,03dh,057h,010h,028h,028h,05fh,0e8h,04eh,048h,04eh,048h	; ad1a  .8.}5=W.((_.NHNH
	defb 055h,024h,07fh,074h,075h,022h,072h,025h,008h,02fh,072h,02ah,0dah,064h,0b6h,029h	; ad2a  U$.tu"r%./r*.d.)
	defb 010h,064h,0ffh,075h,075h,075h,029h,0f2h,020h,04eh,0a0h,05fh,0c2h,042h,042h,04eh	; ad3a  .d.uuu). N._.BBN
	defb 000h,07fh,049h,03eh,03eh,008h,07fh,008h,000h,03eh,008h,02ah,07fh,008h,008h,008h	; ad4a  ..I>>....>.*....
	defb 000h,03eh,03eh,03eh,03eh,014h,015h,067h,02ah,03fh,05fh,0c8h,05fh,06bh,04fh,04bh	; ad5a  .>>>>..g*?_._kOK
	defb 000h,07eh,076h,008h,07eh,01ch,054h,07eh,000h,018h,024h,042h,0bdh,014h,024h,04ch	; ad6a  .~v.~.T~..$B..$L
	defb 000h,022h,074h,02fh,02ah,07ah,0aah,02ah,010h,03eh,022h,03eh,022h,03eh,022h,03eh	; ad7a  ."t/*z.*.>">">">
	defb 000h,071h,052h,074h,008h,017h,025h,047h,024h,044h,077h,059h,075h,051h,071h,006h	; ad8a  .qRt..%G$DwYuQq.
	defb 03ah,055h,022h,05dh,094h,03eh,015h,067h,014h,05eh,034h,01eh,0d4h,05eh,040h,0bfh	; ad9a  :U"].>.g.^4..^@.
	defb 03eh,03eh,014h,07fh,014h,07fh,014h,063h,008h,07fh,014h,055h,01eh,064h,01ch,063h	; adaa  >>.....c...U.d.c
	defb 00ah,03eh,00ch,07fh,010h,03eh,05ah,01eh,000h,026h,069h,029h,026h,029h,029h,026h	; adba  .>...>Z..&i)&))&
	defb 000h,02ah,02ah,07fh,02ah,02eh,020h,03fh,000h,07fh,03dh,001h,03dh,025h,03dh,003h	; adca  .**.*. ?..=.=%=.
	defb 008h,014h,03eh,041h,03eh,00ah,00ch,008h,008h,07fh,041h,01ch,01ch,010h,01eh,01eh	; adda  ..>A>.....A.....
	defb 000h,018h,024h,05ah,081h,03ch,004h,018h,03eh,02ah,03eh,02ah,03eh,015h,052h,04fh	; adea  ..$Z.<..>*>*>.RO
	defb 03eh,012h,0ffh,03eh,020h,07fh,0a1h,03fh,000h,07eh,008h,03ch,014h,024h,024h,0ffh	; adfa  >..> ..?.~.<.$$.
	defb 000h,07eh,042h,07eh,042h,07eh,042h,07eh,044h,04fh,0e4h,05fh,042h,07fh,0cah,046h	; ae0a  .~B~B~B~DO._B..F
	defb 030h,000h,072h,014h,0f8h,038h,054h,092h,004h,04eh,01fh,0cah,04dh,076h,049h,0bfh	; ae1a  0.r..8T..N..MvI.
	defb 000h,028h,03eh,048h,03eh,008h,014h,063h,000h,008h,07fh,07ah,07ah,076h,024h,05bh	; ae2a  .(>H>..c...zzv$[
	defb 000h,026h,04ah,024h,05ah,035h,050h,0a6h,024h,04fh,0a4h,05fh,0c2h,05fh,04ah,046h	; ae3a  .&J$Z5P.$O._._JF
	defb 000h,008h,07fh,010h,010h,010h,010h,00eh,000h,03eh,022h,022h,03eh,022h,022h,03eh	; ae4a  .........>"">"">
	defb 001h,004h,07fh,044h,074h,055h,052h,085h,000h,004h,00fh,075h,025h,035h,049h,012h	; ae5a  ...DtUR....u%5I.
	defb 000h,022h,0fah,057h,052h,056h,022h,0d6h,000h,024h,07fh,020h,02eh,03ah,06ah,02bh	; ae6a  .".WRV"..$. .:j+
	defb 000h,07fh,040h,07eh,052h,052h,04ch,0b2h,008h,07fh,040h,04ah,055h,050h,071h,0aeh	; ae7a  ..@~RRL...@JUPq.

; ----------------------------------------------------------------------
; DATOS copia3_AE8A: 0x110 bytes que p00:4CC1 copia tal cual (LDIRVM) a 0x2560
;   en los tres tercios; lo leen p01:7BC2 (272 bytes)
;   0xae8a..0xaf9a  (272 bytes)
DATA_copia3_AE8A:
	defb 000h,07fh,040h,07eh,042h,07eh,040h,07fh,000h,008h,008h,07fh,008h,014h,022h,041h	; ae8a  ..@~B~@......."A
	defb 001h,004h,0ffh,044h,0efh,044h,0eeh,015h,01ch,022h,07fh,000h,077h,055h,077h,004h	; ae9a  ...D.D..."..wUw.
	defb 072h,04fh,076h,0bfh,00ah,03eh,008h,07fh,008h,07fh,045h,03eh,004h,014h,004h,00ch	; aeaa  rOv..>....E>....
	defb 008h,03eh,008h,07fh,014h,036h,055h,014h,004h,03fh,01eh,03fh,01eh,01eh,012h,026h	; aeba  .>...6U..?.?...&
	defb 008h,010h,07eh,042h,07eh,042h,07eh,042h,014h,07fh,014h,07fh,03eh,03eh,014h,063h	; aeca  ..~B~B~B....>>.c
	defb 008h,014h,03eh,049h,03eh,02ah,01ch,07fh,024h,0ffh,024h,06ah,074h,0a5h,02ah,035h	; aeda  ..>I>*..$.$jt.*5
	defb 000h,03dh,055h,0ffh,04bh,05dh,049h,05dh,008h,050h,01eh,0d2h,05eh,052h,05eh,0bfh	; aeea  .=U.K]I].P..^R^.
	defb 000h,008h,07fh,02ah,07fh,01ch,02ah,049h,000h,014h,054h,0ffh,055h,076h,090h,00fh	; aefa  ...*..*I..T.Uv..
	defb 000h,075h,024h,0ffh,024h,035h,0e6h,029h,054h,05eh,0a4h,0feh,064h,0cah,06ah,091h	; af0a  .u$.$5.)T^..d.j.
	defb 04eh,04eh,0fbh,05bh,064h,0dfh,04eh,0d5h,000h,0e4h,041h,0e4h,055h,0d6h,0ech,053h	; af1a  NN.[d.N...A.U..S
	defb 022h,072h,02fh,0f2h,02ah,072h,022h,0f6h,008h,07fh,041h,02eh,024h,06eh,02eh,02eh	; af2a  "r/.*r"...A.$n..
	defb 000h,008h,07fh,008h,03eh,022h,022h,03eh,001h,014h,024h,07fh,0a4h,024h,022h,023h	; af3a  ....>"">..$..$"#
	defb 000h,008h,07fh,014h,014h,008h,014h,063h,00fh,077h,055h,077h,055h,07fh,009h,013h	; af4a  .......c.wUwU...
	defb 000h,024h,05fh,035h,055h,03bh,051h,0b1h,008h,05ch,03eh,0dch,05ch,05ch,062h,0bfh	; af5a  .$_5U.Q..\>.\\b.
	defb 004h,0ffh,0eah,05bh,07bh,0cah,0eah,012h,049h,07fh,000h,077h,055h,077h,077h,055h	; af6a  ...[{...I..wUwwU
	defb 000h,024h,0f9h,02fh,050h,02fh,069h,09fh,000h,020h,0bfh,0a9h,0eah,024h,02ah,031h	; af7a  .$./P/i.. ...$*1
	defb 009h,076h,05fh,079h,05fh,074h,055h,0abh,008h,049h,02ah,07fh,014h,014h,025h,047h	; af8a  .v_y_tU..I*...%G

; ----------------------------------------------------------------------
; DATOS copia3_AF9A: 0x68 bytes que p00:4CC1 copia tal cual (LDIRVM) a 0x2760
;   en los tres tercios; lo leen p01:7BB6 (104 bytes)
;   0xaf9a..0xb002  (104 bytes)
DATA_copia3_AF9A:
	defb 000h,020h,03fh,042h,0dah,05ah,042h,046h,01eh,0f2h,05eh,0f2h,05eh,0feh,015h,067h	; af9a  . ?B.ZBF..^.^..g
	defb 008h,02ah,014h,063h,008h,02ah,014h,063h,000h,03eh,004h,07fh,00ah,00ch,008h,030h	; afaa  .*.c.*.c.>.....0
	defb 008h,07fh,01ch,01ch,000h,03eh,022h,03eh,028h,008h,07fh,00ah,01ch,028h,048h,018h	; afba  .....>">(....(H.
	defb 008h,07fh,014h,07fh,03eh,03eh,07fh,008h,07fh,014h,07fh,014h,07fh,02ah,051h,08eh	; afca  ....>>.......*Q.
	defb 008h,07fh,040h,07eh,042h,054h,048h,084h,000h,028h,028h,07fh,048h,03eh,008h,07fh	; afda  ..@~BTH..((.H>..
	defb 000h,008h,049h,07fh,008h,049h,049h,07fh,000h,02eh,04eh,03fh,054h,02fh,04eh,0b5h	; afea  ..I..II...N?T/N.
	defb 000h,07fh,008h,00ch,00ah,008h,008h,008h	; affa  ........

; ----------------------------------------------------------------------
; DATOS textos_B002: 22 punteros a los textos (version japonesa, por el byte
;   0x002B de la BIOS en p10:944C): p00:4E31 con A; lo leen p10:9451 (44
;   bytes)
;   0xb002..0xb02e  (44 bytes)
DATA_textos_B002:
	defw 0b02eh,0b039h,0b05bh,0b07bh,0b08ah,0b0b6h,0b0e6h,0b0fdh	; b002
	defw 0b121h,0b144h,0b3e4h,0b42fh,0b1a2h,0b1e7h,0b222h,0b25eh	; b012
	defw 0b290h,0b2f2h,0b31ah,0b350h,0b37ch,0b3b7h	; b022

; ----------------------------------------------------------------------
; DATOS texto_B02E: texto 0 de la tabla 0xB002 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (11 bytes)
;   0xb02e..0xb039  (11 bytes)
DATA_texto_B02E:
	defb 000h,025h,02dh,025h,032h,027h,025h,02eh,023h,039h,0ffh	; b02e  .%-%2'%.#9.

; ----------------------------------------------------------------------
; DATOS texto_B039: texto 1 de la tabla 0xB002 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (34 bytes)
;   0xb039..0xb05b  (34 bytes)
DATA_texto_B039:
	defb 001h,037h,0ach,0adh,0aeh,0afh,06ah,047h,032h,0bch,0bdh,08ah,07eh,091h,07ah,040h	; b039  .7....jG2...~.z@
	defb 05ch,052h,0ach,0adh,0aeh,0afh,062h,0feh,002h,0b0h,0aeh,046h,055h,046h,04ah,032h	; b049  \R....b....FUFJ2
	defb 038h,0ffh	; b059

; ----------------------------------------------------------------------
; DATOS texto_B05B: texto 2 de la tabla 0xB002 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (32 bytes)
;   0xb05b..0xb07b  (32 bytes)
DATA_texto_B05B:
	defb 005h,037h,08ah,07eh,091h,07ah,040h,05ch,052h,0ach,0adh,0aeh,0afh,036h,038h,0feh	; b05b  .7.~.z@\R....68.
	defb 005h,037h,0edh,0b1h,052h,08ah,07eh,091h,07ah,052h,0b2h,0b3h,053h,036h,038h,0ffh	; b06b  .7..R.~.zR..S68.

; ----------------------------------------------------------------------
; DATOS texto_B07B: texto 3 de la tabla 0xB002 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (15 bytes)
;   0xb07b..0xb08a  (15 bytes)
DATA_texto_B07B:
	defb 005h,037h,01bh,018h,02bh,018h,0b4h,0b5h,062h,046h,055h,047h,032h,038h,0ffh	; b07b  .7..+...bFUG28.

; ----------------------------------------------------------------------
; DATOS texto_B08A: texto 4 de la tabla 0xB002 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (44 bytes)
;   0xb08a..0xb0b6  (44 bytes)
DATA_texto_B08A:
	defb 002h,037h,08ah,07eh,091h,07ah,052h,072h,09eh,090h,0b6h,050h,033h,09dh,08dh,07ah	; b08a  .7.~.zRr...P3..z
	defb 034h,085h,093h,039h,07ah,065h,0feh,003h,03bh,05dh,055h,047h,032h,038h,0fdh,005h	; b09a  4..9ze...]UG28..
	defb 037h,0a2h,075h,07eh,05dh,06fh,090h,057h,035h,035h,038h,0ffh	; b0aa  7.u~]o.W558.

; ----------------------------------------------------------------------
; DATOS texto_B0B6: texto 5 de la tabla 0xB002 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (48 bytes)
;   0xb0b6..0xb0e6  (48 bytes)
DATA_texto_B0B6:
	defb 001h,037h,079h,039h,0a1h,05dh,039h,075h,0bfh,0c0h,050h,05bh,05dh,033h,0bch,0bdh	; b0b6  .7y9.]9u..P[]3..
	defb 08ah,07eh,091h,07ah,052h,0c1h,0f6h,0feh,002h,0b7h,0c2h,062h,0c3h,03dh,032h,0b8h	; b0c6  .~.zR......b.=2.
	defb 0b9h,0bah,0c4h,053h,04ah,069h,04bh,050h,0bbh,0c8h,050h,04ch,043h,035h,038h,0ffh	; b0d6  ...SJiKP..PLC58.

; ----------------------------------------------------------------------
; DATOS texto_B0E6: texto 6 de la tabla 0xB002 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (23 bytes)
;   0xb0e6..0xb0fd  (23 bytes)
DATA_texto_B0E6:
	defb 001h,037h,01fh,030h,027h,01ch,029h,000h,02ah,027h,018h,01ah,01ch,000h,01dh,020h	; b0e6  .7.0'.).*'.....
	defb 01eh,01fh,02bh,01ch,029h,038h,0ffh	; b0f6

; ----------------------------------------------------------------------
; DATOS texto_B0FD: texto 7 de la tabla 0xB002 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (36 bytes)
;   0xb0fd..0xb121  (36 bytes)
DATA_texto_B0FD:
	defb 005h,037h,02ah,018h,019h,01ch,023h,000h,02bh,020h,01eh,01ch,029h,038h,0feh,002h	; b0fd  .7*...#.+ ..)8..
	defb 037h,027h,020h,023h,026h,02bh,000h,039h,000h,020h,01eh,01eh,030h,000h,029h,026h	; b10d  7' #&+.9. ..0.)&
	defb 01ah,022h,038h,0ffh	; b11d

; ----------------------------------------------------------------------
; DATOS texto_B121: texto 8 de la tabla 0xB002 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (35 bytes)
;   0xb121..0xb144  (35 bytes)
DATA_texto_B121:
	defb 007h,037h,02bh,01fh,029h,018h,02ah,01fh,01ch,029h,038h,0feh,001h,037h,027h,020h	; b121  .7+.).*..)8..7'
	defb 023h,026h,02bh,000h,039h,000h,031h,026h,02eh,020h,01ch,000h,02ah,01ah,026h,02bh	; b131  #&+.9.1&. ..*.&+
	defb 02bh,038h,0ffh	; b141

; ----------------------------------------------------------------------
; DATOS texto_B144: texto 9 de la tabla 0xB002 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (94 bytes)
;   0xb144..0xb1a2  (94 bytes)
DATA_texto_B144:
	defb 001h,053h,04ah,046h,04dh,033h,078h,039h,06dh,08bh,034h,07ch,070h,099h,039h,04eh	; b144  .SJFM3x9m.4|p.9N
	defb 07ah,08ah,094h,079h,095h,039h,053h,033h,0feh,005h,0bch,0bdh,08ah,07eh,091h,07ah	; b154  z..y.9S3.....~.z
	defb 062h,0c1h,03eh,05eh,069h,060h,03dh,040h,036h,0fdh,003h,0a2h,075h,07eh,05dh,06fh	; b164  b.>^i`=@6...u~]o
	defb 090h,052h,07ah,09bh,079h,095h,08bh,034h,077h,086h,090h,0a1h,039h,0feh,008h,078h	; b174  .Rz.y..4w...9..x
	defb 08ah,086h,090h,09fh,0c4h,04eh,053h,036h,0fdh,003h,049h,046h,04dh,033h,0eeh,052h	; b184  .....NS6..IFM3.R
	defb 0efh,0f0h,050h,040h,042h,045h,05fh,04ah,080h,09eh,04eh,053h,036h,0ffh	; b194  ..P@BE_J..NS6.

; ----------------------------------------------------------------------
; DATOS texto_B1A2: texto 12 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (69 bytes)
;   0xb1a2..0xb1e7  (69 bytes)
DATA_texto_B1A2:
	defb 000h,037h,01bh,018h,02bh,018h,08fh,0c9h,0cah,079h,033h,025h,01ch,02fh,02bh,000h	; b1a2  .7..+....y3%./+.
	defb 02bh,018h,029h,01eh,01ch,02bh,07fh,080h,08bh,0feh,004h,0bch,0bdh,08fh,02ah,01ch	; b1b2  +.)..+........*.
	defb 023h,01ch,01ah,02bh,079h,07eh,0f8h,078h,070h,032h,038h,0feh,000h,037h,02bh,020h	; b1c2  #..+y~.xp28..7+
	defb 024h,01ch,099h,00eh,081h,080h,08bh,07fh,033h,0cbh,0c2h,0cdh,081h,0ceh,0cfh,079h	; b1d2  $.......3......y
	defb 086h,07ah,032h,038h,0ffh	; b1e2

; ----------------------------------------------------------------------
; DATOS texto_B1E7: texto 13 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (59 bytes)
;   0xb1e7..0xb222  (59 bytes)
DATA_texto_B1E7:
	defb 000h,037h,07ah,06dh,07eh,083h,05dh,039h,075h,079h,07ah,07eh,087h,08fh,033h,07bh	; b1e7  .7zm~.]9uyz~..3{
	defb 094h,07fh,079h,086h,079h,07ch,032h,038h,0feh,002h,037h,05bh,046h,032h,05dh,039h	; b1f7  ..y.y|28..7[F2]9
	defb 075h,079h,07ah,07eh,087h,062h,0bfh,0c2h,045h,048h,05eh,068h,032h,038h,0feh,007h	; b207  uyz~.b..EH^h28..
	defb 037h,07ah,070h,094h,07dh,034h,072h,090h,035h,038h,0ffh	; b217  7zp.}4r.58.

; ----------------------------------------------------------------------
; DATOS texto_B222: texto 14 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (60 bytes)
;   0xb222..0xb25e  (60 bytes)
DATA_texto_B222:
	defb 002h,037h,03dh,061h,064h,035h,000h,03ch,064h,04ah,03ch,0ech,065h,03fh,044h,064h	; b222  .7=ad5.<dJ<.e?Dd
	defb 04ah,063h,069h,035h,035h,038h,0feh,007h,037h,07ch,070h,09ah,090h,0a0h,07ah,035h	; b232  Jci558..7|p...z5
	defb 035h,0feh,000h,05dh,039h,075h,079h,07ah,07eh,087h,099h,033h,084h,073h,070h,078h	; b242  5..]9uyz~..3.spx
	defb 08ch,07eh,079h,086h,070h,086h,079h,07ch,035h,035h,038h,0ffh	; b252  .~y.p.y|558.

; ----------------------------------------------------------------------
; DATOS texto_B25E: texto 15 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (50 bytes)
;   0xb25e..0xb290  (50 bytes)
DATA_texto_B25E:
	defb 007h,0d0h,0d1h,065h,033h,03fh,041h,04ah,035h,035h,0feh,004h,0ech,0d2h,040h,050h	; b25e  ...e3?AJ55....@P
	defb 05bh,064h,04dh,033h,05dh,039h,075h,079h,07ah,07eh,087h,065h,033h,0feh,003h,084h	; b26e  [dM3]9uyz~.e3...
	defb 073h,070h,045h,05fh,04dh,046h,055h,064h,04ah,052h,069h,034h,034h,034h,034h,034h	; b27e  spE_MFUdJRi44444
	defb 034h,0ffh	; b28e

; ----------------------------------------------------------------------
; DATOS texto_B290: texto 16 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (98 bytes)
;   0xb290..0xb2f2  (98 bytes)
DATA_texto_B290:
	defb 006h,037h,084h,094h,084h,094h,084h,094h,034h,034h,034h,034h,038h,0feh,007h,098h	; b290  .7......44448...
	defb 092h,083h,087h,06ah,03bh,05eh,035h,035h,0fdh,001h,08ah,039h,09ch,0d3h,0d4h,050h	; b2a0  ...j.^55...9...P
	defb 033h,054h,060h,06eh,045h,05fh,04ah,053h,067h,052h,098h,092h,083h,087h,065h,033h	; b2b0  3T`nE_JSgR....e3
	defb 0feh,007h,0f5h,041h,04dh,03ch,04ah,052h,06ah,03bh,05eh,035h,035h,0feh,002h,046h	; b2c0  ...AM<JRj.^55..F
	defb 040h,058h,033h,078h,08ah,086h,090h,09fh,0c4h,0d5h,0d6h,0d7h,04eh,046h,04dh,034h	; b2d0  @X3x........NFM4
	defb 034h,034h,034h,0fdh,006h,03fh,049h,05eh,06dh,046h,033h,098h,092h,083h,087h,035h	; b2e0  444..?I^mF3....5
	defb 035h,0ffh	; b2f0

; ----------------------------------------------------------------------
; DATOS texto_B2F2: texto 17 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (40 bytes)
;   0xb2f2..0xb31a  (40 bytes)
DATA_texto_B2F2:
	defb 003h,034h,034h,034h,0d8h,03ch,04bh,06bh,033h,0d9h,03ch,0f6h,046h,04dh,054h,046h	; b2f2  .444.<Kk3.<.FMTF
	defb 03ch,0feh,002h,0dah,065h,0bch,0bdh,072h,0a0h,096h,094h,07bh,071h,07ah,06ah,0c6h	; b302  <...e..r...{qzj.
	defb 04ah,0eeh,052h,0efh,0f0h,062h,032h,0ffh	; b312  J.R..b2.

; ----------------------------------------------------------------------
; DATOS texto_B31A: texto 18 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (54 bytes)
;   0xb31a..0xb350  (54 bytes)
DATA_texto_B31A:
	defb 003h,0f7h,052h,0f3h,0f4h,04eh,053h,033h,098h,092h,083h,087h,052h,044h,04eh,06ah	; b31a  ..R..NS3....RDNj
	defb 03bh,05eh,032h,0feh,006h,046h,040h,046h,01ah,029h,030h,02ah,02bh,018h,023h,04eh	; b32a  .^2..F@F.)0*+.#N
	defb 053h,0feh,003h,03ch,064h,04ah,03ch,0ech,062h,045h,047h,052h,06ah,03bh,060h,03dh	; b33a  S..<dJ<.bEGRj.`=
	defb 040h,034h,034h,034h,034h,0ffh	; b34a

; ----------------------------------------------------------------------
; DATOS texto_B350: texto 19 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (44 bytes)
;   0xb350..0xb37c  (44 bytes)
DATA_texto_B350:
	defb 003h,037h,09dh,08dh,07ah,034h,085h,093h,039h,07ah,065h,033h,041h,03eh,04dh,05ah	; b350  .7..z4..9ze3A>MZ
	defb 042h,035h,038h,0feh,008h,037h,059h,064h,04ah,068h,035h,035h,038h,0feh,006h,030h	; b360  B58..7YdJh558..0
	defb 026h,02ch,000h,024h,018h,01bh,01ch,000h,020h,02bh,035h,0ffh	; b370  &,.$.... +5.

; ----------------------------------------------------------------------
; DATOS texto_B37C: texto 20 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (59 bytes)
;   0xb37c..0xb3b7  (59 bytes)
DATA_texto_B37C:
	defb 009h,044h,03dh,046h,04dh,033h,0feh,001h,0fch,050h,05bh,064h,04dh,033h,0feh,005h	; b37c  .D=FM3...P[dM3..
	defb 079h,039h,0a1h,05dh,039h,075h,0bfh,0c0h,053h,0e6h,0e7h,046h,04ah,032h,0fdh,00ah	; b38c  y9.]9u..S..FJ2..
	defb 049h,046h,04dh,033h,0feh,002h,0bch,0bdh,08ah,07eh,091h,07ah,050h,0c5h,0beh,065h	; b39c  IFM3.....~.zP..e
	defb 03fh,04eh,067h,05fh,05eh,034h,034h,034h,034h,034h,0ffh	; b3ac  ?Ng_^44444.

; ----------------------------------------------------------------------
; DATOS texto_B3B7: texto 21 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (45 bytes)
;   0xb3b7..0xb3e4  (45 bytes)
DATA_texto_B3B7:
	defb 004h,01ah,026h,025h,01eh,029h,018h,02bh,02ch,029h,018h,02bh,020h,026h,025h,035h	; b3b7  ..&%.).+,).+ &%5
	defb 0feh,000h,030h,026h,02ch,000h,018h,029h,01ch,000h,01eh,029h,01ch,018h,02bh,000h	; b3c7  ..0&,..)...)..+.
	defb 02ah,02bh,018h,029h,000h,01dh,020h,01eh,01fh,02bh,01ch,029h,0ffh	; b3d7  *+.).. ..+.).

; ----------------------------------------------------------------------
; DATOS texto_B3E4: texto 10 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (75 bytes)
;   0xb3e4..0xb42f  (75 bytes)
DATA_texto_B3E4:
	defb 005h,037h,018h,023h,01ch,02fh,033h,044h,044h,053h,06bh,044h,069h,035h,036h,038h	; b3e4  .7.#./3DDSkDi568
	defb 0feh,004h,037h,0c2h,0c3h,08ah,07eh,091h,07ah,0c4h,0c5h,083h,0bbh,0f8h,0c7h,0c8h	; b3f4  ..7...~.z.......
	defb 0a0h,07ah,032h,038h,0feh,000h,037h,0a3h,08ch,039h,07fh,065h,03bh,05eh,068h,035h	; b404  .z28..7..9.e.^h5
	defb 000h,031h,026h,026h,024h,046h,04dh,046h,05ch,06dh,05bh,03dh,034h,038h,0feh,008h	; b414  .1&&$FMF\m[=48..
	defb 037h,031h,026h,026h,024h,079h,086h,07ah,032h,038h,0ffh	; b424  71&&$y.z28.

; ----------------------------------------------------------------------
; DATOS texto_B42F: texto 11 de la tabla 0xB002 (japonesa): [columna] y
;   letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el
;   nombre del jugador (p10:954D); lo leen p10:94BA (135 bytes)
;   0xb42f..0xb4b6  (135 bytes)
DATA_texto_B42F:
	defb 002h,037h,07ch,070h,09ah,090h,0a0h,07ah,033h,0c7h,0c8h,099h,0c9h,08ch,0cah,088h	; b42f  .7|p...z3.......
	defb 086h,079h,07ch,035h,038h,0feh,00ah,037h,0cch,0f6h,069h,035h,035h,038h,0feh,007h	; b43f  .y|58..7..i558..
	defb 037h,0ech,069h,036h,000h,03bh,052h,0cdh,053h,032h,038h,0feh,003h,037h,089h,079h	; b44f  7.i6..R.S28..7.y
	defb 073h,079h,07eh,034h,034h,034h,01ah,029h,030h,02ah,02bh,018h,023h,0a0h,084h,033h	; b45f  sy~444.)0*+.#..3
	defb 0feh,007h,080h,070h,0a0h,079h,097h,071h,073h,034h,034h,034h,035h,038h,0feh,00ah	; b46f  ...p.y.qs44458..
	defb 037h,059h,064h,04ah,068h,035h,0feh,002h,055h,045h,046h,042h,01ah,029h,030h,02ah	; b47f  7YdJh5..UEFB.)0*
	defb 02bh,018h,023h,034h,019h,029h,01ch,01ch,031h,01ch,069h,035h,038h,0feh,001h,037h	; b48f  +.#4.)..1.i58..7
	defb 01ah,029h,030h,02ah,02bh,018h,023h,034h,019h,029h,01ch,01ch,031h,01ch,08fh,0cbh	; b49f  .)0*+.#4.)..1...
	defb 0c6h,079h,086h,07ah,032h,038h,0ffh	; b4af

; ----------------------------------------------------------------------
; DATOS textos_B4B6: 22 punteros a los textos (version inglesa, por el byte
;   0x002B de la BIOS en p10:944C): p00:4E31 con A; lo leen p10:9456 (44
;   bytes)
;   0xb4b6..0xb4e2  (44 bytes)
DATA_textos_B4B6:
	defw 0b02eh,0b4e2h,0b723h,0b723h,0b503h,0b525h,0b0e6h,0b0fdh	; b4b6
	defw 0b121h,0b55fh,0b5c3h,0b5dch,0b581h,0b5fch,0b63eh,0b723h	; b4c6
	defw 0b654h,0b6a1h,0b723h,0b6cah,0b6fbh,0b3b7h	; b4d6

; ----------------------------------------------------------------------
; DATOS texto_B4E2: texto 1 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (33 bytes)
;   0xb4e2..0xb503  (33 bytes)
DATA_texto_B4E2:
	defb 003h,037h,018h,000h,02eh,018h,029h,025h,020h,025h,01eh,000h,02ah,020h,01eh,025h	; b4e2  .7....)% %..* .%
	defb 018h,023h,0feh,007h,01dh,029h,026h,024h,000h,023h,018h,02bh,020h,02ah,032h,038h	; b4f2  .#...)&$.#.+ *28
	defb 0ffh	; b502

; ----------------------------------------------------------------------
; DATOS texto_B503: texto 4 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (34 bytes)
;   0xb503..0xb525  (34 bytes)
DATA_texto_B503:
	defb 001h,037h,031h,01ch,023h,026h,02ah,039h,01dh,026h,029h,01ah,01ch,000h,02ah,02ch	; b503  .71.#&*9.&)...*,
	defb 029h,029h,026h,02ch,025h,01bh,020h,025h,01eh,0feh,009h,023h,018h,02bh,020h,02ah	; b513  ))&,%. %...#.+ *
	defb 038h,0ffh	; b523

; ----------------------------------------------------------------------
; DATOS texto_B525: texto 5 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (58 bytes)
;   0xb525..0xb55f  (58 bytes)
DATA_texto_B525:
	defb 003h,037h,019h,020h,01eh,020h,025h,000h,01ah,029h,02ch,02ah,01fh,039h,019h,023h	; b525  .7. . %..),*.9.#
	defb 026h,02eh,0feh,000h,026h,027h,01ch,029h,018h,02bh,020h,026h,025h,02ah,035h,000h	; b535  &...&'.).+ &%*5.
	defb 02ah,027h,018h,01ah,01ch,000h,01dh,026h,029h,01ah,01ch,035h,035h,0feh,007h,01eh	; b545  *'.....&)..55...
	defb 01ch,02bh,000h,02ah,01ch,02bh,035h,035h,038h,0ffh	; b555  .+.*.+558.

; ----------------------------------------------------------------------
; DATOS texto_B55F: texto 9 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (34 bytes)
;   0xb55f..0xb581  (34 bytes)
DATA_texto_B55F:
	defb 000h,037h,01ah,018h,025h,000h,02bh,01fh,01ch,030h,000h,029h,01ch,02ah,01ah,02ch	; b55f  .7..%.+..0.).*.,
	defb 01ch,000h,027h,023h,018h,025h,01ch,02bh,0feh,009h,023h,018h,02bh,020h,02ah,036h	; b56f  ..'#.%.+..#.+ *6
	defb 038h,0ffh	; b57f

; ----------------------------------------------------------------------
; DATOS texto_B581: texto 12 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (66 bytes)
;   0xb581..0xb5c3  (66 bytes)
DATA_texto_B581:
	defb 002h,037h,018h,02ah,02ah,01ch,02ah,02ah,000h,018h,029h,024h,02ah,000h,02ah,02ch	; b581  .7.**.**..)$*.*,
	defb 027h,027h,023h,030h,0feh,008h,02ah,020h,02bh,02ch,018h,02bh,020h,026h,025h,0feh	; b591  ''#0..* +,.+ &%.
	defb 006h,02bh,01fh,01ch,025h,000h,01bh,020h,01ah,020h,01bh,01ch,0feh,003h,02eh,020h	; b5a1  .+..%.. . .....
	defb 02bh,01fh,020h,025h,000h,02bh,020h,024h,01ch,000h,023h,020h,024h,020h,02bh,032h	; b5b1  +. %.+ $..# $ +2
	defb 038h,0ffh	; b5c1

; ----------------------------------------------------------------------
; DATOS texto_B5C3: texto 10 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (25 bytes)
;   0xb5c3..0xb5dc  (25 bytes)
DATA_texto_B5C3:
	defb 000h,020h,025h,000h,02bh,01fh,01ch,000h,029h,02ch,020h,025h,000h,026h,01dh,000h	; b5c3  . %.+...), %.&..
	defb 023h,018h,02bh,020h,02ah,034h,034h,034h,0ffh	; b5d3  #.+ *444.

; ----------------------------------------------------------------------
; DATOS texto_B5DC: texto 11 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (32 bytes)
;   0xb5dc..0xb5fc  (32 bytes)
DATA_texto_B5DC:
	defb 006h,030h,026h,02ch,000h,01fh,018h,02dh,01ch,000h,01eh,026h,02bh,0feh,004h,018h	; b5dc  .0&,...-...&+...
	defb 000h,01ah,029h,030h,02ah,02bh,018h,023h,000h,019h,029h,01ch,01ch,031h,01ch,0ffh	; b5ec  ..)0*+.#..)..1..

; ----------------------------------------------------------------------
; DATOS texto_B5FC: texto 13 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (66 bytes)
;   0xb5fc..0xb63e  (66 bytes)
DATA_texto_B5FC:
	defb 002h,037h,02eh,01ch,000h,01fh,018h,02dh,01ch,000h,02ah,01ch,02bh,000h,018h,023h	; b5fc  .7.....-..*.+..#
	defb 023h,000h,026h,01dh,0feh,000h,02bh,01fh,01ch,000h,01ah,029h,02ch,02ah,01fh,000h	; b60c  #.&...+....),*..
	defb 019h,023h,026h,02eh,000h,02ah,030h,02ah,02bh,01ch,024h,02ah,032h,038h,0fdh,004h	; b61c  .#&..*0*+.$*28..
	defb 037h,026h,022h,033h,000h,02ah,02eh,020h,02bh,01ah,01fh,000h,026h,025h,035h,035h	; b62c  7&"3.*. +...&%55
	defb 038h,0ffh	; b63c

; ----------------------------------------------------------------------
; DATOS texto_B63E: texto 14 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (22 bytes)
;   0xb63e..0xb654  (22 bytes)
DATA_texto_B63E:
	defb 002h,037h,02eh,01fh,018h,02bh,000h,020h,02ah,000h,01fh,018h,027h,027h,01ch,025h	; b63e  .7...+. *...''.%
	defb 01ch,01bh,035h,036h,038h,0ffh	; b64e

; ----------------------------------------------------------------------
; DATOS texto_B654: texto 16 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (77 bytes)
;   0xb654..0xb6a1  (77 bytes)
DATA_texto_B654:
	defb 005h,037h,01fh,018h,032h,032h,01fh,018h,032h,032h,01fh,018h,032h,032h,038h,0feh	; b654  .7..22..22..228.
	defb 005h,037h,020h,02bh,000h,020h,02ah,000h,02dh,01ch,025h,026h,024h,035h,035h,0feh	; b664  .7 +. *.-.%&$55.
	defb 001h,01fh,01ch,000h,01bh,020h,01ch,01bh,000h,026h,025h,01ah,01ch,033h,019h,02ch	; b674  ..... ...&%..3.,
	defb 02bh,000h,01fh,01ch,000h,020h,02ah,0feh,003h,025h,026h,02eh,000h,029h,01ch,020h	; b684  +.... *..%&..).
	defb 025h,01ah,018h,029h,025h,018h,02bh,01ch,01bh,035h,035h,038h,0ffh	; b694  %..)%.+..558.

; ----------------------------------------------------------------------
; DATOS texto_B6A1: texto 17 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (41 bytes)
;   0xb6a1..0xb6ca  (41 bytes)
DATA_texto_B6A1:
	defb 001h,037h,02eh,018h,020h,02bh,035h,000h,027h,023h,01ch,018h,02ah,01ch,000h,029h	; b6a1  .7.. +5.'#..*..)
	defb 01ch,024h,01ch,024h,019h,01ch,029h,0feh,004h,02bh,01fh,01ch,000h,027h,029h,01ch	; b6b1  .$.$..)..+...').
	defb 01bh,020h,01ah,02bh,020h,026h,025h,038h,0ffh	; b6c1  . .+ &%8.

; ----------------------------------------------------------------------
; DATOS texto_B6CA: texto 19 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (49 bytes)
;   0xb6ca..0xb6fb  (49 bytes)
DATA_texto_B6CA:
	defb 004h,037h,031h,01ch,023h,026h,02ah,000h,01dh,026h,029h,01ah,01ch,000h,01fh,018h	; b6ca  .71.#&*..&).....
	defb 02ah,0feh,005h,01bh,020h,02ah,018h,027h,027h,01ch,018h,029h,01ch,01bh,035h,035h	; b6da  *... *.''..)..55
	defb 038h,0feh,006h,030h,026h,02ch,000h,024h,018h,01bh,01ch,000h,020h,02bh,035h,035h	; b6ea  8..0&,.$.... +55
	defb 0ffh	; b6fa

; ----------------------------------------------------------------------
; DATOS texto_B6FB: texto 20 de la tabla 0xB4B6 (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (40 bytes)
;   0xb6fb..0xb723  (40 bytes)
DATA_texto_B6FB:
	defb 000h,034h,034h,034h,027h,01ch,018h,01ah,01ch,000h,02eh,020h,023h,023h,000h,029h	; b6fb  .444'...... ##.)
	defb 01ch,02bh,02ch,029h,025h,000h,02bh,026h,0feh,005h,023h,018h,02bh,020h,02ah,000h	; b70b  .+,)%.+&..#.+ *.
	defb 018h,01eh,018h,020h,025h,035h,035h,0ffh	; b71b  ... %55.

; ----------------------------------------------------------------------
; DATOS texto_B723: texto 2, 3, 15, 18 de la tabla 0xB4B6 (inglesa): [columna]
;   y letras; 0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete
;   el nombre del jugador (p10:954D); lo leen p10:94BA (2 bytes)
;   0xb723..0xb725  (2 bytes)
DATA_texto_B723:
	defb 000h,0ffh	; b723

; ----------------------------------------------------------------------
; DATOS textos_B725: 6 punteros a los textos (version japonesa, por el byte
;   0x002B de la BIOS en p10:944C): p00:4E31 con A; lo leen p10:9461 (12
;   bytes)
;   0xb725..0xb731  (12 bytes)
DATA_textos_B725:
	defw 0b731h,0b770h,0b874h,0b81fh,0b7afh,0b8cah	; b725

; ----------------------------------------------------------------------
; DATOS texto_B731: texto 0 de la tabla 0xB725 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (63 bytes)
;   0xb731..0xb770  (63 bytes)
DATA_texto_B731:
	defb 001h,0a4h,0a5h,0a6h,0a7h,0a8h,0a9h,0feh,001h,0aah,0feh,000h,0b3h,085h,082h,080h	; b731  ................
	defb 086h,088h,08bh,0feh,001h,081h,084h,09bh,09eh,08ah,087h,0feh,001h,083h,09ah,09ch	; b741  ................
	defb 09dh,0a1h,089h,0feh,001h,08fh,098h,09fh,0a0h,0a2h,095h,0feh,001h,08dh,090h,099h	; b751  ................
	defb 0a3h,096h,093h,0feh,001h,091h,08eh,08ch,092h,094h,097h,0feh,005h,0b4h,0ffh	; b761  ...............

; ----------------------------------------------------------------------
; DATOS texto_B770: texto 1 de la tabla 0xB725 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (63 bytes)
;   0xb770..0xb7af  (63 bytes)
DATA_texto_B770:
	defb 003h,0c1h,0c2h,0feh,002h,0c3h,0c4h,0c5h,0c6h,0feh,002h,0c7h,0c8h,0c9h,0cah,0feh	; b770  ................
	defb 001h,0cbh,0cch,0cdh,0ceh,0cfh,0d0h,0d1h,0feh,001h,0d2h,0d3h,0d4h,0d5h,0d6h,0d7h	; b780  ................
	defb 0d8h,0feh,000h,0d9h,0dah,0dbh,0dch,0ddh,0deh,0dfh,0e0h,0feh,000h,0e1h,0e2h,0e3h	; b790  ................
	defb 0e4h,0e5h,0e6h,0e7h,0e8h,0feh,001h,0e9h,0eah,0ebh,0ech,0edh,0eeh,0efh,0ffh	; b7a0  ...............

; ----------------------------------------------------------------------
; DATOS texto_B7AF: texto 4 de la tabla 0xB725 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (112 bytes)
;   0xb7af..0xb81f  (112 bytes)
DATA_texto_B7AF:
	defb 007h,039h,0eeh,052h,0efh,0f0h,000h,0f1h,010h,0f2h,039h,0feh,000h,0feh,005h,0ach	; b7af  .9.R......9.....
	defb 0adh,04fh,0aeh,05bh,05dh,0f6h,06ah,046h,0f3h,0f4h,052h,0afh,053h,033h,0feh,000h	; b7bf  .O.[].jF..R.S3..
	defb 0feh,005h,053h,065h,051h,052h,0b0h,050h,05bh,05dh,0b1h,05ch,05fh,04ah,05dh,032h	; b7cf  ..SeQR.P[].\_J]2
	defb 0feh,000h,0feh,003h,053h,065h,051h,052h,0b0h,053h,033h,000h,000h,000h,040h,065h	; b7df  ....SeQR.S3...@e
	defb 059h,042h,0b7h,050h,05bh,05dh,033h,0feh,000h,0feh,007h,04ch,042h,05ch,05fh,046h	; b7ef  YB.P[]3....LB\_F
	defb 058h,052h,04fh,05dh,032h,0feh,000h,0feh,002h,0b7h,062h,0b8h,048h,06ch,033h,047h	; b7ff  XRO]2.....b.Hl3G
	defb 04fh,061h,04bh,033h,053h,065h,051h,052h,0b0h,053h,041h,03eh,05ah,042h,032h,0ffh	; b80f  OaK3SeQR.SA>ZB2.

; ----------------------------------------------------------------------
; DATOS texto_B81F: texto 3 de la tabla 0xB725 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (85 bytes)
;   0xb81f..0xb874  (85 bytes)
DATA_texto_B81F:
	defb 007h,039h,0eeh,052h,0efh,0f0h,000h,0f1h,011h,0f2h,039h,0feh,000h,0feh,007h,0b9h	; b81f  .9.R......9.....
	defb 05dh,042h,05eh,0ach,0adh,04fh,0b0h,053h,033h,0feh,000h,0feh,005h,0bbh,05bh,05dh	; b82f  ]B^..O.S3.....[]
	defb 0f5h,055h,05fh,0f6h,06ah,04dh,0bch,05ch,062h,03fh,049h,03dh,032h,0feh,000h,0feh	; b83f  .U_.jM.\b?I=2...
	defb 002h,0bdh,052h,05bh,060h,03ch,062h,0beh,05eh,073h,053h,033h,000h,000h,000h,040h	; b84f  ..R[`<b.^sS3...@
	defb 065h,059h,042h,0aeh,050h,033h,0feh,000h,0feh,007h,0bfh,057h,05ch,05fh,046h,058h	; b85f  eYB.P3.....W\_FX
	defb 052h,04fh,05dh,032h,0ffh	; b86f

; ----------------------------------------------------------------------
; DATOS texto_B874: texto 2 de la tabla 0xB725 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (86 bytes)
;   0xb874..0xb8ca  (86 bytes)
DATA_texto_B874:
	defb 007h,039h,0eeh,052h,0efh,0f0h,000h,0f1h,012h,0f2h,039h,0feh,000h,0feh,005h,0bbh	; b874  .9.R......9.....
	defb 05bh,05dh,0edh,061h,05fh,0f6h,06ah,046h,0ach,0adh,04fh,0f3h,0f4h,053h,033h,0feh	; b884  [].a_.jF..O..S3.
	defb 000h,0feh,002h,0f4h,052h,085h,093h,039h,07ah,050h,05bh,05dh,03bh,05ch,05ah,05eh	; b894  ....R..9zP[].\Z^
	defb 073h,062h,0c0h,066h,044h,057h,05eh,032h,0feh,000h,0feh,000h,0f4h,052h,085h,093h	; b8a4  sb.fDW^2.....R..
	defb 039h,07ah,053h,033h,000h,000h,000h,040h,065h,059h,042h,0b7h,050h,0c1h,05dh,046h	; b8b4  9zS3...@eYB.P.]F
	defb 058h,052h,04fh,05dh,032h,0ffh	; b8c4

; ----------------------------------------------------------------------
; DATOS texto_B8CA: texto 5 de la tabla 0xB725 (japonesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (64 bytes)
;   0xb8ca..0xb90a  (64 bytes)
DATA_texto_B8CA:
	defb 006h,039h,0eeh,052h,0efh,0f0h,000h,0f1h,0dbh,0f2h,039h,0feh,000h,0feh,006h,0dbh	; b8ca  .9.R......9.....
	defb 04ch,052h,0dch,062h,0ddh,04ch,0f7h,052h,0f3h,0f4h,053h,033h,0feh,000h,0feh,004h	; b8da  LR.b.L.R..S3....
	defb 0deh,0dfh,052h,01ah,029h,030h,02ah,02bh,018h,023h,050h,05bh,064h,04dh,052h,056h	; b8ea  ..R.)0*+.#P[dMRV
	defb 0feh,000h,0feh,006h,054h,060h,06eh,047h,044h,04eh,065h,06ah,041h,05eh,032h,0ffh	; b8fa  ....T`nGDNejA^2.

; ----------------------------------------------------------------------
; DATOS textos_B90A: 6 punteros a los textos (version inglesa, por el byte
;   0x002B de la BIOS en p10:944C): p00:4E31 con A; lo leen p10:9466 (12
;   bytes)
;   0xb90a..0xb916  (12 bytes)
DATA_textos_B90A:
	defw 0b731h,0b770h,0ba85h,0b9d7h,0b916h,0bb08h	; b90a

; ----------------------------------------------------------------------
; DATOS texto_B916: texto 4 de la tabla 0xB90A (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (193 bytes)
;   0xb916..0xb9d7  (193 bytes)
DATA_texto_B916:
	defb 000h,02bh,01fh,01ch,000h,027h,029h,01ch,01bh,020h,01ah,02bh,020h,026h,025h,000h	; b916  .+...').. .+ &%.
	defb 000h,000h,01ah,01fh,018h,027h,02bh,01ch,029h,000h,010h,0feh,000h,0feh,002h,037h	; b926  .....'+.)......7
	defb 02bh,01fh,01ch,000h,01bh,01ch,02dh,020h,023h,000h,01ah,018h,024h,01ch,000h,01dh	; b936  +.....- #...$...
	defb 029h,026h,024h,0feh,000h,0feh,000h,02bh,01fh,01ch,000h,01fh,02ch,01eh,01ch,000h	; b946  )&$....+....,...
	defb 02ah,027h,01fh,01ch,029h,01ch,000h,018h,025h,01bh,000h,01fh,01ch,000h,02eh,018h	; b956  *'..)...%.......
	defb 02ah,0feh,000h,0feh,007h,027h,029h,026h,02bh,01ch,01ah,02bh,01ch,01bh,000h,019h	; b966  *....')&+..+....
	defb 030h,0feh,000h,0feh,005h,018h,000h,01ah,026h,027h,027h,01ch,029h,000h,02ah,01fh	; b976  0.......&''.).*.
	defb 020h,01ch,023h,01bh,032h,0feh,000h,0feh,002h,020h,01dh,000h,02bh,01fh,01ch,000h	; b986   .#.2.... ..+...
	defb 000h,000h,000h,000h,000h,000h,000h,025h,02ch,01ah,023h,01ch,02ch,02ah,0feh,000h	; b996  .......%,.#.,*..
	defb 0feh,001h,020h,02ah,000h,01bh,01ch,02ah,02bh,029h,026h,030h,01ch,01bh,000h,02bh	; b9a6  .. *...*+)&0...+
	defb 01fh,01ch,000h,02ah,01fh,020h,01ch,023h,01bh,0feh,000h,0feh,003h,02eh,020h,023h	; b9b6  ...*. .#...... #
	defb 023h,000h,01bh,020h,02ah,018h,027h,027h,01ch,018h,029h,032h,032h,032h,032h,038h	; b9c6  #.. *.''..)22228
	defb 0ffh	; b9d6

; ----------------------------------------------------------------------
; DATOS texto_B9D7: texto 3 de la tabla 0xB90A (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (174 bytes)
;   0xb9d7..0xba85  (174 bytes)
DATA_texto_B9D7:
	defb 000h,02bh,01fh,01ch,000h,027h,029h,01ch,01bh,020h,01ah,02bh,020h,026h,025h,000h	; b9d7  .+...').. .+ &%.
	defb 000h,000h,01ah,01fh,018h,027h,02bh,01ch,029h,000h,011h,0feh,000h,0feh,000h,037h	; b9e7  .....'+.)......7
	defb 02bh,01fh,01ch,000h,01fh,02ch,01eh,01ch,000h,02ah,027h,01fh,01ch,029h,01ch,000h	; b9f7  +....,...*'..)..
	defb 02eh,020h,023h,023h,000h,01ah,026h,024h,01ch,0feh,000h,0feh,004h,01dh,029h,026h	; ba07  . ##..&$......)&
	defb 024h,000h,02bh,01fh,01ch,000h,01eh,029h,026h,02ch,025h,01bh,0feh,000h,0feh,002h	; ba17  $.+....)&,%.....
	defb 018h,025h,01bh,000h,018h,02bh,02bh,018h,01ah,022h,000h,01ch,02dh,01ch,029h,030h	; ba27  .%...++.."..-.)0
	defb 026h,025h,01ch,032h,0feh,000h,0feh,000h,02bh,01fh,01ch,000h,02ah,01fh,020h,025h	; ba37  &%.2....+...*. %
	defb 020h,025h,01eh,000h,000h,000h,000h,000h,000h,000h,000h,019h,018h,023h,023h,0feh	; ba47   %...........##.
	defb 000h,0feh,000h,01fh,018h,02ah,000h,02bh,01fh,01ch,000h,027h,026h,02eh,01ch,029h	; ba57  .....*.+...'&..)
	defb 000h,02bh,026h,000h,01ah,026h,025h,02bh,029h,026h,023h,0feh,000h,0feh,005h,02bh	; ba67  .+&..&%+)&#....+
	defb 01fh,01ch,000h,018h,029h,024h,026h,029h,032h,032h,032h,032h,038h,0ffh	; ba77  ....)$&)22228.

; ----------------------------------------------------------------------
; DATOS texto_BA85: texto 2 de la tabla 0xB90A (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (131 bytes)
;   0xba85..0xbb08  (131 bytes)
DATA_texto_BA85:
	defb 000h,02bh,01fh,01ch,000h,027h,029h,01ch,01bh,020h,01ah,02bh,020h,026h,025h,000h	; ba85  .+...').. .+ &%.
	defb 000h,000h,01ah,01fh,018h,027h,02bh,01ch,029h,000h,012h,0feh,000h,0feh,002h,037h	; ba95  .....'+.)......7
	defb 02bh,01fh,01ch,000h,01eh,029h,01ch,018h,02bh,000h,01bh,01ch,02dh,020h,023h,000h	; baa5  +....)..+...- #.
	defb 01ah,018h,024h,01ch,0feh,000h,0feh,003h,01dh,029h,026h,024h,000h,02bh,01fh,01ch	; bab5  ..$......)&$.+..
	defb 000h,01eh,029h,026h,02ch,025h,01bh,032h,032h,032h,032h,0feh,000h,0feh,001h,01fh	; bac5  ..)&,%.2222.....
	defb 020h,02ah,000h,02eh,020h,01ah,022h,01ch,01bh,000h,027h,026h,02eh,01ch,029h,000h	; bad5   *.. ."...'&..).
	defb 01bh,02eh,01ch,023h,023h,02ah,0feh,000h,0feh,001h,020h,025h,000h,018h,000h,000h	; bae5  ...##*.... %....
	defb 000h,000h,000h,000h,000h,000h,025h,02ch,01ah,023h,01ch,02ch,02ah,032h,032h,032h	; baf5  ......%,.#.,*222
	defb 032h,038h,0ffh	; bb05

; ----------------------------------------------------------------------
; DATOS texto_BB08: texto 5 de la tabla 0xB90A (inglesa): [columna] y letras;
;   0xFF acaba, 0xFE/0xFD [columna] linea o pagina nueva, 0xFC mete el nombre
;   del jugador (p10:954D); lo leen p10:94BA (103 bytes)
;   0xbb08..0xbb6f  (103 bytes)
DATA_texto_BB08:
	defb 000h,02bh,01fh,01ch,000h,027h,029h,01ch,01bh,020h,01ah,02bh,020h,026h,025h,000h	; bb08  .+...').. .+ &%.
	defb 000h,000h,01ah,01fh,018h,027h,02bh,01ch,029h,000h,013h,0feh,000h,0feh,000h,037h	; bb18  .....'+.)......7
	defb 02bh,01fh,01ch,000h,01dh,020h,02dh,01ch,000h,01ch,030h,01ch,01bh,000h,01eh,029h	; bb28  +.... -...0....)
	defb 01ch,01ch,025h,000h,01bh,01ch,02dh,020h,023h,0feh,000h,0feh,003h,01ah,018h,025h	; bb38  ..%...- #......%
	defb 000h,019h,01ch,000h,022h,020h,023h,023h,01ch,01bh,000h,026h,025h,023h,030h,0feh	; bb48  ...." ##...&%#0.
	defb 000h,0feh,002h,019h,030h,000h,02bh,01fh,01ch,000h,01ah,029h,030h,02ah,02bh,018h	; bb58  ....0.+....)0*+.
	defb 023h,032h,032h,032h,032h,038h,0ffh	; bb68

; ----------------------------------------------------------------------
; DATOS ventanas_BB6F: 9 punteros a cabeceras de ventana que p10:95BD elige
;   con A (p00:4E28; p10:82BF); lo leen p10:82C2 (18 bytes)
;   0xbb6f..0xbb81  (18 bytes)
DATA_ventanas_BB6F:
	defw 0bb81h,0bb88h,0bb8fh,0bb96h,0bb9dh,0bba4h,0bbabh,0bbb2h,0bbb9h	; bb6f

; ----------------------------------------------------------------------
; DATOS ventana_BB81: cabecera de ventana 0 de 0xBB6F: [modo][fila][1
;   filas][26 columnas][?][datos 0xBBC0] que p10:95C1 copia a 0xEE10; lo leen
;   p10:95BD (7 bytes)
;   0xbb81..0xbb88  (7 bytes)
DATA_ventana_BB81:
	defb 001h,007h,001h,01ah,01ch,0c0h,0bbh	; bb81

; ----------------------------------------------------------------------
; DATOS ventana_BB88: cabecera de ventana 1 de 0xBB6F: [modo][fila][1
;   filas][26 columnas][?][datos 0xBBDA] que p10:95C1 copia a 0xEE10; lo leen
;   p10:95BD (7 bytes)
;   0xbb88..0xbb8f  (7 bytes)
DATA_ventana_BB88:
	defb 000h,008h,001h,01ah,01ch,0dah,0bbh	; bb88

; ----------------------------------------------------------------------
; DATOS ventana_BB8F: cabecera de ventana 2 de 0xBB6F: [modo][fila][1
;   filas][26 columnas][?][datos 0xBBF4] que p10:95C1 copia a 0xEE10; lo leen
;   p10:95BD (7 bytes)
;   0xbb8f..0xbb96  (7 bytes)
DATA_ventana_BB8F:
	defb 001h,009h,001h,01ah,01ch,0f4h,0bbh	; bb8f

; ----------------------------------------------------------------------
; DATOS ventana_BB96: cabecera de ventana 3 de 0xBB6F: [modo][fila][1
;   filas][26 columnas][?][datos 0xBC0E] que p10:95C1 copia a 0xEE10; lo leen
;   p10:95BD (7 bytes)
;   0xbb96..0xbb9d  (7 bytes)
DATA_ventana_BB96:
	defb 000h,00ah,001h,01ah,01ch,00eh,0bch	; bb96

; ----------------------------------------------------------------------
; DATOS ventana_BB9D: cabecera de ventana 4 de 0xBB6F: [modo][fila][1
;   filas][26 columnas][?][datos 0xBC28] que p10:95C1 copia a 0xEE10; lo leen
;   p10:95BD (7 bytes)
;   0xbb9d..0xbba4  (7 bytes)
DATA_ventana_BB9D:
	defb 001h,00bh,001h,01ah,01ch,028h,0bch	; bb9d

; ----------------------------------------------------------------------
; DATOS ventana_BBA4: cabecera de ventana 5 de 0xBB6F: [modo][fila][1
;   filas][26 columnas][?][datos 0xBC42] que p10:95C1 copia a 0xEE10; lo leen
;   p10:95BD (7 bytes)
;   0xbba4..0xbbab  (7 bytes)
DATA_ventana_BBA4:
	defb 000h,00ch,001h,01ah,01ch,042h,0bch	; bba4

; ----------------------------------------------------------------------
; DATOS ventana_BBAB: cabecera de ventana 6 de 0xBB6F: [modo][fila][1
;   filas][26 columnas][?][datos 0xBC5C] que p10:95C1 copia a 0xEE10; lo leen
;   p10:95BD (7 bytes)
;   0xbbab..0xbbb2  (7 bytes)
DATA_ventana_BBAB:
	defb 001h,00dh,001h,01ah,01ch,05ch,0bch	; bbab

; ----------------------------------------------------------------------
; DATOS ventana_BBB2: cabecera de ventana 7 de 0xBB6F: [modo][fila][1
;   filas][26 columnas][?][datos 0xBC76] que p10:95C1 copia a 0xEE10; lo leen
;   p10:95BD (7 bytes)
;   0xbbb2..0xbbb9  (7 bytes)
DATA_ventana_BBB2:
	defb 000h,00fh,001h,01ah,01ch,076h,0bch	; bbb2

; ----------------------------------------------------------------------
; DATOS ventana_BBB9: cabecera de ventana 8 de 0xBB6F: [modo][fila][1
;   filas][26 columnas][?][datos 0xBC90] que p10:95C1 copia a 0xEE10; lo leen
;   p10:95BD (7 bytes)
;   0xbbb9..0xbbc0  (7 bytes)
DATA_ventana_BBB9:
	defb 001h,010h,001h,01ah,01ch,090h,0bch	; bbb9

; ----------------------------------------------------------------------
; DATOS ventana_datos_BBC0: 1 x 26 caracteres de la ventana de 0xBB81
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (26 bytes)
;   0xbbc0..0xbbda  (26 bytes)
DATA_ventana_datos_BBC0:
	defb 040h,041h,000h,042h,000h,000h,043h,044h,045h,046h,047h,000h,048h,049h,04ah,04bh,000h,000h,04ch,04dh,000h,04eh,000h,000h,000h,000h	; bbc0  @A.B..CDEFG.HIJK..LM.N....

; ----------------------------------------------------------------------
; DATOS ventana_datos_BBDA: 1 x 26 caracteres de la ventana de 0xBB88
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (26 bytes)
;   0xbbda..0xbbf4  (26 bytes)
DATA_ventana_datos_BBDA:
	defb 000h,000h,04fh,050h,051h,052h,053h,000h,054h,055h,056h,057h,058h,000h,059h,05ah,05bh,05ch,05dh,000h,05eh,05fh,060h,061h,062h,063h	; bbda  ..OPQRS.TUVWX.YZ[\].^_`abc

; ----------------------------------------------------------------------
; DATOS ventana_datos_BBF4: 1 x 26 caracteres de la ventana de 0xBB8F
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (26 bytes)
;   0xbbf4..0xbc0e  (26 bytes)
DATA_ventana_datos_BBF4:
	defb 064h,065h,066h,067h,068h,069h,06ah,06bh,06ch,06dh,06eh,000h,06fh,070h,071h,072h,073h,000h,074h,075h,076h,077h,078h,079h,000h,000h	; bbf4  defghijklmn.opqrs.tuvwxy..

; ----------------------------------------------------------------------
; DATOS ventana_datos_BC0E: 1 x 26 caracteres de la ventana de 0xBB96
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (26 bytes)
;   0xbc0e..0xbc28  (26 bytes)
DATA_ventana_datos_BC0E:
	defb 000h,000h,07ah,07bh,07ch,07dh,000h,000h,07eh,07fh,080h,081h,082h,000h,000h,083h,084h,085h,000h,000h,086h,087h,088h,089h,000h,08ah	; bc0e  ..z{|}..~.................

; ----------------------------------------------------------------------
; DATOS ventana_datos_BC28: 1 x 26 caracteres de la ventana de 0xBB9D
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (26 bytes)
;   0xbc28..0xbc42  (26 bytes)
DATA_ventana_datos_BC28:
	defb 08bh,08ch,08dh,000h,000h,08eh,08fh,090h,091h,092h,093h,094h,095h,096h,097h,098h,099h,09ah,09bh,000h,09ch,09dh,09eh,09fh,000h,000h	; bc28  ..........................

; ----------------------------------------------------------------------
; DATOS ventana_datos_BC42: 1 x 26 caracteres de la ventana de 0xBBA4
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (26 bytes)
;   0xbc42..0xbc5c  (26 bytes)
DATA_ventana_datos_BC42:
	defb 000h,000h,000h,0a0h,000h,000h,000h,000h,0a1h,000h,0a2h,000h,000h,000h,0a3h,000h,000h,000h,0a4h,0a5h,000h,000h,000h,000h,0a6h,000h	; bc42  ..........................

; ----------------------------------------------------------------------
; DATOS ventana_datos_BC5C: 1 x 26 caracteres de la ventana de 0xBBAB
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (26 bytes)
;   0xbc5c..0xbc76  (26 bytes)
DATA_ventana_datos_BC5C:
	defb 0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a8h,0a9h,000h,000h	; bc5c  ..........................

; ----------------------------------------------------------------------
; DATOS ventana_datos_BC76: 1 x 26 caracteres de la ventana de 0xBBB2
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (26 bytes)
;   0xbc76..0xbc90  (26 bytes)
DATA_ventana_datos_BC76:
	defb 000h,000h,000h,000h,0aah,0abh,0ach,0adh,0aeh,0afh,0b0h,0b1h,0b2h,0b3h,0b0h,0b4h,0b5h,0b6h,0b7h,0b8h,0b9h,0bah,0bbh,0bch,000h,000h	; bc76  ..........................

; ----------------------------------------------------------------------
; DATOS ventana_datos_BC90: 1 x 26 caracteres de la ventana de 0xBBB9
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (26 bytes)
;   0xbc90..0xbcaa  (26 bytes)
DATA_ventana_datos_BC90:
	defb 000h,000h,0bdh,0beh,0bfh,0c0h,0c1h,0c2h,0c3h,0c4h,0c5h,0c6h,0c3h,0c7h,0c8h,0c9h,0cah,0cbh,0cch,0cdh,0ceh,0cfh,000h,000h,000h,000h	; bc90  ..........................

; ----------------------------------------------------------------------
; DATOS ventana_BCAA: cabecera de ventana (HL fijo en p10:83AD):
;   [modo][fila][6 filas][18 columnas][?][datos 0xBD85] que p10:95C1 copia a
;   0xEE10; lo leen p10:83AD (7 bytes)
;   0xbcaa..0xbcb1  (7 bytes)
DATA_ventana_BCAA:
	defb 001h,002h,006h,012h,018h,085h,0bdh	; bcaa

; ----------------------------------------------------------------------
; DATOS ventana_BCB1: cabecera de ventana (HL fijo en p10:8409):
;   [modo][fila][8 filas][18 columnas][?][datos 0xBDF1] que p10:95C1 copia a
;   0xEE10; lo leen p10:8409 (7 bytes)
;   0xbcb1..0xbcb8  (7 bytes)
DATA_ventana_BCB1:
	defb 000h,010h,008h,012h,018h,0f1h,0bdh	; bcb1

; ----------------------------------------------------------------------
; DATOS ventana_BCB8: cabecera de ventana (HL fijo en p10:8491):
;   [modo][fila][8 filas][18 columnas][?][datos 0xBDF1] que p10:95C1 copia a
;   0xEE10; lo leen p10:8491 (7 bytes)
;   0xbcb8..0xbcbf  (7 bytes)
DATA_ventana_BCB8:
	defb 000h,008h,008h,012h,018h,0f1h,0bdh	; bcb8

; ----------------------------------------------------------------------
; DATOS ventana_BCBF: cabecera de ventana (HL fijo en p10:85C5):
;   [modo][fila][7 filas][9 columnas][?][datos 0xBE81] que p10:95C1 copia a
;   0xEE10; lo leen p10:85C5 (7 bytes)
;   0xbcbf..0xbcc6  (7 bytes)
DATA_ventana_BCBF:
	defb 000h,00ah,007h,009h,00eh,081h,0beh	; bcbf

; ----------------------------------------------------------------------
; DATOS ventana_BCC6: cabecera de ventana (HL fijo en p10:85D5):
;   [modo][fila][7 filas][9 columnas][?][datos 0xBEC0] que p10:95C1 copia a
;   0xEE10; lo leen p10:85D5 (7 bytes)
;   0xbcc6..0xbccd  (7 bytes)
DATA_ventana_BCC6:
	defb 001h,00ah,007h,009h,00eh,0c0h,0beh	; bcc6

; ----------------------------------------------------------------------
; DATOS ventana_BCCD: cabecera de ventana (HL fijo en p10:84D6):
;   [modo][fila][5 filas][17 columnas][?][datos 0xBCDB] que p10:95C1 copia a
;   0xEE10; lo leen p10:84D6 (7 bytes)
;   0xbccd..0xbcd4  (7 bytes)
DATA_ventana_BCCD:
	defb 000h,00ah,005h,011h,018h,0dbh,0bch	; bccd

; ----------------------------------------------------------------------
; DATOS ventana_BCD4: cabecera de ventana (HL fijo en p10:854E):
;   [modo][fila][5 filas][17 columnas][?][datos 0xBD30] que p10:95C1 copia a
;   0xEE10; lo leen p10:854E (7 bytes)
;   0xbcd4..0xbcdb  (7 bytes)
DATA_ventana_BCD4:
	defb 000h,00ah,005h,011h,018h,030h,0bdh	; bcd4

; ----------------------------------------------------------------------
; DATOS ventana_datos_BCDB: 5 x 17 caracteres de la ventana de 0xBCCD
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (85 bytes)
;   0xbcdb..0xbd30  (85 bytes)
DATA_ventana_datos_BCDB:
	defb 000h,000h,000h,040h,041h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bcdb  ...@A............
	defb 000h,000h,042h,043h,044h,045h,046h,047h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bcec  ..BCDEFG.........
	defb 000h,000h,048h,049h,04ah,003h,04bh,004h,005h,04ch,04dh,04eh,04fh,050h,001h,002h,000h	; bcfd  ..HIJ.K..LMNOP...
	defb 000h,000h,051h,052h,053h,054h,055h,056h,057h,058h,059h,05ah,05bh,05ch,05dh,05eh,05fh	; bd0e  ..QRSTUVWXYZ[\]^_
	defb 000h,000h,060h,061h,062h,000h,063h,064h,065h,066h,067h,068h,069h,06ah,06bh,000h,000h	; bd1f  ..`ab.cdefghijk..

; ----------------------------------------------------------------------
; DATOS ventana_datos_BD30: 5 x 17 caracteres de la ventana de 0xBCD4
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (85 bytes)
;   0xbd30..0xbd85  (85 bytes)
DATA_ventana_datos_BD30:
	defb 000h,000h,010h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bd30  .................
	defb 000h,000h,011h,012h,013h,014h,015h,016h,017h,000h,000h,000h,000h,000h,000h,000h,000h	; bd41  .................
	defb 000h,000h,018h,019h,01ah,008h,01bh,009h,00ah,01ch,01dh,01eh,01fh,020h,006h,007h,000h	; bd52  ............. ...
	defb 000h,000h,021h,022h,023h,024h,025h,026h,027h,028h,029h,02ah,02bh,02ch,02dh,02eh,02fh	; bd63  ..!"#$%&'()*+,-./
	defb 000h,000h,030h,031h,032h,033h,034h,030h,031h,032h,033h,034h,035h,000h,000h,000h,000h	; bd74  ..01234012345....

; ----------------------------------------------------------------------
; DATOS ventana_datos_BD85: 6 x 18 caracteres de la ventana de 0xBCAA
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (108 bytes)
;   0xbd85..0xbdf1  (108 bytes)
DATA_ventana_datos_BD85:
	defb 000h,000h,003h,004h,000h,010h,011h,012h,013h,014h,015h,016h,000h,005h,003h,000h,000h,000h	; bd85  ..................
	defb 003h,006h,007h,000h,005h,017h,018h,019h,01ah,01bh,01ch,01dh,01eh,004h,008h,009h,000h,000h	; bd97  ..................
	defb 007h,003h,005h,003h,000h,01fh,020h,021h,022h,023h,024h,025h,026h,009h,00ah,00dh,000h,000h	; bda9  ...... !"#$%&.....
	defb 005h,000h,004h,008h,00bh,027h,028h,029h,02ah,02bh,02ch,02dh,02eh,00eh,00dh,00ch,000h,000h	; bdbb  .....'()*+,-......
	defb 006h,008h,009h,00ah,001h,02fh,030h,031h,032h,033h,034h,035h,036h,00fh,00eh,00ah,000h,000h	; bdcd  ...../0123456.....
	defb 009h,00ah,00ch,00dh,002h,037h,038h,039h,03ah,03bh,03ch,03dh,03eh,03fh,036h,002h,000h,000h	; bddf  .....789:.<=>?6...

; ----------------------------------------------------------------------
; DATOS ventana_datos_BDF1: 8 x 18 caracteres de la ventana de 0xBCB1
;   (p10:9613 los copia fila a fila); lo leen p10:9613 (144 bytes)
;   0xbdf1..0xbe81  (144 bytes)
DATA_ventana_datos_BDF1:
	defb 000h,000h,010h,011h,012h,013h,014h,015h,016h,017h,018h,000h,000h,000h,004h,005h,000h,000h	; bdf1  ..................
	defb 000h,000h,019h,01ah,01bh,01ch,01dh,01eh,01fh,020h,021h,000h,000h,005h,000h,000h,003h,006h	; be03  ......... !.......
	defb 000h,000h,000h,022h,023h,024h,025h,026h,027h,028h,029h,005h,000h,000h,003h,004h,007h,003h	; be15  ..."#$%&'().......
	defb 000h,000h,000h,02ah,02bh,02ch,02dh,02eh,02fh,030h,000h,000h,003h,006h,007h,003h,004h,008h	; be27  ...*+,-./0........
	defb 000h,000h,000h,031h,032h,033h,034h,035h,036h,037h,038h,039h,007h,003h,005h,000h,009h,00ah	; be39  ...123456789......
	defb 000h,000h,000h,03ah,03bh,03ch,03dh,03eh,03fh,040h,041h,042h,043h,044h,045h,000h,00eh,00dh	; be4b  ...:.<=>?@ABCDE...
	defb 000h,000h,046h,047h,048h,049h,04ah,04bh,04ch,04dh,04eh,04fh,050h,051h,052h,053h,054h,00eh	; be5d  ..FGHIJKLMNOPQRST.
	defb 000h,000h,055h,056h,057h,058h,059h,05ah,05bh,05ch,05dh,05eh,05fh,060h,059h,061h,062h,00fh	; be6f  ..UVWXYZ[\]^_`Yab.

; ----------------------------------------------------------------------
; DATOS ventana_datos_BE81: 7 x 9 caracteres de la ventana de 0xBCBF (p10:9613
;   los copia fila a fila); lo leen p10:9613 (63 bytes)
;   0xbe81..0xbec0  (63 bytes)
DATA_ventana_datos_BE81:
	defb 000h,000h,062h,063h,064h,065h,066h,067h,068h	; be81  ..bcdefgh
	defb 000h,000h,069h,06ah,06fh,070h,071h,072h,06dh	; be8a  ..ijopqrm
	defb 000h,000h,06ch,06eh,052h,055h,053h,056h,074h	; be93  ..lnRUSVt
	defb 000h,000h,06bh,076h,077h,078h,07ah,075h,000h	; be9c  ..kvwxzu.
	defb 000h,000h,000h,05fh,079h,073h,054h,07ch,000h	; bea5  ..._ysT|.
	defb 000h,000h,061h,080h,07eh,07bh,07dh,059h,000h	; beae  ..a.~{}Y.
	defb 000h,000h,07fh,081h,082h,083h,084h,085h,086h	; beb7  .........

; ----------------------------------------------------------------------
; DATOS ventana_datos_BEC0: 7 x 9 caracteres de la ventana de 0xBCC6 (p10:9613
;   los copia fila a fila); lo leen p10:9613 (63 bytes)
;   0xbec0..0xbeff  (63 bytes)
DATA_ventana_datos_BEC0:
	defb 08dh,08ch,08bh,08ah,089h,088h,087h,000h,000h	; bec0  .........
	defb 092h,097h,096h,095h,094h,08fh,08eh,000h,000h	; bec9  .........
	defb 099h,05bh,05ah,05ch,051h,093h,091h,000h,000h	; bed2  .[Z\Q....
	defb 000h,09ah,09fh,09dh,09ch,09bh,090h,000h,000h	; bedb  .........
	defb 000h,0a1h,057h,098h,09eh,05eh,05dh,000h,000h	; bee4  ..W..^]..
	defb 000h,058h,0a2h,0a0h,0a3h,0a5h,060h,000h,000h	; beed  .X....`..
	defb 0abh,0aah,0a9h,0a8h,0a7h,0a6h,0a4h,000h,000h	; bef6  .........

; ----------------------------------------------------------------------
; DATOS rotulos_BEFD: 7 punteros (fase 1 a 7; tabla en 0xBEFD + 2 x A): los
;   rotulos de cada fase (p10:8A20 con A = 1, 0xE21B o 7); lo leen p10:8A2C
;   (14 bytes)
;   0xbeff..0xbf0d  (14 bytes)
DATA_rotulos_BEFD:
	defw 0bf1bh,0bf39h,0bf5ah,0bf5ah,0bf5ah,0bf72h,0bf87h	; beff

; ----------------------------------------------------------------------
; DATOS rotulos_BF0B: 7 punteros (fase 1 a 7; tabla en 0xBF0B + 2 x A): los
;   rotulos de cada fase (p10:8A20 con A = 1, 0xE21B o 7); lo leen p10:8A31
;   (14 bytes)
;   0xbf0d..0xbf1b  (14 bytes)
DATA_rotulos_BF0B:
	defw 0bf1bh,0bf39h,0bf9ah,0bf9ah,0bf9ah,0bf72h,0bf87h	; bf0d

; ----------------------------------------------------------------------
; DATOS rotulo_BF1B: lista a la VRAM (p00:4CF5) del rotulo de la fase 1,
;   version japonesa; lo leen p10:8A39 (30 bytes)
;   0xbf1b..0xbf39  (30 bytes)
DATA_rotulo_BF1B:
	defb 062h,039h,020h,034h,02fh,030h,000h,026h,02ch,029h,027h,028h,034h,000h,033h,030h	; bf1b  b9 4/0.&,)'(4.30
	defb 025h,025h,024h,000h,034h,02fh,000h,02ch,021h,034h,029h,033h,020h,0ffh	; bf2b  %%$.4/.,!4)3 .

; ----------------------------------------------------------------------
; DATOS rotulo_BF39: lista a la VRAM (p00:4CF5) del rotulo de la fase 2,
;   version japonesa; lo leen p10:8A39 (33 bytes)
;   0xbf39..0xbf5a  (33 bytes)
DATA_rotulo_BF39:
	defb 061h,039h,020h,023h,02fh,02eh,024h,035h,023h,034h,000h,034h,02fh,000h,033h,030h	; bf39  a9 #/.$5#4.4/.30
	defb 021h,023h,025h,000h,033h,034h,021h,034h,029h,02fh,02eh,000h,03ah,02fh,034h,020h	; bf49  !#%.34!4)/..:/4
	defb 0ffh	; bf59

; ----------------------------------------------------------------------
; DATOS rotulo_BF5A: lista a la VRAM (p00:4CF5) del rotulo de la fase 3, 4, 5,
;   version japonesa; lo leen p10:8A39 (24 bytes)
;   0xbf5a..0xbf72  (24 bytes)
DATA_rotulo_BF5A:
	defb 065h,039h,020h,033h,025h,034h,000h,034h,028h,025h,000h,02ch,025h,025h,02bh,000h	; bf5a  e9 3%4.4(%.,%%+.
	defb 033h,039h,033h,034h,025h,02dh,020h,0ffh	; bf6a  3934%- .

; ----------------------------------------------------------------------
; DATOS rotulo_BF72: lista a la VRAM (p00:4CF5) del rotulo de la fase 6,
;   version japonesa; lo leen p10:8A39 (21 bytes)
;   0xbf72..0xbf87  (21 bytes)
DATA_rotulo_BF72:
	defb 067h,039h,020h,023h,032h,035h,033h,028h,000h,033h,021h,02ch,021h,02dh,021h,02eh	; bf72  g9 #253(.3!,!-!.
	defb 024h,025h,032h,020h,0ffh	; bf82

; ----------------------------------------------------------------------
; DATOS rotulo_BF87: lista a la VRAM (p00:4CF5) del rotulo de la fase 7,
;   version japonesa; lo leen p10:8A39 (19 bytes)
;   0xbf87..0xbf9a  (19 bytes)
DATA_rotulo_BF87:
	defb 067h,039h,020h,037h,032h,021h,034h,028h,000h,02fh,026h,000h,036h,025h,02eh,02fh	; bf87  g9 72!4(./&.6%./
	defb 02dh,020h,0ffh	; bf97

; ----------------------------------------------------------------------
; DATOS rotulo_BF9A: lista a la VRAM (p00:4CF5) del rotulo de la fase 3, 4, 5,
;   version inglesa; lo leen p10:8A39 (30 bytes)
;   0xbf9a..0xbfb8  (30 bytes)
DATA_rotulo_BF9A:
	defb 062h,039h,020h,033h,025h,034h,000h,034h,028h,025h,000h,023h,032h,035h,033h,028h	; bf9a  b9 3%4.4(%.#253(
	defb 000h,022h,02ch,02fh,037h,000h,033h,039h,033h,034h,025h,02dh,020h,0ffh	; bfaa  .",/7.3934%- .

; ----------------------------------------------------------------------
; DATOS relleno_ff: 72 bytes a 0xFF hasta el final del banco: relleno; lo leen
;   nadie (72 bytes)
;   0xbfb8..0xc000  (72 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb8  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc8  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd8  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe8  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff8  ........
