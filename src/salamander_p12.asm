; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 12 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
la7ech:	equ 0x0a7ec

; ======================================================================
; CODIGO 0xa000..0xa009  (9 bytes)
; ======================================================================


L_A000:
	ld hl,0e6c8h		;a000
	ld a,(hl)			;a003
	dec a			;a004
	ret m			;a005
	call 040ceh		;a006

; ----------------------------------------------------------------------
; DATOS tabla_A009: 4 destinos del despachador p00:40CE (call en p12:A006, el
;   indice en A): A011, A04C, A0A3, A0D8; lo leen p12:A006 (8 bytes)
;   0xa009..0xa011  (8 bytes)
DATA_tabla_A009:
	defw 0a011h,0a04ch,0a0a3h,0a0d8h	; a009  -> L_A011 L_A04C L_A0A3 L_A0D8

; ======================================================================
; CODIGO 0xa011..0xa044  (51 bytes)
; ======================================================================


L_A011:
	ld hl,0e6c8h		;a011
	inc (hl)			;a014
	inc l			;a015
	ld (hl),050h		;a016
L_A018:
	inc l			;a018
	ld (hl),0a0h		;a019
	inc l			;a01b
	ld (hl),001h		;a01c
	inc l			;a01e
	ld (hl),000h		;a01f
	inc l			;a021
	inc l			;a022
	inc l			;a023
	ld (hl),064h		;a024
	xor a			;a026
	ld (0e644h),a		;a027
	ld (0e648h),a		;a02a
L_A02D:
	ld hl,0a044h		;a02d
L_A030:
	ld de,0cc97h		;a030
	ldi		;a033
	ldi		;a035
	ld de,0ccd7h		;a037
	ldi		;a03a
	ldi		;a03c
	ret			;a03e
L_A03F:
	ld hl,0a048h		;a03f
	jr L_A030		;a042

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa044..0xa04c  (8 bytes)
DATA_A044:
	defb 06ch,078h,084h,090h,06bh,077h,083h,08fh	; a044  lx..kw..

; ======================================================================
; CODIGO 0xa04c..0xa0f7  (171 bytes)
; ======================================================================


L_A04C:
	ld a,(0e644h)		;a04c
	or a			;a04f
	jr nz,L_A065		;a050
	call L_A084		;a052
	ld a,(0e6cfh)		;a055
	cp 020h		;a058
	jr nc,$-45		;a05a
	ld a,(0e203h)		;a05c
	bit 2,a		;a05f
	jr z,$-52		;a061
	jr $-36		;a063
L_A065:
	ld de,00500h		;a065
	call 05936h		;a068
	call L_A03F		;a06b
	xor a			;a06e
	ld (0e644h),a		;a06f
	ld a,078h		;a072
	ld (0e6cdh),a		;a074
	ld a,015h		;a077
	call 04d6eh		;a079
	call L_A0E2		;a07c
L_A07F:
	ld hl,0e6c8h		;a07f
	inc (hl)			;a082
	ret			;a083
L_A084:
	ld hl,0e6cbh		;a084
	dec (hl)			;a087
	ret nz			;a088
	ld a,(0e6cfh)		;a089
	cp 020h		;a08c
	ld a,012h		;a08e
	jr nc,L_A094		;a090
	ld a,009h		;a092
L_A094:
	ld (hl),a			;a094
	inc l			;a095
	inc (hl)			;a096
	bit 1,(hl)		;a097
	ld de,09c38h		;a099
	jr z,L_A0A0		;a09c
	ld e,063h		;a09e
L_A0A0:
	jp 074c5h		;a0a0
L_A0A3:
	ld hl,0e6cdh		;a0a3
	dec (hl)			;a0a6
	jr z,L_A0B1		;a0a7
	ld a,(hl)			;a0a9
	rra			;a0aa
	and 001h		;a0ab
	ld (0e645h),a		;a0ad
	ret			;a0b0
L_A0B1:
	xor a			;a0b1
	ld (0e645h),a		;a0b2
	ld hl,0ca94h		;a0b5
	ld a,012h		;a0b8
L_A0BA:
	ld d,h			;a0ba
	ld e,l			;a0bb
	inc de			;a0bc
	ld bc,00007h		;a0bd
	ld (hl),000h		;a0c0
	ldir		;a0c2
	ld de,00039h		;a0c4
	add hl,de			;a0c7
	dec a			;a0c8
	jr nz,L_A0BA		;a0c9
	ld de,0b048h		;a0cb
	call 08ec6h		;a0ce
	ld a,03ch		;a0d1
	ld (0e6cdh),a		;a0d3
	jr L_A07F		;a0d6
L_A0D8:
	ld hl,0e6cdh		;a0d8
	dec (hl)			;a0db
	ret nz			;a0dc
	xor a			;a0dd
	ld (0e6c8h),a		;a0de
	ret			;a0e1
L_A0E2:
	ld hl,0e700h		;a0e2
	ld de,0e701h		;a0e5
	ld bc,0037fh		;a0e8
	ld (hl),000h		;a0eb
	ldir		;a0ed
	xor a			;a0ef
	ld (0e652h),a		;a0f0
	ld (0e655h),a		;a0f3
	ret			;a0f6

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa0f7..0xa1c2  (203 bytes)
DATA_A0F7:
	defb 010h,008h,018h,010h,010h,018h,018h,010h,000h,008h,008h,010h,008h,008h,008h,010h	; a0f7  ................
	defb 010h,008h,008h,010h,018h,008h,008h,010h,008h,000h,010h,008h,008h,008h,010h,008h	; a107  ................
	defb 008h,010h,010h,010h,020h,018h,010h,010h,030h,000h,010h,010h,020h,000h,010h,010h	; a117  .... ...0... ...
	defb 008h,020h,010h,010h,010h,010h,010h,010h,010h,018h,010h,010h,000h,000h,010h,010h	; a127  . ..............
	defb 010h,000h,010h,010h,010h,020h,010h,010h,020h,010h,010h,010h,040h,008h,010h,010h	; a137  ..... .. ...@...
	defb 050h,018h,010h,010h,030h,010h,010h,010h,000h,010h,010h,010h,000h,000h,010h,010h	; a147  P...0...........
	defb 008h,000h,010h,010h,010h,000h,010h,010h,018h,000h,010h,010h,020h,000h,010h,010h	; a157  ............ ...
	defb 028h,000h,010h,010h,030h,000h,010h,010h,038h,000h,010h,010h,040h,000h,010h,010h	; a167  (...0...8...@...
	defb 008h,000h,010h,008h,000h,000h,018h,010h,008h,008h,010h,008h,091h,0a1h,099h,0a1h	; a177  ................
	defb 0a1h,0a1h,0afh,0a1h,0c0h,0a1h,0bah,0a1h,0c0h,0a1h,012h,001h,041h,037h,001h,082h	; a187  ............A7..
	defb 0ffh,0ffh,0a6h,000h,0eah,099h,001h,015h,0ffh,0ffh,076h,000h,025h,0e7h,000h,016h	; a197  ..........v.%...
	defb 0f8h,000h,01dh,074h,001h,0d2h,0ffh,0ffh,099h,000h,085h,01dh,001h,023h,088h,001h	; a1a7  ...t.........#..
	defb 01ah,0ffh,0ffh,0bdh,000h,046h,0d6h,001h,025h,0ffh,0ffh	; a1b7  .....F..%..

; ======================================================================
; CODIGO 0xa1c2..0xa347  (389 bytes)
; ======================================================================


L_A1C2:
	ld a,(0e6aah)		;a1c2
	or a			;a1c5
	ret nz			;a1c6
	ld de,0ee00h		;a1c7
	ld ix,0e700h		;a1ca
	ld b,00ch		;a1ce
L_A1D0:
	push bc			;a1d0
	call L_A1DF		;a1d1
	exx			;a1d4
	ld de,00040h		;a1d5
	add ix,de		;a1d8
	exx			;a1da
	pop bc			;a1db
	djnz L_A1D0		;a1dc
	ret			;a1de
L_A1DF:
	bit 6,(ix+00bh)		;a1df
	ret z			;a1e3
	ld a,(ix+000h)		;a1e4
	and a			;a1e7
	ret z			;a1e8
	cp 024h		;a1e9
	ret z			;a1eb
	cp 03fh		;a1ec
	jp z,L_A24A		;a1ee
	sub 039h		;a1f1
	cp 004h		;a1f3
	jr c,L_A230		;a1f5
	ld a,(ix+006h)		;a1f7
	ld h,a			;a1fa
	ld l,(ix+004h)		;a1fb
	call 05a99h		;a1fe
	ld (ix+011h),l		;a201
	ld (ix+012h),h		;a204
	ld b,(ix+013h)		;a207
	ld c,(ix+006h)		;a20a
	xor a			;a20d
	sub c			;a20e
	jr nz,L_A213		;a20f
	ld a,0f8h		;a211
L_A213:
	rra			;a213
	rra			;a214
	rra			;a215
	and 01fh		;a216
	ld c,(ix+014h)		;a218
	cp c			;a21b
	jr nc,L_A21F		;a21c
	ld c,a			;a21e
L_A21F:
	push bc			;a21f
	ld b,000h		;a220
	ldir		;a222
	pop bc			;a224
	ld a,040h		;a225
	sub c			;a227
	add a,l			;a228
	ld l,a			;a229
	jr nc,L_A22D		;a22a
	inc h			;a22c
L_A22D:
	djnz L_A21F		;a22d
	ret			;a22f
L_A230:
	ld a,(ix+014h)		;a230
	or a			;a233
	ret z			;a234
	ld c,a			;a235
	ld l,(ix+004h)		;a236
	ld h,(ix+006h)		;a239
	call 05a99h		;a23c
	ld (ix+011h),l		;a23f
	ld (ix+012h),h		;a242
	ld b,000h		;a245
	ldir		;a247
	ret			;a249
L_A24A:
	ld a,(ix+006h)		;a24a
	push de			;a24d
	ld e,a			;a24e
	ld d,(ix+021h)		;a24f
	ld l,(ix+004h)		;a252
	ld h,(ix+020h)		;a255
	call 05aadh		;a258
	pop de			;a25b
	ld (ix+011h),l		;a25c
	ld (ix+012h),h		;a25f
	ld b,(ix+013h)		;a262
	ld c,(ix+014h)		;a265
	jr L_A21F		;a268
L_A26A:
	ld a,(0e6aah)		;a26a
	or a			;a26d
	ret nz			;a26e
	ld hl,0ee00h		;a26f
	ld ix,0e700h		;a272
	ld b,00ch		;a276
L_A278:
	push bc			;a278
	bit 6,(ix+00bh)		;a279
	jr z,L_A2C1		;a27d
	ld a,(ix+000h)		;a27f
	and a			;a282
	jr z,L_A2C1		;a283
	sub 039h		;a285
	cp 004h		;a287
	jr c,L_A2D2		;a289
	ld e,(ix+011h)		;a28b
	ld d,(ix+012h)		;a28e
	ld a,(ix+000h)		;a291
	cp 03fh		;a294
	jp z,L_A2CA		;a296
	ld b,(ix+013h)		;a299
	ld c,(ix+006h)		;a29c
	xor a			;a29f
	sub c			;a2a0
	jr nz,L_A2A5		;a2a1
	ld a,0f8h		;a2a3
L_A2A5:
	rra			;a2a5
	rra			;a2a6
	rra			;a2a7
	and 01fh		;a2a8
	ld c,(ix+014h)		;a2aa
	cp c			;a2ad
	jr nc,L_A2B1		;a2ae
	ld c,a			;a2b0
L_A2B1:
	push bc			;a2b1
	ld b,000h		;a2b2
	ldir		;a2b4
	pop bc			;a2b6
	ld a,040h		;a2b7
	sub c			;a2b9
	add a,e			;a2ba
	ld e,a			;a2bb
	jr nc,L_A2BF		;a2bc
	inc d			;a2be
L_A2BF:
	djnz L_A2B1		;a2bf
L_A2C1:
	pop bc			;a2c1
	ld de,00040h		;a2c2
	add ix,de		;a2c5
	djnz L_A278		;a2c7
	ret			;a2c9
L_A2CA:
	ld b,(ix+013h)		;a2ca
	ld c,(ix+014h)		;a2cd
	jr L_A2B1		;a2d0
L_A2D2:
	ld a,(ix+014h)		;a2d2
	or a			;a2d5
	jr z,L_A2C1		;a2d6
	ld c,a			;a2d8
	ld b,000h		;a2d9
	ld e,(ix+011h)		;a2db
	ld d,(ix+012h)		;a2de
	ldir		;a2e1
	jr L_A2C1		;a2e3
L_A2E5:
	ld hl,00000h		;a2e5
	ld (0e20eh),hl		;a2e8
	ld de,0a347h		;a2eb
	call 04d10h		;a2ee
	ld hl,00a00h		;a2f1
	ld bc,003f0h		;a2f4
	xor a			;a2f7
	call 00056h		;a2f8   ; BIOS FILVRM - Fills VRAM with value
	ld hl,03907h		;a2fb
	ld a,040h		;a2fe
	ld c,006h		;a300
	ld de,0000bh		;a302
L_A305:
	ld b,015h		;a305
L_A307:
	call 0004dh		;a307   ; BIOS WRTVRM - Writes data in VRAM
	inc hl			;a30a
	inc a			;a30b
	djnz L_A307		;a30c
	add hl,de			;a30e
	dec c			;a30f
	jr nz,L_A305		;a310
	ret			;a312
L_A313:
	ld bc,(0e20eh)		;a313
	ld a,0ebh		;a317
	inc b			;a319
L_A31A:
	add a,015h		;a31a
	djnz L_A31A		;a31c
	ld l,a			;a31e
	ld h,b			;a31f
	add hl,hl			;a320
	add hl,hl			;a321
	add hl,hl			;a322
	ld de,00a00h		;a323
	add hl,de			;a326
	ld a,c			;a327
	call 040c4h		;a328
	ld b,015h		;a32b
	ld de,00008h		;a32d
	ld a,0f0h		;a330
L_A332:
	call 0004dh		;a332   ; BIOS WRTVRM - Writes data in VRAM
	add hl,de			;a335
	djnz L_A332		;a336
	ld hl,0e20eh		;a338
	ld a,(hl)			;a33b
	inc a			;a33c
	and 007h		;a33d
	ld (hl),a			;a33f
	ret nz			;a340
	inc hl			;a341
	inc (hl)			;a342
	ld a,(hl)			;a343
	cp 006h		;a344
	ret			;a346

; ----------------------------------------------------------------------
; DATOS rachas_d_A347: [destino en la VRAM] y rachas (p00:4D10 -> p00:4D16);
;   lo leen p12:A2EE (354 bytes)
;   0xa347..0xa4a9  (354 bytes)
DATA_rachas_d_A347:
	defb 000h,02ah,018h,000h,002h,007h,003h,00fh,002h,01fh,081h,03fh,008h,0ffh,002h,0f8h	; a347  .*.........?....
	defb 003h,0f0h,003h,0e0h,07fh,000h,00dh,000h,087h,001h,003h,00fh,07fh,03fh,07fh,07fh	; a357  .............?..
	defb 00ah,0ffh,082h,0fch,0f0h,003h,0c0h,002h,080h,07fh,000h,083h,001h,003h,007h,003h	; a367  ................
	defb 00fh,081h,03fh,009h,0ffh,087h,0feh,0fch,0f8h,0f8h,0f0h,0f8h,0c0h,00bh,000h,002h	; a377  ..?.............
	defb 001h,083h,003h,07fh,07fh,00bh,0ffh,002h,0feh,083h,0fch,080h,080h,006h,000h,002h	; a387  ................
	defb 03ch,002h,078h,092h,079h,0f3h,0f7h,0ffh,01fh,03eh,07ch,0f9h,0f3h,0e3h,0c3h,087h	; a397  <.x.y....>|.....
	defb 01fh,07fh,0f8h,0f0h,0e0h,0e0h,003h,0c0h,084h,0f0h,0f8h,078h,078h,003h,079h,002h	; a3a7  ...........xx.y.
	defb 07fh,083h,0ffh,0f7h,0f7h,003h,0e7h,002h,00fh,003h,01eh,003h,03ch,088h,003h,007h	; a3b7  ............<...
	defb 00fh,00eh,01eh,03ch,038h,078h,005h,0e0h,003h,0e1h,002h,07eh,083h,0feh,0f6h,0f6h	; a3c7  ...<8x.....~....
	defb 003h,0eeh,002h,00fh,088h,01fh,01dh,03dh,03bh,07bh,073h,0f1h,0f1h,003h,0e3h,003h	; a3d7  .......=.{s.....
	defb 0c7h,002h,0e0h,003h,0c0h,003h,080h,008h,000h,003h,01fh,003h,03fh,002h,07fh,008h	; a3e7  ............?...
	defb 0ffh,083h,0f0h,0e0h,0e0h,003h,0c0h,002h,080h,007h,000h,087h,007h,003h,007h,007h	; a3f7  ................
	defb 00fh,01fh,03fh,009h,0ffh,089h,0f8h,0fch,0f8h,0f8h,0f0h,0e0h,0c0h,000h,000h,003h	; a407  ..?.............
	defb 001h,003h,003h,002h,007h,088h,0efh,0e7h,0e7h,0c7h,0c7h,0c3h,083h,083h,003h,087h	; a417  ................
	defb 003h,0c7h,092h,0e3h,0e0h,080h,080h,081h,081h,083h,0c7h,0ffh,0feh,0fbh,0f3h,0f3h	; a427  ................
	defb 0f7h,0e7h,0c7h,08fh,00fh,003h,0c7h,003h,087h,002h,007h,002h,078h,088h,079h,0f1h	; a437  ............x.y.
	defb 0f3h,0f7h,0e7h,0efh,070h,0f0h,003h,0ffh,002h,081h,081h,001h,003h,0e3h,003h,0e7h	; a447  ....p...........
	defb 002h,0efh,002h,0ceh,081h,0cfh,003h,08fh,002h,00fh,088h,0f7h,0e7h,0c7h,0cfh,08fh	; a457  ................
	defb 08fh,01eh,01eh,003h,08fh,003h,01eh,002h,03ch,090h,007h,008h,017h,014h,017h,014h	; a467  ........<.......
	defb 008h,007h,080h,040h,020h,0a0h,020h,0a0h,040h,080h,011h,000h,085h,003h,00fh,01fh	; a477  ...@ . .@.......
	defb 03fh,07fh,00bh,0ffh,086h,0fch,0f0h,0e0h,0c0h,080h,080h,07fh,000h,00ah,000h,003h	; a487  ?...............
	defb 001h,003h,003h,002h,007h,009h,0ffh,002h,0feh,003h,0fch,002h,0f8h,07fh,000h,009h	; a497  ................
	defb 000h,000h	; a4a7

; ======================================================================
; CODIGO 0xa4a9..0xa531  (136 bytes)
; ======================================================================


L_A4A9:
	ld a,(0e640h)		;a4a9
	or a			;a4ac
	ret nz			;a4ad
	ld a,(0e6aah)		;a4ae
	and a			;a4b1
	ret nz			;a4b2
	ld a,(0e301h)		;a4b3
	ld b,a			;a4b6
	cp 009h		;a4b7
	ret nc			;a4b9
	ld c,00fh		;a4ba
	cp 004h		;a4bc
	jr z,L_A4C7		;a4be
	ld c,003h		;a4c0
	dec a			;a4c2
	cp 007h		;a4c3
	jr c,L_A4CC		;a4c5
L_A4C7:
	ld a,(0e203h)		;a4c7
	and c			;a4ca
	ret nz			;a4cb
L_A4CC:
	ld a,(0e301h)		;a4cc
	ld de,0a52fh		;a4cf
	call 04e21h		;a4d2
	ex de,hl			;a4d5
	ld a,l			;a4d6
	or h			;a4d7
	ret z			;a4d8
	ld a,(hl)			;a4d9
	ld (0f000h),a		;a4da
	and 07fh		;a4dd
	ld c,a			;a4df
	inc hl			;a4e0
	ld a,(0e6bbh)		;a4e1
	inc a			;a4e4
	cp c			;a4e5
	jr c,L_A4E9		;a4e6
	xor a			;a4e8
L_A4E9:
	ld (0e6bbh),a		;a4e9
	push hl			;a4ec
	ld l,a			;a4ed
	ld h,000h		;a4ee
	add hl,hl			;a4f0
	ld c,l			;a4f1
	ld b,h			;a4f2
	add hl,hl			;a4f3
	add hl,hl			;a4f4
	add hl,bc			;a4f5
	ld c,l			;a4f6
	ld b,h			;a4f7
	pop hl			;a4f8
	add hl,bc			;a4f9
	ld a,(hl)			;a4fa
	ex de,hl			;a4fb
	inc de			;a4fc
	ld l,a			;a4fd
	ld a,(0f000h)		;a4fe
	add a,a			;a501
	ld h,004h		;a502
	jr nc,L_A508		;a504
	ld h,000h		;a506
L_A508:
	add hl,hl			;a508
	add hl,hl			;a509
	add hl,hl			;a50a
	ld a,(00007h)		;a50b
	ld c,a			;a50e
	ld a,(de)			;a50f
	inc de			;a510
	exx			;a511
	ld b,003h		;a512
	ld e,a			;a514
L_A515:
	rr e		;a515
	exx			;a517
	jr nc,L_A529		;a518
	call 00053h		;a51a   ; BIOS SETWRT - Enables VDP to write
	push de			;a51d
	push hl			;a51e
	ex de,hl			;a51f
	ld b,008h		;a520
L_A522:
	outi		;a522
	jp nz,L_A522		;a524
	pop hl			;a527
	pop de			;a528
L_A529:
	ld a,008h		;a529
	add a,h			;a52b
	ld h,a			;a52c
	exx			;a52d
	djnz L_A515		;a52e
	ret			;a530

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa531..0xa5ce  (157 bytes)
DATA_A531:
	defb 000h,000h,000h,000h,000h,000h,03fh,0a5h,05eh,0a5h,0afh,0a5h,000h,000h,003h,052h	; a531  ......?.^......R
	defb 007h,000h,000h,000h,018h,018h,000h,000h,000h,052h,007h,000h,024h,042h,018h,018h	; a541  .........R..$B..
	defb 042h,024h,000h,052h,007h,018h,000h,000h,099h,099h,000h,000h,018h,008h,06ah,007h	; a551  B$.R..........j.
	defb 001h,002h,004h,010h,020h,020h,000h,040h,06bh,007h,080h,040h,020h,008h,004h,004h	; a561  ....  .@k..@ ...
	defb 000h,002h,06ch,007h,001h,001h,002h,004h,004h,002h,000h,001h,06dh,007h,080h,080h	; a571  ..l.........m...
	defb 040h,020h,020h,040h,000h,080h,06ah,007h,001h,01ch,020h,040h,080h,080h,000h,080h	; a581  @  @..j... @....
	defb 06bh,007h,080h,038h,004h,002h,001h,001h,000h,001h,06ch,007h,001h,006h,008h,010h	; a591  k..8......l.....
	defb 018h,004h,000h,001h,06dh,007h,080h,060h,010h,008h,018h,020h,000h,080h,003h,05ah	; a5a1  ....m..`... ...Z
	defb 007h,000h,000h,02ah,000h,02ah,000h,000h,000h,05ah,007h,000h,02ah,000h,000h,000h	; a5b1  ...*.*...Z..*...
	defb 02ah,000h,000h,05ah,007h,01ch,000h,000h,02ah,000h,000h,01ch,000h	; a5c1  *..Z....*....

; ======================================================================
; CODIGO 0xa5ce..0xa6fa  (300 bytes)
; ======================================================================


L_A5CE:
	ld a,(0e6c0h)		;a5ce
	or a			;a5d1
	ret nz			;a5d2
	ld a,(0e6d0h)		;a5d3
	and a			;a5d6
	jr z,L_A5E4		;a5d7
	ld hl,0e6d5h		;a5d9
	dec (hl)			;a5dc
	ret nz			;a5dd
	ld a,002h		;a5de
	ld (0e6d0h),a		;a5e0
	ret			;a5e3
L_A5E4:
	call L_A6C6		;a5e4
	call L_A633		;a5e7
	ld a,(0e6d2h)		;a5ea
	and a			;a5ed
	ret z			;a5ee
	ld iy,0e300h		;a5ef
	call L_A5FA		;a5f3
	ld iy,0e380h		;a5f6
L_A5FA:
	ld a,(iy+020h)		;a5fa
	dec a			;a5fd
	ret m			;a5fe
	ld a,(0e6d0h)		;a5ff
	or a			;a602
	ret nz			;a603
	ld hl,0e6d3h		;a604
	ld a,(iy+024h)		;a607
	add a,004h		;a60a
	sub (hl)			;a60c
	add a,008h		;a60d
	cp 011h		;a60f
	ret nc			;a611
	inc l			;a612
	ld a,(iy+026h)		;a613
	add a,004h		;a616
	sub (hl)			;a618
	add a,008h		;a619
	cp 011h		;a61b
	ret nc			;a61d
	ld hl,0e6d2h		;a61e
	ld a,(hl)			;a621
	ld (hl),000h		;a622
	dec l			;a624
	ld (hl),a			;a625
	dec l			;a626
	ld (hl),001h		;a627
	ld a,040h		;a629
	ld (0e6d5h),a		;a62b
	ld a,056h		;a62e
	jp 04d6eh		;a630
L_A633:
	ld hl,(0e627h)		;a633
	ld a,h			;a636
	or l			;a637
	ret z			;a638
L_A639:
	ld a,(0e301h)		;a639
	ld b,004h		;a63c
	sub 003h		;a63e
	jr z,L_A64C		;a640
	ld b,004h		;a642
	sub 002h		;a644
	jr z,L_A64C		;a646
	ld b,001h		;a648
	dec a			;a64a
	ret nz			;a64b
L_A64C:
	ld a,(0e620h)		;a64c
	or a			;a64f
	ld a,0f8h		;a650
	jr z,L_A655		;a652
	xor a			;a654
L_A655:
	ld (0f004h),a		;a655
	ld de,0e350h		;a658
	ld a,(0e301h)		;a65b
	sub 003h		;a65e
	jr z,L_A66A		;a660
	ld e,055h		;a662
	sub 002h		;a664
	jr z,L_A66A		;a666
	ld e,059h		;a668
L_A66A:
	ld c,000h		;a66a
L_A66C:
	ld a,(de)			;a66c
	or a			;a66d
	jr nz,L_A675		;a66e
L_A670:
	inc c			;a670
	inc e			;a671
	djnz L_A66C		;a672
	ret			;a674
L_A675:
	push de			;a675
	ex af,af'			;a676
	ld hl,0a6fah		;a677
	ld a,(0e301h)		;a67a
	cp 003h		;a67d
	jr z,L_A68B		;a67f
	ld hl,0a702h		;a681
	cp 005h		;a684
	jr z,L_A68B		;a686
	ld hl,0a70ah		;a688
L_A68B:
	ld a,c			;a68b
	call 04e28h		;a68c
	ld hl,(0e302h)		;a68f
	rst 20h			;a692
	pop de			;a693
	jr nz,L_A670		;a694
	ld hl,0a70ch		;a696
	ld a,(0e301h)		;a699
	cp 003h		;a69c
	jr z,L_A6AA		;a69e
	ld hl,0a710h		;a6a0
	cp 005h		;a6a3
	jr z,L_A6AA		;a6a5
	ld hl,0a714h		;a6a7
L_A6AA:
	ld a,c			;a6aa
	call 05ad8h		;a6ab
	ld e,a			;a6ae
	ld a,(0f004h)		;a6af
	ld d,a			;a6b2
	ld a,(0e620h)		;a6b3
	or a			;a6b6
	jr z,L_A6BC		;a6b7
	ld a,d			;a6b9
	ld d,e			;a6ba
	ld e,a			;a6bb
L_A6BC:
	ex af,af'			;a6bc
	ld hl,0e6d2h		;a6bd
	ld (hl),a			;a6c0
	inc l			;a6c1
	ld (hl),e			;a6c2
	inc l			;a6c3
	ld (hl),d			;a6c4
	ret			;a6c5
L_A6C6:
	ld a,(0e6d2h)		;a6c6
	or a			;a6c9
	ret z			;a6ca
	ld a,(0e627h)		;a6cb
	and a			;a6ce
	jr z,L_A6E9		;a6cf
	ld hl,0e6d4h		;a6d1
	jp m,L_A6E4		;a6d4
	ld a,(hl)			;a6d7
	sub 008h		;a6d8
L_A6DA:
	ld (hl),a			;a6da
	ret nc			;a6db
	dec l			;a6dc
L_A6DD:
	xor a			;a6dd
	dec l			;a6de
	ld (hl),a			;a6df
	dec l			;a6e0
	dec l			;a6e1
	ld (hl),a			;a6e2
	ret			;a6e3
L_A6E4:
	ld a,(hl)			;a6e4
	add a,008h		;a6e5
	jr L_A6DA		;a6e7
L_A6E9:
	ld a,(0e628h)		;a6e9
	or a			;a6ec
	ret z			;a6ed
	ld hl,0e6d3h		;a6ee
	ld a,(hl)			;a6f1
	add a,008h		;a6f2
	ld (hl),a			;a6f4
	cp 0a8h		;a6f5
	ret c			;a6f7
	jr L_A6DD		;a6f8

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa6fa..0xa715  (27 bytes)
DATA_A6FA:
	defb 0f4h,000h,05eh,001h,085h,001h,0c6h,001h,002h,001h,032h,001h,05eh,001h,096h,001h	; a6fa  ..^.......2.^...
	defb 04eh,001h,0c8h,028h,0d0h,028h,048h,068h,028h,048h,090h	; a70a  N..(.(Hh(H.

; ======================================================================
; CODIGO 0xa715..0xa75c  (71 bytes)
; ======================================================================


L_A715:
	call 04eaah		;a715
	inc (ix+006h)		;a718
	ld a,(0e301h)		;a71b
	cp 003h		;a71e
	jr nz,L_A726		;a720
	ld (ix+032h),006h		;a722
L_A726:
	ld (ix+028h),000h		;a726
	ld (ix+013h),004h		;a72a
	ld (ix+014h),004h		;a72e
	ld a,(ix+006h)		;a732
	rra			;a735
	rra			;a736
	rra			;a737
	and 01fh		;a738
	ld hl,0a764h		;a73a
	call 05ad8h		;a73d
	ld (ix+025h),a		;a740
	ld (ix+002h),a		;a743
	ld a,(ix+019h)		;a746
	res 2,(ix+010h)		;a749
	ld hl,0a75ch		;a74d
	call 04e28h		;a750
	call 0685dh		;a753
	ld de,00800h		;a756
	jp 06856h		;a759

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa75c..0xa784  (40 bytes)
DATA_A75C:
	defb 000h,000h,000h,000h,000h,0f8h,000h,008h,004h,007h,005h,003h,004h,006h,003h,005h	; a75c  ................
	defb 004h,007h,005h,003h,004h,006h,003h,005h,004h,007h,005h,003h,004h,006h,003h,005h	; a76c  ................
	defb 004h,007h,005h,003h,004h,006h,003h,005h	; a77c  ........

; ======================================================================
; CODIGO 0xa784..0xa7a7  (35 bytes)
; ======================================================================


L_A784:
	call 04eaah		;a784
	ld (ix+028h),000h		;a787
	call 04e58h		;a78b
	and 07fh		;a78e
	add a,040h		;a790
	ld c,a			;a792
	ld a,(ix+019h)		;a793
	and a			;a796
	jr nz,$+73		;a797
	call 04e58h		;a799
	bit 4,a		;a79c
	jr z,$+19		;a79e
	ld a,(0e227h)		;a7a0
	cp 002h		;a7a3
	jr $+12		;a7a5

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa7a7..0xa7b1  (10 bytes)
DATA_A7A7:
	defb 03ah,0a4h,0e3h,067h,03ah,0a6h,0e3h,06fh,018h,008h	; a7a7  :..g:..o..

; ======================================================================
; CODIGO 0xa7b1..0xa7ee  (61 bytes)
; ======================================================================


L_A7B1:
	ld a,(0e324h)		;a7b1
	ld h,a			;a7b4
	ld a,(0e326h)		;a7b5
	ld l,a			;a7b8
	call 04e58h		;a7b9
	and 007h		;a7bc
	push hl			;a7be
	ld hl,0a7f4h		;a7bf
	call 04e28h		;a7c2
	pop hl			;a7c5
	add hl,de			;a7c6
	ld a,c			;a7c7
	call 06832h		;a7c8
	bit 7,(ix+008h)		;a7cb
	call nz,06897h		;a7cf
	ld l,(ix+007h)		;a7d2
	ld h,(ix+008h)		;a7d5
	ld de,00300h		;a7d8
	rst 20h			;a7db
	ret nc			;a7dc
L_A7DD:
	jp 06856h		;a7dd
L_A7E0:
	ld hl,la7ech		;a7e0
	call 04e28h		;a7e3
	call 0685dh		;a7e6
	ld de,00600h		;a7e9
L_A7EC:
	jr L_A7DD		;a7ec

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa7ee..0xa804  (22 bytes)
DATA_A7EE:
	defb 000h,0fch,000h,000h,000h,004h,005h,008h,020h,006h,0fch,040h,0edh,035h,025h,0e0h	; a7ee  ........ ..@.5%.
	defb 080h,024h,045h,0f8h,000h,000h	; a7fe

; ======================================================================
; CODIGO 0xa804..0xa86b  (103 bytes)
; ======================================================================


L_A804:
	call L_A784		;a804
	ld (ix+036h),0d0h		;a807
	ld (ix+03ah),0cch		;a80b
	ld a,00eh		;a80f
	ld (ix+037h),a		;a811
	ld (ix+03bh),a		;a814
	jp 06c3fh		;a817
L_A81A:
	res 2,(ix+010h)		;a81a
	ld a,(ix+025h)		;a81e
	and a			;a821
	ret z			;a822
	dec (ix+002h)		;a823
	ret nz			;a826
	ld a,(ix+025h)		;a827
	ld (ix+002h),a		;a82a
	set 2,(ix+010h)		;a82d
	ret			;a831
L_A832:
	ld a,(ix+028h)		;a832
	and a			;a835
	ret z			;a836
	ld (ix+028h),000h		;a837
	ld a,(0e652h)		;a83b
	cp 00ah		;a83e
	ret nc			;a840
	ld e,(ix+004h)		;a841
	ld d,(ix+006h)		;a844
	push de			;a847
	call 06b62h		;a848
	pop de			;a84b
	ld b,003h		;a84c
L_A84E:
	push de			;a84e
	push bc			;a84f
	ld a,b			;a850
	ld hl,0a869h		;a851
	add a,a			;a854
	call 040c4h		;a855
	ld a,e			;a858
	add a,(hl)			;a859
	ld e,a			;a85a
	inc hl			;a85b
	ld a,d			;a85c
	add a,(hl)			;a85d
	ld d,a			;a85e
	ld a,00fh		;a85f
	ld c,000h		;a861
	call 065b5h		;a863
	pop bc			;a866
	pop de			;a867
	djnz L_A84E		;a868
	ret			;a86a

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa86b..0xa871  (6 bytes)
DATA_A86B:
	defb 010h,0f8h,000h,000h,010h,008h	; a86b

; ======================================================================
; CODIGO 0xa871..0xaae9  (632 bytes)
; ======================================================================


L_A871:
	ld a,(0e301h)		;a871
	dec a			;a874
	ld a,003h		;a875
	jr z,L_A880		;a877
	ld a,(0e692h)		;a879
	ld b,a			;a87c
	ld a,005h		;a87d
	sub b			;a87f
L_A880:
	ld (ix+028h),a		;a880
	ld a,(0e620h)		;a883
	and a			;a886
	jr z,L_A894		;a887
	ld b,000h		;a889
	ld a,(ix+006h)		;a88b
	cp 080h		;a88e
	jr c,L_A89E		;a890
	jr L_A89D		;a892
L_A894:
	ld b,000h		;a894
	ld a,(ix+004h)		;a896
	cp 060h		;a899
	jr c,L_A89E		;a89b
L_A89D:
	inc b			;a89d
L_A89E:
	ld (ix+025h),b		;a89e
	ld (ix+013h),002h		;a8a1
	ld (ix+014h),002h		;a8a5
	res 2,(ix+010h)		;a8a9
	ld (ix+029h),001h		;a8ad
L_A8B1:
	call 06872h		;a8b1
	ld a,(0e620h)		;a8b4
	and a			;a8b7
	jr nz,L_A8C0		;a8b8
	ld de,0f800h		;a8ba
	jp 0685dh		;a8bd
L_A8C0:
	ld de,00800h		;a8c0
	jp 06856h		;a8c3
L_A8C6:
	call L_A989		;a8c6
	ld a,(ix+001h)		;a8c9
	dec a			;a8cc
	jr z,L_A918		;a8cd
	dec a			;a8cf
	jr z,L_A92F		;a8d0
	dec a			;a8d2
	jr z,L_A93E		;a8d3
	dec a			;a8d5
	ret z			;a8d6
	ld a,(0e620h)		;a8d7
	and a			;a8da
	jr z,L_A8F6		;a8db
	ld a,(ix+004h)		;a8dd
	cp 064h		;a8e0
	ret c			;a8e2
	call L_A97B		;a8e3
L_A8E6:
	ld de,00800h		;a8e6
	ld a,(ix+025h)		;a8e9
	and a			;a8ec
	call nz,05adfh		;a8ed
	call 0685dh		;a8f0
	jp L_A96F		;a8f3
L_A8F6:
	ld bc,0989ch		;a8f6
	ld a,(ix+025h)		;a8f9
	and a			;a8fc
	jr z,L_A900		;a8fd
	ld b,c			;a8ff
L_A900:
	ld a,(ix+006h)		;a900
	cp b			;a903
	ret nc			;a904
	call L_A97B		;a905
L_A908:
	ld de,00800h		;a908
	ld a,(ix+025h)		;a90b
	and a			;a90e
	call nz,05adfh		;a90f
	call 06856h		;a912
	jp L_A975		;a915
L_A918:
	dec (ix+002h)		;a918
	ret nz			;a91b
	inc (ix+001h)		;a91c
	ld a,(0e620h)		;a91f
	and a			;a922
	ld a,024h		;a923
	jr z,L_A929		;a925
	ld a,012h		;a927
L_A929:
	ld (ix+002h),a		;a929
	jp L_A8B1		;a92c
L_A92F:
	dec (ix+002h)		;a92f
	ret nz			;a932
	inc (ix+001h)		;a933
	ld a,(0e620h)		;a936
	and a			;a939
	jr nz,L_A8E6		;a93a
	jr L_A908		;a93c
L_A93E:
	ld a,(0e620h)		;a93e
	and a			;a941
	jr z,L_A94C		;a942
	ld a,(ix+004h)		;a944
	cp 030h		;a947
	ret nc			;a949
	jr L_A95B		;a94a
L_A94C:
	ld bc,0808ch		;a94c
	ld a,(ix+025h)		;a94f
	and a			;a952
	jr z,L_A956		;a953
	ld b,c			;a955
L_A956:
	ld a,(ix+006h)		;a956
	cp b			;a959
	ret c			;a95a
L_A95B:
	ld a,(ix+004h)		;a95b
	and 0f8h		;a95e
	ld (ix+004h),a		;a960
	inc (ix+001h)		;a963
	call 06872h		;a966
	ld a,(0e620h)		;a969
	and a			;a96c
	jr z,L_A975		;a96d
L_A96F:
	ld de,0f800h		;a96f
	jp 06856h		;a972
L_A975:
	ld de,00800h		;a975
	jp 0685dh		;a978
L_A97B:
	inc (ix+001h)		;a97b
	ld a,(ix+028h)		;a97e
	add a,a			;a981
	add a,a			;a982
	add a,004h		;a983
	ld (ix+002h),a		;a985
	ret			;a988
L_A989:
	dec (ix+029h)		;a989
	ret nz			;a98c
	ld (ix+029h),001h		;a98d
	ld a,(ix+010h)		;a991
	xor 004h		;a994
	ld (ix+010h),a		;a996
	ret			;a999
L_A99A:
	call L_AACE		;a99a
	ld (ix+015h),a		;a99d
	ld a,(0e620h)		;a9a0
	rra			;a9a3
	jr c,L_A9B6		;a9a4
	ld (ix+002h),00ah		;a9a6
	ld (ix+025h),008h		;a9aa
	call 06877h		;a9ae
	ld d,0fch		;a9b1
	jp 0685dh		;a9b3
L_A9B6:
	ld (ix+002h),008h		;a9b6
	ld (ix+025h),00ch		;a9ba
	call 0687ch		;a9be
	ld d,004h		;a9c1
	jp 06856h		;a9c3
L_A9C6:
	ld a,(0e620h)		;a9c6
	rra			;a9c9
	jp c,L_AA46		;a9ca
	bit 0,(ix+001h)		;a9cd
	jr nz,L_A9E3		;a9d1
	ld a,(0e326h)		;a9d3
	cp (ix+006h)		;a9d6
	jr c,L_A9E3		;a9d9
	inc (ix+001h)		;a9db
	ld (ix+015h),002h		;a9de
	ret			;a9e2
L_A9E3:
	call L_AAAF		;a9e3
	dec (ix+002h)		;a9e6
	ret nz			;a9e9
	ld a,(0e326h)		;a9ea
	add a,010h		;a9ed
	sub (ix+006h)		;a9ef
	cpl			;a9f2
	inc a			;a9f3
	ld b,a			;a9f4
	ld e,003h		;a9f5
	ld (ix+002h),004h		;a9f7
	jr c,L_AA10		;a9fb
	ld (ix+002h),018h		;a9fd
	ld a,(ix+025h)		;aa01
	sub 007h		;aa04
	cp 003h		;aa06
	ld a,008h		;aa08
	jr nc,L_AA2E		;aa0a
	ld h,084h		;aa0c
	jr L_AA2B		;aa0e
L_AA10:
	ld a,(0e324h)		;aa10
	sub (ix+004h)		;aa13
	ld d,000h		;aa16
	jr nc,L_AA1D		;aa18
	neg		;aa1a
	inc d			;aa1c
L_AA1D:
	ld c,008h		;aa1d
	call L_AAD8		;aa1f
	dec d			;aa22
	ld a,c			;aa23
	jr z,L_AA2B		;aa24
	xor 00fh		;aa26
	inc a			;aa28
	ld h,088h		;aa29
L_AA2B:
	ld (ix+030h),h		;aa2b
L_AA2E:
	cp (ix+025h)		;aa2e
	ret z			;aa31
	ld a,(ix+025h)		;aa32
	inc a			;aa35
	jr nc,L_AA3A		;aa36
	dec a			;aa38
	dec a			;aa39
L_AA3A:
	ld (ix+025h),a		;aa3a
	and 00fh		;aa3d
	ld b,e			;aa3f
	call 04f1eh		;aa40
	jp 06881h		;aa43
L_AA46:
	call L_AA4F		;aa46
	ld hl,0aae9h		;aa49
	jp 09da7h		;aa4c
L_AA4F:
	bit 0,(ix+001h)		;aa4f
	jr nz,L_AA65		;aa53
	ld a,(0e324h)		;aa55
	cp (ix+004h)		;aa58
	jr nc,L_AA65		;aa5b
	inc (ix+001h)		;aa5d
	ld (ix+015h),002h		;aa60
	ret			;aa64
L_AA65:
	call L_AAAF		;aa65
	dec (ix+002h)		;aa68
	ret nz			;aa6b
	ld a,(0e324h)		;aa6c
	sub 008h		;aa6f
	sub (ix+004h)		;aa71
	ld b,a			;aa74
	ld e,003h		;aa75
	ld (ix+002h),003h		;aa77
	jr nc,L_AA90		;aa7b
	ld (ix+002h),014h		;aa7d
	ld a,(ix+025h)		;aa81
	sub 00bh		;aa84
	cp 003h		;aa86
	ld a,00ch		;aa88
	jr nc,L_AA2E		;aa8a
	ld h,084h		;aa8c
	jr L_AA2B		;aa8e
L_AA90:
	ld a,(0e326h)		;aa90
	sub (ix+006h)		;aa93
	ld d,000h		;aa96
	jr nc,L_AA9D		;aa98
	neg		;aa9a
	inc d			;aa9c
L_AA9D:
	ld c,00ch		;aa9d
	call L_AAD8		;aa9f
	dec d			;aaa2
	ld a,c			;aaa3
	jr z,L_AA2B		;aaa4
	sub 018h		;aaa6
	neg		;aaa8
	ld h,088h		;aaaa
	jp L_AA2B		;aaac
L_AAAF:
	dec (ix+015h)		;aaaf
	ret nz			;aab2
	ld a,(0e64fh)		;aab3
	rra			;aab6
	sub 00dh		;aab7
	neg		;aab9
	bit 0,(ix+001h)		;aabb
	call z,L_AACE		;aabf
	ld (ix+015h),a		;aac2
	ld e,(ix+004h)		;aac5
	ld d,(ix+006h)		;aac8
	jp 074c5h		;aacb
L_AACE:
	call 067cah		;aace
	ld b,a			;aad1
	srl b		;aad2
	srl b		;aad4
	sub b			;aad6
	ret			;aad7
L_AAD8:
	sub b			;aad8
	dec c			;aad9
	ld h,084h		;aada
	ret c			;aadc
	sub b			;aadd
	dec c			;aade
	ld h,08ch		;aadf
	ret c			;aae1
	sub b			;aae2
	ret c			;aae3
	sub b			;aae4
	dec c			;aae5
	ret c			;aae6
	dec c			;aae7
	ret			;aae8

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaae9..0xaaed  (4 bytes)
DATA_AAE9:
	defb 090h,094h,098h,094h	; aae9

; ======================================================================
; CODIGO 0xaaed..0xabb9  (204 bytes)
; ======================================================================


L_AAED:
	ld a,(ix+004h)		;aaed
	ld (ix+025h),a		;aaf0
	ld a,(ix+006h)		;aaf3
	ld (ix+026h),a		;aaf6
L_AAF9:
	ld a,(ix+00ch)		;aaf9
	or a			;aafc
	jr z,L_AB03		;aafd
	ld (ix+031h),006h		;aaff
L_AB03:
	ld a,(0e620h)		;ab03
	rra			;ab06
	jp c,L_AC05		;ab07
	bit 0,(ix+019h)		;ab0a
	jr nz,L_AB14		;ab0e
	ld (ix+030h),0a0h		;ab10
L_AB14:
	ld (ix+029h),000h		;ab14
	call 04f9bh		;ab18
	call 06872h		;ab1b
L_AB1E:
	call 067d0h		;ab1e
	srl a		;ab21
	ld (ix+015h),a		;ab23
	ret			;ab26
L_AB27:
	ld a,(0e620h)		;ab27
	rra			;ab2a
	jp c,L_AC1C		;ab2b
	call L_AB78		;ab2e
	bit 0,(ix+001h)		;ab31
	jr nz,L_AB4C		;ab35
	call L_ABC4		;ab37
	ret nc			;ab3a
	inc (ix+001h)		;ab3b
	bit 0,(ix+019h)		;ab3e
	ld de,0fd00h		;ab42
	jr z,L_AB49		;ab45
	ld d,003h		;ab47
L_AB49:
	jp 06856h		;ab49
L_AB4C:
	bit 0,(ix+019h)		;ab4c
	ld bc,00030h		;ab50
	jr z,L_AB58		;ab53
	ld bc,0ffd0h		;ab55
L_AB58:
	ld a,(ix+004h)		;ab58
	sub (ix+025h)		;ab5b
	add a,002h		;ab5e
	cp 005h		;ab60
	jp nc,06bf3h		;ab62
	ld a,(ix+025h)		;ab65
	ld (ix+004h),a		;ab68
	dec (ix+001h)		;ab6b
	jp 06877h		;ab6e
L_AB71:
	ld a,(0e620h)		;ab71
	rra			;ab74
	jp c,L_AC5F		;ab75
L_AB78:
	call L_ABF6		;ab78
	dec (ix+015h)		;ab7b
	ret nz			;ab7e
	call L_AB1E		;ab7f
	ld a,(ix+029h)		;ab82
	xor 001h		;ab85
	ld (ix+029h),a		;ab87
	ld b,003h		;ab8a
	ld hl,0abbbh		;ab8c
	jr z,L_AB95		;ab8f
	inc b			;ab91
	ld hl,0abc0h		;ab92
L_AB95:
	push bc			;ab95
	bit 0,(ix+019h)		;ab96
	ld a,(hl)			;ab9a
	jr z,L_ABA1		;ab9b
	sub 010h		;ab9d
	neg		;ab9f
L_ABA1:
	inc hl			;aba1
	push hl			;aba2
	ld b,004h		;aba3
	call 04f1eh		;aba5
	ex de,hl			;aba8
	ld c,e			;aba9
	ld b,d			;abaa
	ld e,(ix+004h)		;abab
	ld d,(ix+006h)		;abae
	call 074a2h		;abb1
	pop hl			;abb4
	pop bc			;abb5
	djnz L_AB95		;abb6
	ret			;abb8

; ----------------------------------------------------------------------
; DATOS sin identificar  0xabb9..0xabc4  (11 bytes)
DATA_ABB9:
	defb 00ah,008h,006h,004h,002h,00bh,009h,007h,005h,003h,001h	; abb9  ...........

; ======================================================================
; CODIGO 0xabc4..0xad0f  (331 bytes)
; ======================================================================


L_ABC4:
	ld b,005h		;abc4
	ld hl,0e470h		;abc6
	ld de,00048h		;abc9
L_ABCC:
	ld (ix+027h),l		;abcc
	ld (ix+028h),h		;abcf
	ld a,(hl)			;abd2
	or a			;abd3
	jr z,L_ABEC		;abd4
	ld a,(ix+004h)		;abd6
	inc hl			;abd9
	inc hl			;abda
	inc hl			;abdb
	sub (hl)			;abdc
	add a,010h		;abdd
	cp 018h		;abdf
	jr nc,L_ABEC		;abe1
	ld a,(ix+006h)		;abe3
	inc hl			;abe6
	inc hl			;abe7
	sub (hl)			;abe8
	cp 021h		;abe9
	ret c			;abeb
L_ABEC:
	ld l,(ix+027h)		;abec
	ld h,(ix+028h)		;abef
	add hl,de			;abf2
	djnz L_ABCC		;abf3
	ret			;abf5
L_ABF6:
	ld a,(0e203h)		;abf6
	and 007h		;abf9
	ret nz			;abfb
	ld a,(ix+030h)		;abfc
	xor 004h		;abff
	ld (ix+030h),a		;ac01
	ret			;ac04
L_AC05:
	bit 0,(ix+019h)		;ac05
	jr z,L_AC0F		;ac09
	ld (ix+030h),0a0h		;ac0b
L_AC0F:
	ld (ix+029h),000h		;ac0f
	call 04f9bh		;ac13
	call 06872h		;ac16
	jp L_AB1E		;ac19
L_AC1C:
	call L_AC5F		;ac1c
	bit 0,(ix+001h)		;ac1f
	jr nz,L_AC3A		;ac23
	call L_ACA2		;ac25
	ret nc			;ac28
	inc (ix+001h)		;ac29
	bit 0,(ix+019h)		;ac2c
	ld de,0fd00h		;ac30
	jr z,L_AC37		;ac33
	ld d,003h		;ac35
L_AC37:
	jp 0685dh		;ac37
L_AC3A:
	bit 0,(ix+019h)		;ac3a
	ld bc,00030h		;ac3e
	jr z,L_AC46		;ac41
	ld bc,0ffd0h		;ac43
L_AC46:
	ld a,(ix+006h)		;ac46
	sub (ix+026h)		;ac49
	add a,002h		;ac4c
	cp 005h		;ac4e
	jp nc,06c01h		;ac50
	ld a,(ix+026h)		;ac53
	ld (ix+006h),a		;ac56
	dec (ix+001h)		;ac59
	jp 0687ch		;ac5c
L_AC5F:
	call L_ABF6		;ac5f
	dec (ix+015h)		;ac62
	ret nz			;ac65
	call L_AB1E		;ac66
	ld a,(ix+029h)		;ac69
	xor 001h		;ac6c
	ld (ix+029h),a		;ac6e
	ld b,003h		;ac71
	ld hl,0abb9h		;ac73
	jr z,L_AC7C		;ac76
	inc b			;ac78
	ld hl,0abbeh		;ac79
L_AC7C:
	push bc			;ac7c
	add a,(hl)			;ac7d
	bit 0,(ix+019h)		;ac7e
	jr z,L_AC8A		;ac82
	sub 018h		;ac84
	neg		;ac86
	and 00fh		;ac88
L_AC8A:
	inc hl			;ac8a
	push hl			;ac8b
	ld b,004h		;ac8c
	call 04f1eh		;ac8e
	ex de,hl			;ac91
	ld c,e			;ac92
	ld b,d			;ac93
	ld e,(ix+004h)		;ac94
	ld d,(ix+006h)		;ac97
	call 074a2h		;ac9a
	pop hl			;ac9d
	pop bc			;ac9e
	djnz L_AC7C		;ac9f
	ret			;aca1
L_ACA2:
	ld b,005h		;aca2
	ld hl,0e470h		;aca4
	ld de,00048h		;aca7
L_ACAA:
	ld (ix+027h),l		;acaa
	ld (ix+028h),h		;acad
	ld a,(hl)			;acb0
	or a			;acb1
	jr z,L_ACCA		;acb2
	ld a,(ix+004h)		;acb4
	inc hl			;acb7
	inc hl			;acb8
	inc hl			;acb9
	sub (hl)			;acba
	add a,020h		;acbb
	jr nc,L_ACCA		;acbd
	ld a,(ix+006h)		;acbf
	inc hl			;acc2
	inc hl			;acc3
	sub (hl)			;acc4
	add a,010h		;acc5
	cp 018h		;acc7
	ret c			;acc9
L_ACCA:
	ld l,(ix+027h)		;acca
	ld h,(ix+028h)		;accd
	add hl,de			;acd0
	djnz L_ACAA		;acd1
	ret			;acd3
L_ACD4:
	call 06877h		;acd4
	bit 0,(ix+019h)		;acd7
	ld d,0feh		;acdb
	jr nz,L_ACE1		;acdd
	ld d,002h		;acdf
L_ACE1:
	ld (ix+025h),d		;ace1
	call 0685dh		;ace4
	ld a,(ix+004h)		;ace7
	cp 060h		;acea
	ld a,001h		;acec
	jr c,L_ACF1		;acee
	xor a			;acf0
L_ACF1:
	ld (ix+029h),a		;acf1
	or a			;acf4
	ld hl,00060h		;acf5
	jr z,L_ACFD		;acf8
	ld hl,0ffa0h		;acfa
L_ACFD:
	ld (ix+027h),l		;acfd
	ld (ix+028h),h		;ad00
	jp 06bbeh		;ad03
L_AD06:
	call L_AE05		;ad06
	ld a,(ix+001h)		;ad09
	call 040ceh		;ad0c

; ----------------------------------------------------------------------
; DATOS tabla_AD0F: 3 destinos del despachador p00:40CE (call en p12:AD0C, el
;   indice en A): AD15, AD7B, ADA5; lo leen p12:AD0C (6 bytes)
;   0xad0f..0xad15  (6 bytes)
DATA_tabla_AD0F:
	defw 0ad15h,0ad7bh,0ada5h	; ad0f  -> L_AD15 L_AD7B L_ADA5

; ======================================================================
; CODIGO 0xad15..0xae92  (381 bytes)
; ======================================================================


L_AD15:
	ld h,(ix+006h)		;ad15
	ld a,(ix+004h)		;ad18
	bit 0,(ix+029h)		;ad1b
	jr z,L_AD23		;ad1f
	sub 018h		;ad21
L_AD23:
	add a,010h		;ad23
	ld l,a			;ad25
	call 07ed4h		;ad26
	jr c,L_AD37		;ad29
	inc (ix+001h)		;ad2b
	ld a,(ix+00ah)		;ad2e
	sra a		;ad31
	ld (ix+00ah),a		;ad33
	ret			;ad36
L_AD37:
	ld hl,(0e6bch)		;ad37
	bit 0,(ix+029h)		;ad3a
	ld bc,0ffc0h		;ad3e
	jr z,L_AD46		;ad41
	ld bc,00040h		;ad43
L_AD46:
	add hl,bc			;ad46
	ld (0e6bch),hl		;ad47
	call 07edah		;ad4a
	jr c,L_AD56		;ad4d
	dec (ix+002h)		;ad4f
	ret nz			;ad52
	call 06bbeh		;ad53
L_AD56:
	ld (ix+001h),002h		;ad56
	ld (ix+015h),00dh		;ad5a
	ld a,(0e326h)		;ad5e
	cp (ix+006h)		;ad61
	ld de,00200h		;ad64
	jr nc,L_AD6B		;ad67
	ld d,0feh		;ad69
L_AD6B:
	call 0685dh		;ad6b
	bit 0,(ix+029h)		;ad6e
	ld d,0fbh		;ad72
	jr z,L_AD78		;ad74
	ld d,005h		;ad76
L_AD78:
	jp 06856h		;ad78
L_AD7B:
	dec (ix+002h)		;ad7b
	jr nz,L_AD83		;ad7e
	call 06bbeh		;ad80
L_AD83:
	ld h,(ix+006h)		;ad83
	ld a,(ix+004h)		;ad86
	bit 0,(ix+029h)		;ad89
	jr z,L_AD91		;ad8d
	sub 018h		;ad8f
L_AD91:
	add a,010h		;ad91
	ld l,a			;ad93
	call 07ed4h		;ad94
	ld a,(ix+025h)		;ad97
	jr c,L_ADEC		;ad9a
L_AD9C:
	ld c,(ix+027h)		;ad9c
	ld b,(ix+028h)		;ad9f
	jp 06bf3h		;ada2
L_ADA5:
	dec (ix+015h)		;ada5
	jr nz,L_ADB3		;ada8
	ld e,(ix+004h)		;adaa
	ld d,(ix+006h)		;adad
	call 074c5h		;adb0
L_ADB3:
	ld a,(ix+008h)		;adb3
	rla			;adb6
	rla			;adb7
	xor (ix+029h)		;adb8
	rra			;adbb
	jr c,L_AD9C		;adbc
	ld h,(ix+006h)		;adbe
	ld a,(ix+004h)		;adc1
	bit 0,(ix+029h)		;adc4
	jr z,L_ADCC		;adc8
	sub 018h		;adca
L_ADCC:
	add a,010h		;adcc
	ld l,a			;adce
	call 07ed4h		;adcf
	jr nc,L_AD9C		;add2
	ld e,(ix+004h)		;add4
	ld d,(ix+006h)		;add7
	call 074c5h		;adda
	ld a,(0e326h)		;addd
	cp (ix+006h)		;ade0
	ld a,002h		;ade3
	jr nc,L_ADE9		;ade5
	ld a,0feh		;ade7
L_ADE9:
	ld (ix+025h),a		;ade9
L_ADEC:
	ld (ix+00ah),a		;adec
	call 06877h		;adef
	ld (ix+001h),000h		;adf2
	bit 0,(ix+029h)		;adf6
	ld a,(ix+004h)		;adfa
	jr z,L_ADFF		;adfd
L_ADFF:
	and 0f8h		;adff
	ld (ix+004h),a		;ae01
	ret			;ae04
L_AE05:
	ld a,(0e203h)		;ae05
	and 00ch		;ae08
	add a,0e0h		;ae0a
	ld (ix+030h),a		;ae0c
	ret			;ae0f
L_AE10:
	ld (ix+004h),098h		;ae10
	ld hl,0e203h		;ae14
	bit 0,(hl)		;ae17
	ld a,030h		;ae19
	jr z,L_AE1F		;ae1b
	ld a,0e0h		;ae1d
L_AE1F:
	ld (ix+006h),a		;ae1f
	call 0687ch		;ae22
	ld d,0feh		;ae25
	call 06856h		;ae27
	bit 7,(ix+006h)		;ae2a
	ld a,001h		;ae2e
	jr z,L_AE33		;ae30
	xor a			;ae32
L_AE33:
	ld (ix+019h),a		;ae33
	ld l,(ix+004h)		;ae36
	ld a,(ix+006h)		;ae39
	bit 0,(ix+019h)		;ae3c
	jr z,L_AE44		;ae40
	sub 018h		;ae42
L_AE44:
	add a,010h		;ae44
	ld h,a			;ae46
	call 07ebfh		;ae47
L_AE4A:
	ld hl,(0e6bch)		;ae4a
	bit 0,(ix+019h)		;ae4d
	dec hl			;ae51
	jr z,L_AE56		;ae52
	inc hl			;ae54
	inc hl			;ae55
L_AE56:
	ld (0e6bch),hl		;ae56
	call 07ec5h		;ae59
	jr nc,L_AE77		;ae5c
	bit 0,(ix+019h)		;ae5e
	ld a,0f8h		;ae62
	jr z,L_AE68		;ae64
	ld a,008h		;ae66
L_AE68:
	add a,(ix+006h)		;ae68
	ld (ix+006h),a		;ae6b
	sub 030h		;ae6e
	cp 0a0h		;ae70
	jr c,L_AE4A		;ae72
	jp 06b62h		;ae74
L_AE77:
	call L_AF85		;ae77
L_AE7A:
	ld a,r		;ae7a
	and 01fh		;ae7c
	add a,01eh		;ae7e
	ld (ix+002h),a		;ae80
	ret			;ae83
L_AE84:
	ld a,(ix+006h)		;ae84
	cp 0f8h		;ae87
	jp nc,06b62h		;ae89
	ld a,(ix+001h)		;ae8c
	call 040ceh		;ae8f

; ----------------------------------------------------------------------
; DATOS tabla_AE92: 4 destinos del despachador p00:40CE (call en p12:AE8F, el
;   indice en A): AE9A, AF0F, AF44, AF64; lo leen p12:AE8F (8 bytes)
;   0xae92..0xae9a  (8 bytes)
DATA_tabla_AE92:
	defw 0ae9ah,0af0fh,0af44h,0af64h	; ae92  -> L_AE9A L_AF0F L_AF44 L_AF64

; ======================================================================
; CODIGO 0xae9a..0xafec  (338 bytes)
; ======================================================================


L_AE9A:
	call L_AFD0		;ae9a
	ld l,(ix+004h)		;ae9d
	ld a,(ix+006h)		;aea0
	bit 0,(ix+019h)		;aea3
	jr z,L_AEAB		;aea7
	sub 018h		;aea9
L_AEAB:
	add a,010h		;aeab
	ld h,a			;aead
	call 07ebfh		;aeae
	jr c,L_AEC9		;aeb1
	ld (ix+001h),002h		;aeb3
	bit 0,(ix+019h)		;aeb7
	ld a,008h		;aebb
	jr z,L_AEC1		;aebd
	ld a,0f8h		;aebf
L_AEC1:
	ld (ix+027h),a		;aec1
	ld (ix+010h),011h		;aec4
	ret			;aec8
L_AEC9:
	ld hl,(0e6bch)		;aec9
	bit 0,(ix+019h)		;aecc
	dec hl			;aed0
	jr z,L_AED5		;aed1
	inc hl			;aed3
	inc hl			;aed4
L_AED5:
	ld (0e6bch),hl		;aed5
	call 07ec5h		;aed8
	jr nc,L_AEF6		;aedb
	inc (ix+001h)		;aedd
	ld (ix+028h),002h		;aee0
	ld (ix+010h),00bh		;aee4
	bit 0,(ix+019h)		;aee8
	ld a,0fch		;aeec
	jr z,L_AEF2		;aeee
	ld a,004h		;aef0
L_AEF2:
	ld (ix+027h),a		;aef2
	ret			;aef5
L_AEF6:
	dec (ix+002h)		;aef6
	ret nz			;aef9
	ld (ix+001h),003h		;aefa
	ld (ix+002h),028h		;aefe
	call L_AFF4		;af02
	call L_AF85		;af05
	ld (ix+010h),00bh		;af08
	jp 06877h		;af0c
L_AF0F:
	call L_AFD0		;af0f
	ld a,(ix+006h)		;af12
	add a,(ix+027h)		;af15
	ld (ix+006h),a		;af18
	dec (ix+028h)		;af1b
	ret nz			;af1e
	ld (ix+028h),002h		;af1f
	ld l,(ix+004h)		;af23
	bit 0,(ix+019h)		;af26
	jr nz,L_AF2E		;af2a
	add a,008h		;af2c
L_AF2E:
	ld h,a			;af2e
	call 07ebfh		;af2f
	ret c			;af32
L_AF33:
	ld (ix+010h),007h		;af33
	ld (ix+001h),000h		;af37
	ld a,(ix+006h)		;af3b
	and 0f8h		;af3e
	ld (ix+006h),a		;af40
	ret			;af43
L_AF44:
	ld a,(ix+006h)		;af44
	add a,(ix+027h)		;af47
	ld (ix+006h),a		;af4a
	ld l,(ix+004h)		;af4d
	ld a,(ix+006h)		;af50
	bit 0,(ix+019h)		;af53
	jr z,L_AF5B		;af57
	sub 018h		;af59
L_AF5B:
	add a,010h		;af5b
	ld h,a			;af5d
	call 07ebfh		;af5e
	jr c,L_AF33		;af61
	ret			;af63
L_AF64:
	dec (ix+002h)		;af64
	jp nz,L_AF90		;af67
	ld a,(0e324h)		;af6a
	cp (ix+004h)		;af6d
	ld de,00200h		;af70
	jr nc,L_AF77		;af73
	ld d,0feh		;af75
L_AF77:
	call 06856h		;af77
	ld (ix+010h),007h		;af7a
	ld (ix+001h),000h		;af7e
	jp L_AE7A		;af82
L_AF85:
	ld a,(0e64fh)		;af85
	sub 020h		;af88
	neg		;af8a
	ld (ix+015h),a		;af8c
	ret			;af8f
L_AF90:
	dec (ix+015h)		;af90
	ret nz			;af93
	call L_AF85		;af94
	call L_AFF4		;af97
	bit 0,(ix+019h)		;af9a
	jr nz,L_AFA9		;af9e
	ld a,(0e326h)		;afa0
	cp (ix+006h)		;afa3
	ret nc			;afa6
	jr L_AFB0		;afa7
L_AFA9:
	ld a,(0e326h)		;afa9
	cp (ix+006h)		;afac
	ret c			;afaf
L_AFB0:
	ld e,(ix+004h)		;afb0
	ld d,(ix+006h)		;afb3
	call 07594h		;afb6
	ld a,(0f018h)		;afb9
	cp 080h		;afbc
	jr c,L_AFC2		;afbe
	neg		;afc0
L_AFC2:
	cp 040h		;afc2
	jr c,L_AFC8		;afc4
	sub 040h		;afc6
L_AFC8:
	sub 008h		;afc8
	cp 030h		;afca
	ret nc			;afcc
	jp 081d2h		;afcd
L_AFD0:
	ld a,(ix+008h)		;afd0
	or a			;afd3
	ld hl,0afech		;afd4
	jp p,L_AFDC		;afd7
	inc hl			;afda
	inc hl			;afdb
L_AFDC:
	bit 0,(ix+019h)		;afdc
	jr nz,L_AFE6		;afe0
	ld bc,00004h		;afe2
	add hl,bc			;afe5
L_AFE6:
	ld bc,00302h		;afe6
	jp 06591h		;afe9

; ----------------------------------------------------------------------
; DATOS sin identificar  0xafec..0xaff4  (8 bytes)
DATA_AFEC:
	defb 0d0h,0d4h,0dch,0e0h,0e8h,0ech,0f4h,0f8h	; afec  ........

; ======================================================================
; CODIGO 0xaff4..0xb1c6  (466 bytes)
; ======================================================================


L_AFF4:
	bit 0,(ix+019h)		;aff4
	jr nz,L_B00A		;aff8
	ld b,0f0h		;affa
	ld a,(0e324h)		;affc
	cp (ix+004h)		;afff
	jr nc,L_B006		;b002
	ld b,0fch		;b004
L_B006:
	ld (ix+030h),b		;b006
	ret			;b009
L_B00A:
	ld b,0d8h		;b00a
	ld a,(0e324h)		;b00c
	cp (ix+004h)		;b00f
	jr nc,L_B016		;b012
	ld b,0e4h		;b014
L_B016:
	ld (ix+030h),b		;b016
	ret			;b019
L_B01A:
	ld a,(ix+004h)		;b01a
	cp 060h		;b01d
	ld bc,000d0h		;b01f
	jr c,L_B027		;b022
	ld bc,001dch		;b024
L_B027:
	ld (ix+027h),b		;b027
	ld (ix+030h),c		;b02a
	ld (ix+025h),00ah		;b02d
	call 06877h		;b031
	ld de,00200h		;b034
	call 0685dh		;b037
L_B03A:
	ld a,r		;b03a
	and 01fh		;b03c
	add a,02dh		;b03e
	ld (ix+002h),a		;b040
	ret			;b043
L_B044:
	call L_B1F4		;b044
	jp c,08c9ch		;b047
	call L_B226		;b04a
	jp c,06b62h		;b04d
	ld a,(ix+001h)		;b050
	dec a			;b053
	jr z,L_B08E		;b054
	jp p,L_B0C0		;b056
	call 06587h		;b059
	jr z,L_B080		;b05c
	dec (ix+002h)		;b05e
	jr z,L_B069		;b061
	call L_B0C9		;b063
	jp L_B1AA		;b066
L_B069:
	inc (ix+001h)		;b069
	ld (ix+002h),05ah		;b06c
	call L_B1CE		;b070
	call L_B0C5		;b073
	call L_B15E		;b076
	ld (ix+010h),00bh		;b079
	jp 0687ch		;b07d
L_B080:
	ld (ix+010h),007h		;b080
	ld (ix+001h),002h		;b084
	ld de,0fe00h		;b088
	jp 0685dh		;b08b
L_B08E:
	call 06587h		;b08e
	jr z,L_B080		;b091
	dec (ix+002h)		;b093
	jr z,L_B0A4		;b096
	call L_B16A		;b098
	ld a,(0e301h)		;b09b
	cp 007h		;b09e
	ret nz			;b0a0
	jp L_B0C9		;b0a1
L_B0A4:
	ld a,(0e326h)		;b0a4
	cp (ix+006h)		;b0a7
	ld de,00200h		;b0aa
	jr nc,L_B0B2		;b0ad
	ld de,0fe00h		;b0af
L_B0B2:
	call 0685dh		;b0b2
L_B0B5:
	ld (ix+010h),007h		;b0b5
	ld (ix+001h),000h		;b0b9
	jp L_B03A		;b0bd
L_B0C0:
	call L_B1AA		;b0c0
	jr L_B0C9		;b0c3
L_B0C5:
	ld a,001h		;b0c5
	jr L_B0CA		;b0c7
L_B0C9:
	xor a			;b0c9
L_B0CA:
	ld (0e666h),a		;b0ca
	ld a,(ix+004h)		;b0cd
	ld (ix+028h),a		;b0d0
	bit 0,(ix+027h)		;b0d3
	jr z,L_B122		;b0d7
L_B0D9:
	ld h,(ix+006h)		;b0d9
	ld a,(ix+004h)		;b0dc
	add a,010h		;b0df
	ld l,a			;b0e1
	call 07ed4h		;b0e2
	jr nc,L_B110		;b0e5
L_B0E7:
	ld hl,(0e6bch)		;b0e7
	ld bc,0ffc0h		;b0ea
	add hl,bc			;b0ed
	ld (0e6bch),hl		;b0ee
	call 07edah		;b0f1
	ret nc			;b0f4
	ld a,(ix+004h)		;b0f5
	sub 008h		;b0f8
	ld (ix+004h),a		;b0fa
	cp 010h		;b0fd
	jr nc,L_B0E7		;b0ff
L_B101:
	call 06561h		;b101
	ld (ix+025h),005h		;b104
	ld a,(ix+028h)		;b108
	ld (ix+004h),a		;b10b
	jr L_B0B5		;b10e
L_B110:
	ld a,(ix+004h)		;b110
	cp 090h		;b113
	ret nc			;b115
	add a,008h		;b116
	ld (ix+004h),a		;b118
	ld a,(0e666h)		;b11b
	or a			;b11e
	jr nz,L_B0D9		;b11f
	ret			;b121
L_B122:
	ld h,(ix+006h)		;b122
	ld l,(ix+004h)		;b125
	call 07ed4h		;b128
	jr nc,L_B13B		;b12b
	ld a,(ix+004h)		;b12d
	add a,008h		;b130
	ld (ix+004h),a		;b132
	cp 080h		;b135
	jr c,L_B122		;b137
	jr L_B101		;b139
L_B13B:
	ld hl,(0e6bch)		;b13b
	ld bc,0ffc0h		;b13e
	add hl,bc			;b141
	ld (0e6bch),hl		;b142
	call 07edah		;b145
	ret c			;b148
	ld a,(ix+004h)		;b149
	cp 009h		;b14c
	ret c			;b14e
	ld a,(ix+004h)		;b14f
	sub 008h		;b152
	ld (ix+004h),a		;b154
	ld a,(0e666h)		;b157
	or a			;b15a
	jr nz,L_B13B		;b15b
	ret			;b15d
L_B15E:
	ld a,(0e64fh)		;b15e
	add a,a			;b161
	sub 03ch		;b162
	neg		;b164
	ld (ix+015h),a		;b166
	ret			;b169
L_B16A:
	dec (ix+015h)		;b16a
	ret nz			;b16d
	call L_B15E		;b16e
	call L_B1CE		;b171
	bit 0,(ix+027h)		;b174
	jr z,L_B183		;b178
	ld a,(0e324h)		;b17a
	cp (ix+004h)		;b17d
	ret nc			;b180
	jr L_B18A		;b181
L_B183:
	ld a,(0e324h)		;b183
	cp (ix+004h)		;b186
	ret c			;b189
L_B18A:
	ld e,(ix+004h)		;b18a
	ld d,(ix+006h)		;b18d
	call 07594h		;b190
	ld a,(0f018h)		;b193
	cp 080h		;b196
	jr c,L_B19C		;b198
	neg		;b19a
L_B19C:
	cp 040h		;b19c
	jr c,L_B1A2		;b19e
	sub 040h		;b1a0
L_B1A2:
	sub 008h		;b1a2
	cp 030h		;b1a4
	ret nc			;b1a6
	jp 081d2h		;b1a7
L_B1AA:
	ld a,(ix+00ah)		;b1aa
	or a			;b1ad
	ld hl,0b1c6h		;b1ae
	jp p,L_B1B6		;b1b1
	inc hl			;b1b4
	inc hl			;b1b5
L_B1B6:
	bit 0,(ix+027h)		;b1b6
	jr z,L_B1C0		;b1ba
	ld bc,00004h		;b1bc
	add hl,bc			;b1bf
L_B1C0:
	ld bc,00302h		;b1c0
	jp 06591h		;b1c3

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb1c6..0xb1ce  (8 bytes)
DATA_B1C6:
	defb 0e8h,0ech,0d0h,0d4h,0f4h,0f8h,0dch,0e0h	; b1c6  ........

; ======================================================================
; CODIGO 0xb1ce..0xb280  (178 bytes)
; ======================================================================


L_B1CE:
	bit 0,(ix+027h)		;b1ce
	jr z,L_B1E4		;b1d2
	ld b,0fch		;b1d4
	ld a,(0e326h)		;b1d6
	cp (ix+006h)		;b1d9
	jr nc,L_B1E0		;b1dc
	ld b,0e4h		;b1de
L_B1E0:
	ld (ix+030h),b		;b1e0
	ret			;b1e3
L_B1E4:
	ld b,0f0h		;b1e4
	ld a,(0e326h)		;b1e6
	cp (ix+006h)		;b1e9
	jr nc,L_B1F0		;b1ec
	ld b,0d8h		;b1ee
L_B1F0:
	ld (ix+030h),b		;b1f0
	ret			;b1f3
L_B1F4:
	ld a,(0e301h)		;b1f4
	sub 007h		;b1f7
	cp 001h		;b1f9
	ret nc			;b1fb
	ld l,(ix+004h)		;b1fc
	ld h,(ix+006h)		;b1ff
	call 05a99h		;b202
	ld (0f000h),hl		;b205
	ld (0f002h),hl		;b208
	ld de,0029ah		;b20b
	ld bc,00040h		;b20e
	call L_B21D		;b211
	ret c			;b214
	ld hl,(0f000h)		;b215
	ld a,l			;b218
	and 01fh		;b219
	ret z			;b21b
	inc hl			;b21c
L_B21D:
	ld a,(hl)			;b21d
	sub e			;b21e
	cp d			;b21f
	ret nc			;b220
	add hl,bc			;b221
	ld a,(hl)			;b222
	sub e			;b223
	cp d			;b224
	ret			;b225
L_B226:
	ld a,(0e301h)		;b226
	sub 007h		;b229
	cp 001h		;b22b
	ret nc			;b22d
	ld a,(0e627h)		;b22e
	or a			;b231
	ret nz			;b232
	ld a,(0e605h)		;b233
	ld c,a			;b236
	ld hl,(0f002h)		;b237
	call L_B24C		;b23a
	ret nc			;b23d
	inc hl			;b23e
	call L_B24C		;b23f
	ret nc			;b242
	ld de,0003fh		;b243
	add hl,de			;b246
	call L_B24C		;b247
	ret nc			;b24a
	inc hl			;b24b
L_B24C:
	ld a,(hl)			;b24c
	cp c			;b24d
	ccf			;b24e
	ret			;b24f
L_B250:
	call 06bcdh		;b250
	ld (ix+002h),028h		;b253
	ld a,(ix+006h)		;b257
	sub 050h		;b25a
	ld (ix+025h),a		;b25c
	ld a,(ix+004h)		;b25f
	bit 0,(ix+019h)		;b262
	ld b,0d0h		;b266
	jr z,L_B26C		;b268
	ld b,030h		;b26a
L_B26C:
	add a,b			;b26c
	ld (ix+027h),a		;b26d
	ld a,(ix+019h)		;b270
	ld hl,0b280h		;b273
	call 04e28h		;b276
	ld l,000h		;b279
	ld h,e			;b27b
	ld e,l			;b27c
	jp 06881h		;b27d

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb280..0xb284  (4 bytes)
DATA_B280:
	defb 0fdh,0ffh,003h,0ffh	; b280

; ======================================================================
; CODIGO 0xb284..0xb318  (148 bytes)
; ======================================================================


L_B284:
	call L_B312		;b284
	call 07626h		;b287
	ld a,(ix+001h)		;b28a
	dec a			;b28d
	jr z,L_B2AF		;b28e
	dec a			;b290
	ret z			;b291
	dec (ix+006h)		;b292
	call L_B2DE		;b295
	call L_B301		;b298
	dec (ix+002h)		;b29b
	ret nz			;b29e
	ld (ix+002h),014h		;b29f
	inc (ix+001h)		;b2a3
	ld e,(ix+004h)		;b2a6
	ld d,(ix+006h)		;b2a9
	jp 074c5h		;b2ac
L_B2AF:
	dec (ix+006h)		;b2af
	bit 0,(ix+019h)		;b2b2
	ld bc,00010h		;b2b6
	jr nz,L_B2BE		;b2b9
	dec b			;b2bb
	ld c,0f0h		;b2bc
L_B2BE:
	call 06bf3h		;b2be
	ld bc,0004dh		;b2c1
	call 06c01h		;b2c4
	dec (ix+002h)		;b2c7
	ret nz			;b2ca
	inc (ix+001h)		;b2cb
	xor a			;b2ce
	ld (ix+003h),a		;b2cf
	ld (ix+005h),a		;b2d2
	call 06877h		;b2d5
	ld de,00600h		;b2d8
	jp 0685dh		;b2db
L_B2DE:
	bit 0,(ix+019h)		;b2de
	ld a,(ix+004h)		;b2e2
	ld b,000h		;b2e5
	jr nz,L_B2F4		;b2e7
	cp (ix+027h)		;b2e9
	ld c,04dh		;b2ec
	jr c,L_B2FE		;b2ee
	ld c,0c0h		;b2f0
	jr L_B2FD		;b2f2
L_B2F4:
	cp (ix+027h)		;b2f4
	ld c,040h		;b2f7
	jr c,L_B2FE		;b2f9
	ld c,0b3h		;b2fb
L_B2FD:
	dec b			;b2fd
L_B2FE:
	jp 06bf3h		;b2fe
L_B301:
	ld a,(ix+006h)		;b301
	cp (ix+025h)		;b304
	ld bc,0ffc9h		;b307
	jr nc,L_B30F		;b30a
	ld bc,00040h		;b30c
L_B30F:
	jp 06c01h		;b30f
L_B312:
	ld hl,0b318h		;b312
	jp 06bd5h		;b315

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb318..0xb31e  (6 bytes)
DATA_B318:
	defb 060h,064h,068h,06ch,068h,064h	; b318

; ======================================================================
; CODIGO 0xb31e..0xb367  (73 bytes)
; ======================================================================


L_B31E:
	call 06bcdh		;b31e
	ld a,(ix+004h)		;b321
	cp 054h		;b324
	ld a,001h		;b326
	jr c,L_B32B		;b328
	xor a			;b32a
L_B32B:
	ld (ix+029h),a		;b32b
	ld a,(ix+029h)		;b32e
	or a			;b331
	ld hl,00040h		;b332
	jr z,L_B33A		;b335
	ld l,0c0h		;b337
	dec h			;b339
L_B33A:
	ld (ix+027h),l		;b33a
	ld (ix+028h),h		;b33d
	call 06877h		;b340
	bit 0,(ix+019h)		;b343
	ld d,0feh		;b347
	ld a,040h		;b349
	jr z,L_B355		;b34b
	ld (ix+001h),001h		;b34d
	ld d,002h		;b351
	ld a,020h		;b353
L_B355:
	ld (ix+002h),a		;b355
	ld (ix+025h),d		;b358
	jp 0685dh		;b35b
L_B35E:
	call L_B461		;b35e
	ld a,(ix+001h)		;b361
	call 040ceh		;b364

; ----------------------------------------------------------------------
; DATOS tabla_B367: 5 destinos del despachador p00:40CE (call en p12:B364, el
;   indice en A): B371, B383, B3F1, B3F1, B426; lo leen p12:B364 (10 bytes)
;   0xb367..0xb371  (10 bytes)
DATA_tabla_B367:
	defw 0b371h,0b383h,0b3f1h,0b3f1h,0b426h	; b367

; ======================================================================
; CODIGO 0xb371..0xb470  (255 bytes)
; ======================================================================


L_B371:
	dec (ix+002h)		;b371
	jr nz,L_B3B0		;b374
	call 06bbeh		;b376
	ld (ix+00ah),002h		;b379
	ld (ix+025h),002h		;b37d
	jr L_B3B0		;b381
L_B383:
	dec (ix+002h)		;b383
	jr nz,L_B3B0		;b386
	set 3,(ix+010h)		;b388
	call 06bbeh		;b38c
	ld (ix+001h),004h		;b38f
	ld a,(0e326h)		;b393
	cp (ix+006h)		;b396
	ld de,00200h		;b399
	jr nc,L_B3A0		;b39c
	ld d,0feh		;b39e
L_B3A0:
	call 0685dh		;b3a0
	bit 0,(ix+029h)		;b3a3
	ld d,0fch		;b3a7
	jr z,L_B3AD		;b3a9
	ld d,004h		;b3ab
L_B3AD:
	jp 06856h		;b3ad
L_B3B0:
	ld h,(ix+006h)		;b3b0
	ld a,(ix+004h)		;b3b3
	bit 0,(ix+029h)		;b3b6
	jr nz,L_B3BE		;b3ba
	add a,008h		;b3bc
L_B3BE:
	ld l,a			;b3be
	call 07ed4h		;b3bf
	jr nc,L_B3D5		;b3c2
	bit 0,(ix+029h)		;b3c4
	ld a,0f8h		;b3c8
	jr z,L_B3CE		;b3ca
	ld a,008h		;b3cc
L_B3CE:
	add a,(ix+004h)		;b3ce
	ld (ix+004h),a		;b3d1
	ret			;b3d4
L_B3D5:
	ld hl,(0e6bch)		;b3d5
	bit 0,(ix+029h)		;b3d8
	ld bc,00040h		;b3dc
	jr z,L_B3E4		;b3df
	ld bc,0ffc0h		;b3e1
L_B3E4:
	add hl,bc			;b3e4
	ld (0e6bch),hl		;b3e5
	call 07edah		;b3e8
	ret c			;b3eb
	ld (ix+001h),003h		;b3ec
	ret			;b3f0
L_B3F1:
	dec (ix+002h)		;b3f1
	jr nz,L_B407		;b3f4
	call 06bbeh		;b3f6
	bit 7,(ix+025h)		;b3f9
	jr z,L_B407		;b3fd
	ld (ix+00ah),002h		;b3ff
	ld (ix+025h),002h		;b403
L_B407:
	ld h,(ix+006h)		;b407
	ld a,(ix+004h)		;b40a
	bit 0,(ix+029h)		;b40d
	jr z,L_B415		;b411
	sub 018h		;b413
L_B415:
	add a,010h		;b415
	ld l,a			;b417
	call 07ed4h		;b418
	jr c,L_B447		;b41b
L_B41D:
	ld c,(ix+027h)		;b41d
	ld b,(ix+028h)		;b420
	jp 06bf3h		;b423
L_B426:
	ld a,(ix+00ah)		;b426
	rla			;b429
	rla			;b42a
	xor (ix+029h)		;b42b
	rra			;b42e
	jr z,L_B41D		;b42f
	ld h,(ix+006h)		;b431
	ld a,(ix+004h)		;b434
	bit 0,(ix+029h)		;b437
	jr z,L_B43F		;b43b
	sub 018h		;b43d
L_B43F:
	add a,010h		;b43f
	ld l,a			;b441
	call 07ed4h		;b442
	jr nc,L_B41D		;b445
L_B447:
	call 06877h		;b447
	ld a,(ix+025h)		;b44a
	ld (ix+00ah),a		;b44d
	cpl			;b450
	rla			;b451
	rla			;b452
	and 001h		;b453
	ld (ix+001h),a		;b455
	ld a,(ix+004h)		;b458
	and 0f8h		;b45b
	ld (ix+004h),a		;b45d
	ret			;b460
L_B461:
	bit 0,(ix+029h)		;b461
	ld hl,0b470h		;b465
	jr z,L_B46D		;b468
	ld hl,0b476h		;b46a
L_B46D:
	jp 06bd5h		;b46d

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb470..0xb47c  (12 bytes)
DATA_B470:
	defb 0a0h,0a4h,0a8h,0ach,0a8h,0a4h,0d0h,0d4h,0d8h,0dch,0d8h,0d4h	; b470  ............

; ======================================================================
; CODIGO 0xb47c..0xb4c1  (69 bytes)
; ======================================================================


L_B47C:
	ld a,(0e301h)		;b47c
	cp 004h		;b47f
	jr nz,L_B48B		;b481
	ld (ix+00ch),002h		;b483
	ld (ix+031h),00ah		;b487
L_B48B:
	call 067cah		;b48b
	ld (ix+015h),a		;b48e
	call 06877h		;b491
	bit 0,(ix+019h)		;b494
	ld d,0feh		;b498
	jr nz,L_B49E		;b49a
	ld d,002h		;b49c
L_B49E:
	ld (ix+025h),d		;b49e
	call 0685dh		;b4a1
	ld a,(ix+004h)		;b4a4
	cp 054h		;b4a7
	ld a,001h		;b4a9
	ld b,098h		;b4ab
	jr c,L_B4B2		;b4ad
	xor a			;b4af
	ld b,090h		;b4b0
L_B4B2:
	ld (ix+019h),a		;b4b2
	ld (ix+030h),b		;b4b5
	jp 06bbeh		;b4b8
L_B4BB:
	ld a,(ix+001h)		;b4bb
	call 040ceh		;b4be

; ----------------------------------------------------------------------
; DATOS tabla_B4C1: 4 destinos del despachador p00:40CE (call en p12:B4BE, el
;   indice en A): B4C9, B55F, B593, B5BD; lo leen p12:B4BE (8 bytes)
;   0xb4c1..0xb4c9  (8 bytes)
DATA_tabla_B4C1:
	defw 0b4c9h,0b55fh,0b593h,0b5bdh	; b4c1  -> L_B4C9 L_B55F L_B593 L_B5BD

; ======================================================================
; CODIGO 0xb4c9..0xb6e5  (540 bytes)
; ======================================================================


L_B4C9:
	ld h,(ix+006h)		;b4c9
	ld a,(ix+004h)		;b4cc
	bit 0,(ix+019h)		;b4cf
	jr z,L_B4D7		;b4d3
	sub 018h		;b4d5
L_B4D7:
	add a,010h		;b4d7
	ld l,a			;b4d9
	call 07ed4h		;b4da
	jr c,L_B4FC		;b4dd
	ld (ix+001h),002h		;b4df
	bit 0,(ix+019h)		;b4e3
	ld hl,00080h		;b4e7
	jr z,L_B4ED		;b4ea
	dec h			;b4ec
L_B4ED:
	ld (ix+027h),l		;b4ed
	ld (ix+028h),h		;b4f0
	ld a,(ix+00ah)		;b4f3
	sra a		;b4f6
	ld (ix+00ah),a		;b4f8
	ret			;b4fb
L_B4FC:
	ld hl,(0e6bch)		;b4fc
	bit 0,(ix+019h)		;b4ff
	ld bc,0ffc0h		;b503
	jr z,L_B50B		;b506
	ld bc,00040h		;b508
L_B50B:
	add hl,bc			;b50b
	ld (0e6bch),hl		;b50c
	call 07edah		;b50f
	jr nc,L_B52F		;b512
	inc (ix+001h)		;b514
	set 3,(ix+010h)		;b517
	ld (ix+026h),001h		;b51b
	bit 0,(ix+019h)		;b51f
	ld a,0fch		;b523
	jr z,L_B529		;b525
	ld a,004h		;b527
L_B529:
	ld (ix+008h),a		;b529
	jp 0687ch		;b52c
L_B52F:
	dec (ix+002h)		;b52f
	ret nz			;b532
	call 06bbeh		;b533
	ld (ix+030h),094h		;b536
	ld (ix+001h),003h		;b53a
	ld a,(0e326h)		;b53e
	cp (ix+006h)		;b541
	ld de,00200h		;b544
	jr nc,L_B54B		;b547
	ld d,0feh		;b549
L_B54B:
	call 0685dh		;b54b
	ld a,(ix+019h)		;b54e
	xor 001h		;b551
	ld (ix+019h),a		;b553
	ld d,0fch		;b556
	jr nz,L_B55C		;b558
	ld d,004h		;b55a
L_B55C:
	jp 06856h		;b55c
L_B55F:
	dec (ix+026h)		;b55f
	ret nz			;b562
	ld (ix+026h),001h		;b563
	ld h,(ix+006h)		;b567
	ld a,(ix+004h)		;b56a
	bit 0,(ix+019h)		;b56d
	jr nz,L_B575		;b571
	add a,008h		;b573
L_B575:
	ld l,a			;b575
	call 07ed4h		;b576
	ret c			;b579
	res 3,(ix+010h)		;b57a
L_B57E:
	ld a,(ix+025h)		;b57e
L_B581:
	ld (ix+00ah),a		;b581
	call 06877h		;b584
	ld (ix+001h),d		;b587
	ld a,(ix+004h)		;b58a
	and 0f8h		;b58d
	ld (ix+004h),a		;b58f
	ret			;b592
L_B593:
	ld h,(ix+006h)		;b593
	ld a,(ix+004h)		;b596
	bit 0,(ix+019h)		;b599
	jr z,L_B5A1		;b59d
	sub 018h		;b59f
L_B5A1:
	add a,010h		;b5a1
	ld l,a			;b5a3
	call 07ed4h		;b5a4
	jr c,L_B57E		;b5a7
	ld c,(ix+027h)		;b5a9
	ld b,(ix+028h)		;b5ac
	ld l,(ix+007h)		;b5af
	ld h,(ix+008h)		;b5b2
	add hl,bc			;b5b5
	ld (ix+007h),l		;b5b6
	ld (ix+008h),h		;b5b9
	ret			;b5bc
L_B5BD:
	call 07626h		;b5bd
	ld h,(ix+006h)		;b5c0
	ld a,(ix+004h)		;b5c3
	bit 0,(ix+019h)		;b5c6
	jr z,L_B5CE		;b5ca
	sub 018h		;b5cc
L_B5CE:
	add a,010h		;b5ce
	ld l,a			;b5d0
	call 07ed4h		;b5d1
	ret nc			;b5d4
	bit 0,(ix+019h)		;b5d5
	ld a,090h		;b5d9
	jr z,L_B5DF		;b5db
	ld a,098h		;b5dd
L_B5DF:
	ld (ix+030h),a		;b5df
	ld e,(ix+004h)		;b5e2
	ld d,(ix+006h)		;b5e5
	call 074c5h		;b5e8
	ld a,(0e326h)		;b5eb
	cp (ix+006h)		;b5ee
	ld a,002h		;b5f1
	jr nc,L_B5F7		;b5f3
	ld a,0feh		;b5f5
L_B5F7:
	ld (ix+025h),a		;b5f7
	jr L_B581		;b5fa
L_B5FC:
	bit 0,(ix+00bh)		;b5fc
	ld a,02dh		;b600
	jr z,L_B606		;b602
	ld a,035h		;b604
L_B606:
	ld (ix+007h),a		;b606
	ld (ix+008h),008h		;b609
	ld (ix+009h),002h		;b60d
	ld (ix+00ah),002h		;b611
	ld (ix+002h),018h		;b615
	ld (ix+00ch),003h		;b619
	ld a,(ix+004h)		;b61d
	ld (ix+00eh),a		;b620
	ret			;b623
L_B624:
	dec (ix+00fh)		;b624
	call 07af6h		;b627
	call 07ad2h		;b62a
	ret nz			;b62d
	ld a,(ix+001h)		;b62e
	dec a			;b631
	jr z,L_B676		;b632
	dec (ix+002h)		;b634
	ret nz			;b637
	ld (ix+002h),008h		;b638
	ld a,(ix+00ah)		;b63c
	add a,002h		;b63f
	ld (ix+00ah),a		;b641
	bit 0,(ix+00bh)		;b644
	jr nz,L_B654		;b648
	ld a,(ix+004h)		;b64a
	sub 010h		;b64d
	ld (ix+004h),a		;b64f
	jr L_B657		;b652
L_B654:
	inc (ix+007h)		;b654
L_B657:
	dec (ix+00ch)		;b657
	ret nz			;b65a
	ld (ix+00ch),002h		;b65b
	ld a,(ix+006h)		;b65f
	ld (ix+00fh),a		;b662
	ld (ix+002h),004h		;b665
	inc (ix+001h)		;b669
	bit 0,(ix+00bh)		;b66c
	ret z			;b670
	ld (ix+007h),032h		;b671
	ret			;b675
L_B676:
	dec (ix+002h)		;b676
	ret nz			;b679
	ld (ix+002h),004h		;b67a
	ld a,(0e326h)		;b67e
	sub (ix+00fh)		;b681
	ld b,002h		;b684
	jr c,L_B694		;b686
	cp 010h		;b688
	jr c,L_B6A0		;b68a
	cp 030h		;b68c
	inc b			;b68e
	jr c,L_B6A0		;b68f
	inc b			;b691
	jr L_B6A0		;b692
L_B694:
	neg		;b694
	cp 010h		;b696
	jr c,L_B6A0		;b698
	cp 030h		;b69a
	dec b			;b69c
	jr c,L_B6A0		;b69d
	dec b			;b69f
L_B6A0:
	ld a,(ix+00ch)		;b6a0
	cp b			;b6a3
	ret z			;b6a4
	dec a			;b6a5
	jr nc,L_B6AA		;b6a6
	inc a			;b6a8
	inc a			;b6a9
L_B6AA:
	ld (ix+00ch),a		;b6aa
	bit 0,(ix+00bh)		;b6ad
	jr z,L_B6B5		;b6b1
	add a,005h		;b6b3
L_B6B5:
	ld b,a			;b6b5
	add a,02bh		;b6b6
	ld (ix+007h),a		;b6b8
	ld a,b			;b6bb
	add a,a			;b6bc
	ld hl,0b6e5h		;b6bd
	call 04e28h		;b6c0
	ld (ix+009h),e		;b6c3
	ld (ix+00ah),d		;b6c6
	inc hl			;b6c9
	ld c,(hl)			;b6ca
	inc hl			;b6cb
	ld b,(hl)			;b6cc
	ld a,c			;b6cd
	add a,(ix+00eh)		;b6ce
	ld (ix+004h),a		;b6d1
	ld a,b			;b6d4
	add a,(ix+00fh)		;b6d5
	and 0f8h		;b6d8
	ld (ix+006h),a		;b6da
	ld hl,0b70dh		;b6dd
	ld d,02bh		;b6e0
	jp 07aebh		;b6e2

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb6e5..0xb720  (59 bytes)
DATA_B6E5:
	defb 008h,005h,0e8h,0d0h,005h,008h,0d0h,0e8h,002h,008h,0d0h,000h,005h,008h,0d0h,000h	; b6e5  ................
	defb 008h,005h,0e8h,000h,008h,005h,000h,0d0h,005h,008h,000h,0e8h,002h,008h,000h,000h	; b6f5  ................
	defb 005h,008h,000h,000h,008h,005h,000h,000h,009h,00ah,00bh,00ch,00dh,00eh,00fh,010h	; b705  ................
	defb 011h,012h,0ffh,0ffh,0ffh,013h,014h,015h,016h,012h,017h	; b715  ...........

; ======================================================================
; CODIGO 0xb720..0xb739  (25 bytes)
; ======================================================================


L_B720:
	ld (ix+00dh),0ffh		;b720
	ld (ix+002h),001h		;b724
	ld (ix+00ch),000h		;b728
	ld a,(ix+00bh)		;b72c
	ld hl,0b739h		;b72f
	call 05ad8h		;b732
	ld (ix+00bh),a		;b735
	ret			;b738

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb739..0xb73d  (4 bytes)
DATA_B739:
	defb 071h,091h,0b1h,0d1h	; b739

; ======================================================================
; CODIGO 0xb73d..0xb789  (76 bytes)
; ======================================================================


L_B73D:
	ld a,(ix+005h)		;b73d
	or a			;b740
	ret nz			;b741
	ld a,(ix+006h)		;b742
	cp (ix+00bh)		;b745
	ret nc			;b748
	dec (ix+002h)		;b749
	ret nz			;b74c
	ld (ix+002h),018h		;b74d
	inc (ix+00ch)		;b751
	ld a,(ix+00ch)		;b754
	cp 004h		;b757
	jr c,L_B75F		;b759
	ld (ix+000h),000h		;b75b
L_B75F:
	add a,a			;b75f
	add a,a			;b760
	add a,a			;b761
	add a,a			;b762
	ld de,0b779h		;b763
	call 040c9h		;b766
	ld l,(ix+004h)		;b769
	ld h,(ix+006h)		;b76c
	call 05a99h		;b76f
	ex de,hl			;b772
	exx			;b773
	ld b,004h		;b774
L_B776:
	exx			;b776
	ld bc,00004h		;b777
	ldir		;b77a
	ld a,03ch		;b77c
	call 040c9h		;b77e
	exx			;b781
	djnz L_B776		;b782
	ld a,046h		;b784
	jp 04d6eh		;b786

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb789..0xb7c9  (64 bytes)
DATA_B789:
	defb 09bh,09bh,09bh,09bh,000h,000h,000h,000h,000h,000h,000h,000h,09ch,09ch,09ch,09ch	; b789  ................
	defb 09ah,09ah,09ah,09ah,000h,000h,000h,000h,000h,000h,000h,000h,09ah,09ah,09ah,09ah	; b799  ................
	defb 09ah,09ah,09ah,09ah,09bh,09bh,09bh,09bh,09ch,09ch,09ch,09ch,09ah,09ah,09ah,09ah	; b7a9  ................
	defb 09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah	; b7b9  ................

; ======================================================================
; CODIGO 0xb7c9..0xb9b7  (494 bytes)
; ======================================================================


L_B7C9:
	ld a,(0e627h)		;b7c9
	or a			;b7cc
	ret z			;b7cd
	ld hl,0ca20h		;b7ce
	xor a			;b7d1
	ld de,00020h		;b7d2
	ld c,015h		;b7d5
L_B7D7:
	ld b,020h		;b7d7
L_B7D9:
	ld (hl),a			;b7d9
	inc hl			;b7da
	djnz L_B7D9		;b7db
	add hl,de			;b7dd
	dec c			;b7de
	jr nz,L_B7D7		;b7df
	ret			;b7e1
L_B7E2:
	ld a,(0e301h)		;b7e2
	dec a			;b7e5
	ret nz			;b7e6
	ld de,(0e302h)		;b7e7
	ld hl,001e4h		;b7eb
	or a			;b7ee
	sbc hl,de		;b7ef
	jr z,L_B7C9		;b7f1
	ret nc			;b7f3
	ld hl,0021eh		;b7f4
	or a			;b7f7
	sbc hl,de		;b7f8
	ret c			;b7fa
	call L_B823		;b7fb
	ld hl,0ca20h		;b7fe
	ld c,015h		;b801
L_B803:
	ld b,020h		;b803
L_B805:
	ld a,(hl)			;b805
	or a			;b806
	jr z,L_B818		;b807
	dec a			;b809
	ld (hl),a			;b80a
	jr nz,L_B818		;b80b
	ld de,00020h		;b80d
	or a			;b810
	sbc hl,de		;b811
	ld a,(hl)			;b813
	add a,004h		;b814
	ld (hl),a			;b816
	add hl,de			;b817
L_B818:
	inc hl			;b818
	djnz L_B805		;b819
	ld de,00020h		;b81b
	add hl,de			;b81e
	dec c			;b81f
	jr nz,L_B803		;b820
	ret			;b822
L_B823:
	ld a,(0e627h)		;b823
	or a			;b826
	jr nz,L_B854		;b827
	ld a,(0e628h)		;b829
	or a			;b82c
	ret z			;b82d
	ld de,0ca20h		;b82e
	ld a,014h		;b831
L_B833:
	ld h,d			;b833
	ld l,e			;b834
	ld bc,00040h		;b835
	add hl,bc			;b838
	ld bc,00020h		;b839
	ldir		;b83c
	ld hl,00020h		;b83e
	add hl,de			;b841
	ex de,hl			;b842
	dec a			;b843
	jr nz,L_B833		;b844
	ld hl,0cf20h		;b846
	ld de,0cf21h		;b849
	ld (hl),000h		;b84c
	ld bc,0001fh		;b84e
	ldir		;b851
	ret			;b853
L_B854:
	ld de,0ca20h		;b854
	ld a,014h		;b857
L_B859:
	ld h,d			;b859
	ld l,e			;b85a
	inc hl			;b85b
	ld bc,0001fh		;b85c
	ldir		;b85f
	ld hl,00021h		;b861
	add hl,de			;b864
	ex de,hl			;b865
	dec a			;b866
	jr nz,L_B859		;b867
	ld hl,0ca3fh		;b869
	ld de,00040h		;b86c
	ld b,015h		;b86f
	xor a			;b871
L_B872:
	ld (hl),a			;b872
	add hl,de			;b873
	djnz L_B872		;b874
	ret			;b876
L_B877:
	ld a,(0e6a4h)		;b877
	dec a			;b87a
	jr z,L_B8C0		;b87b
	dec a			;b87d
	jr z,L_B8DB		;b87e
	dec a			;b880
	jp z,L_B9AC		;b881
	ld a,001h		;b884
	ld (0e6a5h),a		;b886
	ld de,0b9b7h		;b889
	call 04cf5h		;b88c
	ld a,(0e227h)		;b88f
	or a			;b892
	jr z,L_B89B		;b893
	ld de,0b9efh		;b895
	call 04cf5h		;b898
L_B89B:
	ld a,(0e3a1h)		;b89b
	or a			;b89e
	jr z,L_B8A9		;b89f
	ld hl,0392bh		;b8a1
	ld a,012h		;b8a4
	call 0004dh		;b8a6   ; BIOS WRTVRM - Writes data in VRAM
L_B8A9:
	call L_B8B1		;b8a9
L_B8AC:
	ld hl,0e6a4h		;b8ac
	inc (hl)			;b8af
	ret			;b8b0
L_B8B1:
	ld a,(0e6a5h)		;b8b1
	or a			;b8b4
	ld de,0b9fah		;b8b5
	jr nz,L_B8BD		;b8b8
	ld de,0ba05h		;b8ba
L_B8BD:
	jp 04cf5h		;b8bd
L_B8C0:
	ld a,(0e30eh)		;b8c0
	bit 4,a		;b8c3
	jr nz,L_B8D3		;b8c5
	and 00ch		;b8c7
	ret z			;b8c9
	ld hl,0e6a5h		;b8ca
	ld a,(hl)			;b8cd
	xor 001h		;b8ce
	ld (hl),a			;b8d0
	jr L_B8B1		;b8d1
L_B8D3:
	ld de,0ba10h		;b8d3
	call 04cf5h		;b8d6
	jr L_B8AC		;b8d9
L_B8DB:
	ld a,(0e30eh)		;b8db
	bit 4,a		;b8de
	jr nz,L_B901		;b8e0
	and 00fh		;b8e2
	jr nz,L_B8F4		;b8e4
	ld a,(0e203h)		;b8e6
	bit 2,a		;b8e9
	ld de,0ba10h		;b8eb
	jp z,04cf5h		;b8ee
	jp 04d0ch		;b8f1
L_B8F4:
	ld de,0ba10h		;b8f4
	call 04d0ch		;b8f7
	ld a,001h		;b8fa
	ld (0e6a4h),a		;b8fc
	jr L_B8C0		;b8ff
L_B901:
	ld de,0ba10h		;b901
	call 04d0ch		;b904
	ld a,(0e6a5h)		;b907
	or a			;b90a
	jp z,L_B9A4		;b90b
	ld a,003h		;b90e
	ld (0e380h),a		;b910
	ld a,(0e227h)		;b913
	or a			;b916
	jr nz,L_B92E		;b917
	ld a,(0e3a1h)		;b919
	or a			;b91c
	ld hl,0e27ah		;b91d
	jr z,L_B924		;b920
	ld l,075h		;b922
L_B924:
	ld d,h			;b924
	ld e,l			;b925
	inc de			;b926
	ld bc,00004h		;b927
	ld (hl),000h		;b92a
	ldir		;b92c
L_B92E:
	xor a			;b92e
	ld (0e3a0h),a		;b92f
	ld hl,0e301h		;b932
	ld de,0e381h		;b935
	ld bc,00005h		;b938
	ldir		;b93b
	ld a,(0e30ah)		;b93d
	ld (0e38ah),a		;b940
	ld hl,0e324h		;b943
	ld de,0e3a4h		;b946
	ld bc,00003h		;b949
	ldir		;b94c
	ld hl,0e35eh		;b94e
	ld de,0e3deh		;b951
	ld bc,00009h		;b954
	ldir		;b957
	ld iy,0e300h		;b959
	xor a			;b95d
	ld (0e430h),a		;b95e
	ld a,(0e60bh)		;b961
	cp 003h		;b964
	jr c,L_B974		;b966
	ld a,003h		;b968
	ld (0e60bh),a		;b96a
	ld (iy+030h),a		;b96d
	ld (iy+017h),0ffh		;b970
L_B974:
	ld a,(0e321h)		;b974
	or a			;b977
	call nz,0549eh		;b978
	ld de,0ba28h		;b97b
	call 04cf5h		;b97e
	ld de,0ba2ah		;b981
	ld hl,03a48h		;b984
	call 04cfdh		;b987
	ld hl,03a4eh		;b98a
	ld a,012h		;b98d
	call 0004dh		;b98f   ; BIOS WRTVRM - Writes data in VRAM
	ld hl,03a16h		;b992
	ld de,0e300h		;b995
	call 059deh		;b998
	ld hl,03a56h		;b99b
	ld de,0e380h		;b99e
	call 059deh		;b9a1
L_B9A4:
	ld a,078h		;b9a4
	ld (0e6a6h),a		;b9a6
	jp L_B8AC		;b9a9
L_B9AC:
	ld hl,0e6a6h		;b9ac
	dec (hl)			;b9af
	ret nz			;b9b0
	ld a,001h		;b9b1
	ld (0e230h),a		;b9b3
	ret			;b9b6

; ----------------------------------------------------------------------
; DATOS lista_B9B7: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p12:B88C (56 bytes)
;   0xb9b7..0xb9ef  (56 bytes)
DATA_lista_B9B7:
	defb 069h,038h,033h,025h,02ch,025h,023h,034h,029h,02fh,02eh,0feh,0c5h,038h,02eh,02fh	; b9b7  i83%,%#4)/...8./
	defb 037h,000h,029h,033h,000h,000h,02fh,02eh,02ch,039h,000h,000h,011h,000h,030h,02ch	; b9c7  7.)3../.,9....0,
	defb 021h,039h,0feh,025h,039h,030h,02ch,021h,039h,025h,032h,011h,000h,02ah,02fh,029h	; b9d7  !9.%90,!9%2..*/)
	defb 02eh,034h,000h,027h,021h,02dh,025h,0ffh	; b9e7  .4.'!-%.

; ----------------------------------------------------------------------
; DATOS lista_B9EF: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p12:B898 (11 bytes)
;   0xb9ef..0xb9fa  (11 bytes)
DATA_lista_B9EF:
	defb 0cch,038h,025h,038h,023h,028h,021h,02eh,027h,025h,0ffh	; b9ef  .8%8#(!.'%.

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb9fa..0xba05  (11 bytes)
DATA_B9FA:
	defb 08ah,039h,059h,045h,053h,0feh,093h,039h,02eh,02fh,0ffh	; b9fa  .9YES..9./.

; ----------------------------------------------------------------------
; DATOS lista_BA05: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p12:B8BD (11 bytes)
;   0xba05..0xba10  (11 bytes)
DATA_lista_BA05:
	defb 08ah,039h,039h,025h,033h,0feh,093h,039h,04eh,04fh,0ffh	; ba05  .99%3..9NO.

; ----------------------------------------------------------------------
; DATOS lista_BA10: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p12:B8D6, p12:B8EE, p12:B8F1, p12:B8F7,
;   p12:B904 (24 bytes)
;   0xba10..0xba28  (24 bytes)
DATA_lista_BA10:
	defb 00eh,03ah,033h,035h,032h,025h,0feh,049h,03ah,030h,035h,033h,028h,000h,033h,030h	; ba10  .:352%.I:053(.30
	defb 021h,023h,025h,000h,02bh,025h,039h,0ffh	; ba20  !#%.+%9.

; ----------------------------------------------------------------------
; DATOS lista_BA28: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); se solapan 2 bloques: (lista_s_BA2A BA2A-BA37); lo
;   leen p12:B97E, p12:B987 (15 bytes)
;   0xba28..0xba37  (15 bytes)
DATA_lista_BA28:
	defb 008h,03ah,030h,02ch,021h,039h,025h,032h,011h,000h,032h,025h,033h,034h,0ffh	; ba28  .:0,!9%2..2%34.

; ======================================================================
; CODIGO 0xba37..0xba7e  (71 bytes)
; ======================================================================


L_BA37:
	ld (ix+026h),000h		;ba37
	call 04f9bh		;ba3b
	res 2,(ix+010h)		;ba3e
	ld hl,(0f000h)		;ba42
	ld (ix+023h),l		;ba45
	ld (ix+024h),h		;ba48
	ld a,(ix+019h)		;ba4b
	ld hl,0ba7eh		;ba4e
	add a,a			;ba51
	call 040c4h		;ba52
	ld a,(hl)			;ba55
	inc hl			;ba56
	ld (ix+019h),a		;ba57
	ld c,(hl)			;ba5a
	ld b,001h		;ba5b
	bit 1,a		;ba5d
	jr z,L_BA64		;ba5f
	ld a,b			;ba61
	ld b,c			;ba62
	ld c,a			;ba63
L_BA64:
	ld (ix+014h),b		;ba64
	ld (ix+025h),b		;ba67
	ld (ix+032h),000h		;ba6a
	ld (ix+013h),c		;ba6e
	ld (ix+022h),c		;ba71
	ld a,(ix+019h)		;ba74
	dec a			;ba77
	ret nz			;ba78
	ld (ix+013h),001h		;ba79
	ret			;ba7d

; ----------------------------------------------------------------------
; DATOS sin identificar  0xba7e..0xbaa0  (34 bytes)
DATA_BA7E:
	defb 002h,007h,001h,009h,000h,009h,001h,005h,000h,005h,001h,008h,000h,008h,003h,00bh	; ba7e  ................
	defb 003h,007h,002h,007h,003h,003h,003h,007h,002h,019h,003h,009h,002h,017h,001h,00bh	; ba8e  ................
	defb 000h,00bh	; ba9e

; ======================================================================
; CODIGO 0xbaa0..0xbb36  (150 bytes)
; ======================================================================


L_BAA0:
	call 04fa0h		;baa0
	call L_BAB2		;baa3
	ld l,(ix+023h)		;baa6
	ld h,(ix+024h)		;baa9
	ld a,(hl)			;baac
	or a			;baad
	jp z,06b62h		;baae
	ret			;bab1
L_BAB2:
	inc (ix+026h)		;bab2
	bit 0,(ix+026h)		;bab5
	ret z			;bab9
	inc (ix+032h)		;baba
	ret			;babd
L_BABE:
	ld c,000h		;babe
	jp 07ae3h		;bac0
L_BAC3:
	ld (ix+008h),004h		;bac3
	push ix		;bac7
	pop hl			;bac9
	ld (0f000h),hl		;baca
	ld a,(ix+00bh)		;bacd
	ld b,a			;bad0
	cp 002h		;bad1
	ld hl,00402h		;bad3
	jr c,L_BAE5		;bad6
	dec h			;bad8
	ld a,(0e301h)		;bad9
	cp 003h		;badc
	jr z,L_BAE5		;bade
	ld hl,00101h		;bae0
	inc b			;bae3
	inc b			;bae4
L_BAE5:
	ld a,b			;bae5
	add a,012h		;bae6
	ld (ix+007h),a		;bae8
	ld (ix+009h),h		;baeb
	ld (ix+00ah),l		;baee
	ld hl,0e65eh		;baf1
	inc (hl)			;baf4
	ld a,(0e301h)		;baf5
	ld b,(hl)			;baf8
	ld hl,0bb36h		;baf9
	call 04e28h		;bafc
	ex de,hl			;baff
	ld a,b			;bb00
	add a,a			;bb01
	add a,b			;bb02
	call 040c4h		;bb03
	ld b,(hl)			;bb06
	inc hl			;bb07
	ld e,(hl)			;bb08
	inc hl			;bb09
	bit 7,e		;bb0a
	ld d,000h		;bb0c
	jr z,L_BB11		;bb0e
	dec d			;bb10
L_BB11:
	push hl			;bb11
	ld l,(ix+004h)		;bb12
	ld h,(ix+003h)		;bb15
	add hl,de			;bb18
	ex de,hl			;bb19
	pop hl			;bb1a
	push de			;bb1b
	ld e,(hl)			;bb1c
	bit 7,e		;bb1d
	ld d,000h		;bb1f
	jr z,L_BB24		;bb21
	dec d			;bb23
L_BB24:
	ld l,(ix+006h)		;bb24
	ld h,(ix+005h)		;bb27
	add hl,de			;bb2a
	pop de			;bb2b
	ld a,d			;bb2c
	ld d,l			;bb2d
	ld l,a			;bb2e
	ld c,000h		;bb2f
	ld a,03fh		;bb31
	jp 065b5h		;bb33

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbb36..0xbb8c  (86 bytes)
DATA_BB36:
	defb 041h,0bbh,041h,0bbh,041h,0bbh,041h,0bbh,059h,0bbh,071h,0bbh,071h,0bbh,00fh,0f8h	; bb36  A.A.A.A.Y.q.q...
	defb 018h,010h,010h,000h,000h,000h,018h,001h,0f8h,018h,002h,010h,000h,007h,008h,0a8h	; bb46  ................
	defb 00ch,000h,018h,00eh,000h,018h,008h,000h,0c8h,009h,000h,008h,008h,000h,0c8h,009h	; bb56  ................
	defb 000h,008h,008h,000h,0c8h,009h,000h,008h,00ah,000h,0e8h,00ah,000h,0e8h,000h,000h	; bb66  ................
	defb 008h,00bh,000h,0c8h,00bh,000h,0c8h,000h,000h,008h,000h,000h,008h,00bh,000h,0c8h	; bb76  ................
	defb 00bh,000h,0c8h,000h,000h,008h	; bb86

; ======================================================================
; CODIGO 0xbb8c..0xbbb2  (38 bytes)
; ======================================================================


L_BB8C:
	ld (ix+009h),006h		;bb8c
	ld (ix+00ah),005h		;bb90
	ld (ix+00fh),080h		;bb94
	ld a,(ix+00bh)		;bb98
	and a			;bb9b
	ld b,000h		;bb9c
	jr nz,L_BBA2		;bb9e
	ld b,002h		;bba0
L_BBA2:
	ld (ix+007h),b		;bba2
	call L_BC0C		;bba5
	ld (ix+008h),00ah		;bba8
	ld a,008h		;bbac
	ld (ix+002h),a		;bbae
	ret			;bbb1

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbbb2..0xbbb6  (4 bytes)
DATA_BBB2:
	defb 0ffh,001h,0ffh,002h	; bbb2

; ======================================================================
; CODIGO 0xbbb6..0xbca1  (235 bytes)
; ======================================================================


L_BBB6:
	ld hl,0bbb2h		;bbb6
	ld d,000h		;bbb9
	call 07aebh		;bbbb
	ld a,(ix+00fh)		;bbbe
	and 003h		;bbc1
	jr nz,L_BBD4		;bbc3
	res 0,(ix+007h)		;bbc5
	dec (ix+00eh)		;bbc9
	ret nz			;bbcc
	call L_BBEC		;bbcd
	inc (ix+00fh)		;bbd0
	ret			;bbd3
L_BBD4:
	set 0,(ix+007h)		;bbd4
	dec a			;bbd8
	jr nz,L_BBF1		;bbd9
	dec (ix+00eh)		;bbdb
	ret nz			;bbde
	ld a,(ix+00ch)		;bbdf
	and 0f0h		;bbe2
	or 006h		;bbe4
	ld (ix+00ch),a		;bbe6
	inc (ix+00fh)		;bbe9
L_BBEC:
	ld (ix+00eh),008h		;bbec
	ret			;bbf0
L_BBF1:
	dec (ix+00eh)		;bbf1
	ret nz			;bbf4
	call L_BBEC		;bbf5
	call L_BCD0		;bbf8
	dec (ix+00ch)		;bbfb
	ld a,(ix+00ch)		;bbfe
	and 007h		;bc01
	ret nz			;bc03
	ld a,(ix+00fh)		;bc04
	and 0fch		;bc07
	ld (ix+00fh),a		;bc09
L_BC0C:
	call 04e58h		;bc0c
	and 007h		;bc0f
	add a,010h		;bc11
	ld (ix+00eh),a		;bc13
	ret			;bc16
L_BC17:
	call L_BBB6		;bc17
	ld a,(ix+001h)		;bc1a
	dec a			;bc1d
	jr z,L_BC3F		;bc1e
	dec (ix+002h)		;bc20
	ret nz			;bc23
	ld a,(ix+00fh)		;bc24
	sub 010h		;bc27
	ld (ix+00fh),a		;bc29
	ld (ix+002h),00ah		;bc2c
	ld (ix+001h),001h		;bc30
L_BC34:
	ld a,(ix+00ch)		;bc34
	and 00fh		;bc37
	or 040h		;bc39
	ld (ix+00ch),a		;bc3b
	ret			;bc3e
L_BC3F:
	ld a,(ix+00ch)		;bc3f
	sub 010h		;bc42
	ld (ix+00ch),a		;bc44
	and 0f0h		;bc47
	ret nz			;bc49
	call L_BC34		;bc4a
	ld a,(ix+002h)		;bc4d
	dec a			;bc50
	and 00fh		;bc51
	ld hl,0bca1h		;bc53
	call 04e28h		;bc56
	call L_BCC1		;bc59
	ld l,(ix+004h)		;bc5c
	ld h,(ix+003h)		;bc5f
	add hl,de			;bc62
	ld (ix+004h),l		;bc63
	ld (ix+003h),h		;bc66
	call L_BCB5		;bc69
	jr c,L_BC9C		;bc6c
	ld e,c			;bc6e
	ld d,b			;bc6f
	ld a,(ix+00bh)		;bc70
	and a			;bc73
	call nz,05adfh		;bc74
	ld l,(ix+006h)		;bc77
	ld h,(ix+005h)		;bc7a
	add hl,de			;bc7d
	ld (ix+006h),l		;bc7e
	ld (ix+005h),h		;bc81
	dec (ix+002h)		;bc84
	ret nz			;bc87
	ld a,03ch		;bc88
	call 04d6eh		;bc8a
	call 04e58h		;bc8d
	and 007h		;bc90
	add a,008h		;bc92
	ld (ix+002h),a		;bc94
	ld (ix+001h),000h		;bc97
	ret			;bc9b
L_BC9C:
	ld (ix+000h),000h		;bc9c
	ret			;bca0

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbca1..0xbcb5  (20 bytes)
DATA_BCA1:
	defb 000h,0f8h,008h,0f8h,000h,0f8h,008h,0f8h,008h,000h,008h,000h,008h,008h,000h,008h	; bca1  ................
	defb 008h,008h,000h,008h	; bcb1

; ======================================================================
; CODIGO 0xbcb5..0xbcfc  (71 bytes)
; ======================================================================


L_BCB5:
	ld a,(ix+003h)		;bcb5
	and a			;bcb8
	ld a,(ix+004h)		;bcb9
	ret nz			;bcbc
	cp 0a8h		;bcbd
	ccf			;bcbf
	ret			;bcc0
L_BCC1:
	ld c,d			;bcc1
	ld d,000h		;bcc2
	bit 7,e		;bcc4
	jr z,L_BCC9		;bcc6
	dec d			;bcc8
L_BCC9:
	ld b,000h		;bcc9
	bit 7,c		;bccb
	ret z			;bccd
	dec b			;bcce
	ret			;bccf
L_BCD0:
	ld a,(ix+003h)		;bcd0
	and a			;bcd3
	jr nz,L_BCEB		;bcd4
L_BCD6:
	call L_BCF3		;bcd6
	ld a,(ix+004h)		;bcd9
	add a,e			;bcdc
	ld e,a			;bcdd
	ld a,(ix+006h)		;bcde
	add a,d			;bce1
	ld d,a			;bce2
	ld a,025h		;bce3
	ld bc,00000h		;bce5
	jp 065b5h		;bce8
L_BCEB:
	ld a,(ix+004h)		;bceb
	cp 0d8h		;bcee
	ret c			;bcf0
	jr L_BCD6		;bcf1
L_BCF3:
	ld a,(ix+00bh)		;bcf3
	ld hl,0bcfch		;bcf6
	jp 04e28h		;bcf9

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbcfc..0xbd00  (4 bytes)
DATA_BCFC:
	defb 020h,008h,020h,020h	; bcfc

; ======================================================================
; CODIGO 0xbd00..0xbddc  (220 bytes)
; ======================================================================


L_BD00:
	ld (ix+002h),01ah		;bd00
	ld a,(0e64fh)		;bd04
	add a,a			;bd07
	add a,050h		;bd08
	cp 060h		;bd0a
	jr c,L_BD10		;bd0c
	ld a,060h		;bd0e
L_BD10:
	jp 06801h		;bd10
L_BD13:
	call L_BD46		;bd13
	ld a,(ix+002h)		;bd16
	and a			;bd19
	jr z,L_BD20		;bd1a
	dec (ix+002h)		;bd1c
	ret nz			;bd1f
L_BD20:
	call L_BD27		;bd20
	ret nc			;bd23
	jp 06b62h		;bd24
L_BD27:
	ld l,(ix+004h)		;bd27
	ld h,(ix+006h)		;bd2a
	call 05a99h		;bd2d
	call L_BD41		;bd30
	ret c			;bd33
	call L_BD40		;bd34
	ret c			;bd37
	ld de,0003fh		;bd38
	add hl,de			;bd3b
	call L_BD41		;bd3c
	ret c			;bd3f
L_BD40:
	inc hl			;bd40
L_BD41:
	ld a,(0e605h)		;bd41
	cp (hl)			;bd44
	ret			;bd45
L_BD46:
	ld a,(0e203h)		;bd46
	and 003h		;bd49
	ret nz			;bd4b
	ld a,(ix+031h)		;bd4c
	xor 005h		;bd4f
	ld (ix+031h),a		;bd51
	ret			;bd54
L_BD55:
	ld a,(0e301h)		;bd55
	cp 005h		;bd58
	ret nz			;bd5a
	call L_BD77		;bd5b
	jr z,L_BD55		;bd5e
	ret c			;bd60
	ld hl,0e669h		;bd61
	inc (hl)			;bd64
	jr L_BD55		;bd65
L_BD67:
	ld a,(0e301h)		;bd67
	cp 005h		;bd6a
	ret nz			;bd6c
	ld a,(0e627h)		;bd6d
	or a			;bd70
	ret z			;bd71
	ld a,0e0h		;bd72
	ld (0f004h),a		;bd74
L_BD77:
	ld hl,0bddch		;bd77
	ld a,(0e669h)		;bd7a
	ld b,a			;bd7d
	add a,a			;bd7e
	add a,b			;bd7f
	call 040c4h		;bd80
	ld e,(hl)			;bd83
	inc hl			;bd84
	ld d,(hl)			;bd85
	inc hl			;bd86
	ld a,(hl)			;bd87
	ld (0f005h),a		;bd88
	ld hl,(0e302h)		;bd8b
	or a			;bd8e
	sbc hl,de		;bd8f
	ret nz			;bd91
	ld hl,0e669h		;bd92
	inc (hl)			;bd95
	xor a			;bd96
	ld hl,0eb80h		;bd97
	ld de,00010h		;bd9a
	ld b,004h		;bd9d
L_BD9F:
	cp (hl)			;bd9f
	jr z,L_BDA8		;bda0
	add hl,de			;bda2
	djnz L_BD9F		;bda3
	or 0ffh		;bda5
	ret			;bda7
L_BDA8:
	ld a,001h		;bda8
	ld (hl),a			;bdaa
	inc l			;bdab
	ld a,(0f005h)		;bdac
	ld c,a			;bdaf
	ld (hl),a			;bdb0
	inc l			;bdb1
	ld a,(0f004h)		;bdb2
	ld b,a			;bdb5
	ld (hl),a			;bdb6
	inc l			;bdb7
	ld (hl),c			;bdb8
	inc l			;bdb9
	ld (hl),b			;bdba
	inc l			;bdbb
	ld a,(0f006h)		;bdbc
	ld (hl),a			;bdbf
	inc l			;bdc0
	inc l			;bdc1
	inc l			;bdc2
	inc l			;bdc3
	ld a,010h		;bdc4
	ld (hl),a			;bdc6
	inc l			;bdc7
	ld a,0cdh		;bdc8
	ld (hl),a			;bdca
	inc l			;bdcb
	xor a			;bdcc
	ld (hl),a			;bdcd
	inc l			;bdce
	ld a,014h		;bdcf
	ld (hl),a			;bdd1
	inc l			;bdd2
	ld (hl),c			;bdd3
	inc l			;bdd4
	ld (hl),b			;bdd5
	inc l			;bdd6
	ld a,008h		;bdd7
	ld (hl),a			;bdd9
	xor a			;bdda
	ret			;bddb

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbddc..0xbdfc  (32 bytes)
DATA_BDDC:
	defb 0d4h,000h,068h,018h,001h,068h,044h,001h,068h,06ch,001h,028h,074h,001h,068h,078h	; bddc  ..h..hD.hl.(t.hx
	defb 001h,028h,0a8h,001h,068h,0ach,001h,028h,0b8h,001h,068h,0bch,001h,028h,0ffh,0ffh	; bdec  .(..h..(..h..(..

; ======================================================================
; CODIGO 0xbdfc..0xbea5  (169 bytes)
; ======================================================================


L_BDFC:
	ld a,(0e301h)		;bdfc
	cp 005h		;bdff
	ret nz			;be01
	ld ix,0eb80h		;be02
	ld b,004h		;be06
L_BE08:
	push bc			;be08
	call L_BE15		;be09
	pop bc			;be0c
	ld de,00010h		;be0d
	add ix,de		;be10
	djnz L_BE08		;be12
	ret			;be14
L_BE15:
	ld a,(ix+000h)		;be15
	or a			;be18
	ret z			;be19
	call L_BF02		;be1a
	ret c			;be1d
	ld a,(ix+000h)		;be1e
	dec a			;be21
	jr nz,L_BE83		;be22
	dec (ix+00ch)		;be24
	ret nz			;be27
	push ix		;be28
	exx			;be2a
	pop hl			;be2b
	ld b,001h		;be2c
	ld a,001h		;be2e
	call 040c4h		;be30
L_BE33:
	call L_BEB5		;be33
	ld a,c			;be36
	and 007h		;be37
	ld (ix+00bh),a		;be39
	ld c,a			;be3c
	ld b,008h		;be3d
L_BE3F:
	ld a,c			;be3f
	and 007h		;be40
	ld hl,0bea5h		;be42
	call 04e28h		;be45
	exx			;be48
	dec hl			;be49
	ld a,(hl)			;be4a
	exx			;be4b
	add a,e			;be4c
	cp 0a0h		;be4d
	jp nc,L_BE9F		;be4f
	ld l,a			;be52
	exx			;be53
	inc hl			;be54
	ld a,(hl)			;be55
	exx			;be56
	add a,d			;be57
	cp 0f0h		;be58
	jp nc,L_BE9F		;be5a
	ld h,a			;be5d
	push hl			;be5e
	push bc			;be5f
	call 07eebh		;be60
	pop bc			;be63
	pop hl			;be64
	jr nc,L_BE6D		;be65
	inc c			;be67
	djnz L_BE3F		;be68
	jp L_BE9F		;be6a
L_BE6D:
	ld a,l			;be6d
	exx			;be6e
	dec hl			;be6f
	ld (hl),a			;be70
	exx			;be71
	ld a,h			;be72
	exx			;be73
	inc hl			;be74
	ld (hl),a			;be75
	inc hl			;be76
	djnz L_BE33		;be77
	exx			;be79
	inc (ix+00ah)		;be7a
	inc (ix+000h)		;be7d
	jp L_BF1D		;be80
L_BE83:
	inc (ix+00ah)		;be83
	ld a,(ix+00ah)		;be86
	cp 0d2h		;be89
	jr z,L_BE90		;be8b
	jp L_BF1D		;be8d
L_BE90:
	dec (ix+000h)		;be90
	ld (ix+00ch),001h		;be93
	ld (ix+00ah),0cdh		;be97
	dec (ix+009h)		;be9b
	ret nz			;be9e
L_BE9F:
	ld (ix+000h),000h		;be9f
	scf			;bea3
	ret			;bea4

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbea5..0xbeb5  (16 bytes)
DATA_BEA5:
	defb 0f8h,000h,0f8h,0f8h,000h,0f8h,008h,0f8h,008h,000h,008h,008h,000h,008h,0f8h,008h	; bea5  ................

; ======================================================================
; CODIGO 0xbeb5..0xbf2b  (118 bytes)
; ======================================================================


L_BEB5:
	exx			;beb5
	ld a,(0e227h)		;beb6
	cp 002h		;beb9
	jr nz,L_BECE		;bebb
	call 04e58h		;bebd
	rra			;bec0
	rra			;bec1
	jr c,L_BECE		;bec2
	ld a,(0e3a4h)		;bec4
	ld e,a			;bec7
	ld a,(0e3a6h)		;bec8
	ld d,a			;becb
	jr L_BED6		;becc
L_BECE:
	ld a,(0e324h)		;bece
	ld e,a			;bed1
	ld a,(0e326h)		;bed2
	ld d,a			;bed5
L_BED6:
	exx			;bed6
	ld a,(hl)			;bed7
	exx			;bed8
	sub e			;bed9
	ld b,a			;beda
	exx			;bedb
	inc hl			;bedc
	ld a,(hl)			;bedd
	exx			;bede
	sub d			;bedf
	ld c,000h		;bee0
	bit 7,a		;bee2
	jr z,L_BEF0		;bee4
	ld c,a			;bee6
	ld a,b			;bee7
	neg		;bee8
	ld b,a			;beea
	ld a,c			;beeb
	ld c,004h		;beec
	neg		;beee
L_BEF0:
	bit 7,b		;bef0
	jr z,L_BEFE		;bef2
	inc c			;bef4
	inc c			;bef5
	ld d,a			;bef6
	ld a,b			;bef7
	neg		;bef8
	cp d			;befa
	ret c			;befb
	inc c			;befc
	ret			;befd
L_BEFE:
	cp b			;befe
	ret c			;beff
	inc c			;bf00
	ret			;bf01
L_BF02:
	ld a,(0e627h)		;bf02
	or a			;bf05
	ret z			;bf06
	ld a,(ix+002h)		;bf07
	sub 008h		;bf0a
	jr c,$-109		;bf0c
	ld (ix+002h),a		;bf0e
	ld a,(ix+00eh)		;bf11
	sub 008h		;bf14
	jp c,L_BE9F		;bf16
	ld (ix+00eh),a		;bf19
	ret			;bf1c
L_BF1D:
	ld l,(ix+001h)		;bf1d
	ld h,(ix+002h)		;bf20
	call 05a99h		;bf23
	ld a,(ix+00ah)		;bf26
	ld (hl),a			;bf29
	ret			;bf2a

; ----------------------------------------------------------------------
; DATOS relleno_ff: 213 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (213 bytes)
;   0xbf2b..0xc000  (213 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf2b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf3b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf4b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf5b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf6b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf7b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf8b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf9b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfbb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfcb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfdb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfeb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; bffb
