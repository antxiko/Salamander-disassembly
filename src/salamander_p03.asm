; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 03 (se ejecuta en 0xa000)
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
la6ffh:	equ 0x0a6ff

; ----------------------------------------------------------------------
; DATOS partida_A000: los 2 ultimos bytes de la instruccion de p02:9FFF (DD 7E
;   19), que empieza en el banco 2; lo leen p02:9FFF (2 bytes)
;   0xa000..0xa002  (2 bytes)
DATA_partida_A000:
	defb 07eh,019h	; a000

; ======================================================================
; CODIGO 0xa002..0xa029  (39 bytes)
; ======================================================================


L_A002:
	or a			;a002
	jr z,L_A008		;a003
	call 08c7bh		;a005
L_A008:
	ld bc,0ffc0h		;a008
	add ix,bc		;a00b
	pop bc			;a00d
	djnz $-23		;a00e
	ld a,011h		;a010
	jp 04d6eh		;a012
L_A015:
	inc (ix+001h)		;a015
L_A018:
	ld a,0b0h		;a018
	jp 06801h		;a01a
L_A01D:
	ld a,(0e203h)		;a01d
	and 003h		;a020
	call 05ad8h		;a022
	ld (ix+031h),a		;a025
	ret			;a028

; ----------------------------------------------------------------------
; DATOS cuadros_A029: 4 bytes que p02:9FB8 pasa a p03:A01D (HL); lo leen
;   p02:9FBB (4 bytes)
;   0xa029..0xa02d  (4 bytes)
DATA_cuadros_A029:
	defb 008h,00dh,005h,00dh	; a029

; ======================================================================
; CODIGO 0xa02d..0xa0c4  (151 bytes)
; ======================================================================


L_A02D:
	call 06bcdh		;a02d
	ld a,(ix+019h)		;a030
	add a,010h		;a033
	ld (ix+002h),a		;a035
	sub 010h		;a038
	ld d,a			;a03a
	ld e,000h		;a03b
	srl d		;a03d
	rr e		;a03f
	ld a,(0e65ah)		;a041
	bit 0,a		;a044
	call z,05adfh		;a046
	call L_A068		;a049
	call 065abh		;a04c
	and 007h		;a04f
	ld hl,0a0c8h		;a051
	call 04e28h		;a054
	call L_A072		;a057
	call 065abh		;a05a
	and 007h		;a05d
	ld hl,0a0d8h		;a05f
	call 04e28h		;a062
	jp L_A07C		;a065
L_A068:
	ld a,(0e620h)		;a068
	or a			;a06b
	jp nz,0685dh		;a06c
	jp 06856h		;a06f
L_A072:
	ld a,(0e620h)		;a072
	or a			;a075
	jp nz,06856h		;a076
	jp 0685dh		;a079
L_A07C:
	ld a,(0e620h)		;a07c
	or a			;a07f
	jp nz,0650eh		;a080
	jp 06515h		;a083
L_A086:
	call L_A0F4		;a086
	call L_A0E8		;a089
	ld a,(ix+001h)		;a08c
	dec a			;a08f
	jr z,L_A0AE		;a090
	dec a			;a092
	ret z			;a093
	ld a,(0e620h)		;a094
	and a			;a097
	jr z,L_A09F		;a098
	call 06528h		;a09a
	jr L_A0A2		;a09d
L_A09F:
	call 0653bh		;a09f
L_A0A2:
	dec (ix+002h)		;a0a2
	ret nz			;a0a5
	ld (ix+002h),008h		;a0a6
L_A0AA:
	inc (ix+001h)		;a0aa
	ret			;a0ad
L_A0AE:
	dec (ix+002h)		;a0ae
	ret nz			;a0b1
	ld a,(0e64fh)		;a0b2
	srl a		;a0b5
	srl a		;a0b7
	ld hl,0a0c4h		;a0b9
	call 05ad8h		;a0bc
	call 0681ah		;a0bf
	jr L_A0AA		;a0c2

; ----------------------------------------------------------------------
; DATOS tabla_A0C4: 4 bytes que p03:A0B9 elige con A (p00:5AD8); lo leen
;   p03:A0BC (4 bytes)
;   0xa0c4..0xa0c8  (4 bytes)
DATA_tabla_A0C4:
	defb 070h,090h,0b0h,0c0h	; a0c4

; ----------------------------------------------------------------------
; DATOS tabla_A0C8: 8 palabras que p03:A051 elige con un numero al azar & 7
;   (p01:65AB, p00:4E28); lo leen p03:A054 (16 bytes)
;   0xa0c8..0xa0d8  (16 bytes)
DATA_tabla_A0C8:
	defw 00050h,0ffb0h,00030h,0ffd0h,00000h,00020h,0ffe0h,00010h	; a0c8

; ----------------------------------------------------------------------
; DATOS tabla_A0D8: 8 palabras que p03:A05F elige con un numero al azar & 7;
;   lo leen p03:A062 (16 bytes)
;   0xa0d8..0xa0e8  (16 bytes)
DATA_tabla_A0D8:
	defw 00008h,0fff8h,00010h,0fff0h,00020h,00018h,0ffe8h,0ffe0h	; a0d8

; ======================================================================
; CODIGO 0xa0e8..0xa0ee  (6 bytes)
; ======================================================================


L_A0E8:
	ld hl,0a0eeh		;a0e8
	jp 06bd5h		;a0eb

; ----------------------------------------------------------------------
; DATOS cuadros_A0EE: 6 caracteres de una animacion que p03:A0E8 pasa a
;   p01:6BD5; lo leen p03:A0EB (6 bytes)
;   0xa0ee..0xa0f4  (6 bytes)
DATA_cuadros_A0EE:
	defb 0c0h,0c4h,0c8h,0cch,0c8h,0c4h	; a0ee

; ======================================================================
; CODIGO 0xa0f4..0xa154  (96 bytes)
; ======================================================================


L_A0F4:
	ld a,(0e203h)		;a0f4
	and 001h		;a0f7
	ret nz			;a0f9
	ld a,(ix+031h)		;a0fa
	xor 004h		;a0fd
	ld (ix+031h),a		;a0ff
	ret			;a102
L_A103:
	ld (ix+026h),000h		;a103
	call 04f9bh		;a107
	res 2,(ix+010h)		;a10a
	ld de,00202h		;a10e
	ld bc,01010h		;a111
L_A114:
	ld (ix+014h),d		;a114
	ld (ix+013h),e		;a117
	ld (ix+00fh),b		;a11a
	ld (ix+00eh),c		;a11d
	ret			;a120
L_A121:
	call L_A177		;a121
	call L_A160		;a124
	ret z			;a127
	ld a,(ix+026h)		;a128
	add a,a			;a12b
	ld hl,0a154h		;a12c
	call 040c4h		;a12f
	ld a,(ix+006h)		;a132
	add a,(hl)			;a135
	bit 7,(hl)		;a136
	jr z,L_A13F		;a138
	cp 0f8h		;a13a
	jp z,06b62h		;a13c
L_A13F:
	ld (ix+006h),a		;a13f
	ld a,(ix+004h)		;a142
	add a,(hl)			;a145
	ld (ix+004h),a		;a146
	inc hl			;a149
	ld a,(hl)			;a14a
	ld e,a			;a14b
	ld d,a			;a14c
	add a,a			;a14d
	add a,a			;a14e
	add a,a			;a14f
	ld c,a			;a150
	ld b,a			;a151
	jr L_A114		;a152

; ----------------------------------------------------------------------
; DATOS pares_A154: 6 pares que p03:A12C elige con IX+26 x 2 y suma a IX+06;
;   lo leen p03:A12F (12 bytes)
;   0xa154..0xa160  (12 bytes)
DATA_pares_A154:
	defb 008h,002h	; a154
	defb 0f8h,003h	; a156
	defb 000h,003h	; a158
	defb 000h,004h	; a15a
	defb 000h,003h	; a15c
	defb 000h,003h	; a15e

; ======================================================================
; CODIGO 0xa160..0xa171  (17 bytes)
; ======================================================================


L_A160:
	ld e,(ix+026h)		;a160
	ld bc,00306h		;a163
	ld hl,0a171h		;a166
	call 06591h		;a169
	ld a,e			;a16c
	cp (ix+026h)		;a16d
	ret			;a170

; ----------------------------------------------------------------------
; DATOS cuadros_A171: 6 cuadros (0 1 2 3 2 1) que p03:A166 pasa a p01:6591 con
;   BC = 0x0306; lo leen p03:A169 (6 bytes)
;   0xa171..0xa177  (6 bytes)
DATA_cuadros_A171:
	defb 000h,001h,002h,003h,002h,001h	; a171

; ======================================================================
; CODIGO 0xa177..0xa1cc  (85 bytes)
; ======================================================================


L_A177:
	dec (ix+015h)		;a177
	ret nz			;a17a
	call 067d0h		;a17b
	ld (ix+015h),a		;a17e
	ld e,(ix+004h)		;a181
	ld d,(ix+006h)		;a184
	jp 074c5h		;a187
L_A18A:
	call 06bcdh		;a18a
	ld a,(0e324h)		;a18d
	ld (ix+004h),a		;a190
	call 06872h		;a193
	ld de,0fe00h		;a196
	call 0685dh		;a199
	ld de,00080h		;a19c
	ld a,(ix+004h)		;a19f
	cp 060h		;a1a2
	call nc,05adfh		;a1a4
	jp 0650eh		;a1a7
L_A1AA:
	call L_A1D2		;a1aa
	call L_A1C6		;a1ad
	call 06528h		;a1b0
	ld e,(ix+007h)		;a1b3
	ld d,(ix+008h)		;a1b6
	bit 7,d		;a1b9
	call nz,05adfh		;a1bb
	ld hl,00600h		;a1be
	rst 20h			;a1c1
	call z,06505h		;a1c2
	ret			;a1c5
L_A1C6:
	ld hl,0a1cch		;a1c6
	jp 06bd5h		;a1c9

; ----------------------------------------------------------------------
; DATOS cuadros_A1CC: 6 caracteres de una animacion que p03:A1C6 pasa a
;   p01:6BD5; lo leen p03:A1C9 (6 bytes)
;   0xa1cc..0xa1d2  (6 bytes)
DATA_cuadros_A1CC:
	defb 0b0h,0b4h,0b8h,0bch,0b8h,0b4h	; a1cc

; ======================================================================
; CODIGO 0xa1d2..0xa237  (101 bytes)
; ======================================================================


L_A1D2:
	ld a,(0e301h)		;a1d2
	dec a			;a1d5
	ret z			;a1d6
	ld a,(0e326h)		;a1d7
	sub (ix+006h)		;a1da
	jr c,L_A232		;a1dd
	cp 008h		;a1df
	jr c,L_A232		;a1e1
	dec (ix+015h)		;a1e3
	ret nz			;a1e6
	call 067cah		;a1e7
	ld b,003h		;a1ea
L_A1EC:
	push bc			;a1ec
	call L_A1F4		;a1ed
	pop bc			;a1f0
	djnz L_A1EC		;a1f1
	ret			;a1f3
L_A1F4:
	ld a,b			;a1f4
	dec a			;a1f5
	ld hl,0a237h		;a1f6
	call 05ad8h		;a1f9
	ld h,a			;a1fc
	ld a,(0e326h)		;a1fd
	add a,h			;a200
	ld l,a			;a201
	jr nc,L_A209		;a202
	ld a,(0e324h)		;a204
	sub h			;a207
	ld l,a			;a208
L_A209:
	ld a,(0e324h)		;a209
	ld h,a			;a20c
	ld a,060h		;a20d
	ld e,(ix+004h)		;a20f
	ld d,(ix+006h)		;a212
	ld (0f00fh),a		;a215
	ld a,h			;a218
	ld (0f000h),a		;a219
	ld a,l			;a21c
	ld (0f001h),a		;a21d
	call 075b4h		;a220
	call 07534h		;a223
	ld e,(ix+004h)		;a226
	ld a,(ix+006h)		;a229
	add a,008h		;a22c
	ld d,a			;a22e
	jp 074eah		;a22f
L_A232:
	ld (ix+015h),001h		;a232
	ret			;a236

; ----------------------------------------------------------------------
; DATOS tabla_A237: 3 bytes (p03:A1F6: 0xA237 + B - 1); lo leen p03:A1F9 (3
;   bytes)
;   0xa237..0xa23a  (3 bytes)
DATA_tabla_A237:
	defb 000h,010h,020h	; a237

; ======================================================================
; CODIGO 0xa23a..0xa2e2  (168 bytes)
; ======================================================================


L_A23A:
	ld a,(0e301h)		;a23a
	cp 004h		;a23d
	jr nz,L_A245		;a23f
	ld (ix+030h),0d0h		;a241
L_A245:
	ld (ix+002h),008h		;a245
	ld de,00400h		;a249
	call 06856h		;a24c
	ld d,(ix+019h)		;a24f
	ld e,000h		;a252
	jp 0685dh		;a254
L_A257:
	ld a,(ix+001h)		;a257
	dec a			;a25a
	jr z,L_A27C		;a25b
	dec a			;a25d
	ret z			;a25e
	dec (ix+002h)		;a25f
	ret nz			;a262
	ld (ix+002h),00eh		;a263
	inc (ix+001h)		;a267
	res 2,(ix+010h)		;a26a
L_A26E:
	call 074b4h		;a26e
	ld e,(ix+004h)		;a271
	ld d,(ix+006h)		;a274
	ld a,090h		;a277
	jp 074d4h		;a279
L_A27C:
	dec (ix+002h)		;a27c
	ret nz			;a27f
	inc (ix+001h)		;a280
	set 2,(ix+010h)		;a283
	ld de,0fc00h		;a287
	call 06856h		;a28a
	ld a,(0e64fh)		;a28d
	cp 008h		;a290
	ret c			;a292
	jr L_A26E		;a293
L_A295:
	ld (ix+002h),020h		;a295
	ld (ix+013h),004h		;a299
	ld (ix+014h),004h		;a29d
	res 2,(ix+010h)		;a2a1
	ret			;a2a5
L_A2A6:
	ld a,(ix+006h)		;a2a6
	or a			;a2a9
	jp z,06b62h		;a2aa
	dec (ix+002h)		;a2ad
	ret nz			;a2b0
	ld (ix+002h),004h		;a2b1
	ld a,(ix+006h)		;a2b5
	sub 008h		;a2b8
	ld (ix+006h),a		;a2ba
	ret			;a2bd
L_A2BE:
	call 04eaah		;a2be
	ld (ix+024h),004h		;a2c1
	call 0687ch		;a2c5
	call 04e58h		;a2c8
	and 007h		;a2cb
	ld b,a			;a2cd
	inc b			;a2ce
	ld de,00080h		;a2cf
	ld hl,00400h		;a2d2
L_A2D5:
	add hl,de			;a2d5
	djnz L_A2D5		;a2d6
	ex de,hl			;a2d8
	jp 06856h		;a2d9
L_A2DC:
	ld hl,0a2e2h		;a2dc
	jp 04f80h		;a2df

; ----------------------------------------------------------------------
; DATOS cuadros_A2E2: 4 caracteres que p03:A2DC pasa a p00:4F80; lo leen
;   p03:A2DF (4 bytes)
;   0xa2e2..0xa2e6  (4 bytes)
DATA_cuadros_A2E2:
	defb 080h,084h,088h,08ch	; a2e2

; ======================================================================
; CODIGO 0xa2e6..0xa499  (435 bytes)
; ======================================================================


L_A2E6:
	ld (ix+010h),004h		;a2e6
	ld (ix+002h),008h		;a2ea
	ld (ix+026h),012h		;a2ee
	call 067cah		;a2f2
	ld (ix+015h),a		;a2f5
	ld a,006h		;a2f8
	ld (ix+025h),a		;a2fa
	ld b,002h		;a2fd
L_A2FF:
	call 04f1eh		;a2ff
	jp 06881h		;a302
L_A305:
	bit 0,(ix+001h)		;a305
	jr nz,L_A361		;a309
	ld a,(ix+026h)		;a30b
	cp 00eh		;a30e
	ld bc,00470h		;a310
	jr nc,L_A333		;a313
	cp 009h		;a315
	ld bc,00574h		;a317
	jr nc,L_A333		;a31a
	ld (ix+010h),007h		;a31c
	cp 005h		;a320
	ld bc,00778h		;a322
	jr nc,L_A333		;a325
	bit 0,(ix+00ch)		;a327
	ld b,00fh		;a32b
	jr z,L_A331		;a32d
	ld b,008h		;a32f
L_A331:
	ld c,07ch		;a331
L_A333:
	ld (ix+030h),c		;a333
	ld (ix+031h),b		;a336
	dec (ix+002h)		;a339
	ret nz			;a33c
	ld a,016h		;a33d
	sub (ix+026h)		;a33f
	rra			;a342
	srl a		;a343
	srl a		;a345
	inc a			;a347
	ld (ix+002h),a		;a348
	dec (ix+026h)		;a34b
	jr nz,L_A354		;a34e
	inc (ix+001h)		;a350
	ret			;a353
L_A354:
	ld a,(ix+025h)		;a354
	dec a			;a357
	and 00fh		;a358
	ld (ix+025h),a		;a35a
	ld b,003h		;a35d
	jr L_A2FF		;a35f
L_A361:
	call 081ceh		;a361
	ld bc,00040h		;a364
	call 06bf3h		;a367
	ld a,(0e326h)		;a36a
	cp (ix+006h)		;a36d
	ld c,040h		;a370
	jr nc,L_A377		;a372
	dec b			;a374
	ld c,0c0h		;a375
L_A377:
	call 06c01h		;a377
	ld a,(0e203h)		;a37a
	and 004h		;a37d
	add a,078h		;a37f
	ld (ix+030h),a		;a381
	ret			;a384
L_A385:
	ld (ix+002h),018h		;a385
	ld a,(ix+019h)		;a389
	and a			;a38c
	jr z,L_A393		;a38d
	ld (ix+004h),098h		;a38f
L_A393:
	call 06872h		;a393
	ld de,00180h		;a396
	ld a,(ix+019h)		;a399
	and a			;a39c
	call nz,05adfh		;a39d
	jp 06856h		;a3a0
L_A3A3:
	ld a,(ix+001h)		;a3a3
	dec a			;a3a6
	jr z,L_A3BB		;a3a7
	dec a			;a3a9
	ret z			;a3aa
	dec (ix+002h)		;a3ab
	ret nz			;a3ae
	res 2,(ix+010h)		;a3af
	ld (ix+002h),010h		;a3b3
	inc (ix+001h)		;a3b7
	ret			;a3ba
L_A3BB:
	dec (ix+002h)		;a3bb
	jr z,L_A3E5		;a3be
	ld a,(ix+002h)		;a3c0
	cp 00eh		;a3c3
	ret nz			;a3c5
	ld d,(ix+006h)		;a3c6
	ld b,(ix+019h)		;a3c9
	ld a,b			;a3cc
	and a			;a3cd
	ld e,0f8h		;a3ce
	jr nz,L_A3D4		;a3d0
	ld e,010h		;a3d2
L_A3D4:
	ld a,(ix+004h)		;a3d4
	add a,e			;a3d7
	ld e,a			;a3d8
L_A3D9:
	ld c,000h		;a3d9
	ld a,031h		;a3db
	call 065b5h		;a3dd
	ld a,036h		;a3e0
	jp 04d6eh		;a3e2
L_A3E5:
	inc (ix+001h)		;a3e5
	set 2,(ix+010h)		;a3e8
	ld de,00100h		;a3ec
	ld a,(0e326h)		;a3ef
	cp (ix+006h)		;a3f2
	call c,05adfh		;a3f5
	jp 0685dh		;a3f8
L_A3FB:
	ld (ix+010h),01bh		;a3fb
	ld (ix+014h),004h		;a3ff
	ld (ix+013h),002h		;a403
	ld a,(ix+019h)		;a407
	and a			;a40a
	ld a,0f8h		;a40b
	jr z,L_A411		;a40d
	ld a,008h		;a40f
L_A411:
	ld (ix+029h),a		;a411
	ld a,(0e64fh)		;a414
	cp 00ah		;a417
	ld a,002h		;a419
	jr nc,L_A41F		;a41b
	ld a,004h		;a41d
L_A41F:
	ld (ix+028h),a		;a41f
	ld (ix+02ah),a		;a422
	ret			;a425
L_A426:
	dec (ix+028h)		;a426
	ret nz			;a429
	call L_A43D		;a42a
	ld a,(ix+02ah)		;a42d
	ld (ix+028h),a		;a430
	ld a,(ix+004h)		;a433
	add a,(ix+029h)		;a436
	ld (ix+004h),a		;a439
	ret			;a43c
L_A43D:
	bit 7,(ix+029h)		;a43d
	jr nz,L_A459		;a441
	ld a,(ix+004h)		;a443
	add a,010h		;a446
L_A448:
	ld l,a			;a448
	ld h,(ix+006h)		;a449
	call 07ed4h		;a44c
	ret nc			;a44f
	ld a,(ix+029h)		;a450
	neg		;a453
	ld (ix+029h),a		;a455
	ret			;a458
L_A459:
	ld a,(ix+004h)		;a459
	sub 008h		;a45c
	jr L_A448		;a45e
L_A460:
	ld (ix+025h),020h		;a460
	ld (ix+010h),002h		;a464
	ld a,070h		;a468
	jp 0681ah		;a46a
L_A46D:
	ld a,(ix+001h)		;a46d
	and a			;a470
	ret nz			;a471
	dec (ix+025h)		;a472
	jr nz,L_A483		;a475
	inc (ix+001h)		;a477
	ld (ix+031h),005h		;a47a
	ld (ix+010h),007h		;a47e
	ret			;a482
L_A483:
	ld hl,0a499h		;a483
	ld a,(ix+027h)		;a486
	inc a			;a489
	cp 006h		;a48a
	jr c,L_A48F		;a48c
	xor a			;a48e
L_A48F:
	ld (ix+027h),a		;a48f
	call 05ad8h		;a492
	ld (ix+031h),a		;a495
	ret			;a498

; ----------------------------------------------------------------------
; DATOS tabla_A499: 6 bytes que p03:A483 elige con IX+27 (de 0 a 5); lo leen
;   p03:A486 (6 bytes)
;   0xa499..0xa49f  (6 bytes)
DATA_tabla_A499:
	defb 004h,005h,007h,00fh,007h,005h	; a499

; ======================================================================
; CODIGO 0xa49f..0xa684  (485 bytes)
; ======================================================================


L_A49F:
	ld c,038h		;a49f
	ld de,00204h		;a4a1
	ld hl,00810h		;a4a4
	jp L_B804		;a4a7
L_A4AA:
	call 07acdh		;a4aa
	ret nz			;a4ad
	ld a,(ix+001h)		;a4ae
	dec a			;a4b1
	jr z,L_A4C6		;a4b2
	dec a			;a4b4
	ret z			;a4b5
	dec (ix+002h)		;a4b6
	ret nz			;a4b9
	inc (ix+001h)		;a4ba
	ld (ix+00eh),010h		;a4bd
	ld a,038h		;a4c1
	jp 04d6eh		;a4c3
L_A4C6:
	ld a,(ix+004h)		;a4c6
	add a,002h		;a4c9
	ld e,a			;a4cb
	ld d,(ix+006h)		;a4cc
	ld a,012h		;a4cf
	ld c,000h		;a4d1
	ld b,(ix+00bh)		;a4d3
	call 065b5h		;a4d6
	dec (ix+00eh)		;a4d9
	ret nz			;a4dc
	dec (ix+001h)		;a4dd
	ld (ix+002h),014h		;a4e0
	ret			;a4e4
L_A4E5:
	ld (ix+010h),00fh		;a4e5
	ld (ix+002h),010h		;a4e9
	call 04e58h		;a4ed
	and 007h		;a4f0
	sub 004h		;a4f2
	ld d,a			;a4f4
	ld e,000h		;a4f5
	call 06856h		;a4f7
	call 065abh		;a4fa
	and 003h		;a4fd
	inc a			;a4ff
	inc a			;a500
	bit 0,(ix+019h)		;a501
	jr nz,L_A509		;a505
	neg		;a507
L_A509:
	ld e,000h		;a509
	ld d,a			;a50b
	jp 0685dh		;a50c
L_A50F:
	call L_A53B		;a50f
	bit 0,(ix+001h)		;a512
	jr nz,L_A520		;a516
	dec (ix+002h)		;a518
	ret nz			;a51b
	inc (ix+001h)		;a51c
	ret			;a51f
L_A520:
	ld l,(ix+004h)		;a520
	ld a,(ix+006h)		;a523
	ld h,a			;a526
	call 07ebfh		;a527
	jr c,L_A538		;a52a
	ld hl,(0e6bch)		;a52c
	inc hl			;a52f
	inc hl			;a530
	ld (0e6bch),hl		;a531
	call 07ec5h		;a534
	ret nc			;a537
L_A538:
	jp 08c7bh		;a538
L_A53B:
	bit 0,(ix+019h)		;a53b
	ld bc,00040h		;a53f
	jr z,L_A547		;a542
	dec b			;a544
	ld c,0c0h		;a545
L_A547:
	jp 06c01h		;a547
L_A54A:
	xor a			;a54a
	ld (0e60bh),a		;a54b
	ld hl,0e400h		;a54e
	ld de,0e401h		;a551
	ld bc,0003fh		;a554
	ld (hl),000h		;a557
	ldir		;a559
	ld iy,0e300h		;a55b
	call L_A566		;a55f
	ld iy,0e380h		;a562
L_A566:
	ld a,(iy+020h)		;a566
	or a			;a569
	ret z			;a56a
	ld a,(iy+030h)		;a56b
	or a			;a56e
	ret z			;a56f
	ld b,a			;a570
	ld (iy+030h),000h		;a571
L_A575:
	push bc			;a575
	inc (iy+030h)		;a576
	ld hl,0e60bh		;a579
	inc (hl)			;a57c
	call L_A5B8		;a57d
	pop bc			;a580
	djnz L_A575		;a581
	ret			;a583
L_A584:
	ld de,0e280h		;a584
	bit 0,(iy+021h)		;a587
	ret z			;a58b
	ld e,0c0h		;a58c
	ret			;a58e
L_A58F:
	ld iy,0e300h		;a58f
	call L_A59A		;a593
	ld iy,0e380h		;a596
L_A59A:
	push iy		;a59a
	pop hl			;a59c
	ld a,l			;a59d
	add a,024h		;a59e
	ld l,a			;a5a0
	ld (0f000h),hl		;a5a1
	call L_A584		;a5a4
	ld a,020h		;a5a7
L_A5A9:
	ld hl,(0f000h)		;a5a9
	ldi		;a5ac
	inc l			;a5ae
	ldi		;a5af
	dec a			;a5b1
	jr nz,L_A5A9		;a5b2
	ld (iy+033h),a		;a5b4
	ret			;a5b7
L_A5B8:
	ld hl,0e400h		;a5b8
	ld de,00010h		;a5bb
	xor a			;a5be
L_A5BF:
	cp (hl)			;a5bf
	jr z,L_A5C5		;a5c0
	add hl,de			;a5c2
	jr L_A5BF		;a5c3
L_A5C5:
	ld (hl),001h		;a5c5
	inc l			;a5c7
	ld a,(iy+021h)		;a5c8
	ld (hl),a			;a5cb
	inc l			;a5cc
	ld a,(iy+030h)		;a5cd
	ld (hl),a			;a5d0
	add a,a			;a5d1
	add a,a			;a5d2
	add a,a			;a5d3
	sub (iy+033h)		;a5d4
	neg		;a5d7
	jp p,L_A5DE		;a5d9
	add a,020h		;a5dc
L_A5DE:
	add a,a			;a5de
	call L_A584		;a5df
	add a,e			;a5e2
	ld e,a			;a5e3
	inc l			;a5e4
	inc l			;a5e5
	ld a,(de)			;a5e6
	ld (hl),a			;a5e7
	inc e			;a5e8
	inc l			;a5e9
	inc l			;a5ea
	ld a,(de)			;a5eb
	ld (hl),a			;a5ec
	ret			;a5ed
L_A5EE:
	ld a,(0e630h)		;a5ee
	cp 006h		;a5f1
	jp z,L_A711		;a5f3
	ld a,001h		;a5f6
	ld (0f000h),a		;a5f8
	ld ix,0e400h		;a5fb
	ld b,004h		;a5ff
L_A601:
	push bc			;a601
	call L_A60E		;a602
	ld bc,00010h		;a605
	add ix,bc		;a608
	pop bc			;a60a
	djnz L_A601		;a60b
	ret			;a60d
L_A60E:
	ld a,(ix+000h)		;a60e
	or a			;a611
	ret z			;a612
	ld a,(ix+001h)		;a613
	ld iy,0e300h		;a616
	xor (iy+021h)		;a61a
	jr z,L_A623		;a61d
	ld iy,0e380h		;a61f
L_A623:
	ld a,(iy+020h)		;a623
	cp 004h		;a626
	call z,04da6h		;a628
	ld a,(iy+020h)		;a62b
	dec a			;a62e
	ret m			;a62f
	cp 002h		;a630
	jr c,L_A63B		;a632
	ld hl,0f000h		;a634
	ld a,(hl)			;a637
	inc (hl)			;a638
	jr L_A644		;a639
L_A63B:
	ld a,(iy+034h)		;a63b
	or a			;a63e
	jr nz,$+85		;a63f
	ld a,(ix+002h)		;a641
L_A644:
	add a,a			;a644
	add a,a			;a645
	add a,a			;a646
	sub (iy+033h)		;a647
	neg		;a64a
	jp p,L_A651		;a64c
	add a,020h		;a64f
L_A651:
	add a,a			;a651
	ld de,0e280h		;a652
	bit 0,(iy+021h)		;a655
	jr z,L_A65D		;a659
	ld e,0c0h		;a65b
L_A65D:
	add a,e			;a65d
	ld e,a			;a65e
	ld a,(de)			;a65f
	ld (ix+004h),a		;a660
	inc e			;a663
	ld a,(de)			;a664
	ld (ix+006h),a		;a665
L_A668:
	ld a,(0e203h)		;a668
	rra			;a66b
	and 003h		;a66c
	bit 0,(iy+021h)		;a66e
	ld hl,0a684h		;a672
	jr z,L_A67A		;a675
	ld hl,0a68ch		;a677
L_A67A:
	call 04e28h		;a67a
	ld (ix+007h),e		;a67d
	ld (ix+008h),d		;a680
	ret			;a683

; ----------------------------------------------------------------------
; DATOS palabras_A684: 4 palabras que p03:A67A elige (p00:4E28) con IY+21 a 0
;   y copia a IX+07; lo leen p03:A672 (8 bytes)
;   0xa684..0xa68c  (8 bytes)
DATA_palabras_A684:
	defw 00518h,00718h,0051ch,0071ch	; a684

; ----------------------------------------------------------------------
; DATOS palabras_A68C: 4 palabras que p03:A67A elige con IY+21 a 1; lo leen
;   p03:A677 (8 bytes)
;   0xa68c..0xa694  (8 bytes)
DATA_palabras_A68C:
	defw 00a18h,00918h,00a1ch,0091ch	; a68c

; ======================================================================
; CODIGO 0xa694..0xa701  (109 bytes)
; ======================================================================


L_A694:
	ld hl,la6ffh		;a694
	ld a,(0e620h)		;a697
	or a			;a69a
	jr z,L_A6A0		;a69b
	ld hl,0a707h		;a69d
L_A6A0:
	ld a,(ix+002h)		;a6a0
	call 04e28h		;a6a3
	ld a,(iy+024h)		;a6a6
	add a,e			;a6a9
	ld (ix+004h),a		;a6aa
	call L_A6CB		;a6ad
	ld a,d			;a6b0
	or a			;a6b1
	jp m,L_A6BA		;a6b2
	add a,(iy+026h)		;a6b5
	jr L_A6C1		;a6b8
L_A6BA:
	neg		;a6ba
	ld d,a			;a6bc
	ld a,(iy+026h)		;a6bd
	sub d			;a6c0
L_A6C1:
	ld d,a			;a6c1
	ld (ix+006h),a		;a6c2
	call L_A6DC		;a6c5
	jp L_A668		;a6c8
L_A6CB:
	cp 0e0h		;a6cb
	jr c,L_A6D4		;a6cd
	ld (ix+004h),000h		;a6cf
	ret			;a6d3
L_A6D4:
	cp 09ch		;a6d4
	ret c			;a6d6
	ld (ix+004h),09ch		;a6d7
	ret			;a6db
L_A6DC:
	ex af,af'			;a6dc
	ld a,(0e620h)		;a6dd
	or a			;a6e0
	jr nz,L_A6EC		;a6e1
	ld a,d			;a6e3
	cp 0e8h		;a6e4
	ret c			;a6e6
L_A6E7:
	ld (ix+006h),000h		;a6e7
	ret			;a6eb
L_A6EC:
	ex af,af'			;a6ec
	jr c,L_A6F8		;a6ed
	ld a,d			;a6ef
	cp 0f0h		;a6f0
	ret c			;a6f2
L_A6F3:
	ld (ix+006h),0f0h		;a6f3
	ret			;a6f7
L_A6F8:
	cp 011h		;a6f8
	jr c,L_A6F3		;a6fa
	cp 0e0h		;a6fc
	ret c			;a6fe
L_A6FF:
	jr L_A6E7		;a6ff

; ----------------------------------------------------------------------
; DATOS palabras_A701: 4 palabras (p03:A6A3: 0xA6FF + 2 x IX+02) en
;   horizontal; lo leen p03:A694 (8 bytes)
;   0xa701..0xa709  (8 bytes)
DATA_palabras_A701:
	defw 0f0f0h,0f010h,0e0e0h,0e020h	; a701

; ----------------------------------------------------------------------
; DATOS palabras_A709: 4 palabras (p03:A6A3: 0xA707 + 2 x IX+02) en vertical;
;   lo leen p03:A69D (8 bytes)
;   0xa709..0xa711  (8 bytes)
DATA_palabras_A709:
	defw 0f010h,01010h,0e020h,02020h	; a709

; ======================================================================
; CODIGO 0xa711..0xa878  (359 bytes)
; ======================================================================


L_A711:
	ld a,(0e60bh)		;a711
	or a			;a714
	ret z			;a715
	dec a			;a716
	jp z,L_A7CD		;a717
	dec a			;a71a
	jr z,L_A782		;a71b
	ld a,(0e324h)		;a71d
	exx			;a720
	ld l,a			;a721
	exx			;a722
	ld e,a			;a723
	ld a,(0e3a4h)		;a724
	ld b,000h		;a727
	sub e			;a729
	jr nc,L_A72F		;a72a
	neg		;a72c
	inc b			;a72e
L_A72F:
	srl a		;a72f
	srl a		;a731
	dec b			;a733
	jr nz,L_A738		;a734
	neg		;a736
L_A738:
	exx			;a738
	ld e,a			;a739
	exx			;a73a
	ld a,(0e326h)		;a73b
	exx			;a73e
	ld h,a			;a73f
	exx			;a740
	ld d,a			;a741
	ld a,(0e3a6h)		;a742
	sub d			;a745
	ld b,000h		;a746
	jr nc,L_A74D		;a748
	neg		;a74a
	inc b			;a74c
L_A74D:
	srl a		;a74d
	srl a		;a74f
	dec b			;a751
	jr nz,L_A756		;a752
	neg		;a754
L_A756:
	exx			;a756
	ld d,a			;a757
	exx			;a758
L_A759:
	ld ix,0e400h		;a759
	ld b,004h		;a75d
L_A75F:
	push bc			;a75f
	call L_A76C		;a760
	ld bc,00010h		;a763
	add ix,bc		;a766
	pop bc			;a768
	djnz L_A75F		;a769
	ret			;a76b
L_A76C:
	ld a,(ix+000h)		;a76c
	or a			;a76f
	ret z			;a770
	exx			;a771
	ld a,l			;a772
	add a,e			;a773
	ld l,a			;a774
	ld (ix+004h),a		;a775
	ld a,h			;a778
	add a,d			;a779
	ld h,a			;a77a
	ld (ix+006h),a		;a77b
	exx			;a77e
	jp L_A668		;a77f
L_A782:
	ld a,(0e324h)		;a782
	exx			;a785
	ld l,a			;a786
	exx			;a787
	ld e,a			;a788
	ld a,(0e3a4h)		;a789
	sub e			;a78c
	ld b,000h		;a78d
	jr nc,L_A794		;a78f
	neg		;a791
	inc b			;a793
L_A794:
	srl a		;a794
	srl a		;a796
	ld e,a			;a798
	srl a		;a799
	srl a		;a79b
	add a,e			;a79d
	dec b			;a79e
	jr nz,L_A7A3		;a79f
	neg		;a7a1
L_A7A3:
	exx			;a7a3
	ld e,a			;a7a4
	exx			;a7a5
	ld a,(0e326h)		;a7a6
	exx			;a7a9
	ld h,a			;a7aa
	exx			;a7ab
	ld d,a			;a7ac
	ld a,(0e3a6h)		;a7ad
	sub d			;a7b0
	ld b,000h		;a7b1
	jr nc,L_A7B8		;a7b3
	neg		;a7b5
	inc b			;a7b7
L_A7B8:
	srl a		;a7b8
	srl a		;a7ba
	ld d,a			;a7bc
	srl a		;a7bd
	srl a		;a7bf
	add a,d			;a7c1
	dec b			;a7c2
	jr nz,L_A7C7		;a7c3
	neg		;a7c5
L_A7C7:
	exx			;a7c7
	ld d,a			;a7c8
	exx			;a7c9
	jp L_A759		;a7ca
L_A7CD:
	ld a,(0e324h)		;a7cd
	exx			;a7d0
	ld l,a			;a7d1
	exx			;a7d2
	ld e,a			;a7d3
	ld a,(0e3a4h)		;a7d4
	sub e			;a7d7
	ld b,000h		;a7d8
	jr nc,L_A7DF		;a7da
	neg		;a7dc
	inc b			;a7de
L_A7DF:
	srl a		;a7df
	dec b			;a7e1
	jr nz,L_A7E6		;a7e2
	neg		;a7e4
L_A7E6:
	exx			;a7e6
	ld e,a			;a7e7
	exx			;a7e8
	ld a,(0e326h)		;a7e9
	exx			;a7ec
	ld h,a			;a7ed
	exx			;a7ee
	ld d,a			;a7ef
	ld a,(0e3a6h)		;a7f0
	sub d			;a7f3
	ld b,000h		;a7f4
	jr nc,L_A7FB		;a7f6
	neg		;a7f8
	inc b			;a7fa
L_A7FB:
	srl a		;a7fb
	dec b			;a7fd
	jr nz,L_A802		;a7fe
	neg		;a800
L_A802:
	exx			;a802
	ld d,a			;a803
	exx			;a804
	jp L_A759		;a805
L_A808:
	ld iy,0e300h		;a808
	call L_A813		;a80c
	ld iy,0e380h		;a80f
L_A813:
	ld a,(iy+020h)		;a813
	dec a			;a816
	ret m			;a817
	ld hl,0e280h		;a818
	bit 0,(iy+021h)		;a81b
	jr z,L_A824		;a81f
	ld hl,0e2c0h		;a821
L_A824:
	ld a,(iy+00fh)		;a824
	and 00fh		;a827
	ret z			;a829
	cp 003h		;a82a
	ret z			;a82c
	cp 00ch		;a82d
	ret z			;a82f
	cp 00fh		;a830
	ret z			;a832
	ld a,(iy+033h)		;a833
	add a,a			;a836
	add a,l			;a837
	ld l,a			;a838
	ld a,(iy+024h)		;a839
	ld (hl),a			;a83c
	ld a,(iy+026h)		;a83d
	inc l			;a840
	ld (hl),a			;a841
	inc (iy+033h)		;a842
	ld a,(iy+033h)		;a845
	cp 020h		;a848
	jr c,L_A850		;a84a
	ld (iy+033h),000h		;a84c
L_A850:
	ret			;a850
L_A851:
	ld iy,0e440h		;a851
	ld b,00fh		;a855
L_A857:
	push bc			;a857
	call L_A864		;a858
	ld bc,00018h		;a85b
	add iy,bc		;a85e
	pop bc			;a860
	djnz L_A857		;a861
	ret			;a863
L_A864:
	ld a,(iy+000h)		;a864
	or a			;a867
	ret z			;a868
	sub 005h		;a869
	cp 006h		;a86b
	jr nc,L_A873		;a86d
	ld hl,07e7fh		;a86f
	push hl			;a872
L_A873:
	add a,004h		;a873
	call 040ceh		;a875

; ----------------------------------------------------------------------
; DATOS tabla_A878: 12 destinos del despachador p00:40CE (call en p03:A875, el
;   indice en A): A9F0, B07F, B25B, B349, AD68, AA69, ACBE, ABDD, AA69, AA69,
;   B498, A9F0; lo leen p03:A875 (24 bytes)
;   0xa878..0xa890  (24 bytes)
DATA_tabla_A878:
	defw 0a9f0h,0b07fh,0b25bh,0b349h,0ad68h,0aa69h,0acbeh,0abddh	; a878
	defw 0aa69h,0aa69h,0b498h,0a9f0h	; a888  -> L_AA69 L_AA69 L_B498 L_A9F0

; ======================================================================
; CODIGO 0xa890..0xa99c  (268 bytes)
; ======================================================================


L_A890:
	ld a,(0e227h)		;a890
	cp 002h		;a893
	ret nz			;a895
	ld a,(0e320h)		;a896
	sub 003h		;a899
	cp 002h		;a89b
	ret nc			;a89d
	ld de,0e340h		;a89e
	ld hl,0e3c0h		;a8a1
	ld a,(de)			;a8a4
	cp (hl)			;a8a5
	jr nc,L_A8A9		;a8a6
	ld a,(hl)			;a8a8
L_A8A9:
	ld (0e63bh),a		;a8a9
	inc de			;a8ac
	inc hl			;a8ad
	ld a,(de)			;a8ae
	cp (hl)			;a8af
	jr nc,L_A8B3		;a8b0
	ld a,(hl)			;a8b2
L_A8B3:
	ld (0e63ch),a		;a8b3
	ret			;a8b6
L_A8B7:
	call L_A890		;a8b7
	ld iy,0e300h		;a8ba
	call L_A8C5		;a8be
	ld iy,0e380h		;a8c1
L_A8C5:
	ld a,(iy+020h)		;a8c5
	cp 003h		;a8c8
	ret z			;a8ca
	dec a			;a8cb
	ret m			;a8cc
	ld a,(iy+00eh)		;a8cd
	and 010h		;a8d0
	jr nz,L_A8E9		;a8d2
	ld a,(iy+00fh)		;a8d4
	and 010h		;a8d7
	jr nz,L_A8E0		;a8d9
	ld (iy+03fh),000h		;a8db
	ret			;a8df
L_A8E0:
	inc (iy+03fh)		;a8e0
	ld a,(iy+03fh)		;a8e3
	cp 00fh		;a8e6
	ret c			;a8e8
L_A8E9:
	ld (iy+03fh),000h		;a8e9
	push iy		;a8ed
	pop ix		;a8ef
	ld hl,00000h		;a8f1
	ld a,(0e227h)		;a8f4
	cp 002h		;a8f7
	jr nz,L_A903		;a8f9
	bit 0,(iy+021h)		;a8fb
	jr z,L_A903		;a8ff
	ld l,048h		;a901
L_A903:
	ld (0e6a0h),hl		;a903
	xor a			;a906
	ld (0e6a2h),a		;a907
	call L_A943		;a90a
	ld a,001h		;a90d
	ld (0e6a2h),a		;a90f
	ld hl,00090h		;a912
	ld ix,0e400h		;a915
	ld b,003h		;a919
	ld a,(0e227h)		;a91b
	cp 002h		;a91e
	jr z,L_A925		;a920
	inc b			;a922
	ld l,048h		;a923
L_A925:
	ld (0e6a0h),hl		;a925
L_A928:
	push bc			;a928
	ld a,(ix+000h)		;a929
	or a			;a92c
	call nz,L_A943		;a92d
	ld bc,00010h		;a930
	add ix,bc		;a933
	ld hl,(0e6a0h)		;a935
	ld bc,00048h		;a938
	add hl,bc			;a93b
	ld (0e6a0h),hl		;a93c
	pop bc			;a93f
	djnz L_A928		;a940
	ret			;a942
L_A943:
	ld a,(iy+020h)		;a943
	cp 004h		;a946
	ld a,(iy+040h)		;a948
	jr nz,L_A950		;a94b
	ld a,(0e63bh)		;a94d
L_A950:
	or a			;a950
	call nz,L_A991		;a951
	ld a,(iy+020h)		;a954
	cp 004h		;a957
	ld a,(iy+041h)		;a959
	jr nz,L_A961		;a95c
	ld a,(0e63ch)		;a95e
L_A961:
	ld b,a			;a961
	ld a,(iy+042h)		;a962
	or a			;a965
	jp nz,L_A96F		;a966
	ld a,b			;a969
	or a			;a96a
	call nz,L_AF4F		;a96b
	ret			;a96e
L_A96F:
	call L_AF30		;a96f
	ret nz			;a972
	dec (iy+042h)		;a973
	jp z,05d62h		;a976
	push iy		;a979
	pop hl			;a97b
	ld bc,00042h		;a97c
	add hl,bc			;a97f
	ex de,hl			;a980
	bit 0,(iy+021h)		;a981
	ld hl,03aceh		;a985
	jr z,L_A98C		;a988
	ld l,0deh		;a98a
L_A98C:
	ld b,001h		;a98c
	jp 05a63h		;a98e
L_A991:
	ld b,a			;a991
	ld a,(iy+042h)		;a992
	or a			;a995
	ret nz			;a996
	ld a,b			;a997
	dec a			;a998
	call 040ceh		;a999

; ----------------------------------------------------------------------
; DATOS tabla_A99C: 7 destinos del despachador p00:40CE (call en p03:A999, el
;   indice en A): A9AA, AD24, AA0E, AC50, ABB8, AE9E, AEE3; lo leen p03:A999
;   (14 bytes)
;   0xa99c..0xa9aa  (14 bytes)
DATA_tabla_A99C:
	defw 0a9aah,0ad24h,0aa0eh,0ac50h,0abb8h,0ae9eh,0aee3h	; a99c

; ======================================================================
; CODIGO 0xa9aa..0xabaa  (512 bytes)
; ======================================================================


L_A9AA:
	call L_ADF8		;a9aa
	jr z,L_A9B3		;a9ad
	call L_ADF3		;a9af
	ret nz			;a9b2
L_A9B3:
	ld (hl),001h		;a9b3
	inc l			;a9b5
	ld de,00810h		;a9b6
	ld a,(0e620h)		;a9b9
	or a			;a9bc
	jr z,L_A9C2		;a9bd
	ld de,00807h		;a9bf
L_A9C2:
	call L_AE4D		;a9c2
	and 0f8h		;a9c5
	ld (hl),a			;a9c7
	ld c,02ch		;a9c8
	call L_AE72		;a9ca
	ld de,00802h		;a9cd
	ld a,(0e620h)		;a9d0
	or a			;a9d3
	jr z,L_A9D9		;a9d4
	ld de,00208h		;a9d6
L_A9D9:
	ld a,l			;a9d9
	add a,006h		;a9da
	ld l,a			;a9dc
	ld (hl),d			;a9dd
	inc l			;a9de
	ld (hl),e			;a9df
	call L_AE88		;a9e0
	ld a,003h		;a9e3
	bit 0,(iy+021h)		;a9e5
	jr z,L_A9ED		;a9e9
	ld a,004h		;a9eb
L_A9ED:
	jp 04d6eh		;a9ed
L_A9F0:
	ld a,(0e620h)		;a9f0
	or a			;a9f3
	jr z,L_AA02		;a9f4
	ld a,(iy+003h)		;a9f6
	sub 008h		;a9f9
	jp c,L_AA64		;a9fb
	ld (iy+003h),a		;a9fe
	ret			;aa01
L_AA02:
	ld a,(iy+005h)		;aa02
	add a,00ch		;aa05
	jp c,L_AA64		;aa07
	ld (iy+005h),a		;aa0a
	ret			;aa0d
L_AA0E:
	call L_ADF8		;aa0e
	ret nz			;aa11
	ld a,005h		;aa12
	call 04d6eh		;aa14
	ld (hl),006h		;aa17
	inc l			;aa19
	ld (hl),000h		;aa1a
	ld a,(0e620h)		;aa1c
	or a			;aa1f
	jr nz,L_AA49		;aa20
	ld de,00810h		;aa22
	call L_AE4D		;aa25
	and 0f8h		;aa28
	ld (hl),a			;aa2a
	ld c,034h		;aa2b
	call L_AE72		;aa2d
	ld de,00200h		;aa30
	ld a,01ch		;aa33
L_AA35:
	inc l			;aa35
	inc l			;aa36
	push ix		;aa37
	pop bc			;aa39
	ld (hl),c			;aa3a
	inc l			;aa3b
	ld (hl),b			;aa3c
	inc l			;aa3d
	ld (hl),000h		;aa3e
	inc l			;aa40
	ld (hl),a			;aa41
	inc l			;aa42
	ld (hl),e			;aa43
	inc l			;aa44
	ld (hl),d			;aa45
	jp L_AE88		;aa46
L_AA49:
	ld de,00407h		;aa49
	call L_AE4D		;aa4c
	ld a,d			;aa4f
	and 0f8h		;aa50
	dec l			;aa52
	dec l			;aa53
	ld (hl),a			;aa54
	inc l			;aa55
	inc l			;aa56
	ld c,034h		;aa57
	call L_AE80		;aa59
	ld a,014h		;aa5c
	ld de,00002h		;aa5e
	jp L_AA35		;aa61
L_AA64:
	ld (iy+000h),000h		;aa64
	ret			;aa68
L_AA69:
	push iy		;aa69
	pop hl			;aa6b
	ld a,(0e620h)		;aa6c
	or a			;aa6f
	jp nz,L_AAFF		;aa70
	inc l			;aa73
	ld a,(hl)			;aa74
	dec a			;aa75
	jr z,L_AAD4		;aa76
	jp p,L_AAE3		;aa78
	ld c,(iy+008h)		;aa7b
	ld b,(iy+009h)		;aa7e
	push bc			;aa81
	pop ix		;aa82
	ld de,00810h		;aa84
	ld a,(iy+000h)		;aa87
	cp 006h		;aa8a
	jr z,L_AA96		;aa8c
	ld d,004h		;aa8e
	cp 009h		;aa90
	jr z,L_AA96		;aa92
	ld d,000h		;aa94
L_AA96:
	call L_AE44		;aa96
	and 0f8h		;aa99
	cp 0f8h		;aa9b
	jr nc,L_AA64		;aa9d
	ld (hl),a			;aa9f
	ld c,034h		;aaa0
	call L_AE72		;aaa2
	ld a,004h		;aaa5
L_AAA7:
	add a,l			;aaa7
	ld l,a			;aaa8
	ld b,003h		;aaa9
L_AAAB:
	inc (hl)			;aaab
	inc l			;aaac
	dec (hl)			;aaad
	jr z,L_AAB5		;aaae
	dec l			;aab0
	djnz L_AAAB		;aab1
	jr L_AAB8		;aab3
L_AAB5:
	inc (iy+001h)		;aab5
L_AAB8:
	ld a,(iy+00ah)		;aab8
	add a,a			;aabb
	add a,a			;aabc
	add a,a			;aabd
	neg		;aabe
	sub (iy+005h)		;aac0
	ret nc			;aac3
	neg		;aac4
	rra			;aac6
	rra			;aac7
	rra			;aac8
	and 01fh		;aac9
	sub (iy+00ah)		;aacb
	neg		;aace
	ld (iy+00ah),a		;aad0
	ret			;aad3
L_AAD4:
	call L_AAF6		;aad4
	jr c,L_AA64		;aad7
	call L_AAB8		;aad9
	ld a,(iy+00ah)		;aadc
	or a			;aadf
	ret nz			;aae0
	jr L_AA64		;aae1
L_AAE3:
	call L_AAF6		;aae3
	jp c,L_AA64		;aae6
	ld a,(iy+00ah)		;aae9
	sub 004h		;aaec
	jp c,L_AA64		;aaee
	inc a			;aaf1
	ld (iy+00ah),a		;aaf2
	ret			;aaf5
L_AAF6:
	ld a,(iy+005h)		;aaf6
	add a,018h		;aaf9
	ld (iy+005h),a		;aafb
	ret			;aafe
L_AAFF:
	inc l			;aaff
	ld a,(hl)			;ab00
	dec a			;ab01
	jr z,L_AB77		;ab02
	jp p,L_AB8B		;ab04
	ld c,(iy+008h)		;ab07
	ld b,(iy+009h)		;ab0a
	push bc			;ab0d
	pop ix		;ab0e
	ld de,00407h		;ab10
	ld a,(iy+000h)		;ab13
	cp 006h		;ab16
	jr z,L_AB22		;ab18
	ld e,003h		;ab1a
	cp 009h		;ab1c
	jr z,L_AB22		;ab1e
	ld e,0ffh		;ab20
L_AB22:
	call L_AE44		;ab22
	ld a,d			;ab25
	and 0f8h		;ab26
	cp 008h		;ab28
	jp c,L_AA64		;ab2a
	dec l			;ab2d
	dec l			;ab2e
	ld (hl),a			;ab2f
	inc l			;ab30
	inc l			;ab31
	ld a,(iy+000h)		;ab32
	cp 00ah		;ab35
	jr nz,L_AB43		;ab37
	ld a,e			;ab39
	cp 0f8h		;ab3a
	jr c,L_AB43		;ab3c
	ld e,000h		;ab3e
	ld (iy+005h),e		;ab40
L_AB43:
	ld c,034h		;ab43
	call L_AE80		;ab45
	ld a,004h		;ab48
L_AB4A:
	add a,l			;ab4a
	ld l,a			;ab4b
	ld b,003h		;ab4c
L_AB4E:
	inc (hl)			;ab4e
	inc l			;ab4f
	dec (hl)			;ab50
	jr z,L_AB58		;ab51
	dec l			;ab53
	djnz L_AB4E		;ab54
	jr L_AB5B		;ab56
L_AB58:
	inc (iy+001h)		;ab58
L_AB5B:
	ld a,(iy+00ah)		;ab5b
	add a,a			;ab5e
	add a,a			;ab5f
	add a,a			;ab60
	ld b,a			;ab61
	ld a,(iy+003h)		;ab62
	sub b			;ab65
	ret nc			;ab66
	neg		;ab67
	rra			;ab69
	rra			;ab6a
	rra			;ab6b
	and 01fh		;ab6c
	sub (iy+00ah)		;ab6e
	neg		;ab71
	ld (iy+00ah),a		;ab73
	ret			;ab76
L_AB77:
	call L_ABA1		;ab77
	jp c,L_AA64		;ab7a
	jp z,L_AA64		;ab7d
	call L_AB5B		;ab80
	ld a,(iy+00ah)		;ab83
	or a			;ab86
	ret nz			;ab87
	jp L_AA64		;ab88
L_AB8B:
	call L_ABA1		;ab8b
	jp c,L_AA64		;ab8e
	jp z,L_AA64		;ab91
	ld a,(iy+00ah)		;ab94
	sub 004h		;ab97
	jp c,L_AA64		;ab99
	inc a			;ab9c
	ld (iy+00ah),a		;ab9d
	ret			;aba0
L_ABA1:
	ld a,(iy+003h)		;aba1
	sub 018h		;aba4
	ld (iy+003h),a		;aba6
	ret			;aba9

; ----------------------------------------------------------------------
; DATOS fichas_ABAA: 7 bytes que p03:ABB8 apunta en 0xE64B (con A = 9) en
;   horizontal; lo leen p03:ABB8 (7 bytes)
;   0xabaa..0xabb1  (7 bytes)
DATA_fichas_ABAA:
	defb 008h,010h,008h,033h,01ch,000h,008h	; abaa

; ----------------------------------------------------------------------
; DATOS fichas_ABB1: 7 bytes que p03:ABC1 apunta en 0xE64B (con A = 9) en
;   vertical; lo leen p03:ABC1 (7 bytes)
;   0xabb1..0xabb8  (7 bytes)
DATA_fichas_ABB1:
	defb 008h,004h,004h,033h,014h,008h,000h	; abb1

; ======================================================================
; CODIGO 0xabb8..0xac42  (138 bytes)
; ======================================================================


L_ABB8:
	ld hl,0abaah		;abb8
	ld a,(0e620h)		;abbb
	or a			;abbe
	jr z,L_ABC4		;abbf
	ld hl,0abb1h		;abc1
L_ABC4:
	ld a,009h		;abc4
	jp L_AC5E		;abc6
L_ABC9:
	bit 0,(iy+011h)		;abc9
	jr nz,L_ABD6		;abcd
	ld c,(ix+024h)		;abcf
	ld b,(ix+026h)		;abd2
	ret			;abd5
L_ABD6:
	ld c,(ix+004h)		;abd6
	ld b,(ix+006h)		;abd9
	ret			;abdc
L_ABDD:
	push iy		;abdd
	pop hl			;abdf
	ld a,(0e620h)		;abe0
	or a			;abe3
	jr nz,L_AC15		;abe4
	inc l			;abe6
	ld a,(hl)			;abe7
	dec a			;abe8
	jp z,L_AAD4		;abe9
	jp p,L_AAE3		;abec
	ld c,(iy+008h)		;abef
	ld b,(iy+009h)		;abf2
	push bc			;abf5
	pop ix		;abf6
	call L_ABC9		;abf8
	ld a,c			;abfb
	add a,008h		;abfc
	and 0f8h		;abfe
	inc l			;ac00
	inc l			;ac01
	ld (hl),a			;ac02
	ld a,b			;ac03
	add a,010h		;ac04
	and 0f8h		;ac06
	cp 0f8h		;ac08
	jp nc,L_AA64		;ac0a
	inc l			;ac0d
	inc l			;ac0e
	ld (hl),a			;ac0f
	ld a,005h		;ac10
	jp L_AAA7		;ac12
L_AC15:
	inc l			;ac15
	ld a,(hl)			;ac16
	dec a			;ac17
	jp z,L_AB77		;ac18
	jp p,L_AB8B		;ac1b
	ld c,(iy+008h)		;ac1e
	ld b,(iy+009h)		;ac21
	push bc			;ac24
	pop ix		;ac25
	call L_ABC9		;ac27
	ld a,c			;ac2a
	and 0f8h		;ac2b
	inc l			;ac2d
	inc l			;ac2e
	ld (hl),a			;ac2f
	ld a,b			;ac30
	add a,004h		;ac31
	and 0f8h		;ac33
	cp 0f8h		;ac35
	jp nc,L_AA64		;ac37
	inc l			;ac3a
	inc l			;ac3b
	ld (hl),a			;ac3c
	ld a,005h		;ac3d
	jp L_AB4A		;ac3f

; ----------------------------------------------------------------------
; DATOS fichas_AC42: 7 bytes que p03:AC50 apunta en 0xE64B (con A = 8) en
;   horizontal; lo leen p03:AC50 (7 bytes)
;   0xac42..0xac49  (7 bytes)
DATA_fichas_AC42:
	defb 007h,010h,000h,000h,018h,000h,010h	; ac42

; ----------------------------------------------------------------------
; DATOS fichas_AC49: 7 bytes que p03:AC59 apunta en 0xE64B (con A = 8) en
;   vertical; lo leen p03:AC59 (7 bytes)
;   0xac49..0xac50  (7 bytes)
DATA_fichas_AC49:
	defb 007h,000h,000h,000h,014h,010h,000h	; ac49

; ======================================================================
; CODIGO 0xac50..0xb085  (1077 bytes)
; ======================================================================


L_AC50:
	ld hl,0ac42h		;ac50
	ld a,(0e620h)		;ac53
	or a			;ac56
	jr z,L_AC5C		;ac57
	ld hl,0ac49h		;ac59
L_AC5C:
	ld a,008h		;ac5c
L_AC5E:
	ld (0e64bh),hl		;ac5e
	ld (0e64dh),a		;ac61
	call L_ADF8		;ac64
	ret nz			;ac67
	call L_ACAA		;ac68
	ld de,(0e64bh)		;ac6b
	ld a,(de)			;ac6f
	ld (hl),a			;ac70
	inc l			;ac71
	ld (hl),000h		;ac72
	inc de			;ac74
	ld a,(de)			;ac75
	add a,c			;ac76
	and 0f8h		;ac77
	inc l			;ac79
	inc l			;ac7a
	ld (hl),a			;ac7b
	inc de			;ac7c
	ld a,(de)			;ac7d
	add a,b			;ac7e
	and 0f8h		;ac7f
	inc l			;ac81
	inc l			;ac82
	ld (hl),a			;ac83
	inc de			;ac84
	ld a,(de)			;ac85
	inc l			;ac86
	ld (hl),a			;ac87
	inc l			;ac88
	inc l			;ac89
	push ix		;ac8a
	pop bc			;ac8c
	ld (hl),c			;ac8d
	inc l			;ac8e
	ld (hl),b			;ac8f
	inc l			;ac90
	ld (hl),000h		;ac91
	inc l			;ac93
	inc de			;ac94
	ld a,(de)			;ac95
	ld (hl),a			;ac96
	inc l			;ac97
	inc de			;ac98
	ld a,(de)			;ac99
	ld (hl),a			;ac9a
	inc l			;ac9b
	inc de			;ac9c
	ld a,(de)			;ac9d
	ld (hl),a			;ac9e
	call L_AE88		;ac9f
	ld a,(0e64dh)		;aca2
	or a			;aca5
	ret z			;aca6
	jp 04d6eh		;aca7
L_ACAA:
	ld a,(0e6a2h)		;acaa
	or a			;acad
	jr nz,L_ACB7		;acae
	ld c,(ix+024h)		;acb0
	ld b,(ix+026h)		;acb3
	ret			;acb6
L_ACB7:
	ld c,(ix+004h)		;acb7
	ld b,(ix+006h)		;acba
	ret			;acbd
L_ACBE:
	push iy		;acbe
	pop hl			;acc0
	ld a,(0e620h)		;acc1
	or a			;acc4
	jr nz,L_ACF6		;acc5
	inc l			;acc7
	ld a,(hl)			;acc8
	dec a			;acc9
	jp z,L_AAD4		;acca
	jp p,L_AAE3		;accd
	ld c,(iy+008h)		;acd0
	ld b,(iy+009h)		;acd3
	push bc			;acd6
	pop ix		;acd7
	call L_ABC9		;acd9
	ld a,c			;acdc
	add a,004h		;acdd
	and 0f8h		;acdf
	inc l			;ace1
	inc l			;ace2
	ld (hl),a			;ace3
	ld a,b			;ace4
	add a,010h		;ace5
	and 0f8h		;ace7
	cp 0f8h		;ace9
	jp nc,L_AA64		;aceb
	inc l			;acee
	inc l			;acef
	ld (hl),a			;acf0
	ld a,005h		;acf1
	jp L_AAA7		;acf3
L_ACF6:
	inc l			;acf6
	ld a,(hl)			;acf7
	dec a			;acf8
	jp z,L_AB77		;acf9
	jp p,L_AB8B		;acfc
	ld c,(iy+008h)		;acff
	ld b,(iy+009h)		;ad02
	push bc			;ad05
	pop ix		;ad06
	call L_ABC9		;ad08
	ld a,c			;ad0b
	and 0f8h		;ad0c
	inc l			;ad0e
	inc l			;ad0f
	ld (hl),a			;ad10
	ld a,b			;ad11
	add a,004h		;ad12
	and 0f8h		;ad14
	cp 0f8h		;ad16
	jp nc,L_AA64		;ad18
	inc l			;ad1b
	inc l			;ad1c
	ld (hl),a			;ad1d
	ld a,005h		;ad1e
	jp L_AB4A		;ad20
L_AD23:
	ret			;ad23
L_AD24:
	call L_ADF8		;ad24
	ret nz			;ad27
	ld (hl),005h		;ad28
	inc l			;ad2a
	ld (hl),004h		;ad2b
	call L_ACAA		;ad2d
	ld a,(0e620h)		;ad30
	or a			;ad33
	jr nz,L_AD59		;ad34
	inc l			;ad36
	inc l			;ad37
	ld a,c			;ad38
	and 0f8h		;ad39
	ld (hl),a			;ad3b
	inc l			;ad3c
	inc l			;ad3d
	ld a,b			;ad3e
	add a,010h		;ad3f
	and 0f8h		;ad41
	ld (hl),a			;ad43
L_AD44:
	ld a,l			;ad44
	add a,005h		;ad45
	ld l,a			;ad47
	ld (hl),002h		;ad48
	inc l			;ad4a
	inc l			;ad4b
	ld (hl),010h		;ad4c
	inc l			;ad4e
	ld (hl),010h		;ad4f
	call L_AE88		;ad51
	ld a,006h		;ad54
	jp 04d6eh		;ad56
L_AD59:
	inc l			;ad59
	inc l			;ad5a
	ld a,c			;ad5b
	and 0f8h		;ad5c
	ld (hl),a			;ad5e
	inc l			;ad5f
	inc l			;ad60
	ld a,b			;ad61
	and 0f8h		;ad62
	ld (hl),a			;ad64
	jp L_AD44		;ad65
L_AD68:
	ld a,(0e620h)		;ad68
	or a			;ad6b
	jr nz,L_ADAE		;ad6c
	ld a,(iy+005h)		;ad6e
	add a,008h		;ad71
	jp c,L_AA64		;ad73
	ld (iy+005h),a		;ad76
	dec (iy+001h)		;ad79
	ret nz			;ad7c
	ld (iy+001h),004h		;ad7d
	ld a,(iy+003h)		;ad81
	or a			;ad84
	ld b,001h		;ad85
	jr z,L_AD8F		;ad87
	inc b			;ad89
	sub 008h		;ad8a
	ld (iy+003h),a		;ad8c
L_AD8F:
	ld a,(iy+00ah)		;ad8f
	add a,b			;ad92
	ld (iy+00ah),a		;ad93
	ld a,(iy+003h)		;ad96
	rra			;ad99
	rra			;ad9a
	rra			;ad9b
	and 01fh		;ad9c
	add a,(iy+00ah)		;ad9e
	sub 016h		;ada1
	ret c			;ada3
	inc a			;ada4
	neg		;ada5
	add a,(iy+00ah)		;ada7
	ld (iy+00ah),a		;adaa
	ret			;adad
L_ADAE:
	ld a,(iy+003h)		;adae
	sub 008h		;adb1
	jp c,L_AA64		;adb3
	ld (iy+003h),a		;adb6
	dec (iy+001h)		;adb9
	ret nz			;adbc
	ld (iy+001h),004h		;adbd
	ld a,(iy+005h)		;adc1
	ld b,001h		;adc4
	or a			;adc6
	jr z,L_ADCF		;adc7
	inc b			;adc9
	sub 008h		;adca
	ld (iy+005h),a		;adcc
L_ADCF:
	ld a,(iy+00ah)		;adcf
	add a,b			;add2
	ld (iy+00ah),a		;add3
	ld a,(iy+005h)		;add6
	rra			;add9
	rra			;adda
	rra			;addb
	and 01fh		;addc
	add a,(iy+00ah)		;adde
	sub 021h		;ade1
	ret c			;ade3
	inc a			;ade4
	neg		;ade5
	add a,(iy+00ah)		;ade7
	ld (iy+00ah),a		;adea
	ret			;aded
L_ADEE:
	ld bc,0a5e8h		;adee
	jr L_ADFE		;adf1
L_ADF3:
	ld de,0e458h		;adf3
	jr L_ADFB		;adf6
L_ADF8:
	ld de,0e440h		;adf8
L_ADFB:
	ld bc,0a6d9h		;adfb
L_ADFE:
	ld a,(0e6a2h)		;adfe
	or a			;ae01
	jr nz,L_AE19		;ae02
	ld a,(ix+024h)		;ae04
	cp b			;ae07
	jr nc,L_AE40		;ae08
	ld a,(0e620h)		;ae0a
	or a			;ae0d
	jr nz,L_AE16		;ae0e
	ld a,(ix+026h)		;ae10
	cp c			;ae13
	jr nc,L_AE40		;ae14
L_AE16:
	jp L_AE39		;ae16
L_AE19:
	ld a,(iy+020h)		;ae19
	cp 004h		;ae1c
	jr z,L_AE27		;ae1e
	ld a,(iy+021h)		;ae20
	xor (ix+001h)		;ae23
	ret nz			;ae26
L_AE27:
	ld a,(ix+004h)		;ae27
	cp b			;ae2a
	jr nc,L_AE40		;ae2b
	ld a,(0e620h)		;ae2d
	or a			;ae30
	jr nz,L_AE39		;ae31
	ld a,(ix+006h)		;ae33
	cp c			;ae36
	jr nc,L_AE40		;ae37
L_AE39:
	ld hl,(0e6a0h)		;ae39
	add hl,de			;ae3c
	ld a,(hl)			;ae3d
	or a			;ae3e
	ret			;ae3f
L_AE40:
	ld a,001h		;ae40
	or a			;ae42
	ret			;ae43
L_AE44:
	bit 0,(iy+011h)		;ae44
	jr z,L_AE53		;ae48
	jp L_AE61		;ae4a
L_AE4D:
	ld a,(0e6a2h)		;ae4d
	or a			;ae50
	jr nz,L_AE61		;ae51
L_AE53:
	ld a,(ix+024h)		;ae53
	add a,d			;ae56
	ld d,a			;ae57
	inc l			;ae58
	inc l			;ae59
	ld (hl),a			;ae5a
	ld a,(ix+026h)		;ae5b
	jp L_AE6C		;ae5e
L_AE61:
	ld a,(ix+004h)		;ae61
	add a,d			;ae64
	ld d,a			;ae65
	inc l			;ae66
	inc l			;ae67
	ld (hl),a			;ae68
	ld a,(ix+006h)		;ae69
L_AE6C:
	add a,e			;ae6c
	ld e,a			;ae6d
	inc l			;ae6e
	inc l			;ae6f
	ld (hl),a			;ae70
	ret			;ae71
L_AE72:
	ld a,(0e620h)		;ae72
	or a			;ae75
	jr nz,L_AE80		;ae76
	ld a,d			;ae78
	rra			;ae79
	and 003h		;ae7a
	add a,c			;ae7c
	inc l			;ae7d
	ld (hl),a			;ae7e
	ret			;ae7f
L_AE80:
	ld a,e			;ae80
	rra			;ae81
	and 003h		;ae82
	add a,c			;ae84
	inc l			;ae85
	ld (hl),a			;ae86
	ret			;ae87
L_AE88:
	inc l			;ae88
	inc l			;ae89
	inc l			;ae8a
	ld a,(0e6a2h)		;ae8b
	or a			;ae8e
	ld a,(ix+021h)		;ae8f
	jr z,L_AE97		;ae92
	ld a,(ix+001h)		;ae94
L_AE97:
	ld (hl),a			;ae97
	inc l			;ae98
	ld a,(0e6a2h)		;ae99
	ld (hl),a			;ae9c
	ret			;ae9d
L_AE9E:
	call L_ADF8		;ae9e
	ret nz			;aea1
	ld a,005h		;aea2
	call 04d6eh		;aea4
	ld (hl),009h		;aea7
	inc l			;aea9
	ld (hl),000h		;aeaa
	ld a,(0e620h)		;aeac
	or a			;aeaf
	jr nz,L_AEC8		;aeb0
	ld de,0fc10h		;aeb2
	call L_AE4D		;aeb5
	and 0f8h		;aeb8
	ld (hl),a			;aeba
	ld d,034h		;aebb
	call L_AE72		;aebd
	ld de,00a00h		;aec0
	ld a,010h		;aec3
	jp L_AA35		;aec5
L_AEC8:
	ld de,000fch		;aec8
	call L_AE4D		;aecb
	ld a,d			;aece
	and 0f8h		;aecf
	dec l			;aed1
	dec l			;aed2
	ld (hl),a			;aed3
	inc l			;aed4
	inc l			;aed5
	ld d,034h		;aed6
	call L_AE80		;aed8
	ld de,0000ah		;aedb
	ld a,010h		;aede
	jp L_AA35		;aee0
L_AEE3:
	call L_ADF8		;aee3
	ret nz			;aee6
	ld a,005h		;aee7
	call 04d6eh		;aee9
	ld (hl),00ah		;aeec
	inc l			;aeee
	ld (hl),000h		;aeef
	ld a,(0e620h)		;aef1
	or a			;aef4
	jr nz,L_AF0D		;aef5
	ld de,0f810h		;aef7
	call L_AE4D		;aefa
	and 0f8h		;aefd
	ld (hl),a			;aeff
	ld d,034h		;af00
	call L_AE72		;af02
	ld de,01200h		;af05
	ld a,00ch		;af08
	jp L_AA35		;af0a
L_AF0D:
	ld de,000f8h		;af0d
	call L_AE4D		;af10
	ld a,d			;af13
	and 0f8h		;af14
	dec l			;af16
	dec l			;af17
	ld (hl),a			;af18
	inc l			;af19
	inc l			;af1a
	ld a,e			;af1b
	cp 0f8h		;af1c
	jr c,L_AF22		;af1e
	ld e,000h		;af20
L_AF22:
	ld (hl),e			;af22
	ld d,034h		;af23
	call L_AE80		;af25
	ld de,00012h		;af28
	ld a,00ch		;af2b
	jp L_AA35		;af2d
L_AF30:
	ld a,(0e6a2h)		;af30
	or a			;af33
	ret nz			;af34
	ld de,0e470h		;af35
	call L_ADEE		;af38
	ret nz			;af3b
	ld a,041h		;af3c
	call 04d6eh		;af3e
	ld a,00ch		;af41
	call L_AF6A		;af43
	xor a			;af46
	ret			;af47
L_AF48:
	ld de,0fffbh		;af48
	add hl,de			;af4b
	ld (hl),000h		;af4c
	ret			;af4e
L_AF4F:
	ld de,0e470h		;af4f
	call L_ADEE		;af52
	ret nz			;af55
	ld a,(iy+020h)		;af56
	cp 004h		;af59
	ld a,(iy+041h)		;af5b
	jr nz,L_AF63		;af5e
	ld a,(0e63ch)		;af60
L_AF63:
	cp 004h		;af63
	jp z,L_B43F		;af65
	add a,001h		;af68
L_AF6A:
	ld (hl),a			;af6a
	ld (0f000h),a		;af6b
	inc l			;af6e
	ld (hl),000h		;af6f
	ld de,00808h		;af71
	ld a,(0e620h)		;af74
	or a			;af77
	jr z,L_AF7D		;af78
	ld de,00008h		;af7a
L_AF7D:
	call L_AE4D		;af7d
	ld a,d			;af80
	and 0fch		;af81
	jr z,L_AF48		;af83
	dec l			;af85
	dec l			;af86
	ld (hl),a			;af87
	ld (0f002h),a		;af88
	inc l			;af8b
	inc l			;af8c
	ld a,e			;af8d
	and 0fch		;af8e
	ld (hl),a			;af90
	ld (0f003h),a		;af91
	inc l			;af94
	ld a,(0f000h)		;af95
	ld b,a			;af98
	cp 00ch		;af99
	ld a,014h		;af9b
	jr z,L_AFA1		;af9d
	ld a,024h		;af9f
L_AFA1:
	ld (hl),a			;afa1
	inc l			;afa2
	ld a,b			;afa3
	ld b,00ah		;afa4
	sub 002h		;afa6
	jr z,L_AFB6		;afa8
	ld b,003h		;afaa
	dec a			;afac
	jr z,L_AFB6		;afad
	ld b,009h		;afaf
	dec a			;afb1
	jr z,L_AFB6		;afb2
	ld b,00fh		;afb4
L_AFB6:
	ld (hl),b			;afb6
	inc l			;afb7
	inc l			;afb8
	ld a,(0e620h)		;afb9
	or a			;afbc
	jr nz,L_AFCD		;afbd
	ld bc,00802h		;afbf
	ld a,d			;afc2
	cp 050h		;afc3
	ld a,000h		;afc5
	jr nc,L_AFD8		;afc7
	inc a			;afc9
	jp L_AFD8		;afca
L_AFCD:
	ld bc,00208h		;afcd
	ld a,e			;afd0
	cp 080h		;afd1
	ld a,002h		;afd3
	jr nc,L_AFD8		;afd5
	inc a			;afd7
L_AFD8:
	ld (hl),a			;afd8
	inc l			;afd9
	inc l			;afda
	inc l			;afdb
	ld (hl),b			;afdc
	inc l			;afdd
	ld (hl),c			;afde
	call L_AE88		;afdf
	ld a,(0f000h)		;afe2
	cp 004h		;afe5
	ret nz			;afe7
	ld (0f004h),hl		;afe8
	ld hl,00000h		;afeb
	ld (0f006h),hl		;afee
	dec hl			;aff1
	ld (0f000h),hl		;aff2
	ld hl,0eb00h		;aff5
	ld b,008h		;aff8
L_AFFA:
	ld a,(hl)			;affa
	or a			;affb
	jr z,L_B015		;affc
	inc l			;affe
	inc l			;afff
	inc l			;b000
	ld a,(hl)			;b001
	dec l			;b002
	dec l			;b003
	dec l			;b004
	or a			;b005
	jr nz,L_B015		;b006
	ld a,l			;b008
	add a,005h		;b009
	ld l,a			;b00b
	ld d,(hl)			;b00c
	ld a,l			;b00d
	sub 005h		;b00e
	ld l,a			;b010
	ld a,d			;b011
	or a			;b012
	jr z,L_B03E		;b013
L_B015:
	ld de,00010h		;b015
	add hl,de			;b018
	djnz L_AFFA		;b019
	ld hl,(0f006h)		;b01b
	ld a,l			;b01e
	or h			;b01f
	jr nz,L_B02C		;b020
	ld hl,(0f004h)		;b022
	ld de,0ffefh		;b025
	add hl,de			;b028
	ld (hl),003h		;b029
	ret			;b02b
L_B02C:
	ex de,hl			;b02c
	ld hl,(0f004h)		;b02d
	inc l			;b030
	ld (hl),e			;b031
	inc l			;b032
	ld (hl),d			;b033
	inc l			;b034
	xor a			;b035
	ld (hl),a			;b036
	inc l			;b037
	ld (hl),a			;b038
	inc l			;b039
	ld (hl),a			;b03a
	inc l			;b03b
	ld (hl),a			;b03c
	ret			;b03d
L_B03E:
	ld de,(0f002h)		;b03e
	ld a,l			;b042
	add a,004h		;b043
	ld l,a			;b045
	ld a,(hl)			;b046
	sub e			;b047
	jr nc,L_B04C		;b048
	neg		;b04a
L_B04C:
	exx			;b04c
	ld e,a			;b04d
	ld d,000h		;b04e
	exx			;b050
	inc l			;b051
	inc l			;b052
	ld a,(hl)			;b053
	sub d			;b054
	jr nc,L_B059		;b055
	neg		;b057
L_B059:
	exx			;b059
	add a,e			;b05a
	ld e,a			;b05b
	jr nc,L_B05F		;b05c
	inc d			;b05e
L_B05F:
	ld hl,(0f000h)		;b05f
	or a			;b062
	sbc hl,de		;b063
	jr c,L_B06B		;b065
	ld (0f000h),de		;b067
L_B06B:
	exx			;b06b
	jr c,L_B078		;b06c
	ld a,l			;b06e
	sub 006h		;b06f
	ld l,a			;b071
	ld (0f006h),hl		;b072
	jp L_B015		;b075
L_B078:
	ld a,l			;b078
	sub 006h		;b079
	ld l,a			;b07b
	jp L_B015		;b07c
L_B07F:
	ld a,(iy+009h)		;b07f
	call 040ceh		;b082

; ----------------------------------------------------------------------
; DATOS tabla_B085: 4 destinos del despachador p00:40CE (call en p03:B082, el
;   indice en A): B08D, B121, B19A, B201; lo leen p03:B082 (8 bytes)
;   0xb085..0xb08d  (8 bytes)
DATA_tabla_B085:
	defw 0b08dh,0b121h,0b19ah,0b201h	; b085  -> L_B08D L_B121 L_B19A L_B201

; ======================================================================
; CODIGO 0xb08d..0xb269  (476 bytes)
; ======================================================================


L_B08D:
	call L_B0D9		;b08d
	jr c,L_B0D1		;b090
	call L_B0E2		;b092
	jr nc,L_B0B9		;b095
	call L_B0F4		;b097
	jr nc,L_B0B3		;b09a
	call L_B103		;b09c
	jp c,L_AA64		;b09f
L_B0A2:
	ld (iy+006h),024h		;b0a2
	ld b,004h		;b0a6
L_B0A8:
	ld a,(iy+005h)		;b0a8
	add a,b			;b0ab
	jp c,L_AA64		;b0ac
	ld (iy+005h),a		;b0af
	ret			;b0b2
L_B0B3:
	call L_B0BE		;b0b3
	jp L_B0A2		;b0b6
L_B0B9:
	ld b,002h		;b0b9
	call L_B0A8		;b0bb
L_B0BE:
	ld (iy+006h),028h		;b0be
	ld b,004h		;b0c2
L_B0C4:
	ld a,(iy+003h)		;b0c4
	add a,b			;b0c7
	cp 0a4h		;b0c8
	jp nc,L_AA64		;b0ca
	ld (iy+003h),a		;b0cd
	ret			;b0d0
L_B0D1:
	call L_B0A2		;b0d1
	ld b,008h		;b0d4
	jp L_B14C		;b0d6
L_B0D9:
	ld h,(iy+005h)		;b0d9
	ld l,(iy+003h)		;b0dc
	jp L_B118		;b0df
L_B0E2:
	ld h,(iy+005h)		;b0e2
	ld a,(iy+003h)		;b0e5
	add a,008h		;b0e8
	ld l,a			;b0ea
L_B0EB:
	ld a,(0e605h)		;b0eb
	exx			;b0ee
	ld c,a			;b0ef
	exx			;b0f0
	jp 07ea2h		;b0f1
L_B0F4:
	ld a,(iy+005h)		;b0f4
	add a,008h		;b0f7
	ld h,a			;b0f9
	ld a,(iy+003h)		;b0fa
	add a,008h		;b0fd
	ld l,a			;b0ff
	jp L_B0EB		;b100
L_B103:
	ld a,(iy+005h)		;b103
	add a,008h		;b106
	ld h,a			;b108
	ld l,(iy+003h)		;b109
	jp L_B0EB		;b10c
L_B10F:
	ld h,(iy+005h)		;b10f
	ld a,(iy+003h)		;b112
	sub 008h		;b115
	ld l,a			;b117
L_B118:
	ld a,(0e605h)		;b118
	exx			;b11b
	ld c,a			;b11c
	exx			;b11d
	jp 07e9ch		;b11e
L_B121:
	call L_B162		;b121
	jr c,L_B15A		;b124
	call L_B16B		;b126
	jr nc,L_B141		;b129
	call L_B175		;b12b
	jr nc,L_B139		;b12e
	call L_B182		;b130
	jp c,L_AA64		;b133
	jp L_B0A2		;b136
L_B139:
	ld b,004h		;b139
	call L_B148		;b13b
	jp L_B0A2		;b13e
L_B141:
	ld b,002h		;b141
	call L_B0A8		;b143
	ld b,004h		;b146
L_B148:
	ld (iy+006h),020h		;b148
L_B14C:
	ld a,(iy+003h)		;b14c
	sub b			;b14f
	jp c,L_AA64		;b150
	jp z,L_AA64		;b153
	ld (iy+003h),a		;b156
	ret			;b159
L_B15A:
	call L_B0A2		;b15a
	ld b,008h		;b15d
	jp L_B0C4		;b15f
L_B162:
	ld h,(iy+005h)		;b162
	ld l,(iy+003h)		;b165
	jp L_B118		;b168
L_B16B:
	ld h,(iy+005h)		;b16b
	ld l,(iy+003h)		;b16e
	dec l			;b171
	jp L_B0EB		;b172
L_B175:
	ld a,(iy+005h)		;b175
	add a,008h		;b178
	ld h,a			;b17a
	ld l,(iy+003h)		;b17b
	dec l			;b17e
	jp L_B0EB		;b17f
L_B182:
	ld a,(iy+005h)		;b182
	add a,008h		;b185
	ld h,a			;b187
	ld l,(iy+003h)		;b188
	jp L_B0EB		;b18b
L_B18E:
	ld h,(iy+005h)		;b18e
	ld a,(iy+003h)		;b191
	add a,007h		;b194
	ld l,a			;b196
	jp L_B118		;b197
L_B19A:
	call L_B1CE		;b19a
	jr nc,L_B1C0		;b19d
	call L_B1DA		;b19f
	jr nc,L_B1BD		;b1a2
	call L_B1E9		;b1a4
	jp c,L_AA64		;b1a7
L_B1AA:
	ld (iy+006h),024h		;b1aa
L_B1AE:
	ld b,004h		;b1ae
L_B1B0:
	ld a,(iy+003h)		;b1b0
	sub b			;b1b3
	cp 008h		;b1b4
	jp c,L_AA64		;b1b6
	ld (iy+003h),a		;b1b9
	ret			;b1bc
L_B1BD:
	call L_B1AE		;b1bd
L_B1C0:
	ld (iy+006h),028h		;b1c0
	ld b,002h		;b1c4
	call L_B1B0		;b1c6
	ld b,004h		;b1c9
	jp L_B0A8		;b1cb
L_B1CE:
	ld a,(iy+005h)		;b1ce
	add a,008h		;b1d1
	ld h,a			;b1d3
	ld l,(iy+003h)		;b1d4
	jp L_B0EB		;b1d7
L_B1DA:
	ld a,(iy+005h)		;b1da
	add a,008h		;b1dd
	ld h,a			;b1df
	ld a,(iy+003h)		;b1e0
	sub 008h		;b1e3
	ld l,a			;b1e5
	jp L_B0EB		;b1e6
L_B1E9:
	ld h,(iy+005h)		;b1e9
	ld a,(iy+003h)		;b1ec
	sub 008h		;b1ef
	ld l,a			;b1f1
	jp L_B0EB		;b1f2
L_B1F5:
	ld a,(iy+005h)		;b1f5
	sub 008h		;b1f8
	ld h,a			;b1fa
	ld l,(iy+003h)		;b1fb
	jp L_B118		;b1fe
L_B201:
	call L_B22C		;b201
	jr nc,L_B217		;b204
	call L_B236		;b206
	jr nc,L_B214		;b209
	call L_B243		;b20b
	jp c,L_AA64		;b20e
	jp L_B1AA		;b211
L_B214:
	call L_B1AE		;b214
L_B217:
	ld (iy+006h),020h		;b217
	ld b,002h		;b21b
	call L_B1B0		;b21d
	ld a,(iy+005h)		;b220
	sub 004h		;b223
	jp c,L_AA64		;b225
	ld (iy+005h),a		;b228
	ret			;b22b
L_B22C:
	ld h,(iy+005h)		;b22c
	dec h			;b22f
	ld l,(iy+003h)		;b230
	jp L_B0EB		;b233
L_B236:
	ld h,(iy+005h)		;b236
	dec h			;b239
	ld a,(iy+003h)		;b23a
	sub 008h		;b23d
	ld l,a			;b23f
	jp L_B0EB		;b240
L_B243:
	ld h,(iy+005h)		;b243
	ld a,(iy+003h)		;b246
	sub 008h		;b249
	ld l,a			;b24b
	jp L_B0EB		;b24c
L_B24F:
	ld a,(iy+005h)		;b24f
	add a,006h		;b252
	ld h,a			;b254
	ld l,(iy+003h)		;b255
	jp L_B118		;b258
L_B25B:
	call L_B3F3		;b25b
	ld a,(iy+000h)		;b25e
	or a			;b261
	ret z			;b262
	ld a,(iy+009h)		;b263
	call 040ceh		;b266

; ----------------------------------------------------------------------
; DATOS tabla_B269: 4 destinos del despachador p00:40CE (call en p03:B266, el
;   indice en A): B271, B2A9, B2E3, B315; lo leen p03:B266 (8 bytes)
;   0xb269..0xb271  (8 bytes)
DATA_tabla_B269:
	defw 0b271h,0b2a9h,0b2e3h,0b315h	; b269  -> L_B271 L_B2A9 L_B2E3 L_B315

; ======================================================================
; CODIGO 0xb271..0xb494  (547 bytes)
; ======================================================================


L_B271:
	bit 0,(iy+001h)		;b271
	ld (iy+001h),000h		;b275
	jr nz,L_B28D		;b279
	call L_B0D9		;b27b
	jp c,L_B0D1		;b27e
	call L_B0E2		;b281
	jp nc,L_B0B9		;b284
	call L_B0F4		;b287
	jp nc,L_B0B3		;b28a
L_B28D:
	call L_B103		;b28d
	jp nc,L_B0A2		;b290
	call L_B10F		;b293
	jp c,L_AA64		;b296
	ld a,(iy+003h)		;b299
	sub 004h		;b29c
	jp c,L_AA64		;b29e
	ld (iy+003h),a		;b2a1
	ld (iy+001h),001h		;b2a4
	ret			;b2a8
L_B2A9:
	bit 0,(iy+001h)		;b2a9
	ld (iy+001h),000h		;b2ad
	jr nz,L_B2C5		;b2b1
	call L_B162		;b2b3
	jp c,L_B15A		;b2b6
	call L_B16B		;b2b9
	jp nc,L_B141		;b2bc
	call L_B175		;b2bf
	jp nc,L_B139		;b2c2
L_B2C5:
	call L_B182		;b2c5
	jp nc,L_B0A2		;b2c8
	call L_B18E		;b2cb
	jp c,L_AA64		;b2ce
	ld a,(iy+003h)		;b2d1
	add a,004h		;b2d4
	cp 0a0h		;b2d6
	jp nc,L_AA64		;b2d8
	ld (iy+003h),a		;b2db
	ld (iy+001h),001h		;b2de
	ret			;b2e2
L_B2E3:
	bit 0,(iy+001h)		;b2e3
	ld (iy+001h),000h		;b2e7
	jr nz,L_B2F9		;b2eb
	call L_B1CE		;b2ed
	jp nc,L_B1C0		;b2f0
	call L_B1DA		;b2f3
	jp nc,L_B1BD		;b2f6
L_B2F9:
	call L_B1E9		;b2f9
	jp nc,L_B1AA		;b2fc
	call L_B1F5		;b2ff
	jp c,L_AA64		;b302
	ld a,(iy+005h)		;b305
	sub 004h		;b308
	jp c,L_AA64		;b30a
	ld (iy+005h),a		;b30d
	ld (iy+001h),001h		;b310
	ret			;b314
L_B315:
	bit 0,(iy+001h)		;b315
	ld (iy+001h),000h		;b319
	jr nz,L_B32B		;b31d
	call L_B22C		;b31f
	jp nc,L_B217		;b322
	call L_B236		;b325
	jp nc,L_B214		;b328
L_B32B:
	call L_B243		;b32b
	jp nc,L_B1AA		;b32e
	call L_B24F		;b331
	jp c,L_AA64		;b334
	ld a,(iy+005h)		;b337
	add a,004h		;b33a
	cp 0f8h		;b33c
	jp nc,L_AA64		;b33e
	ld (iy+005h),a		;b341
	ld (iy+001h),001h		;b344
	ret			;b348
L_B349:
	ld l,(iy+012h)		;b349
	ld h,(iy+013h)		;b34c
	ld a,(hl)			;b34f
	or a			;b350
	jr z,L_B3C1		;b351
	ld a,(0e203h)		;b353
	inc a			;b356
	and 003h		;b357
	jr nz,L_B389		;b359
	ld a,l			;b35b
	add a,004h		;b35c
	ld l,a			;b35e
	ld e,(hl)			;b35f
	inc l			;b360
	inc l			;b361
	ld d,(hl)			;b362
	ld (0f000h),de		;b363
	ld e,(iy+003h)		;b367
	ld d,(iy+005h)		;b36a
	call 075b4h		;b36d
	ld a,0c0h		;b370
	ld (0f00fh),a		;b372
	ld d,001h		;b375
	call 07536h		;b377
	ld (iy+016h),e		;b37a
	ld (iy+017h),d		;b37d
	ld hl,(0f012h)		;b380
	ld (iy+014h),l		;b383
	ld (iy+015h),h		;b386
L_B389:
	ld a,(iy+004h)		;b389
	add a,(iy+016h)		;b38c
	ld (iy+004h),a		;b38f
	ld a,(iy+005h)		;b392
	adc a,(iy+017h)		;b395
	ld (iy+005h),a		;b398
	cp 0f8h		;b39b
	jp nc,L_AA64		;b39d
	ld a,(iy+002h)		;b3a0
	add a,(iy+014h)		;b3a3
	ld (iy+002h),a		;b3a6
	ld a,(iy+003h)		;b3a9
	adc a,(iy+015h)		;b3ac
	ld (iy+003h),a		;b3af
	cp 0a4h		;b3b2
	jp nc,L_AA64		;b3b4
	ld h,(iy+005h)		;b3b7
	ld l,(iy+003h)		;b3ba
	call L_B118		;b3bd
	ret nc			;b3c0
L_B3C1:
	ld a,(0e620h)		;b3c1
	or a			;b3c4
	jr nz,L_B3E8		;b3c5
	bit 7,(iy+015h)		;b3c7
	ld a,000h		;b3cb
	jr z,L_B3D0		;b3cd
	inc a			;b3cf
L_B3D0:
	ld (iy+009h),a		;b3d0
	ld (iy+000h),003h		;b3d3
	ld a,(iy+003h)		;b3d7
	and 0fch		;b3da
	ld (iy+003h),a		;b3dc
	ld a,(iy+005h)		;b3df
	and 0fch		;b3e2
	ld (iy+005h),a		;b3e4
	ret			;b3e7
L_B3E8:
	bit 7,(iy+017h)		;b3e8
	ld a,002h		;b3ec
	jr z,L_B3F1		;b3ee
	inc a			;b3f0
L_B3F1:
	jr L_B3D0		;b3f1
L_B3F3:
	bit 0,(iy+001h)		;b3f3
	ret z			;b3f7
	call L_B41F		;b3f8
	ld a,(0e628h)		;b3fb
	or a			;b3fe
	ret z			;b3ff
	jp m,L_B411		;b400
	ld a,(iy+003h)		;b403
	add a,008h		;b406
	cp 0a4h		;b408
	jp nc,L_AA64		;b40a
	ld (iy+003h),a		;b40d
	ret			;b410
L_B411:
	ld a,(iy+003h)		;b411
	sub 008h		;b414
	cp 008h		;b416
	jp c,L_AA64		;b418
	ld (iy+003h),a		;b41b
	ret			;b41e
L_B41F:
	ld a,(0e627h)		;b41f
	or a			;b422
	ret z			;b423
	jp m,L_B433		;b424
	ld a,(iy+005h)		;b427
	sub 008h		;b42a
	jp c,L_AA64		;b42c
	ld (iy+005h),a		;b42f
	ret			;b432
L_B433:
	ld a,(iy+005h)		;b433
	add a,008h		;b436
	jp c,L_AA64		;b438
	ld (iy+005h),a		;b43b
	ret			;b43e
L_B43F:
	ld (hl),00bh		;b43f
	inc l			;b441
	ld (hl),000h		;b442
	ld de,00000h		;b444
	call L_AE4D		;b447
	dec l			;b44a
	dec l			;b44b
	ld a,d			;b44c
	and 0f8h		;b44d
	ld (hl),a			;b44f
	inc l			;b450
	inc l			;b451
	ld a,e			;b452
	and 0f8h		;b453
	ld (hl),a			;b455
	inc l			;b456
	ld (hl),010h		;b457
	inc l			;b459
	ld (hl),00bh		;b45a
	inc l			;b45c
	inc l			;b45d
	inc l			;b45e
	ld a,(iy+00fh)		;b45f
	ld b,a			;b462
	and 003h		;b463
	ld de,0b494h		;b465
	call 040c9h		;b468
	ld a,(de)			;b46b
	ld (hl),a			;b46c
	ld c,a			;b46d
	ld a,b			;b46e
	rra			;b46f
	rra			;b470
	and 003h		;b471
	ld de,0b494h		;b473
	call 040c9h		;b476
	ld a,(de)			;b479
	inc l			;b47a
	ld (hl),a			;b47b
	or c			;b47c
	jr nz,L_B486		;b47d
	ld bc,0fff5h		;b47f
	add hl,bc			;b482
	ld (hl),000h		;b483
	ret			;b485
L_B486:
	inc l			;b486
	ld (hl),010h		;b487
	inc l			;b489
	ld (hl),010h		;b48a
	call L_AE88		;b48c
	ld a,00ah		;b48f
	jp 04d6eh		;b491

; ----------------------------------------------------------------------
; DATOS tabla_B494: 4 bytes que p03:B465 y p03:B473 eligen con A & 3; lo leen
;   p03:B468 (4 bytes)
;   0xb494..0xb498  (4 bytes)
DATA_tabla_B494:
	defb 000h,0ffh,001h,000h	; b494

; ======================================================================
; CODIGO 0xb498..0xb621  (393 bytes)
; ======================================================================


L_B498:
	ld a,(0e605h)		;b498
	ld c,a			;b49b
	call L_B4D5		;b49c
	call L_B537		;b49f
	ld a,(iy+00ah)		;b4a2
	or a			;b4a5
	jr z,L_B4BC		;b4a6
	ld a,008h		;b4a8
	jp p,L_B4AF		;b4aa
	ld a,0f8h		;b4ad
L_B4AF:
	add a,(iy+003h)		;b4af
	ld (iy+003h),a		;b4b2
	sub 008h		;b4b5
	cp 098h		;b4b7
	jp nc,L_AA64		;b4b9
L_B4BC:
	ld a,(iy+00bh)		;b4bc
	or a			;b4bf
	ret z			;b4c0
	ld a,008h		;b4c1
	jp p,L_B4C8		;b4c3
	ld a,0f8h		;b4c6
L_B4C8:
	add a,(iy+005h)		;b4c8
	ld (iy+005h),a		;b4cb
	sub 008h		;b4ce
	cp 0f0h		;b4d0
	jp nc,L_AA64		;b4d2
L_B4D5:
	ld b,000h		;b4d5
	call L_B4F5		;b4d7
	inc b			;b4da
	dec b			;b4db
	ret nz			;b4dc
	ld a,(0e628h)		;b4dd
	or a			;b4e0
	ret z			;b4e1
	ld a,(iy+003h)		;b4e2
	jp m,L_B4EF		;b4e5
	add a,008h		;b4e8
	cp 0a0h		;b4ea
	ret nc			;b4ec
	jr L_B4F2		;b4ed
L_B4EF:
	sub 008h		;b4ef
	ret c			;b4f1
L_B4F2:
	ld l,a			;b4f2
	jr L_B4F8		;b4f3
L_B4F5:
	ld l,(iy+003h)		;b4f5
L_B4F8:
	dec l			;b4f8
	ld h,(iy+005h)		;b4f9
	ld a,(iy+00ah)		;b4fc
	or a			;b4ff
	jr z,L_B51E		;b500
	jp m,L_B509		;b502
L_B505:
	ld a,l			;b505
	add a,009h		;b506
	ld l,a			;b508
L_B509:
	call 05a99h		;b509
	ld a,(hl)			;b50c
	cp c			;b50d
	jr nc,L_B514		;b50e
	inc hl			;b510
	ld a,(hl)			;b511
	cp c			;b512
	ret c			;b513
L_B514:
	ld a,(iy+00ah)		;b514
	neg		;b517
	ld (iy+00ah),a		;b519
	inc b			;b51c
	ret			;b51d
L_B51E:
	push hl			;b51e
	call L_B509		;b51f
	pop hl			;b522
	inc b			;b523
	dec b			;b524
	jr z,L_B52C		;b525
	ld (iy+00ah),001h		;b527
	ret			;b52b
L_B52C:
	call L_B505		;b52c
	inc b			;b52f
	dec b			;b530
	ret z			;b531
	ld (iy+00ah),0ffh		;b532
	ret			;b536
L_B537:
	ld b,000h		;b537
	call L_B554		;b539
	inc b			;b53c
	dec b			;b53d
	ret nz			;b53e
	ld a,(0e627h)		;b53f
	or a			;b542
	ret z			;b543
	ld a,(iy+005h)		;b544
	jp p,L_B54E		;b547
	add a,008h		;b54a
	jr L_B550		;b54c
L_B54E:
	sub 008h		;b54e
L_B550:
	ret c			;b550
	ld h,a			;b551
	jr L_B557		;b552
L_B554:
	ld h,(iy+005h)		;b554
L_B557:
	dec h			;b557
	ld l,(iy+003h)		;b558
	ld a,(iy+00bh)		;b55b
	or a			;b55e
	jr z,L_B580		;b55f
	jp m,L_B568		;b561
L_B564:
	ld a,h			;b564
	add a,009h		;b565
	ld h,a			;b567
L_B568:
	call 05a99h		;b568
	ld a,(hl)			;b56b
	cp c			;b56c
	jr nc,L_B576		;b56d
	ld de,00040h		;b56f
	add hl,de			;b572
	ld a,(hl)			;b573
	cp c			;b574
	ret c			;b575
L_B576:
	ld a,(iy+00bh)		;b576
	neg		;b579
	ld (iy+00bh),a		;b57b
	inc b			;b57e
	ret			;b57f
L_B580:
	push hl			;b580
	call L_B568		;b581
	pop hl			;b584
	inc b			;b585
	dec b			;b586
	jr z,L_B58E		;b587
	ld (iy+00bh),001h		;b589
	ret			;b58d
L_B58E:
	call L_B564		;b58e
	inc b			;b591
	dec b			;b592
	ret z			;b593
	ld (iy+00bh),0ffh		;b594
	ret			;b598
L_B599:
	xor a			;b599
	ld (0f0f5h),a		;b59a
	ld bc,00400h		;b59d
	ld hl,0fcc1h		;b5a0
L_B5A3:
	push bc			;b5a3
	push hl			;b5a4
	ld a,(hl)			;b5a5
	bit 7,a		;b5a6
	jr nz,L_B5BA		;b5a8
	call L_B5E3		;b5aa
L_B5AD:
	pop hl			;b5ad
	pop bc			;b5ae
	ld a,(0f0f5h)		;b5af
	rra			;b5b2
	jr c,L_B5C6		;b5b3
	inc hl			;b5b5
	inc c			;b5b6
	djnz L_B5A3		;b5b7
	ret			;b5b9
L_B5BA:
	call L_B5CB		;b5ba
	jr L_B5AD		;b5bd
L_B5BF:
	ld a,c			;b5bf
	and 00ch		;b5c0
	rra			;b5c2
	rra			;b5c3
	jr L_B5C7		;b5c4
L_B5C6:
	ld a,c			;b5c6
L_B5C7:
	ld (0f0f4h),a		;b5c7
	ret			;b5ca
L_B5CB:
	and 080h		;b5cb
	or c			;b5cd
	ld c,a			;b5ce
	ld b,004h		;b5cf
L_B5D1:
	push bc			;b5d1
	call L_B5E3		;b5d2
	pop bc			;b5d5
	ld a,(0f0f5h)		;b5d6
	rra			;b5d9
	jr c,L_B5BF		;b5da
	ld a,c			;b5dc
	add a,004h		;b5dd
	ld c,a			;b5df
	djnz L_B5D1		;b5e0
	ret			;b5e2
L_B5E3:
	ld de,0b621h		;b5e3
	ld hl,04010h		;b5e6
	ld b,004h		;b5e9
	call L_B60C		;b5eb
	jr nc,L_B5F5		;b5ee
	ld hl,0f0f5h		;b5f0
	set 0,(hl)		;b5f3
L_B5F5:
	ld de,0b625h		;b5f5
	ld hl,07ffah		;b5f8
	ld b,006h		;b5fb
	call L_B60C		;b5fd
	ret nc			;b600
	ld hl,0f0f5h		;b601
	set 1,(hl)		;b604
	ld a,0c9h		;b606
	ld (0ffa7h),a		;b608
	ret			;b60b
L_B60C:
	push bc			;b60c
	push de			;b60d
	ld a,c			;b60e
	call 0000ch		;b60f   ; BIOS RDSLT - Reads the value of an address in another slot
	pop de			;b612
	pop bc			;b613
	ex de,hl			;b614
	cp (hl)			;b615
	ex de,hl			;b616
	jr nz,L_B61F		;b617
	inc hl			;b619
	inc de			;b61a
	djnz L_B60C		;b61b
	scf			;b61d
	ret			;b61e
L_B61F:
	and a			;b61f
	ret			;b620

; ----------------------------------------------------------------------
; DATOS firma_nemesis2: "CD" 0x07 0x51: la segunda cabecera de Nemesis 2
;   (RC-751), que p03:B5E3 compara con la de 0x4010 del cartucho vecino
;   (RDSLT, p03:B60C); lo leen p03:B5EB (4 bytes)
;   0xb621..0xb625  (4 bytes)
DATA_firma_nemesis2:
	defb 043h,044h,007h,051h	; b621

; ----------------------------------------------------------------------
; DATOS firma_nemesis2_7ffa: 6 bytes que p03:B5F5 compara con los de 0x7FFA
;   del vecino; si cuadran, 0xF0F5 bit 1 y 0xFFA7 = 0xC9; lo leen p03:B5FD (6
;   bytes)
;   0xb625..0xb62b  (6 bytes)
DATA_firma_nemesis2_7ffa:
	defb 000h,030h,031h,013h,035h,0aah	; b625

; ----------------------------------------------------------------------
; DATOS lista_B62B: lista a la VRAM (p00:4CF5: [destino] y letras; 0xFE otro
;   destino; 0xFF acaba) de p00:5A21, una de las ramas que el trazador no
;   sigue; lo leen p00:5A21 (17 bytes)
;   0xb62b..0xb63c  (17 bytes)
DATA_lista_B62B:
	defb 0c1h,03ah,00dh,000h,000h,000h,00fh,000h,000h,000h,00bh,0feh,0e1h,03ah,002h,00ch	; b62b  .:...........:..
	defb 0ffh	; b63b

; ----------------------------------------------------------------------
; DATOS lista_B63C: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p00:5A29, p00:5A26 (17 bytes)
;   0xb63c..0xb64d  (17 bytes)
DATA_lista_B63C:
	defb 0d1h,03ah,00eh,000h,000h,000h,00fh,000h,000h,000h,00bh,0feh,0f1h,03ah,003h,00ch	; b63c  .:...........:..
	defb 0ffh	; b64c

; ----------------------------------------------------------------------
; DATOS lista_B64D: lista a la VRAM (p00:4CF5: [destino] y letras; 0xFE otro
;   destino; 0xFF acaba) de p00:534C, una de las ramas que el trazador no
;   sigue; lo leen p00:534C (10 bytes)
;   0xb64d..0xb657  (10 bytes)
DATA_lista_B64D:
	defb 02dh,03ah,011h,030h,02ch,021h,039h,025h,032h,0ffh	; b64d  -:.0,!9%2.

; ----------------------------------------------------------------------
; DATOS lista_B657: lista a la VRAM (p00:4CF5: [destino] y letras; 0xFE otro
;   destino; 0xFF acaba) de p00:5351, una de las ramas que el trazador no
;   sigue; lo leen p00:5351 (11 bytes)
;   0xb657..0xb662  (11 bytes)
DATA_lista_B657:
	defb 06dh,03ah,025h,038h,023h,028h,021h,02eh,027h,025h,0ffh	; b657  m:%8#(!.'%.

; ----------------------------------------------------------------------
; DATOS lista_B662: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p00:535C, p00:535F, p00:5357 (11 bytes)
;   0xb662..0xb66d  (11 bytes)
DATA_lista_B662:
	defb 0adh,03ah,024h,035h,021h,02ch,030h,02ch,021h,039h,0ffh	; b662  .:$5!,0,!9.

; ----------------------------------------------------------------------
; DATOS lista_s_B66D: lista a la VRAM sin destino delante (p00:4CFD; 0xFE otro
;   destino; 0xFF acaba); lo leen p02:90EB (3 bytes)
;   0xb66d..0xb670  (3 bytes)
DATA_lista_s_B66D:
	defb 01bh,01ch,0ffh	; b66d

; ----------------------------------------------------------------------
; DATOS lista_B670: lista a la VRAM (p00:4CF5: [destino] y letras; 0xFE otro
;   destino; 0xFF acaba) de p00:5822, una de las ramas que el trazador no
;   sigue; lo leen p00:5822 (11 bytes)
;   0xb670..0xb67b  (11 bytes)
DATA_lista_B670:
	defb 0cch,038h,030h,02ch,021h,039h,025h,032h,000h,011h,0ffh	; b670  .80,!9%2...

; ----------------------------------------------------------------------
; DATOS lista_B67B: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p00:582A, p00:5827 (11 bytes)
;   0xb67b..0xb686  (11 bytes)
DATA_lista_B67B:
	defb 0cch,038h,030h,02ch,021h,039h,025h,032h,000h,012h,0ffh	; b67b  .80,!9%2...

; ----------------------------------------------------------------------
; DATOS lista_B686: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); se solapan 2 bloques: (lista_B693 B693-B6A2); lo
;   leen p00:552A, p00:55F6 (28 bytes)
;   0xb686..0xb6a2  (28 bytes)
DATA_lista_B686:
	defb 00bh,039h,027h,021h,02dh,025h,000h,000h,02fh,036h,025h,032h,0feh,04ah,039h,023h	; b686  .9'!-%../6%2.J9#
	defb 02fh,02eh,034h,029h,02eh,035h,025h,000h,000h,026h,015h,0ffh	; b696  /.4).5%..&..

; ----------------------------------------------------------------------
; DATOS lista_B6A2: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p00:5A81 (11 bytes)
;   0xb6a2..0xb6ad  (11 bytes)
DATA_lista_B6A2:
	defb 0cch,039h,028h,029h,000h,033h,023h,02fh,032h,025h,0ffh	; b6a2  .9().3#/2%.

; ----------------------------------------------------------------------
; DATOS lista_B6AD: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p00:5711, p00:5733, p00:5743 (19 bytes)
;   0xb6ad..0xb6c0  (19 bytes)
DATA_lista_B6AD:
	defb 028h,03ah,01ch,02fh,02bh,01ch,025h,01bh,000h,027h,023h,018h,030h,036h,000h,030h	; b6ad  (:./+.%..'#.06.0
	defb 03ah,025h,0ffh	; b6bd

; ----------------------------------------------------------------------
; DATOS lista_B6C0: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p00:5694 (17 bytes)
;   0xb6c0..0xb6d1  (17 bytes)
DATA_lista_B6C0:
	defb 029h,03ah,027h,02ch,02ah,01fh,000h,02ah,027h,018h,01ah,01ch,000h,022h,01ch,030h	; b6c0  ):',*..*'....".0
	defb 0ffh	; b6d0

; ----------------------------------------------------------------------
; DATOS lista_B6D1: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p00:5749 (11 bytes)
;   0xb6d1..0xb6dc  (11 bytes)
DATA_lista_B6D1:
	defb 02ch,03ah,02ah,026h,000h,023h,026h,025h,01eh,035h,0ffh	; b6d1  ,:*&.#&%.5.

; ----------------------------------------------------------------------
; DATOS lista_B6DC: lista a la VRAM (p00:4CF5: [destino] y bytes; 0xFE otro
;   destino; 0xFF acaba); lo leen p00:5739 (13 bytes)
;   0xb6dc..0xb6e9  (13 bytes)
DATA_lista_B6DC:
	defb 02ah,03ah,01eh,026h,000h,01dh,026h,029h,000h,020h,02bh,035h,0ffh	; b6dc  *:.&..&). +5.

; ======================================================================
; CODIGO 0xb6e9..0xb9f6  (781 bytes)
; ======================================================================


L_B6E9:
	ld c,000h		;b6e9
	call 07ae3h		;b6eb
	call 07ad2h		;b6ee
	ret nz			;b6f1
	ld a,(ix+001h)		;b6f2
	dec a			;b6f5
	jr z,L_B70E		;b6f6
	dec (ix+002h)		;b6f8
	ret nz			;b6fb
	ld a,(ix+000h)		;b6fc
	cp 012h		;b6ff
	jr z,L_B706		;b701
	inc (ix+007h)		;b703
L_B706:
	inc (ix+001h)		;b706
	ld (ix+002h),008h		;b709
	ret			;b70d
L_B70E:
	bit 1,(ix+00bh)		;b70e
	jr z,L_B71C		;b712
	ld a,(ix+004h)		;b714
	cp 098h		;b717
	ret nc			;b719
	jr L_B722		;b71a
L_B71C:
	ld a,(ix+006h)		;b71c
	cp 018h		;b71f
	ret c			;b721
L_B722:
	call L_B747		;b722
	ld a,(ix+00ch)		;b725
	and a			;b728
	ret nz			;b729
	ld (ix+00ch),005h		;b72a
	ld a,(0e64fh)		;b72e
	srl a		;b731
	neg		;b733
	add a,028h		;b735
	ld (ix+002h),a		;b737
	dec (ix+001h)		;b73a
	ld a,(ix+000h)		;b73d
	cp 012h		;b740
	ret z			;b742
	dec (ix+007h)		;b743
	ret			;b746
L_B747:
	ld a,(ix+00bh)		;b747
	ld (0e65ah),a		;b74a
	ld a,(ix+00ch)		;b74d
	and a			;b750
	ret z			;b751
	dec (ix+002h)		;b752
	ret nz			;b755
	ld (ix+002h),001h		;b756
	dec (ix+00ch)		;b75a
	ld b,010h		;b75d
	bit 0,(ix+00bh)		;b75f
	jr nz,L_B767		;b763
	ld b,0f8h		;b765
L_B767:
	ld c,008h		;b767
	bit 1,(ix+00bh)		;b769
	call z,L_B792		;b76d
	ld a,(ix+006h)		;b770
	add a,b			;b773
	ld d,a			;b774
	ld a,(ix+004h)		;b775
	add a,c			;b778
	ld e,a			;b779
	ld a,(0e67fh)		;b77a
	inc a			;b77d
	ld (0e67fh),a		;b77e
	and 003h		;b781
	ld c,000h		;b783
	jr nz,L_B788		;b785
	inc c			;b787
L_B788:
	ld a,(ix+00ch)		;b788
	inc a			;b78b
	ld b,a			;b78c
	ld a,007h		;b78d
	jp 065b5h		;b78f
L_B792:
	ld d,c			;b792
	ld c,b			;b793
	ld b,d			;b794
	ret			;b795
L_B796:
	ld (ix+008h),006h		;b796
	ld bc,00402h		;b79a
	ld a,(ix+00bh)		;b79d
	bit 1,a		;b7a0
	call z,L_B792		;b7a2
	ld (ix+009h),c		;b7a5
	ld (ix+00ah),b		;b7a8
	ld b,a			;b7ab
	ld a,(ix+000h)		;b7ac
	cp 012h		;b7af
	ld c,055h		;b7b1
	ld a,b			;b7b3
	jr z,L_B7B9		;b7b4
	add a,a			;b7b6
	ld c,03eh		;b7b7
L_B7B9:
	add a,c			;b7b9
	ld (ix+007h),a		;b7ba
	ld (ix+002h),034h		;b7bd
	ld (ix+00ch),005h		;b7c1
	ret			;b7c5
L_B7C6:
	ld a,(ix+00bh)		;b7c6
	add a,055h		;b7c9
	ld c,a			;b7cb
	ld de,00402h		;b7cc
	ld hl,00810h		;b7cf
	jr L_B804		;b7d2
L_B7D4:
	ld de,00204h		;b7d4
	ld hl,00810h		;b7d7
	bit 0,(ix+00bh)		;b7da
	ld c,042h		;b7de
	jr z,L_B804		;b7e0
	ld c,044h		;b7e2
	jr L_B804		;b7e4
L_B7E6:
	ld c,055h		;b7e6
	ld de,00402h		;b7e8
	ld hl,01010h		;b7eb
	jr L_B804		;b7ee
L_B7F0:
	ld hl,01010h		;b7f0
	ld de,00303h		;b7f3
	ld a,(0e301h)		;b7f6
	cp 003h		;b7f9
	ld c,01ah		;b7fb
	jr nz,L_B804		;b7fd
	ld c,046h		;b7ff
	ld de,00506h		;b801
L_B804:
	ld (ix+007h),c		;b804
	ld (ix+008h),h		;b807
	ld (ix+009h),d		;b80a
	ld (ix+00ah),e		;b80d
	ld (ix+002h),l		;b810
	ret			;b813
L_B814:
	ld c,000h		;b814
	call 07ae3h		;b816
	call 07acdh		;b819
	ret nz			;b81c
	ld a,(ix+001h)		;b81d
	dec a			;b820
	jr z,L_B842		;b821
	dec a			;b823
	jr z,L_B86F		;b824
	dec (ix+002h)		;b826
	jr z,L_B835		;b829
	ld a,(ix+002h)		;b82b
	cp 009h		;b82e
	ret nz			;b830
	inc (ix+007h)		;b831
	ret			;b834
L_B835:
	ld (ix+001h),001h		;b835
	ld (ix+002h),00ah		;b839
	ld (ix+00eh),004h		;b83d
	ret			;b841
L_B842:
	dec (ix+002h)		;b842
	ret nz			;b845
	ld (ix+002h),00ah		;b846
	ld a,(ix+006h)		;b84a
	ld bc,000f4h		;b84d
	bit 0,(ix+00bh)		;b850
	jr z,L_B859		;b854
	ld bc,00114h		;b856
L_B859:
	add a,c			;b859
	ld d,a			;b85a
	ld e,(ix+004h)		;b85b
	ld a,010h		;b85e
	ld c,000h		;b860
	call 065b5h		;b862
	dec (ix+00eh)		;b865
	ret nz			;b868
	ld (ix+002h),008h		;b869
	jr L_B8C8		;b86d
L_B86F:
	dec (ix+002h)		;b86f
	ret nz			;b872
	dec (ix+007h)		;b873
	ld (ix+002h),028h		;b876
	ld (ix+001h),000h		;b87a
	ret			;b87e
L_B87F:
	ld c,000h		;b87f
	call 07ae3h		;b881
	call 07ad2h		;b884
	ret nz			;b887
	ld a,(ix+001h)		;b888
	dec a			;b88b
	jr z,L_B89E		;b88c
	dec a			;b88e
	ret z			;b88f
	dec (ix+002h)		;b890
	ret nz			;b893
	ld (ix+002h),006h		;b894
	ld (ix+00eh),005h		;b898
	jr L_B8C8		;b89c
L_B89E:
	dec (ix+002h)		;b89e
	ret nz			;b8a1
	ld (ix+002h),006h		;b8a2
	ld a,(ix+004h)		;b8a6
	ld bc,000f4h		;b8a9
	bit 0,(ix+00bh)		;b8ac
	jr z,L_B8B5		;b8b0
	ld bc,00114h		;b8b2
L_B8B5:
	add a,c			;b8b5
	ld e,a			;b8b6
	ld a,(ix+006h)		;b8b7
	add a,008h		;b8ba
	ld d,a			;b8bc
	ld a,002h		;b8bd
	ld c,000h		;b8bf
	call 065b5h		;b8c1
	dec (ix+00eh)		;b8c4
	ret nz			;b8c7
L_B8C8:
	inc (ix+001h)		;b8c8
	ret			;b8cb
L_B8CC:
	ld a,(ix+001h)		;b8cc
	inc a			;b8cf
	ret z			;b8d0
L_B8D1:
	call 07acdh		;b8d1
	ret nz			;b8d4
	ld c,000h		;b8d5
	call 07ae3h		;b8d7
	call 07ad2h		;b8da
	ret nz			;b8dd
	ld a,(ix+001h)		;b8de
	dec a			;b8e1
	jr z,L_B91A		;b8e2
	dec a			;b8e4
	ret z			;b8e5
	dec (ix+002h)		;b8e6
	jr z,L_B910		;b8e9
	ld a,(0e301h)		;b8eb
	cp 003h		;b8ee
	jr nz,L_B905		;b8f0
	ld a,(ix+007h)		;b8f2
	cp 048h		;b8f5
	ret z			;b8f7
L_B8F8:
	ld a,(ix+002h)		;b8f8
	cp 009h		;b8fb
	jr z,L_B901		;b8fd
	dec a			;b8ff
	ret nz			;b900
L_B901:
	inc (ix+007h)		;b901
	ret			;b904
L_B905:
	cp 006h		;b905
	ret nz			;b907
	ld a,(ix+007h)		;b908
	cp 067h		;b90b
	ret z			;b90d
	jr L_B8F8		;b90e
L_B910:
	ld (ix+002h),00ah		;b910
	ld (ix+00eh),005h		;b914
	jr L_B8C8		;b918
L_B91A:
	dec (ix+002h)		;b91a
	ret nz			;b91d
	ld (ix+002h),00ah		;b91e
	ld a,(ix+004h)		;b922
	add a,002h		;b925
	ld e,a			;b927
	ld a,(ix+006h)		;b928
	add a,008h		;b92b
	ld d,a			;b92d
	ld a,(0e301h)		;b92e
	cp 003h		;b931
	ld c,000h		;b933
	call z,0705dh		;b935
	ld a,01eh		;b938
	call 065b5h		;b93a
	dec (ix+00eh)		;b93d
	ret nz			;b940
	ld a,(0e64fh)		;b941
	cp 008h		;b944
	jr nc,L_B94C		;b946
	inc (ix+001h)		;b948
	ret			;b94b
L_B94C:
	dec (ix+001h)		;b94c
	ld (ix+002h),018h		;b94f
	ret			;b953
L_B954:
	call 06bcdh		;b954
	ld (ix+002h),00bh		;b957
	ld (ix+028h),01ah		;b95b
	call 067cah		;b95f
	ld (ix+015h),a		;b962
	ld a,(ix+004h)		;b965
	cp 054h		;b968
	rla			;b96a
	rla			;b96b
	and 002h		;b96c
	add a,(ix+019h)		;b96e
	ld (ix+027h),a		;b971
	rra			;b974
	ld a,008h		;b975
	jr nc,L_B97A		;b977
	xor a			;b979
L_B97A:
	ld (ix+025h),a		;b97a
	ld b,004h		;b97d
L_B97F:
	call 04f1eh		;b97f
	jp 06881h		;b982
L_B985:
	call L_B9F0		;b985
	call 081ceh		;b988
	bit 0,(ix+001h)		;b98b
	ret nz			;b98f
	dec (ix+002h)		;b990
	ret nz			;b993
	dec (ix+028h)		;b994
	jr nz,L_B99E		;b997
	inc (ix+001h)		;b999
	jr L_B9C3		;b99c
L_B99E:
	ld a,(ix+028h)		;b99e
	srl a		;b9a1
	srl a		;b9a3
	srl a		;b9a5
	add a,004h		;b9a7
	ld (ix+002h),a		;b9a9
	ld a,(ix+027h)		;b9ac
	dec a			;b9af
	cp 002h		;b9b0
	ld a,(ix+025h)		;b9b2
	dec a			;b9b5
	jr nc,L_B9BA		;b9b6
	inc a			;b9b8
	inc a			;b9b9
L_B9BA:
	and 00fh		;b9ba
	ld (ix+025h),a		;b9bc
	ld b,003h		;b9bf
	jr L_B97F		;b9c1
L_B9C3:
	ld a,080h		;b9c3
	ld (0f00fh),a		;b9c5
	ld e,(ix+004h)		;b9c8
	ld d,(ix+006h)		;b9cb
	bit 1,(ix+027h)		;b9ce
	ld a,0a0h		;b9d2
	jr z,L_B9D7		;b9d4
	xor a			;b9d6
L_B9D7:
	ld (0f000h),a		;b9d7
	ld a,(0e326h)		;b9da
	ld (0f001h),a		;b9dd
	call 075b4h		;b9e0
	call 07534h		;b9e3
	ld hl,(0f012h)		;b9e6
	ld de,(0f014h)		;b9e9
	jp 06881h		;b9ed
L_B9F0:
	ld hl,0b9f6h		;b9f0
	jp 06bd5h		;b9f3

; ----------------------------------------------------------------------
; DATOS cuadros_B9F6: 6 caracteres de una animacion que p03:B9F0 pasa a
;   p01:6BD5; lo leen p03:B9F3 (6 bytes)
;   0xb9f6..0xb9fc  (6 bytes)
DATA_cuadros_B9F6:
	defb 0b0h,0b4h,0b8h,0bch,0b8h,0b4h	; b9f6

; ======================================================================
; CODIGO 0xb9fc..0xbaf9  (253 bytes)
; ======================================================================


L_B9FC:
	ld a,(0e610h)		;b9fc
	or a			;b9ff
	ld a,053h		;ba00
	jr z,L_BA06		;ba02
	ld a,010h		;ba04
L_BA06:
	ld (ix+002h),a		;ba06
	ld (ix+00ch),003h		;ba09
	ld (ix+009h),004h		;ba0d
	ld (ix+00ah),002h		;ba11
	ld (ix+008h),010h		;ba15
	bit 0,(ix+00bh)		;ba19
	ld a,005h		;ba1d
	jr nz,L_BA22		;ba1f
	dec a			;ba21
L_BA22:
	ld (ix+007h),a		;ba22
	ret			;ba25
L_BA26:
	ld c,000h		;ba26
	call 07ae3h		;ba28
	call 07ad2h		;ba2b
	ret nz			;ba2e
	call 07acdh		;ba2f
	ret nz			;ba32
	dec (ix+002h)		;ba33
	ret nz			;ba36
	ld (ix+002h),006h		;ba37
	dec (ix+00ch)		;ba3b
	jr nz,L_BA48		;ba3e
	ld (ix+00ch),003h		;ba40
	ld (ix+002h),040h		;ba44
L_BA48:
	ld d,(ix+006h)		;ba48
	ld b,(ix+00bh)		;ba4b
	ld a,b			;ba4e
	xor 001h		;ba4f
	ld b,a			;ba51
	and a			;ba52
	ld e,0f8h		;ba53
	jr nz,L_BA59		;ba55
	ld e,010h		;ba57
L_BA59:
	ld a,(ix+004h)		;ba59
	add a,e			;ba5c
	ld e,a			;ba5d
	call L_A3D9		;ba5e
	ld a,006h		;ba61
	jp 04d6eh		;ba63
L_BA66:
	ld c,03eh		;ba66
	ld de,00402h		;ba68
	ld hl,00818h		;ba6b
	jp L_B804		;ba6e
L_BA71:
	ld c,000h		;ba71
	call 07ae3h		;ba73
	call 07ad2h		;ba76
	ret nz			;ba79
	dec (ix+002h)		;ba7a
	ret nz			;ba7d
	ld a,(ix+001h)		;ba7e
	dec a			;ba81
	jr z,L_BA92		;ba82
	dec a			;ba84
	jr z,L_BAA5		;ba85
	inc (ix+007h)		;ba87
L_BA8A:
	ld (ix+002h),008h		;ba8a
	inc (ix+001h)		;ba8e
	ret			;ba91
L_BA92:
	call L_BA8A		;ba92
	ld a,(ix+004h)		;ba95
	sub 010h		;ba98
	ld e,a			;ba9a
	ld d,(ix+006h)		;ba9b
	ld c,000h		;ba9e
	ld a,015h		;baa0
	jp 065b5h		;baa2
L_BAA5:
	ld a,(0e64fh)		;baa5
	cp 00ah		;baa8
	ld a,030h		;baaa
	jr c,L_BAB0		;baac
	ld a,010h		;baae
L_BAB0:
	ld (ix+002h),a		;bab0
	ld (ix+001h),000h		;bab3
	dec (ix+007h)		;bab7
	ret			;baba
L_BABB:
	ld a,(ix+004h)		;babb
	ld (ix+026h),a		;babe
	ld (ix+002h),003h		;bac1
	ld (ix+013h),004h		;bac5
	ld (ix+014h),003h		;bac9
	call 0687ch		;bacd
	ld d,0f8h		;bad0
	jp 06856h		;bad2
L_BAD5:
	ld a,(ix+006h)		;bad5
	or a			;bad8
	jp z,06b62h		;bad9
	res 2,(ix+010h)		;badc
	dec (ix+002h)		;bae0
	ret nz			;bae3
	set 2,(ix+010h)		;bae4
	ld a,(ix+001h)		;bae8
	cp 005h		;baeb
	ld (ix+002h),002h		;baed
	ret z			;baf1
	ld (ix+002h),003h		;baf2
	call 040ceh		;baf6

; ----------------------------------------------------------------------
; DATOS tabla_BAF9: 5 destinos del despachador p00:40CE (call en p03:BAF6, el
;   indice en A): BB03, BB1A, BB34, BB1A, BB7B; lo leen p03:BAF6 (10 bytes)
;   0xbaf9..0xbb03  (10 bytes)
DATA_tabla_BAF9:
	defw 0bb03h,0bb1ah,0bb34h,0bb1ah,0bb7bh	; baf9

; ======================================================================
; CODIGO 0xbb03..0xbc06  (259 bytes)
; ======================================================================


L_BB03:
	ld a,(ix+004h)		;bb03
	cp 041h		;bb06
	ret nc			;bb08
	ld (ix+025h),003h		;bb09
L_BB0D:
	inc (ix+001h)		;bb0d
	xor a			;bb10
	ld (ix+008h),a		;bb11
	ld a,0f8h		;bb14
	ld (ix+00ah),a		;bb16
	ret			;bb19
L_BB1A:
	dec (ix+025h)		;bb1a
	ret nz			;bb1d
	xor a			;bb1e
	ld (ix+00ah),a		;bb1f
	bit 1,(ix+001h)		;bb22
	ld a,008h		;bb26
	jr z,L_BB2C		;bb28
	ld a,0f8h		;bb2a
L_BB2C:
	ld (ix+008h),a		;bb2c
	ld (ix+001h),002h		;bb2f
	ret			;bb33
L_BB34:
	ld a,(0e324h)		;bb34
	ld b,(ix+004h)		;bb37
	sub b			;bb3a
	add a,008h		;bb3b
	cp 011h		;bb3d
	jr nc,L_BB6C		;bb3f
L_BB41:
	ld (ix+001h),004h		;bb41
	ld (ix+002h),008h		;bb45
	xor a			;bb49
	ld (ix+008h),a		;bb4a
	ld a,0f8h		;bb4d
	ld (ix+00ah),a		;bb4f
	res 2,(ix+010h)		;bb52
	ld a,(ix+004h)		;bb56
	add a,008h		;bb59
	ld e,a			;bb5b
	ld a,(ix+006h)		;bb5c
	cp 011h		;bb5f
	ret c			;bb61
	sub 010h		;bb62
	ld d,a			;bb64
	ld a,014h		;bb65
	ld c,000h		;bb67
	jp 065b5h		;bb69
L_BB6C:
	ld a,b			;bb6c
	cp 021h		;bb6d
	jr c,L_BB41		;bb6f
	cp (ix+026h)		;bb71
	ret c			;bb74
	ld (ix+025h),002h		;bb75
	jr L_BB0D		;bb79
L_BB7B:
	set 2,(ix+010h)		;bb7b
	inc (ix+001h)		;bb7f
	ret			;bb82
L_BB83:
	ld (ix+013h),001h		;bb83
	ld (ix+014h),002h		;bb87
	ld (ix+002h),008h		;bb8b
	ld (ix+010h),001h		;bb8f
	call 06877h		;bb93
	ld d,0f0h		;bb96
	jp 0685dh		;bb98
L_BB9B:
	ld a,(ix+001h)		;bb9b
	dec a			;bb9e
	jr z,L_BBB1		;bb9f
	dec (ix+002h)		;bba1
	ret nz			;bba4
	set 2,(ix+010h)		;bba5
	inc (ix+001h)		;bba9
	ld a,013h		;bbac
	jp 04d6eh		;bbae
L_BBB1:
	ld a,(ix+006h)		;bbb1
	cp 010h		;bbb4
	ret nc			;bbb6
	jp 06b62h		;bbb7
L_BBBA:
	call 04eaah		;bbba
	ld (ix+013h),002h		;bbbd
	ld (ix+014h),002h		;bbc1
	call 04f9bh		;bbc5
	res 2,(ix+010h)		;bbc8
	ld (ix+002h),004h		;bbcc
	call 06872h		;bbd0
	ld de,00800h		;bbd3
	bit 0,(ix+019h)		;bbd6
	call z,05adfh		;bbda
	ld a,(0e620h)		;bbdd
	or a			;bbe0
	push af			;bbe1
	call z,06856h		;bbe2
	pop af			;bbe5
	call nz,0685dh		;bbe6
	or 0ffh		;bbe9
	ret			;bbeb
L_BBEC:
	res 2,(ix+010h)		;bbec
	dec (ix+002h)		;bbf0
	ret nz			;bbf3
	ld (ix+002h),004h		;bbf4
	set 2,(ix+010h)		;bbf8
	ld hl,0bc0eh		;bbfc
	push hl			;bbff
	ld a,(ix+019h)		;bc00
	call 040ceh		;bc03

; ----------------------------------------------------------------------
; DATOS tabla_BC06: 4 destinos del despachador p00:40CE (call en p03:BC03, el
;   indice en A): 7EFF, 7EF4, BC1A, BC24; lo leen p03:BC03 (8 bytes)
;   0xbc06..0xbc0e  (8 bytes)
DATA_tabla_BC06:
	defw 07effh,07ef4h,0bc1ah,0bc24h	; bc06  -> 0x7eff 0x7ef4 L_BC1A L_BC24

; ======================================================================
; CODIGO 0xbc0e..0xbc89  (123 bytes)
; ======================================================================


L_BC0E:
	jp c,06b62h		;bc0e
	ld a,(ix+006h)		;bc11
	cp 0f8h		;bc14
	ret c			;bc16
	jp 06b62h		;bc17
L_BC1A:
	ld h,(ix+006h)		;bc1a
	dec h			;bc1d
L_BC1E:
	ld l,(ix+004h)		;bc1e
	jp 07ebfh		;bc21
L_BC24:
	ld a,(ix+006h)		;bc24
	add a,010h		;bc27
	ld h,a			;bc29
	jr L_BC1E		;bc2a
L_BC2C:
	ld a,(ix+00fh)		;bc2c
	and a			;bc2f
	jr nz,L_BC3A		;bc30
	dec (ix+002h)		;bc32
	ret nz			;bc35
	ld (ix+002h),018h		;bc36
L_BC3A:
	ld (ix+00fh),001h		;bc3a
	ld a,(0e620h)		;bc3e
	add a,a			;bc41
	add a,(ix+00bh)		;bc42
	ld b,a			;bc45
	ld hl,0bc89h		;bc46
	call 04e28h		;bc49
	push de			;bc4c
	ld l,(ix+006h)		;bc4d
	ld h,(ix+005h)		;bc50
	ld e,d			;bc53
	call L_BC79		;bc54
	pop de			;bc57
	ret nz			;bc58
	ld d,l			;bc59
	push de			;bc5a
	ld l,(ix+004h)		;bc5b
	ld h,(ix+003h)		;bc5e
	call L_BC79		;bc61
	pop de			;bc64
	ret nz			;bc65
	ld e,l			;bc66
	ld c,000h		;bc67
	ld a,035h		;bc69
	call 065b5h		;bc6b
	ret z			;bc6e
	ld (ix+00fh),000h		;bc6f
	dec (ix+00ch)		;bc73
	jr z,L_BC84		;bc76
	ret			;bc78
L_BC79:
	ld d,000h		;bc79
	bit 7,e		;bc7b
	jr z,L_BC80		;bc7d
	dec d			;bc7f
L_BC80:
	add hl,de			;bc80
	ld a,h			;bc81
	and a			;bc82
	ret			;bc83
L_BC84:
	ld (ix+000h),000h		;bc84
	ret			;bc88

; ----------------------------------------------------------------------
; DATOS palabras_BC89: 4 palabras que p03:BC46 elige con B (p00:4E28); lo leen
;   p03:BC49 (8 bytes)
;   0xbc89..0xbc91  (8 bytes)
DATA_palabras_BC89:
	defw 008f8h,00810h,0f808h,01008h	; bc89

; ======================================================================
; CODIGO 0xbc91..0xbdb9  (296 bytes)
; ======================================================================


L_BC91:
	xor a			;bc91
	ld (ix+00fh),a		;bc92
	dec a			;bc95
	ld (ix+00dh),a		;bc96
	ld a,(ix+00bh)		;bc99
	rra			;bc9c
	and 003h		;bc9d
	ld (ix+00ch),a		;bc9f
	ld a,(ix+00bh)		;bca2
	and 001h		;bca5
	ld (ix+00bh),a		;bca7
	ld (ix+002h),001h		;bcaa
	ret			;bcae
L_BCAF:
	ld c,038h		;bcaf
	ld de,00404h		;bcb1
	ld hl,00810h		;bcb4
	call L_B804		;bcb7
L_BCBA:
	call 067d0h		;bcba
	ld (ix+002h),a		;bcbd
	ret			;bcc0
L_BCC1:
	call 07acdh		;bcc1
	ret nz			;bcc4
	ld c,000h		;bcc5
	call 07ae3h		;bcc7
	dec (ix+002h)		;bcca
	ret nz			;bccd
	ld a,(ix+001h)		;bcce
	dec a			;bcd1
	jr z,L_BCE0		;bcd2
	ld (ix+002h),005h		;bcd4
	ld (ix+00ch),003h		;bcd8
	inc (ix+001h)		;bcdc
	ret			;bcdf
L_BCE0:
	ld (ix+002h),005h		;bce0
	ld a,(ix+004h)		;bce4
	add a,010h		;bce7
	ld e,a			;bce9
	ld a,(ix+006h)		;bcea
	add a,010h		;bced
	ld d,a			;bcef
	push de			;bcf0
	call L_BD19		;bcf1
	pop de			;bcf4
	call 074eah		;bcf5
	push ix		;bcf8
	push hl			;bcfa
	pop ix		;bcfb
	ld bc,0fff4h		;bcfd
	add ix,bc		;bd00
	ld (ix+000h),083h		;bd02
	ld (ix+002h),00ah		;bd06
	ld (ix+00ch),00fh		;bd0a
	pop ix		;bd0e
	dec (ix+00ch)		;bd10
L_BD13:
	ret nz			;bd13
	dec (ix+001h)		;bd14
	jr L_BCBA		;bd17
L_BD19:
	ld a,060h		;bd19
	ld (0f00fh),a		;bd1b
	ld a,(0e324h)		;bd1e
	ld (0f000h),a		;bd21
	ld a,(0e326h)		;bd24
	ld (0f001h),a		;bd27
	call 075b4h		;bd2a
	jp 07534h		;bd2d
L_BD30:
	res 1,(ix+010h)		;bd30
	ret			;bd34
L_BD35:
	dec (ix+002h)		;bd35
	ret nz			;bd38
	res 7,(ix+000h)		;bd39
	ret			;bd3d
L_BD3E:
	ld a,001h		;bd3e
	ld (0e671h),a		;bd40
	ld hl,00384h		;bd43
	ld a,(0e305h)		;bd46
	or a			;bd49
	jr z,L_BD4F		;bd4a
	ld hl,004b0h		;bd4c
L_BD4F:
	ld (0e649h),hl		;bd4f
	ret			;bd52
L_BD53:
	ld a,(0e671h)		;bd53
	or a			;bd56
	ret z			;bd57
	dec a			;bd58
	jr nz,L_BD6B		;bd59
	ld hl,(0e649h)		;bd5b
	dec hl			;bd5e
	ld (0e649h),hl		;bd5f
	ld a,l			;bd62
	or h			;bd63
	jr nz,L_BD85		;bd64
	ld a,002h		;bd66
	ld (0e671h),a		;bd68
L_BD6B:
	ld ix,0e700h		;bd6b
	ld de,00040h		;bd6f
	ld b,00ch		;bd72
L_BD74:
	ld a,(ix+000h)		;bd74
	or a			;bd77
	ret nz			;bd78
	add ix,de		;bd79
	djnz L_BD74		;bd7b
	xor a			;bd7d
	ld (0e671h),a		;bd7e
	ld (0e648h),a		;bd81
	ret			;bd84
L_BD85:
	ld bc,00300h		;bd85
L_BD88:
	push bc			;bd88
	ld ix,0e700h		;bd89
	ld de,00040h		;bd8d
	ld b,00ch		;bd90
L_BD92:
	ld a,(ix+000h)		;bd92
	cp 021h		;bd95
	jr nz,L_BD9F		;bd97
	ld a,(ix+019h)		;bd99
	cp c			;bd9c
	jr z,L_BDB4		;bd9d
L_BD9F:
	add ix,de		;bd9f
	djnz L_BD92		;bda1
	push de			;bda3
	ld hl,0bdb9h		;bda4
	ld a,c			;bda7
	call 04e28h		;bda8
	ld b,c			;bdab
	ld c,000h		;bdac
	ld a,021h		;bdae
	call 065bdh		;bdb0
	pop de			;bdb3
L_BDB4:
	pop bc			;bdb4
	inc c			;bdb5
	djnz L_BD88		;bdb6
	ret			;bdb8

; ----------------------------------------------------------------------
; DATOS palabras_BDB9: 3 palabras que p03:BDA4 elige con C (p00:4E28); lo leen
;   p03:BDA8 (6 bytes)
;   0xbdb9..0xbdbf  (6 bytes)
DATA_palabras_BDB9:
	defw 01018h,01080h,0d028h	; bdb9

; ======================================================================
; CODIGO 0xbdbf..0xbeae  (239 bytes)
; ======================================================================


L_BDBF:
	ld a,(ix+019h)		;bdbf
	ld hl,00302h		;bdc2
	bit 1,a		;bdc5
	jr nz,L_BDCC		;bdc7
	ld hl,00203h		;bdc9
L_BDCC:
	ld (ix+014h),l		;bdcc
	ld (ix+013h),h		;bdcf
	add a,01eh		;bdd2
	ld (ix+032h),a		;bdd4
	call 04fa0h		;bdd7
	call 04e58h		;bdda
	and 003h		;bddd
	rra			;bddf
	rra			;bde0
	ld (ix+026h),a		;bde1
	call L_BE74		;bde4
L_BDE7:
	call 04e58h		;bde7
	and 018h		;bdea
	add a,010h		;bdec
	ld (ix+015h),a		;bdee
	ret			;bdf1
L_BDF2:
	ld a,(ix+001h)		;bdf2
	dec a			;bdf5
	jr z,L_BE2F		;bdf6
	dec a			;bdf8
	jr z,L_BE5A		;bdf9
	ld a,(ix+019h)		;bdfb
	and 002h		;bdfe
	ld l,(ix+005h)		;be00
	ld h,(ix+006h)		;be03
	ld b,010h		;be06
	ld d,0b8h		;be08
	jr z,L_BE16		;be0a
	ld l,(ix+003h)		;be0c
	ld h,(ix+004h)		;be0f
	ld b,020h		;be12
	ld d,060h		;be14
L_BE16:
	ld e,000h		;be16
	ld c,e			;be18
	or a			;be19
	sbc hl,bc		;be1a
	rst 20h			;be1c
	call nc,L_BE6A		;be1d
	dec (ix+015h)		;be20
	ret nz			;be23
	ld (ix+023h),010h		;be24
	res 2,(ix+010h)		;be28
	jp L_BF0E		;be2c
L_BE2F:
	dec (ix+023h)		;be2f
	ret nz			;be32
	ld (ix+023h),010h		;be33
	inc (ix+001h)		;be37
	ld hl,0beb6h		;be3a
	ld b,(ix+019h)		;be3d
	ld a,b			;be40
	call 04e28h		;be41
	ld a,(ix+006h)		;be44
	add a,d			;be47
	ld d,a			;be48
	ld a,(ix+004h)		;be49
	add a,e			;be4c
	ld e,a			;be4d
	ld c,000h		;be4e
	ld a,036h		;be50
	call 065b5h		;be52
	ld a,013h		;be55
	jp 04d6eh		;be57
L_BE5A:
	dec (ix+023h)		;be5a
	ret nz			;be5d
	call L_BDE7		;be5e
	set 2,(ix+010h)		;be61
	ld (ix+001h),000h		;be65
	ret			;be69
L_BE6A:
	bit 1,(ix+019h)		;be6a
	jp nz,06897h		;be6e
	jp 06887h		;be71
L_BE74:
	ld a,(ix+019h)		;be74
	and 002h		;be77
	add a,a			;be79
	ld hl,0beaeh		;be7a
	call 040c4h		;be7d
	ld b,000h		;be80
	call 06c2dh		;be82
	bit 1,(ix+019h)		;be85
	ld a,(ix+026h)		;be89
	jr nz,L_BE9E		;be8c
	ld l,(ix+009h)		;be8e
	ld h,(ix+00ah)		;be91
	call 040c4h		;be94
	ld (ix+009h),l		;be97
	ld (ix+00ah),h		;be9a
	ret			;be9d
L_BE9E:
	ld l,(ix+007h)		;be9e
	ld h,(ix+008h)		;bea1
	call 040c4h		;bea4
	ld (ix+007h),l		;bea7
	ld (ix+008h),h		;beaa
	ret			;bead

; ----------------------------------------------------------------------
; DATOS pares_BEAE: 2 fichas de 4 bytes que p03:BE7A elige con (IX+19 & 2) x
;   2; lo leen p03:BE7D (8 bytes)
;   0xbeae..0xbeb6  (8 bytes)
DATA_pares_BEAE:
	defb 000h,004h,000h,000h	; beae
	defb 000h,000h,000h,004h	; beb2

; ----------------------------------------------------------------------
; DATOS palabras_BEB6: 3 palabras que p03:BE3A elige con IX+19 (p00:4E28); lo
;   leen p03:BE41 (6 bytes)
;   0xbeb6..0xbebc  (6 bytes)
DATA_palabras_BEB6:
	defw 00810h,008f8h,0f808h	; beb6

; ======================================================================
; CODIGO 0xbebc..0xbfff  (323 bytes)
; ======================================================================


L_BEBC:
	call 09157h		;bebc
	call L_BEC5		;bebf
	jp 04fa0h		;bec2
L_BEC5:
	ld a,(ix+001h)		;bec5
	dec a			;bec8
	jr z,L_BF12		;bec9
	dec (ix+002h)		;becb
	ret nz			;bece
	call L_BF49		;becf
	ld a,(ix+013h)		;bed2
	cp 00dh		;bed5
	jr z,L_BF0E		;bed7
	ld a,(ix+014h)		;bed9
	cp 01ah		;bedc
	jr z,L_BF0E		;bede
	ld a,(ix+019h)		;bee0
	dec a			;bee3
	jr nz,L_BEFF		;bee4
	ld a,(ix+004h)		;bee6
	sub 008h		;bee9
	ld (ix+004h),a		;beeb
L_BEEE:
	inc (ix+013h)		;beee
	ld a,(ix+013h)		;bef1
	add a,a			;bef4
	add a,a			;bef5
	add a,a			;bef6
	add a,(ix+004h)		;bef7
	cp 0a8h		;befa
	jr nc,L_BF0E		;befc
	ret			;befe
L_BEFF:
	dec a			;beff
	jr nz,L_BEEE		;bf00
	ld a,(ix+006h)		;bf02
	sub 008h		;bf05
	ld (ix+006h),a		;bf07
	inc (ix+014h)		;bf0a
	ret			;bf0d
L_BF0E:
	inc (ix+001h)		;bf0e
	ret			;bf11
L_BF12:
	dec (ix+002h)		;bf12
	ret nz			;bf15
	call L_BF49		;bf16
	ld a,(ix+019h)		;bf19
	dec a			;bf1c
	jr z,L_BF2A		;bf1d
	dec a			;bf1f
	jr z,L_BF2F		;bf20
	ld a,(ix+004h)		;bf22
	add a,008h		;bf25
	ld (ix+004h),a		;bf27
L_BF2A:
	dec (ix+013h)		;bf2a
	jr L_BF32		;bf2d
L_BF2F:
	dec (ix+014h)		;bf2f
L_BF32:
	ret nz			;bf32
	jp 06b62h		;bf33
L_BF36:
	ld (ix+029h),000h		;bf36
	res 2,(ix+010h)		;bf3a
	ld (ix+014h),001h		;bf3e
	ld (ix+013h),001h		;bf42
	call 04fa0h		;bf46
L_BF49:
	ld (ix+002h),001h		;bf49
	ret			;bf4d
L_BF4E:
	ld a,0ffh		;bf4e
	ld (0e320h),a		;bf50
	ld (0e3a0h),a		;bf53
	inc a			;bf56
	ld (0e64fh),a		;bf57
	ld (0e30fh),a		;bf5a
	ld (0e207h),a		;bf5d
	ld (0e20dh),a		;bf60
	ld (0e239h),a		;bf63
	ld (0e305h),a		;bf66
	ld h,a			;bf69
	inc a			;bf6a
	ld l,a			;bf6b
	ld (0e20bh),hl		;bf6c
	ld (0e237h),hl		;bf6f
	ld (0e213h),a		;bf72
	ld (0e301h),a		;bf75
	inc a			;bf78
	ld (0e227h),a		;bf79
	call 05aefh		;bf7c
	call 05d18h		;bf7f
	jp 05a12h		;bf82
L_BF85:
	xor a			;bf85
	ld (0e30fh),a		;bf86
	ld (0e38fh),a		;bf89
	ld (0e30eh),a		;bf8c
	ld (0e38eh),a		;bf8f
	ld de,09419h		;bf92
	ld hl,0e20bh		;bf95
	dec (hl)			;bf98
	jr nz,L_BFA7		;bf99
	call L_BFE7		;bf9b
	inc c			;bf9e
	jr z,L_BFD9		;bf9f
	ld hl,0e30eh		;bfa1
	call L_BFDE		;bfa4
L_BFA7:
	ld a,(0e20ch)		;bfa7
	or 010h		;bfaa
	ld (0e30fh),a		;bfac
	ld hl,0e30eh		;bfaf
	set 4,(hl)		;bfb2
	ld de,094dah		;bfb4
	ld hl,0e237h		;bfb7
	dec (hl)			;bfba
	jr nz,L_BFC9		;bfbb
	call L_BFE7		;bfbd
	inc c			;bfc0
	jr z,L_BFD9		;bfc1
	ld hl,0e38eh		;bfc3
	call L_BFDE		;bfc6
L_BFC9:
	ld a,(0e238h)		;bfc9
	or 010h		;bfcc
	ld (0e38fh),a		;bfce
	ld hl,0e38eh		;bfd1
	set 4,(hl)		;bfd4
	jp 04200h		;bfd6
L_BFD9:
	xor a			;bfd9
	ld (0e213h),a		;bfda
	ret			;bfdd
L_BFDE:
	ld a,(hl)			;bfde
	and 0dfh		;bfdf
	ld a,(de)			;bfe1
	and 020h		;bfe2
	or (hl)			;bfe4
	ld (hl),a			;bfe5
	ret			;bfe6
L_BFE7:
	push hl			;bfe7
	inc hl			;bfe8
	inc hl			;bfe9
	ld c,(hl)			;bfea
	inc (hl)			;bfeb
	call 041ach		;bfec
	ld l,c			;bfef
	ld h,000h		;bff0
	add hl,hl			;bff2
	add hl,de			;bff3
	ld a,(hl)			;bff4
	ld c,a			;bff5
	pop de			;bff6
	ld (de),a			;bff7
	inc hl			;bff8
	inc de			;bff9
	ld a,(hl)			;bffa
	ld (de),a			;bffb
	jp 0416eh		;bffc

; ----------------------------------------------------------------------
; DATOS relleno_bfff: el ultimo byte del banco, 0xFF: relleno; lo leen nadie
;   (1 bytes)
;   0xbfff..0xc000  (1 bytes)
DATA_relleno_bfff:
	defb 0ffh	; bfff
