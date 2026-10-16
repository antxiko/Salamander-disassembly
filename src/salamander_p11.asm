; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 11 (se ejecuta en 0xa000)
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
la604h:	equ 0x0a604

; ======================================================================
; CODIGO 0xa000..0xa0f4  (244 bytes)
; ======================================================================


L_A000:
	ld a,(0e227h)		;a000
	cp 002h		;a003
	jr nz,L_A011		;a005
	ld iy,0e380h		;a007
	ld de,0ef88h		;a00b
	call L_A018		;a00e
L_A011:
	ld iy,0e300h		;a011
	ld de,0ef80h		;a015
L_A018:
	ld a,(iy+020h)		;a018
	or a			;a01b
	ret z			;a01c
	jp m,L_A05F		;a01d
	sub 004h		;a020
	ret z			;a022
	inc a			;a023
	jp z,L_A04E		;a024
L_A027:
	ld a,(0e630h)		;a027
	cp 005h		;a02a
	jr nz,L_A041		;a02c
	bit 0,(iy+01dh)		;a02e
	jr z,L_A041		;a032
	ld a,(0e203h)		;a034
	bit 1,a		;a037
	jr z,L_A041		;a039
	call L_A0B4		;a03b
	jp L_A0B4		;a03e
L_A041:
	push iy		;a041
	pop hl			;a043
	ld bc,00028h		;a044
L_A047:
	add hl,bc			;a047
	ld bc,00008h		;a048
	ldir		;a04b
	ret			;a04d
L_A04E:
	ld de,0ef80h		;a04e
	push iy		;a051
	pop hl			;a053
	ld bc,00028h		;a054
	call L_A047		;a057
	ld bc,00018h		;a05a
	jr L_A047		;a05d
L_A05F:
	ld de,0efe0h		;a05f
	call L_A027		;a062
	ld bc,00018h		;a065
	jr L_A047		;a068
L_A06A:
	ld de,0ef90h		;a06a
	ld hl,0e400h		;a06d
	call L_A08B		;a070
	ld hl,0e410h		;a073
	call L_A08B		;a076
	ld hl,0e420h		;a079
	call L_A08B		;a07c
	ld a,(0e227h)		;a07f
	cp 002h		;a082
	ret z			;a084
	ld hl,0e430h		;a085
	ld de,0ef8ch		;a088
L_A08B:
	ld a,(hl)			;a08b
	or a			;a08c
	jr z,L_A0B7		;a08d
	ld a,l			;a08f
	add a,004h		;a090
	ld l,a			;a092
	ldi		;a093
	inc l			;a095
L_A096:
	ld bc,00003h		;a096
	ldir		;a099
	ret			;a09b
L_A09C:
	ld de,0ef9ch		;a09c
	ld hl,0e470h		;a09f
	exx			;a0a2
	ld b,005h		;a0a3
L_A0A5:
	exx			;a0a5
	push hl			;a0a6
	call L_A0BC		;a0a7
	pop hl			;a0aa
	ld bc,00048h		;a0ab
	add hl,bc			;a0ae
	exx			;a0af
	djnz L_A0A5		;a0b0
	exx			;a0b2
	ret			;a0b3
L_A0B4:
	ld a,0e0h		;a0b4
	ld (de),a			;a0b6
L_A0B7:
	inc e			;a0b7
	inc e			;a0b8
	inc e			;a0b9
	inc e			;a0ba
	ret			;a0bb
L_A0BC:
	ld a,(hl)			;a0bc
	sub 002h		;a0bd
	cp 003h		;a0bf
	jr c,L_A0C8		;a0c1
	sub 009h		;a0c3
	cp 002h		;a0c5
	ret nc			;a0c7
L_A0C8:
	inc l			;a0c8
	inc l			;a0c9
	inc l			;a0ca
	ldi		;a0cb
	inc l			;a0cd
	jr L_A096		;a0ce
L_A0D0:
	ld de,0ed00h		;a0d0
	ld ix,0e440h		;a0d3
	ld b,00fh		;a0d7
L_A0D9:
	push bc			;a0d9
	call L_A0E6		;a0da
	ld bc,00018h		;a0dd
	add ix,bc		;a0e0
	pop bc			;a0e2
	djnz L_A0D9		;a0e3
	ret			;a0e5
L_A0E6:
	ld a,(ix+000h)		;a0e6
	dec a			;a0e9
	jr z,$+22		;a0ea
	sub 004h		;a0ec
	cp 006h		;a0ee
	ret nc			;a0f0
	call 040ceh		;a0f1

; ----------------------------------------------------------------------
; DATOS tabla_A0F4: 6 destinos del despachador p00:40CE (call en p11:A0F1, el
;   indice en A): A148, A106, A128, A106, A128, A124; lo leen p11:A0F1 (12
;   bytes)
;   0xa0f4..0xa100  (12 bytes)
DATA_tabla_A0F4:
	defw 0a148h,0a106h,0a128h,0a106h,0a128h,0a124h	; a0f4

; ======================================================================
; CODIGO 0xa100..0xa123  (35 bytes)
; ======================================================================


L_A100:
	call L_A167		;a100
	ldi		;a103
	ret			;a105
L_A106:
	ld a,(ix+00ah)		;a106
	or a			;a109
	ret z			;a10a
	ld c,a			;a10b
	call L_A167		;a10c
L_A10F:
	ld a,(0e620h)		;a10f
	or a			;a112
	jr nz,L_A117		;a113
	jr $+77		;a115
L_A117:
	ld a,c			;a117
L_A118:
	ldi		;a118
	dec a			;a11a
	ret z			;a11b
	ld bc,0ffbfh		;a11c
	add hl,bc			;a11f
	jp L_A118		;a120

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa123..0xa124  (1 bytes)
DATA_A123:
	defb 0c9h	; a123

; ======================================================================
; CODIGO 0xa124..0xa19b  (119 bytes)
; ======================================================================


L_A124:
	ld b,003h		;a124
	jr L_A12A		;a126
L_A128:
	ld b,002h		;a128
L_A12A:
	ld a,(ix+00ah)		;a12a
	or a			;a12d
	ret z			;a12e
	ld c,a			;a12f
	call L_A167		;a130
L_A133:
	push bc			;a133
	push hl			;a134
	call L_A10F		;a135
	pop hl			;a138
	inc hl			;a139
	ld a,(0e620h)		;a13a
	or a			;a13d
	jr nz,L_A144		;a13e
	ld bc,0003fh		;a140
	add hl,bc			;a143
L_A144:
	pop bc			;a144
	djnz L_A133		;a145
	ret			;a147
L_A148:
	ld a,(ix+00ah)		;a148
	or a			;a14b
	ret z			;a14c
	ld c,a			;a14d
	call L_A167		;a14e
	ld a,(0e620h)		;a151
	or a			;a154
	ld a,c			;a155
	jr nz,L_A162		;a156
L_A158:
	ldi		;a158
	ld bc,0003fh		;a15a
	add hl,bc			;a15d
	dec a			;a15e
	jr nz,L_A158		;a15f
	ret			;a161
L_A162:
	ld b,000h		;a162
	ldir		;a164
	ret			;a166
L_A167:
	ld l,(ix+003h)		;a167
	ld h,(ix+005h)		;a16a
	call 05a99h		;a16d
	ld (ix+00eh),l		;a170
	ld (ix+00fh),h		;a173
	ret			;a176
L_A177:
	ld de,0ed00h		;a177
	ld ix,0e440h		;a17a
	ld b,00fh		;a17e
L_A180:
	push bc			;a180
	call L_A18D		;a181
	ld bc,00018h		;a184
	add ix,bc		;a187
	pop bc			;a189
	djnz L_A180		;a18a
	ret			;a18c
L_A18D:
	ld a,(ix+000h)		;a18d
	dec a			;a190
	jr z,$+22		;a191
	sub 004h		;a193
	cp 006h		;a195
	ret nc			;a197
	call 040ceh		;a198

; ----------------------------------------------------------------------
; DATOS tabla_A19B: 6 destinos del despachador p00:40CE (call en p11:A198, el
;   indice en A): A202, A1B2, A1DF, A1B2, A1DF, A1DB; lo leen p11:A198 (12
;   bytes)
;   0xa19b..0xa1a7  (12 bytes)
DATA_tabla_A19B:
	defw 0a202h,0a1b2h,0a1dfh,0a1b2h,0a1dfh,0a1dbh	; a19b

; ======================================================================
; CODIGO 0xa1a7..0xa245  (158 bytes)
; ======================================================================


L_A1A7:
	ex de,hl			;a1a7
	ld e,(ix+00eh)		;a1a8
	ld d,(ix+00fh)		;a1ab
	ldi		;a1ae
	ex de,hl			;a1b0
	ret			;a1b1
L_A1B2:
	ld a,(ix+00ah)		;a1b2
	or a			;a1b5
	ret z			;a1b6
	ld c,a			;a1b7
	ld l,(ix+00eh)		;a1b8
	ld h,(ix+00fh)		;a1bb
L_A1BE:
	ld a,(0e620h)		;a1be
	or a			;a1c1
	jr nz,L_A1CB		;a1c2
L_A1C4:
	ex de,hl			;a1c4
	ld b,000h		;a1c5
	ldir		;a1c7
	ex de,hl			;a1c9
	ret			;a1ca
L_A1CB:
	ld a,c			;a1cb
	ld bc,0ffc0h		;a1cc
	exx			;a1cf
	ld b,a			;a1d0
L_A1D1:
	exx			;a1d1
	ld a,(de)			;a1d2
	ld (hl),a			;a1d3
	inc de			;a1d4
	add hl,bc			;a1d5
	exx			;a1d6
	djnz L_A1D1		;a1d7
	exx			;a1d9
	ret			;a1da
L_A1DB:
	ld b,003h		;a1db
	jr L_A1E1		;a1dd
L_A1DF:
	ld b,002h		;a1df
L_A1E1:
	ld a,(ix+00ah)		;a1e1
	or a			;a1e4
	ret z			;a1e5
	ld c,a			;a1e6
	ld l,(ix+00eh)		;a1e7
	ld h,(ix+00fh)		;a1ea
L_A1ED:
	push bc			;a1ed
	push hl			;a1ee
	call L_A1BE		;a1ef
	pop hl			;a1f2
	inc hl			;a1f3
	ld a,(0e620h)		;a1f4
	or a			;a1f7
	jr nz,L_A1FE		;a1f8
	ld bc,0003fh		;a1fa
	add hl,bc			;a1fd
L_A1FE:
	pop bc			;a1fe
	djnz L_A1ED		;a1ff
	ret			;a201
L_A202:
	ld a,(ix+00ah)		;a202
	or a			;a205
	ret z			;a206
	ld c,a			;a207
	ld l,(ix+00eh)		;a208
	ld h,(ix+00fh)		;a20b
	ld a,(0e620h)		;a20e
	or a			;a211
	jr nz,L_A1C4		;a212
	ld a,c			;a214
	ld bc,00040h		;a215
	exx			;a218
	ld b,a			;a219
L_A21A:
	exx			;a21a
	ld a,(de)			;a21b
	ld (hl),a			;a21c
	inc de			;a21d
	add hl,bc			;a21e
	exx			;a21f
	djnz L_A21A		;a220
	exx			;a222
	ret			;a223
L_A224:
	ld ix,0e440h		;a224
	ld b,00fh		;a228
L_A22A:
	push bc			;a22a
	call L_A237		;a22b
	ld bc,00018h		;a22e
	add ix,bc		;a231
	pop bc			;a233
	djnz L_A22A		;a234
	ret			;a236
L_A237:
	ld a,(ix+000h)		;a237
	dec a			;a23a
	jr z,$+22		;a23b
	sub 004h		;a23d
	cp 006h		;a23f
	ret nc			;a241
	call 040ceh		;a242

; ----------------------------------------------------------------------
; DATOS tabla_A245: 6 destinos del despachador p00:40CE (call en p11:A242, el
;   indice en A): A2E5, A285, A2A7, A285, A25C, A260; lo leen p11:A242 (12
;   bytes)
;   0xa245..0xa251  (12 bytes)
DATA_tabla_A245:
	defw 0a2e5h,0a285h,0a2a7h,0a285h,0a25ch,0a260h	; a245

; ======================================================================
; CODIGO 0xa251..0xa4ad  (604 bytes)
; ======================================================================


L_A251:
	ld l,(ix+00eh)		;a251
	ld h,(ix+00fh)		;a254
	ld a,(ix+006h)		;a257
	ld (hl),a			;a25a
	ret			;a25b
L_A25C:
	ld c,002h		;a25c
	jr L_A262		;a25e
L_A260:
	ld c,003h		;a260
L_A262:
	ld a,(ix+00ah)		;a262
	or a			;a265
	ret z			;a266
	ld b,a			;a267
	ld l,(ix+00eh)		;a268
	ld h,(ix+00fh)		;a26b
L_A26E:
	push bc			;a26e
	push hl			;a26f
	call L_A291		;a270
	pop hl			;a273
	ld de,00040h		;a274
	ld a,(0e620h)		;a277
	or a			;a27a
	jr z,L_A27F		;a27b
	ld e,001h		;a27d
L_A27F:
	add hl,de			;a27f
	pop bc			;a280
	dec c			;a281
	jr nz,L_A26E		;a282
	ret			;a284
L_A285:
	ld a,(ix+00ah)		;a285
	or a			;a288
	ret z			;a289
	ld b,a			;a28a
	ld l,(ix+00eh)		;a28b
	ld h,(ix+00fh)		;a28e
L_A291:
	ld a,(0e620h)		;a291
	or a			;a294
	ld a,(ix+006h)		;a295
	jr nz,L_A29F		;a298
L_A29A:
	ld (hl),a			;a29a
	inc l			;a29b
	djnz L_A29A		;a29c
	ret			;a29e
L_A29F:
	ld de,0ffc0h		;a29f
L_A2A2:
	ld (hl),a			;a2a2
	add hl,de			;a2a3
	djnz L_A2A2		;a2a4
	ret			;a2a6
L_A2A7:
	ld a,(ix+00ah)		;a2a7
	or a			;a2aa
	ret z			;a2ab
	ld b,a			;a2ac
	ld l,(ix+00eh)		;a2ad
	ld h,(ix+00fh)		;a2b0
	ld a,(0e620h)		;a2b3
	or a			;a2b6
	jr nz,L_A2CF		;a2b7
	push hl			;a2b9
	push bc			;a2ba
	ld a,038h		;a2bb
	call L_A2C8		;a2bd
	pop bc			;a2c0
	pop hl			;a2c1
	ld de,00040h		;a2c2
	add hl,de			;a2c5
	ld a,039h		;a2c6
L_A2C8:
	ld (hl),a			;a2c8
	xor 001h		;a2c9
	inc l			;a2cb
	djnz L_A2C8		;a2cc
	ret			;a2ce
L_A2CF:
	push hl			;a2cf
	push bc			;a2d0
	ld de,0ffc0h		;a2d1
	ld a,039h		;a2d4
	call L_A2DE		;a2d6
	pop bc			;a2d9
	pop hl			;a2da
	inc hl			;a2db
	ld a,038h		;a2dc
L_A2DE:
	ld (hl),a			;a2de
	add hl,de			;a2df
	xor 001h		;a2e0
	djnz L_A2DE		;a2e2
	ret			;a2e4
L_A2E5:
	ld a,(ix+00ah)		;a2e5
	or a			;a2e8
	ret z			;a2e9
	ld b,a			;a2ea
	ld l,(ix+00eh)		;a2eb
	ld h,(ix+00fh)		;a2ee
	ld a,(0e620h)		;a2f1
	or a			;a2f4
	jr nz,L_A315		;a2f5
	ld de,00040h		;a2f7
	dec b			;a2fa
	jr z,L_A30C		;a2fb
	dec b			;a2fd
	jr z,L_A30F		;a2fe
	ld (hl),030h		;a300
	add hl,de			;a302
	ld a,031h		;a303
L_A305:
	ld (hl),a			;a305
	add hl,de			;a306
	djnz L_A305		;a307
	ld (hl),032h		;a309
	ret			;a30b
L_A30C:
	ld (hl),031h		;a30c
	ret			;a30e
L_A30F:
	ld (hl),030h		;a30f
	add hl,de			;a311
	ld (hl),032h		;a312
	ret			;a314
L_A315:
	ld de,00001h		;a315
	dec b			;a318
	jr z,L_A30C		;a319
	dec b			;a31b
	jr z,L_A30F		;a31c
	ld (hl),030h		;a31e
	inc hl			;a320
	ld a,031h		;a321
L_A323:
	ld (hl),a			;a323
	inc hl			;a324
	djnz L_A323		;a325
	ld (hl),032h		;a327
	ret			;a329
L_A32A:
	ld hl,0e6abh		;a32a
	ld a,(hl)			;a32d
	dec a			;a32e
	jr z,L_A377		;a32f
	dec a			;a331
	jr z,L_A3A5		;a332
	dec a			;a334
	jp z,L_A3D7		;a335
	xor a			;a338
	ld (0e6aeh),a		;a339
	inc l			;a33c
	ld (hl),a			;a33d
	inc l			;a33e
	ld (hl),0f0h		;a33f
L_A341:
	ld de,01000h		;a341
	call L_A3E2		;a344
	ld de,00800h		;a347
	call L_A3E2		;a34a
	ld de,00000h		;a34d
	call L_A3E2		;a350
	ld hl,0e6ach		;a353
	ld a,(hl)			;a356
	add a,040h		;a357
	ld (hl),a			;a359
	jr nz,L_A341		;a35a
	dec l			;a35c
	inc (hl)			;a35d
	inc l			;a35e
	inc l			;a35f
	ld (hl),0feh		;a360
	ld a,(0e63ah)		;a362
	or a			;a365
	ret nz			;a366
	ld a,(0e640h)		;a367
	cp 004h		;a36a
	ret z			;a36c
	sub 007h		;a36d
	cp 002h		;a36f
	ret c			;a371
	ld a,024h		;a372
	jp 04d6eh		;a374
L_A377:
	ld de,03000h		;a377
	call L_A3E2		;a37a
	ld de,02800h		;a37d
	call L_A3E2		;a380
	ld de,02000h		;a383
	call L_A3E2		;a386
	ld hl,0e6ach		;a389
	ld a,(hl)			;a38c
	add a,040h		;a38d
	ld (hl),a			;a38f
	ret nz			;a390
	inc l			;a391
	ld a,(hl)			;a392
	and a			;a393
	jr z,L_A399		;a394
	sla (hl)		;a396
	ret			;a398
L_A399:
	ld a,(0e63ah)		;a399
	or a			;a39c
	jr nz,L_A3DC		;a39d
	ld a,002h		;a39f
	ld (0e6abh),a		;a3a1
	ret			;a3a4
L_A3A5:
	ld a,03ch		;a3a5
	ld (0e649h),a		;a3a7
	ld a,003h		;a3aa
	ld (0e6abh),a		;a3ac
	ld hl,0ca00h		;a3af
	ld de,0ca01h		;a3b2
	ld bc,0053fh		;a3b5
	ld (hl),000h		;a3b8
	ldir		;a3ba
L_A3BC:
	ld hl,0e700h		;a3bc
	ld de,0e701h		;a3bf
	ld bc,002ffh		;a3c2
	ld (hl),000h		;a3c5
	ldir		;a3c7
	ld hl,0e650h		;a3c9
	ld de,0e651h		;a3cc
	ld bc,00006h		;a3cf
	ld (hl),000h		;a3d2
	ldir		;a3d4
	ret			;a3d6
L_A3D7:
	ld hl,0e649h		;a3d7
	dec (hl)			;a3da
	ret nz			;a3db
L_A3DC:
	ld a,001h		;a3dc
	ld (0e6aeh),a		;a3de
	ret			;a3e1
L_A3E2:
	ld a,(0e6ach)		;a3e2
	ld l,a			;a3e5
	ld bc,00200h		;a3e6
	ld a,(0e63ah)		;a3e9
	or a			;a3ec
	jr z,L_A40A		;a3ed
	ld a,(0e226h)		;a3ef
	or a			;a3f2
	jr z,L_A427		;a3f3
	ld a,(0e639h)		;a3f5
	or a			;a3f8
	jr z,L_A427		;a3f9
	bit 4,d		;a3fb
	ret nz			;a3fd
	bit 7,l		;a3fe
	ret z			;a400
	ld a,l			;a401
	cp 0c0h		;a402
	ret nc			;a404
	ld bc,000c0h		;a405
	jr L_A427		;a408
L_A40A:
	bit 4,d		;a40a
	jr nz,L_A41C		;a40c
	ld a,l			;a40e
	or a			;a40f
	jp m,L_A427		;a410
	ld l,000h		;a413
	ld bc,00100h		;a415
	jr z,L_A427		;a418
	jr L_A422		;a41a
L_A41C:
	ld a,l			;a41c
	or a			;a41d
	ret z			;a41e
	jp m,L_A427		;a41f
L_A422:
	ld l,050h		;a422
	ld bc,00180h		;a424
L_A427:
	ld h,000h		;a427
	add hl,hl			;a429
	add hl,hl			;a42a
	add hl,hl			;a42b
	add hl,de			;a42c
	push hl			;a42d
	ld de,0e700h		;a42e
	push bc			;a431
	call 00059h		;a432   ; BIOS LDIRMV - Block transfers to memory from VRAM
	pop bc			;a435
	push bc			;a436
	ld hl,0e700h		;a437
	ld a,(0e6adh)		;a43a
	ld e,a			;a43d
	call L_A449		;a43e
	pop bc			;a441
	pop hl			;a442
	ld de,0e700h		;a443
	jp 04cbdh		;a446
L_A449:
	ld a,(0e6abh)		;a449
	and a			;a44c
	jr nz,L_A459		;a44d
L_A44F:
	ld a,(hl)			;a44f
	and e			;a450
	ld (hl),a			;a451
	inc hl			;a452
	dec bc			;a453
	ld a,b			;a454
	or c			;a455
	jr nz,L_A44F		;a456
	ret			;a458
L_A459:
	ld a,(hl)			;a459
	and e			;a45a
	ld (hl),a			;a45b
	inc hl			;a45c
	rrc e		;a45d
	rrc e		;a45f
	rrc e		;a461
	dec bc			;a463
	ld a,b			;a464
	or c			;a465
	jr nz,L_A459		;a466
	ret			;a468
L_A469:
	ld a,(ix+006h)		;a469
	sub 020h		;a46c
	ld (ix+029h),a		;a46e
	ld a,0e0h		;a471
	ld (ix+034h),a		;a473
	ld (ix+038h),a		;a476
	ld (ix+03ch),a		;a479
	ld (ix+024h),008h		;a47c
	xor a			;a480
	ld (0e69ah),a		;a481
	inc a			;a484
	ld (ix+010h),a		;a485
	ld (ix+025h),a		;a488
	inc a			;a48b
	ld (ix+02bh),a		;a48c
	ld (ix+02ch),a		;a48f
L_A492:
	inc (ix+02bh)		;a492
	ld a,(ix+02bh)		;a495
	and 007h		;a498
	ld hl,0a4adh		;a49a
	call 05ad8h		;a49d
	ld (ix+031h),a		;a4a0
	ld (ix+037h),a		;a4a3
	ld (ix+03bh),a		;a4a6
	ld (ix+03fh),a		;a4a9
	ret			;a4ac

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa4ad..0xa4b5  (8 bytes)
DATA_A4AD:
	defb 008h,00dh,005h,003h,00fh,007h,00bh,00ah	; a4ad  ........

; ======================================================================
; CODIGO 0xa4b5..0xa4cc  (23 bytes)
; ======================================================================


L_A4B5:
	call L_A492		;a4b5
	dec (ix+02ch)		;a4b8
	ret nz			;a4bb
	ld (ix+02ch),002h		;a4bc
	ld a,(ix+001h)		;a4c0
	or a			;a4c3
	jr nz,L_A4C9		;a4c4
	dec (ix+02ch)		;a4c6
L_A4C9:
	call 040ceh		;a4c9

; ----------------------------------------------------------------------
; DATOS tabla_A4CC: 4 destinos del despachador p00:40CE (call en p11:A4C9, el
;   indice en A): A4D4, A50C, A51B, A532; lo leen p11:A4C9 (8 bytes)
;   0xa4cc..0xa4d4  (8 bytes)
DATA_tabla_A4CC:
	defw 0a4d4h,0a50ch,0a51bh,0a532h	; a4cc  -> L_A4D4 L_A50C L_A51B L_A532

; ======================================================================
; CODIGO 0xa4d4..0xa5b8  (228 bytes)
; ======================================================================


L_A4D4:
	dec (ix+024h)		;a4d4
	jr z,L_A4ED		;a4d7
	bit 0,(ix+024h)		;a4d9
	ret z			;a4dd
	ld a,(ix+030h)		;a4de
	add a,004h		;a4e1
	cp 0b4h		;a4e3
	jr nz,L_A4E9		;a4e5
	ld a,0a0h		;a4e7
L_A4E9:
	ld (ix+030h),a		;a4e9
	ret			;a4ec
L_A4ED:
	ld a,(ix+006h)		;a4ed
	sub 010h		;a4f0
	ld (ix+006h),a		;a4f2
	ld a,(ix+004h)		;a4f5
	ld (ix+02ah),a		;a4f8
	call L_A56B		;a4fb
	ld b,001h		;a4fe
	call L_A5C2		;a500
	ld a,014h		;a503
	call 04d6eh		;a505
L_A508:
	inc (ix+001h)		;a508
	ret			;a50b
L_A50C:
	call L_A525		;a50c
	ld a,(ix+025h)		;a50f
	inc a			;a512
	cp 004h		;a513
	jr z,L_A508		;a515
	ld (ix+025h),a		;a517
	ret			;a51a
L_A51B:
	ld a,(ix+03dh)		;a51b
	cp 009h		;a51e
	jr c,L_A508		;a520
	call L_A540		;a522
L_A525:
	call L_A5E4		;a525
	push af			;a528
	call L_A608		;a529
	pop af			;a52c
	ld b,001h		;a52d
	jp L_A5C2		;a52f
L_A532:
	call L_A540		;a532
	dec (ix+025h)		;a535
	jp m,06b62h		;a538
	ld (ix+03ch),0e0h		;a53b
	ret			;a53f
L_A540:
	ld a,(ix+034h)		;a540
	ld (ix+004h),a		;a543
	ld a,(ix+035h)		;a546
	ld (ix+006h),a		;a549
	ld a,(ix+036h)		;a54c
	ld (ix+030h),a		;a54f
	ld a,(ix+037h)		;a552
	ld (ix+031h),a		;a555
	push ix		;a558
	pop de			;a55a
	ld a,034h		;a55b
	call 040c9h		;a55d
	ld h,d			;a560
	ld a,e			;a561
	add a,004h		;a562
	ld l,a			;a564
	ld bc,00008h		;a565
	ldir		;a568
	ret			;a56a
L_A56B:
	ld hl,0e69ah		;a56b
	inc (hl)			;a56e
	ld a,(hl)			;a56f
	and 003h		;a570
	jr z,L_A5B1		;a572
	ld a,(0e227h)		;a574
	cp 002h		;a577
	jr nz,L_A586		;a579
	ld hl,0e68dh		;a57b
	ld a,(hl)			;a57e
	inc (hl)			;a57f
	rra			;a580
	ld a,(0e3a4h)		;a581
	jr c,L_A589		;a584
L_A586:
	ld a,(0e324h)		;a586
L_A589:
	ld bc,00500h		;a589
	ld hl,0a5b8h		;a58c
	sub (ix+004h)		;a58f
	jr c,L_A599		;a592
	ld de,00005h		;a594
	ld c,e			;a597
	add hl,de			;a598
L_A599:
	cp (hl)			;a599
	jr c,L_A5A1		;a59a
	inc c			;a59c
	inc hl			;a59d
	djnz L_A599		;a59e
	dec c			;a5a0
L_A5A1:
	ld a,c			;a5a1
L_A5A2:
	add a,a			;a5a2
	add a,a			;a5a3
	add a,a			;a5a4
	ld hl,0a63bh		;a5a5
	call 05ad8h		;a5a8
	inc hl			;a5ab
	ld (ix+030h),a		;a5ac
	jr $+79		;a5af
L_A5B1:
	call 065abh		;a5b1
	and 007h		;a5b4
	jr L_A5A2		;a5b6

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa5b8..0xa5c2  (10 bytes)
DATA_A5B8:
	defb 0dbh,0e7h,0ech,0f6h,0ffh,004h,008h,00dh,018h,028h	; a5b8  .........(

; ======================================================================
; CODIGO 0xa5c2..0xa5da  (24 bytes)
; ======================================================================


L_A5C2:
	sub 0a0h		;a5c2
	rra			;a5c4
	rra			;a5c5
	and 03fh		;a5c6
	djnz L_A5D4		;a5c8
	ld hl,0a5dah		;a5ca
	call 05ad8h		;a5cd
	ld (ix+028h),a		;a5d0
	ret			;a5d3
L_A5D4:
	ld hl,0a5dfh		;a5d4
	jp 05ad8h		;a5d7

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa5da..0xa5e4  (10 bytes)
DATA_A5DA:
	defb 001h,006h,00ah,00ah,00eh,006h,007h,000h,00fh,004h	; a5da  ..........

; ======================================================================
; CODIGO 0xa5e4..0xa605  (33 bytes)
; ======================================================================


L_A5E4:
	ld a,(ix+025h)		;a5e4
	ld hl,la604h		;a5e7
	call 05ad8h		;a5ea
	inc a			;a5ed
	inc a			;a5ee
	push ix		;a5ef
	pop de			;a5f1
	call 040c9h		;a5f2
	ld h,(ix+026h)		;a5f5
	ld l,(ix+027h)		;a5f8
	ld a,(hl)			;a5fb
	ldi		;a5fc
L_A5FE:
	ld (ix+026h),h		;a5fe
	ld (ix+027h),l		;a601
L_A604:
	ret			;a604

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa605..0xa608  (3 bytes)
DATA_A605:
	defb 034h,038h,03ch	; a605

; ======================================================================
; CODIGO 0xa608..0xa63b  (51 bytes)
; ======================================================================


L_A608:
	ld b,000h		;a608
	call L_A5C2		;a60a
	ld b,a			;a60d
	ld a,(ix+02ah)		;a60e
	add a,(ix+028h)		;a611
	sub b			;a614
	cp 0d0h		;a615
	jr c,L_A61B		;a617
	ld a,0e0h		;a619
L_A61B:
	ld (ix+02ah),a		;a61b
	ld c,a			;a61e
	push ix		;a61f
	pop hl			;a621
	ld de,0a604h		;a622
	ld a,(ix+025h)		;a625
	call 040c9h		;a628
	ld a,(de)			;a62b
	call 040c4h		;a62c
	ld (hl),c			;a62f
	inc l			;a630
	ld a,(ix+029h)		;a631
	ld (hl),a			;a634
	add a,0f0h		;a635
	ld (ix+029h),a		;a637
	ret			;a63a

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa63b..0xa68d  (82 bytes)
DATA_A63B:
	defb 0ach,0a0h,0ach,0a0h,0a0h,0ach,0a0h,0ach,0ach,0a0h,0ach,0a4h,0a0h,0ach,0ach,0a0h	; a63b  ................
	defb 0ach,0a4h,0ach,0a0h,0ach,0ach,0a0h,0a4h,0a0h,0ach,0a0h,0a8h,0ach,0a4h,0a0h,0ach	; a64b  ................
	defb 0a0h,0ach,0a8h,0ach,0b0h,0a0h,0a8h,0ach,0ach,0b0h,0a4h,0ach,0a0h,0a8h,0b0h,0a0h	; a65b  ................
	defb 0a8h,0ach,0a0h,0b0h,0b0h,0a0h,0a8h,0ach,0a0h,0a8h,0b0h,0a4h,0ach,0a8h,0b0h,0a0h	; a66b  ................
	defb 0b0h,0a0h,0ach,0a8h,0b0h,0a8h,0b0h,0a8h,0a8h,0b0h,0b0h,0a8h,0a4h,0a8h,0b0h,0a8h	; a67b  ................
	defb 0a8h,0ach	; a68b

; ======================================================================
; CODIGO 0xa68d..0xa697  (10 bytes)
; ======================================================================


L_A68D:
	ld ix,0ec80h		;a68d
	ld a,(0e641h)		;a691
	call 040ceh		;a694

; ----------------------------------------------------------------------
; DATOS tabla_A697: 6 destinos del despachador p00:40CE (call en p11:A694, el
;   indice en A): A6A3, A6C2, A6D1, A6D8, B543, B588; lo leen p11:A694 (12
;   bytes)
;   0xa697..0xa6a3  (12 bytes)
DATA_tabla_A697:
	defw 0a6a3h,0a6c2h,0a6d1h,0a6d8h,0b543h,0b588h	; a697

; ======================================================================
; CODIGO 0xa6a3..0xa6b6  (19 bytes)
; ======================================================================


L_A6A3:
	call L_B523		;a6a3
	ret nz			;a6a6
	ld hl,0a6b6h		;a6a7
	call L_A7C6		;a6aa
	call L_A6FA		;a6ad
	call L_A6EC		;a6b0
	jp L_B51E		;a6b3

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa6b6..0xa6c2  (12 bytes)
DATA_A6B6:
	defb 002h,000h,008h,0b0h,0ffh,080h,000h,010h,001h,010h,010h,030h	; a6b6  ...........0

; ======================================================================
; CODIGO 0xa6c2..0xa6ea  (40 bytes)
; ======================================================================


L_A6C2:
	ld bc,00018h		;a6c2
	call L_A7A2		;a6c5
	call z,L_B51E		;a6c8
	call L_A75C		;a6cb
	jp L_A6EC		;a6ce
L_A6D1:
	ld (ix+002h),008h		;a6d1
	jp L_B51E		;a6d5
L_A6D8:
	call L_A703		;a6d8
	call L_A6EC		;a6db
	ld hl,0a6eah		;a6de
	exx			;a6e1
	ld b,001h		;a6e2
	call L_B5A4		;a6e4
	jp L_B52F		;a6e7

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa6ea..0xa6ec  (2 bytes)
DATA_A6EA:
	defb 030h,018h	; a6ea

; ======================================================================
; CODIGO 0xa6ec..0xa6ff  (19 bytes)
; ======================================================================


L_A6EC:
	exx			;a6ec
	ld hl,0a6ffh		;a6ed
	call L_B64B		;a6f0
	dec (ix+07ch)		;a6f3
	ret nz			;a6f6
	inc (ix+07dh)		;a6f7
L_A6FA:
	ld (ix+07ch),007h		;a6fa
	ret			;a6fe

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa6ff..0xa703  (4 bytes)
DATA_A6FF:
	defb 001h,018h,028h,000h	; a6ff

; ======================================================================
; CODIGO 0xa703..0xa713  (16 bytes)
; ======================================================================


L_A703:
	dec (ix+002h)		;a703
	ret nz			;a706
	ld (ix+002h),008h		;a707
	ld a,(ix+001h)		;a70b
	and 007h		;a70e
	call 040ceh		;a710

; ----------------------------------------------------------------------
; DATOS tabla_A713: 8 destinos del despachador p00:40CE (call en p11:A710, el
;   indice en A): A750, A723, A72A, A731, A736, A73D, A744, A74B; lo leen
;   p11:A710 (16 bytes)
;   0xa713..0xa723  (16 bytes)
DATA_tabla_A713:
	defw 0a750h,0a723h,0a72ah,0a731h,0a736h,0a73dh,0a744h,0a74bh	; a713

; ======================================================================
; CODIGO 0xa723..0xa802  (223 bytes)
; ======================================================================


L_A723:
	call L_A783		;a723
	jr c,L_A759		;a726
	jr L_A750		;a728
L_A72A:
	call L_A783		;a72a
	jr c,L_A759		;a72d
	jr L_A755		;a72f
L_A731:
	call L_A783		;a731
	jr c,L_A759		;a734
L_A736:
	call L_A778		;a736
	jr c,L_A759		;a739
	jr L_A755		;a73b
L_A73D:
	call L_A797		;a73d
	jr c,L_A759		;a740
	jr L_A736		;a742
L_A744:
	call L_A797		;a744
	jr c,L_A759		;a747
	jr L_A755		;a749
L_A74B:
	call L_A797		;a74b
	jr c,L_A759		;a74e
L_A750:
	call L_A766		;a750
	jr c,L_A759		;a753
L_A755:
	dec (ix+07bh)		;a755
	ret nz			;a758
L_A759:
	inc (ix+001h)		;a759
L_A75C:
	call 04e58h		;a75c
	and 007h		;a75f
	inc a			;a761
	ld (ix+07bh),a		;a762
	ret			;a765
L_A766:
	ld de,00090h		;a766
L_A769:
	ld hl,(0ec85h)		;a769
	ld bc,00008h		;a76c
L_A76F:
	rst 20h			;a76f
	jr z,L_A795		;a770
	add hl,bc			;a772
	ld (0ec85h),hl		;a773
	and a			;a776
	ret			;a777
L_A778:
	ld de,00038h		;a778
L_A77B:
	ld hl,(0ec85h)		;a77b
	ld bc,0fff8h		;a77e
	jr L_A76F		;a781
L_A783:
	ld de,00058h		;a783
L_A786:
	ld hl,(0ec83h)		;a786
	ld bc,00008h		;a789
L_A78C:
	rst 20h			;a78c
	jr z,L_A795		;a78d
	add hl,bc			;a78f
	ld (0ec83h),hl		;a790
	and a			;a793
	ret			;a794
L_A795:
	scf			;a795
	ret			;a796
L_A797:
	ld de,00018h		;a797
L_A79A:
	ld hl,(0ec83h)		;a79a
	ld bc,0fff8h		;a79d
	jr L_A78C		;a7a0
L_A7A2:
	ld a,008h		;a7a2
L_A7A4:
	ld hl,0ec82h		;a7a4
	dec (hl)			;a7a7
	ret nz			;a7a8
	ld (hl),a			;a7a9
	ld hl,(0ec83h)		;a7aa
	ld de,00008h		;a7ad
	ld a,(0ec80h)		;a7b0
	cp 008h		;a7b3
	jr z,L_A7BB		;a7b5
	cp 006h		;a7b7
	jr nz,L_A7BE		;a7b9
L_A7BB:
	ld de,0fff8h		;a7bb
L_A7BE:
	add hl,de			;a7be
	ld (0ec83h),hl		;a7bf
	or a			;a7c2
	sbc hl,bc		;a7c3
	ret			;a7c5
L_A7C6:
	ld de,0ec80h		;a7c6
	ld bc,00007h		;a7c9
	ldir		;a7cc
	ld a,(hl)			;a7ce
	ld (0ece3h),a		;a7cf
	inc hl			;a7d2
	ld b,(hl)			;a7d3
	inc hl			;a7d4
	push bc			;a7d5
	ld a,0e0h		;a7d6
	ld de,0ecc7h		;a7d8
L_A7DB:
	ld (de),a			;a7db
	inc e			;a7dc
	inc e			;a7dd
	djnz L_A7DB		;a7de
	pop bc			;a7e0
	ld c,b			;a7e1
	ld b,000h		;a7e2
	push bc			;a7e4
	ld a,c			;a7e5
	add a,a			;a7e6
	ld c,a			;a7e7
	ld de,0ecd5h		;a7e8
	ldir		;a7eb
	pop bc			;a7ed
	ld de,0ecf4h		;a7ee
	ldir		;a7f1
	ld a,(0e640h)		;a7f3
	ld hl,0a801h		;a7f6
	call 05ad8h		;a7f9
	ld (0e605h),a		;a7fc
	jp 04dc8h		;a7ff

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa802..0xa80a  (8 bytes)
DATA_A802:
	defb 052h,053h,0a4h,054h,054h,0a4h,090h,069h	; a802  RS.TT..i

; ======================================================================
; CODIGO 0xa80a..0xa87a  (112 bytes)
; ======================================================================


L_A80A:
	call L_B6A3		;a80a
	ret z			;a80d
	ld bc,01000h		;a80e
	call L_B77E		;a811
	ld b,004h		;a814
L_A816:
	ld ix,0ec80h		;a816
	push bc			;a81a
	ld a,b			;a81b
	add a,a			;a81c
	add a,a			;a81d
	add a,(ix+07dh)		;a81e
	and 00fh		;a821
	push af			;a823
	call L_A84A		;a824
	pop af			;a827
	push hl			;a828
	ld hl,06487h		;a829
	call 04e28h		;a82c
	pop hl			;a82f
	call L_A837		;a830
	pop bc			;a833
	djnz L_A816		;a834
	ret			;a836
L_A837:
	ld a,c			;a837
	ld (0f001h),a		;a838
	call L_B73A		;a83b
	ret c			;a83e
	jp L_B70D		;a83f
L_A842:
	ld e,(hl)			;a842
	ld d,000h		;a843
	bit 7,e		;a845
	ret z			;a847
	dec d			;a848
	ret			;a849
L_A84A:
	ld hl,06547h		;a84a
	add a,a			;a84d
	add a,a			;a84e
	call 040c4h		;a84f
	ld c,(hl)			;a852
	inc hl			;a853
	ld b,(hl)			;a854
	inc hl			;a855
	call L_A842		;a856
	push hl			;a859
	ld hl,(0ec85h)		;a85a
	add hl,de			;a85d
	ld a,h			;a85e
	exx			;a85f
	ld d,a			;a860
	exx			;a861
	ld a,l			;a862
	exx			;a863
	ld e,a			;a864
	exx			;a865
	pop hl			;a866
	inc hl			;a867
	call L_A842		;a868
	ld hl,(0ec83h)		;a86b
	add hl,de			;a86e
	ret			;a86f
L_A870:
	ld ix,0ec80h		;a870
	ld a,(0e641h)		;a874
	call 040ceh		;a877

; ----------------------------------------------------------------------
; DATOS tabla_A87A: 6 destinos del despachador p00:40CE (call en p11:A877, el
;   indice en A): A886, A8CB, A8DB, A8ED, B543, B588; lo leen p11:A877 (12
;   bytes)
;   0xa87a..0xa886  (12 bytes)
DATA_tabla_A87A:
	defw 0a886h,0a8cbh,0a8dbh,0a8edh,0b543h,0b588h	; a87a

; ======================================================================
; CODIGO 0xa886..0xa8be  (56 bytes)
; ======================================================================


L_A886:
	call L_B523		;a886
	ret nz			;a889
	ld hl,0a8bfh		;a88a
	call L_A7C6		;a88d
	ld h,080h		;a890
	ld l,h			;a892
	ld (0ec88h),hl		;a893
	ld (0ec8ah),hl		;a896
	ld a,088h		;a899
	ld (0ec8ch),a		;a89b
	ld h,090h		;a89e
	ld l,h			;a8a0
	ld (0ec8dh),hl		;a8a1
	ld (0ec8fh),hl		;a8a4
	ld a,098h		;a8a7
	ld (0ec91h),a		;a8a9
	ld c,001h		;a8ac
	ld hl,0a8beh		;a8ae
	call L_B69B		;a8b1
	ld (ix+014h),000h		;a8b4
	call L_A93A		;a8b8
	jp L_B51E		;a8bb

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa8be..0xa8cb  (13 bytes)
DATA_A8BE:
	defb 014h,001h,000h,008h,030h,000h,010h,001h,012h,001h,010h,010h,010h	; a8be  ....0........

; ======================================================================
; CODIGO 0xa8cb..0xa938  (109 bytes)
; ======================================================================


L_A8CB:
	ld c,0a1h		;a8cb
	ld a,008h		;a8cd
	call L_A9FB		;a8cf
	call c,L_B51E		;a8d2
	call L_A9CE		;a8d5
	jp L_A93A		;a8d8
L_A8DB:
	ld (ix+002h),000h		;a8db
	ld (ix+013h),008h		;a8df
	ld (ix+017h),002h		;a8e3
	call L_A99E		;a8e7
	jp L_B51E		;a8ea
L_A8ED:
	call L_A945		;a8ed
	call L_A955		;a8f0
	ld hl,0ec97h		;a8f3
	dec (hl)			;a8f6
	jr nz,L_A91E		;a8f7
	ld (hl),002h		;a8f9
	ld a,(ix+001h)		;a8fb
	or a			;a8fe
	jr z,L_A91E		;a8ff
	push af			;a901
	ld de,010f8h		;a902
	ld hl,0ec88h		;a905
	xor a			;a908
	call L_AAC5		;a909
	pop af			;a90c
	cp 003h		;a90d
	jr c,L_A91E		;a90f
	ld de,01838h		;a911
	ld hl,0ec8dh		;a914
	ld a,(0e227h)		;a917
	rra			;a91a
	call L_AAC5		;a91b
L_A91E:
	call L_A93A		;a91e
	ld hl,0a938h		;a921
	exx			;a924
	ld b,001h		;a925
	call L_B5A4		;a927
	ld a,(0ecefh)		;a92a
	cp 017h		;a92d
	jr z,L_A935		;a92f
	ld (ix+047h),0e0h		;a931
L_A935:
	jp L_B52F		;a935

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa938..0xa93a  (2 bytes)
DATA_A938:
	defb 020h,000h	; a938

; ======================================================================
; CODIGO 0xa93a..0xa941  (7 bytes)
; ======================================================================


L_A93A:
	exx			;a93a
	ld hl,0a941h		;a93b
	jp L_B64B		;a93e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa941..0xa945  (4 bytes)
DATA_A941:
	defb 000h,001h,000h,020h	; a941

; ======================================================================
; CODIGO 0xa945..0xa95b  (22 bytes)
; ======================================================================


L_A945:
	ld hl,0ec94h		;a945
	dec (hl)			;a948
	ret nz			;a949
	ld (hl),008h		;a94a
	ld hl,0ecefh		;a94c
	ld a,(hl)			;a94f
	cp 017h		;a950
	ret z			;a952
	inc (hl)			;a953
	ret			;a954
L_A955:
	ld a,(ix+001h)		;a955
	call 040ceh		;a958

; ----------------------------------------------------------------------
; DATOS tabla_A95B: 5 destinos del despachador p00:40CE (call en p11:A958, el
;   indice en A): A965, A997, A96C, A9A3, A9B7; lo leen p11:A958 (10 bytes)
;   0xa95b..0xa965  (10 bytes)
DATA_tabla_A95B:
	defw 0a965h,0a997h,0a96ch,0a9a3h,0a9b7h	; a95b

; ======================================================================
; CODIGO 0xa965..0xaaf3  (398 bytes)
; ======================================================================


L_A965:
	ld hl,0ec88h		;a965
	ld b,030h		;a968
	jr L_A971		;a96a
L_A96C:
	ld hl,0ec8dh		;a96c
	ld b,0b0h		;a96f
L_A971:
	dec (ix+013h)		;a971
	ret nz			;a974
	ld (ix+013h),008h		;a975
	ld de,0ec82h		;a979
	ld a,(de)			;a97c
	call 040c4h		;a97d
	set 3,(hl)		;a980
	ld a,(de)			;a982
	inc a			;a983
	ld (de),a			;a984
	cp 004h		;a985
	ret nz			;a987
	ld a,040h		;a988
	ld (de),a			;a98a
	inc (ix+001h)		;a98b
	inc hl			;a98e
	ld a,b			;a98f
	ld b,005h		;a990
L_A992:
	ld (hl),a			;a992
	dec hl			;a993
	djnz L_A992		;a994
	ret			;a996
L_A997:
	dec (ix+002h)		;a997
	ret nz			;a99a
	inc (ix+001h)		;a99b
L_A99E:
	ld de,0fff8h		;a99e
	jr L_A9F3		;a9a1
L_A9A3:
	ld hl,0ec82h		;a9a3
	dec (hl)			;a9a6
	ret nz			;a9a7
	ld a,006h		;a9a8
	ld (hl),a			;a9aa
	ld (ix+013h),005h		;a9ab
	ld (ix+012h),007h		;a9af
	inc (ix+001h)		;a9b3
	ret			;a9b6
L_A9B7:
	ld hl,0ec82h		;a9b7
	dec (hl)			;a9ba
	ret nz			;a9bb
	ld (hl),006h		;a9bc
	call L_A9D3		;a9be
	dec (ix+013h)		;a9c1
	ret nz			;a9c4
	ld a,(ix+012h)		;a9c5
	dec a			;a9c8
	and 007h		;a9c9
	ld (ix+012h),a		;a9cb
L_A9CE:
	ld (ix+013h),003h		;a9ce
	ret			;a9d2
L_A9D3:
	call L_A9D9		;a9d3
	jp L_A9EC		;a9d6
L_A9D9:
	ld a,(ix+012h)		;a9d9
	add a,a			;a9dc
	ld hl,0aaf3h		;a9dd
	call 040c4h		;a9e0
	call L_A842		;a9e3
	ld c,e			;a9e6
	ld b,d			;a9e7
	inc hl			;a9e8
	jp L_A842		;a9e9
L_A9EC:
	ld hl,(0ec83h)		;a9ec
	add hl,bc			;a9ef
	ld (0ec83h),hl		;a9f0
L_A9F3:
	ld hl,(0ec85h)		;a9f3
	add hl,de			;a9f6
	ld (0ec85h),hl		;a9f7
	ret			;a9fa
L_A9FB:
	and a			;a9fb
	dec (ix+002h)		;a9fc
	ret nz			;a9ff
	ld (ix+002h),a		;aa00
	ld a,(0ec80h)		;aa03
	cp 005h		;aa06
	ld hl,(0ec85h)		;aa08
	ld de,00008h		;aa0b
	jr z,L_AA13		;aa0e
	ld de,0fff8h		;aa10
L_AA13:
	add hl,de			;aa13
	ld (0ec85h),hl		;aa14
	ld a,h			;aa17
	and a			;aa18
	ret nz			;aa19
	ld a,l			;aa1a
	cp c			;aa1b
	ret			;aa1c
L_AA1D:
	call L_B6A3		;aa1d
	ret z			;aa20
	exx			;aa21
	ld b,001h		;aa22
	exx			;aa24
	call L_B6E9		;aa25
	ld a,(0e641h)		;aa28
	cp 003h		;aa2b
	ret c			;aa2d
	ld hl,01808h		;aa2e
	ld (0ec95h),hl		;aa31
	ld hl,0ec8ch		;aa34
	ld a,(0ec81h)		;aa37
	or a			;aa3a
	jr z,L_AA53		;aa3b
	dec a			;aa3d
	jr z,L_AA6C		;aa3e
	call L_AA6C		;aa40
	ld hl,01028h		;aa43
	ld (0ec95h),hl		;aa46
	ld hl,0ec91h		;aa49
	ld a,(0ec81h)		;aa4c
	cp 002h		;aa4f
	jr nz,L_AA6C		;aa51
L_AA53:
	ld b,005h		;aa53
L_AA55:
	ld ix,0ec80h		;aa55
	push hl			;aa59
	push bc			;aa5a
	ld a,(hl)			;aa5b
	rra			;aa5c
	rra			;aa5d
	and 03eh		;aa5e
	call L_AA88		;aa60
	call L_A837		;aa63
	pop bc			;aa66
	pop hl			;aa67
	dec hl			;aa68
	djnz L_AA55		;aa69
	ret			;aa6b
L_AA6C:
	ld b,005h		;aa6c
L_AA6E:
	ld ix,0ec80h		;aa6e
	push hl			;aa72
	push bc			;aa73
	call L_AA80		;aa74
	call L_A837		;aa77
	pop bc			;aa7a
	pop hl			;aa7b
	dec hl			;aa7c
	djnz L_AA6E		;aa7d
	ret			;aa7f
L_AA80:
	ld a,(hl)			;aa80
	add a,008h		;aa81
	rra			;aa83
	rra			;aa84
	rra			;aa85
	and 01eh		;aa86
L_AA88:
	ld c,a			;aa88
	ld hl,06460h		;aa89
	call 040c4h		;aa8c
	ld de,0ec96h		;aa8f
	ld a,(de)			;aa92
	add a,(hl)			;aa93
	ld (de),a			;aa94
	add a,(ix+005h)		;aa95
	ld e,a			;aa98
	ld d,000h		;aa99
	dec hl			;aa9b
	push hl			;aa9c
	push bc			;aa9d
	exx			;aa9e
	pop bc			;aa9f
	pop hl			;aaa0
	ld de,0ec95h		;aaa1
	ld a,(de)			;aaa4
	add a,(hl)			;aaa5
	ld (de),a			;aaa6
	add a,(ix+003h)		;aaa7
	ld l,a			;aaaa
	ld h,000h		;aaab
	dec b			;aaad
	jr z,L_AAB7		;aaae
	ld bc,00202h		;aab0
	ld de,0645bh		;aab3
	ret			;aab6
L_AAB7:
	ld a,c			;aab7
	rra			;aab8
	push hl			;aab9
	ld hl,0641bh		;aaba
	call 04e28h		;aabd
	pop hl			;aac0
	ld bc,00202h		;aac1
	ret			;aac4
L_AAC5:
	ld (0e63dh),a		;aac5
	ld a,(0ec83h)		;aac8
	add a,e			;aacb
	ld e,a			;aacc
	ld a,(0ec85h)		;aacd
	add a,d			;aad0
	ld d,a			;aad1
	push hl			;aad2
	call 07594h		;aad3
	pop hl			;aad6
	ld a,(0f018h)		;aad7
	and 0f0h		;aada
	ld d,a			;aadc
	ld bc,00405h		;aadd
L_AAE0:
	ld a,(hl)			;aae0
	and 0f0h		;aae1
	sub d			;aae3
	jr z,L_AAEE		;aae4
	rla			;aae6
	ld a,c			;aae7
	jr nc,L_AAEC		;aae8
	neg		;aaea
L_AAEC:
	add a,(hl)			;aaec
	ld (hl),a			;aaed
L_AAEE:
	dec c			;aaee
	inc hl			;aaef
	djnz L_AAE0		;aaf0
	ret			;aaf2

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaaf3..0xab03  (16 bytes)
DATA_AAF3:
	defb 008h,000h,008h,008h,000h,008h,0f8h,008h,0f8h,000h,0f8h,0f8h,000h,0f8h,008h,0f8h	; aaf3  ................

; ======================================================================
; CODIGO 0xab03..0xab0d  (10 bytes)
; ======================================================================


L_AB03:
	ld ix,0ec80h		;ab03
	ld a,(0e641h)		;ab07
	call 040ceh		;ab0a

; ----------------------------------------------------------------------
; DATOS tabla_AB0D: 8 destinos del despachador p00:40CE (call en p11:AB0A, el
;   indice en A): B4B3, AB1D, AB28, AB4F, AB5C, AB6F, B543, B588; lo leen
;   p11:AB0A (16 bytes)
;   0xab0d..0xab1d  (16 bytes)
DATA_tabla_AB0D:
	defw 0b4b3h,0ab1dh,0ab28h,0ab4fh,0ab5ch,0ab6fh,0b543h,0b588h	; ab0d

; ======================================================================
; CODIGO 0xab1d..0xab40  (35 bytes)
; ======================================================================


L_AB1D:
	call L_B4CA		;ab1d
	ret z			;ab20
	xor a			;ab21
	ld (0e6aah),a		;ab22
	jp L_B51E		;ab25
L_AB28:
	call L_B523		;ab28
	ret nz			;ab2b
	ld hl,0ab40h		;ab2c
	call L_A7C6		;ab2f
	ld (ix+06fh),01dh		;ab32
	ld (ix+07ch),00ah		;ab36
	call L_AB8C		;ab3a
	jp L_B51E		;ab3d

; ----------------------------------------------------------------------
; DATOS sin identificar  0xab40..0xab4f  (15 bytes)
DATA_AB40:
	defb 005h,000h,004h,038h,000h,0a0h,0ffh,013h,002h,020h,008h,020h,008h,020h,008h	; ab40  ...8..... . . .

; ======================================================================
; CODIGO 0xab4f..0xab93  (68 bytes)
; ======================================================================


L_AB4F:
	ld c,0a0h		;ab4f
	ld a,004h		;ab51
	call L_A9FB		;ab53
	call z,L_B51E		;ab56
	jp L_AB8C		;ab59
L_AB5C:
	ld (ix+002h),004h		;ab5c
	ld (ix+07dh),006h		;ab60
	ld (ix+07eh),001h		;ab64
	ld (ix+07fh),030h		;ab68
	jp L_B51E		;ab6c
L_AB6F:
	call L_AB9B		;ab6f
	call L_AB8C		;ab72
	ld hl,0ab97h		;ab75
	exx			;ab78
	ld b,002h		;ab79
	call L_B5A4		;ab7b
	ld a,(0ecf4h)		;ab7e
	or a			;ab81
	jr nz,L_AB89		;ab82
	ld a,0e0h		;ab84
	ld (0ecc7h),a		;ab86
L_AB89:
	jp L_B52F		;ab89
L_AB8C:
	exx			;ab8c
	ld hl,0ab93h		;ab8d
	jp L_B64B		;ab90

; ----------------------------------------------------------------------
; DATOS sin identificar  0xab93..0xab9b  (8 bytes)
DATA_AB93:
	defb 000h,001h,0f9h,010h,010h,0f9h,010h,000h	; ab93  ........

; ======================================================================
; CODIGO 0xab9b..0xacd2  (311 bytes)
; ======================================================================


L_AB9B:
	ld a,(ix+001h)		;ab9b
	dec a			;ab9e
	jp z,L_AC0D		;ab9f
	dec a			;aba2
	jr z,L_ABC6		;aba3
	ld a,(ix+074h)		;aba5
	or a			;aba8
	jr nz,L_ABBA		;aba9
	ld a,00fh		;abab
	call 04d6eh		;abad
	ld (ix+001h),002h		;abb0
	ld (ix+002h),060h		;abb4
	jr L_ABC6		;abb8
L_ABBA:
	call L_ABEB		;abba
	ld hl,0ec82h		;abbd
	dec (hl)			;abc0
	ret nz			;abc1
	ld (hl),004h		;abc2
	jr L_ABCB		;abc4
L_ABC6:
	dec (ix+002h)		;abc6
	jr z,L_ABFA		;abc9
L_ABCB:
	bit 0,(ix+07eh)		;abcb
	ld bc,0fff8h		;abcf
	jr z,L_ABD7		;abd2
	inc b			;abd4
	ld c,008h		;abd5
L_ABD7:
	ld hl,(0ec83h)		;abd7
	add hl,bc			;abda
	ld (0ec83h),hl		;abdb
	ld hl,0ecfdh		;abde
	dec (hl)			;abe1
	ret nz			;abe2
	ld (hl),00dh		;abe3
	inc hl			;abe5
	ld a,(hl)			;abe6
	xor 001h		;abe7
	ld (hl),a			;abe9
	ret			;abea
L_ABEB:
	ld hl,0ecffh		;abeb
	dec (hl)			;abee
	ret nz			;abef
	ld (hl),008h		;abf0
	inc (ix+001h)		;abf2
	ld (ix+06fh),01eh		;abf5
	ret			;abf9
L_ABFA:
	ld (ix+001h),000h		;abfa
	ld (ix+002h),004h		;abfe
	ld (ix+07fh),008h		;ac02
	ld hl,00820h		;ac06
	ld (0ecf4h),hl		;ac09
	ret			;ac0c
L_AC0D:
	ld hl,0ecffh		;ac0d
	dec (hl)			;ac10
	ret nz			;ac11
	ld (hl),010h		;ac12
	dec (ix+001h)		;ac14
	ld (ix+06fh),01dh		;ac17
	ld a,(ix+003h)		;ac1b
	add a,018h		;ac1e
	ld e,a			;ac20
	ld a,(ix+005h)		;ac21
	sub 018h		;ac24
	ld d,a			;ac26
	ld hl,00000h		;ac27
	ld a,017h		;ac2a
	call 07811h		;ac2c
	ld a,014h		;ac2f
	jp 04d6eh		;ac31
L_AC34:
	call L_B6A3		;ac34
	ret z			;ac37
	ld a,(0ecf4h)		;ac38
	or a			;ac3b
	ret z			;ac3c
	exx			;ac3d
	ld b,001h		;ac3e
	exx			;ac40
	jp L_B6E9		;ac41
L_AC44:
	ld (ix+00ch),008h		;ac44
	ld (ix+007h),021h		;ac48
	ld (ix+00fh),021h		;ac4c
	ld a,002h		;ac50
	ld (ix+002h),a		;ac52
	ld (ix+008h),004h		;ac55
	ld (ix+009h),a		;ac59
	ld (ix+00ah),a		;ac5c
	ld (ix+00eh),a		;ac5f
	ld c,018h		;ac62
	jp 07ae3h		;ac64
L_AC67:
	ld a,(0e203h)		;ac67
	rra			;ac6a
	ld a,(ix+00fh)		;ac6b
	jr c,L_AC72		;ac6e
	add a,02bh		;ac70
L_AC72:
	ld (ix+007h),a		;ac72
	dec (ix+00eh)		;ac75
	ret nz			;ac78
	ld (ix+00eh),002h		;ac79
	ld a,(ix+006h)		;ac7d
	sub 008h		;ac80
	ld (ix+006h),a		;ac82
	jp z,079feh		;ac85
	ld a,(ix+001h)		;ac88
	dec a			;ac8b
	ret z			;ac8c
	dec (ix+002h)		;ac8d
	ret nz			;ac90
	ld (ix+002h),002h		;ac91
	ld a,(ix+00ah)		;ac95
	sla a		;ac98
	sla a		;ac9a
	sla a		;ac9c
	add a,(ix+004h)		;ac9e
	cp 0a8h		;aca1
	jr nc,L_ACC4		;aca3
	inc (ix+00fh)		;aca5
	inc (ix+007h)		;aca8
	inc (ix+00dh)		;acab
	ld a,(ix+00ah)		;acae
	add a,002h		;acb1
	ld (ix+00ah),a		;acb3
	ld a,(ix+004h)		;acb6
	sub 008h		;acb9
	ld (ix+004h),a		;acbb
	jr z,L_ACC4		;acbe
	dec (ix+00ch)		;acc0
	ret nz			;acc3
L_ACC4:
	inc (ix+001h)		;acc4
	ret			;acc7
L_ACC8:
	ld ix,0ec80h		;acc8
	ld a,(0e641h)		;accc
	call 040ceh		;accf

; ----------------------------------------------------------------------
; DATOS tabla_ACD2: 5 destinos del despachador p00:40CE (call en p11:ACCF, el
;   indice en A): ACF5, ACE1, AD39, B543, B4BF; lo leen p11:ACCF (10 bytes)
;   0xacd2..0xacdc  (10 bytes)
DATA_tabla_ACD2:
	defw 0acf5h,0ace1h,0ad39h,0b543h,0b4bfh	; acd2

; ======================================================================
; CODIGO 0xacdc..0xad24  (72 bytes)
; ======================================================================


L_ACDC:
	call L_AFEE		;acdc
	jr L_ACE4		;acdf
L_ACE1:
	call L_AD54		;ace1
L_ACE4:
	call 041eeh		;ace4
	call 04708h		;ace7
	call 041eah		;acea
	ld a,(0e21ch)		;aced
	or a			;acf0
	ret nz			;acf1
	jp L_B51E		;acf2
L_ACF5:
	call L_B523		;acf5
	ret nz			;acf8
	ld hl,0ad27h		;acf9
	call L_A7C6		;acfc
	ld a,02eh		;acff
	ld (0e646h),a		;ad01
	ld a,018h		;ad04
	ld (0e647h),a		;ad06
	ld hl,0ad24h		;ad09
	ld c,003h		;ad0c
	call L_B69B		;ad0e
	ld (ix+00fh),004h		;ad11
	call L_AE4C		;ad15
	call L_ADD0		;ad18
	ld hl,0e30bh		;ad1b
	call L_AFA3		;ad1e
	jp L_B51A		;ad21

; ----------------------------------------------------------------------
; DATOS sin identificar  0xad24..0xad39  (21 bytes)
DATA_AD24:
	defb 01fh,022h,025h,004h,001h,008h,0d8h,0ffh,018h,000h,011h,003h,028h,018h,028h,018h	; ad24  ."%.........(.(.
	defb 028h,018h,019h,019h,019h	; ad34

; ======================================================================
; CODIGO 0xad39..0xad4e  (21 bytes)
; ======================================================================


L_AD39:
	call L_AE48		;ad39
	call L_AD7D		;ad3c
	call L_AD54		;ad3f
	ld hl,0ad4eh		;ad42
	exx			;ad45
	ld b,003h		;ad46
	call L_B5A4		;ad48
	jp L_AFC7		;ad4b

; ----------------------------------------------------------------------
; DATOS sin identificar  0xad4e..0xad54  (6 bytes)
DATA_AD4E:
	defb 048h,030h,048h,080h,038h,058h	; ad4e

; ======================================================================
; CODIGO 0xad54..0xad6f  (27 bytes)
; ======================================================================


L_AD54:
	exx			;ad54
	ld hl,0ad6fh		;ad55
	call L_B64B		;ad58
	ld hl,0ecbbh		;ad5b
L_AD5E:
	ld a,(0ecffh)		;ad5e
	and a			;ad61
	ld a,0e0h		;ad62
	jr z,L_AD6B		;ad64
	ld (hl),a			;ad66
	inc l			;ad67
	ld (hl),000h		;ad68
	ret			;ad6a
L_AD6B:
	ld (0eccbh),a		;ad6b
	ret			;ad6e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xad6f..0xad7d  (14 bytes)
DATA_AD6F:
	defb 003h,030h,040h,080h,040h,058h,030h,003h,030h,028h,080h,028h,058h,058h	; ad6f  .0@.@X0.0(.(XX

; ======================================================================
; CODIGO 0xad7d..0xad8a  (13 bytes)
; ======================================================================


L_AD7D:
	ld hl,0ec8fh		;ad7d
	dec (hl)			;ad80
	ret nz			;ad81
	ld (hl),004h		;ad82
	ld a,(ix+001h)		;ad84
	call 040ceh		;ad87

; ----------------------------------------------------------------------
; DATOS tabla_AD8A: 6 destinos del despachador p00:40CE (call en p11:AD87, el
;   indice en A): ADDB, AD96, ADAC, ADB4, ADC0, ADC6; lo leen p11:AD87 (12
;   bytes)
;   0xad8a..0xad96  (12 bytes)
DATA_tabla_AD8A:
	defw 0addbh,0ad96h,0adach,0adb4h,0adc0h,0adc6h	; ad8a

; ======================================================================
; CODIGO 0xad96..0xae91  (251 bytes)
; ======================================================================


L_AD96:
	call L_ADED		;ad96
	call z,L_ADE4		;ad99
L_AD9C:
	ret z			;ad9c
	dec (ix+07bh)		;ad9d
	ret nz			;ada0
	ld a,(ix+001h)		;ada1
	ld (ix+016h),a		;ada4
	ld (ix+001h),003h		;ada7
	ret			;adab
L_ADAC:
	call L_ADF9		;adac
	call z,L_ADE4		;adaf
	jr L_AD9C		;adb2
L_ADB4:
	call L_AE05		;adb4
	ret nz			;adb7
	ld (ix+07bh),008h		;adb8
L_ADBC:
	inc (ix+001h)		;adbc
	ret			;adbf
L_ADC0:
	dec (ix+07bh)		;adc0
	ret nz			;adc3
	jr L_ADBC		;adc4
L_ADC6:
	call L_AE11		;adc6
	ret nz			;adc9
	ld a,(ix+016h)		;adca
	ld (ix+001h),a		;adcd
L_ADD0:
	call 04e58h		;add0
	and 00eh		;add3
	add a,008h		;add5
	ld (ix+07bh),a		;add7
	ret			;adda
L_ADDB:
	dec (ix+002h)		;addb
	ret nz			;adde
	ld a,(ix+017h)		;addf
	jr L_ADE9		;ade2
L_ADE4:
	ld a,(ix+001h)		;ade4
	xor 003h		;ade7
L_ADE9:
	ld (ix+001h),a		;ade9
	ret			;adec
L_ADED:
	ld de,00018h		;aded
	ld hl,00058h		;adf0
	call L_AE1D		;adf3
	jp L_A769		;adf6
L_ADF9:
	ld de,0fff0h		;adf9
	ld hl,0ffe0h		;adfc
	call L_AE1D		;adff
	jp L_A77B		;ae02
L_AE05:
	ld de,00018h		;ae05
	ld hl,00028h		;ae08
	call L_AE1D		;ae0b
	jp L_A786		;ae0e
L_AE11:
	ld de,0ffd0h		;ae11
	ld hl,0ffd8h		;ae14
	call L_AE1D		;ae17
	jp L_A79A		;ae1a
L_AE1D:
	ld a,(0ec80h)		;ae1d
	cp 007h		;ae20
	ret z			;ae22
	ex de,hl			;ae23
	ret			;ae24
L_AE25:
	ld a,003h		;ae25
L_AE27:
	ld (0c506h),a		;ae27
	call L_B6A3		;ae2a
	ret z			;ae2d
	exx			;ae2e
	ld a,(0c506h)		;ae2f
	ld b,a			;ae32
	exx			;ae33
	call L_B6E9		;ae34
	ld de,01b05h		;ae37
	ld b,005h		;ae3a
	exx			;ae3c
	ld a,(0c506h)		;ae3d
	ld b,a			;ae40
	ld a,003h		;ae41
	ld e,000h		;ae43
	jp L_B7B6		;ae45
L_AE48:
	call L_AE5B		;ae48
	ret nz			;ae4b
L_AE4C:
	ld a,(0e64fh)		;ae4c
	neg		;ae4f
	add a,038h		;ae51
	ld (ix+010h),a		;ae53
	ld (ix+018h),000h		;ae56
	ret			;ae5a
L_AE5B:
	ld hl,0ec90h		;ae5b
	dec (hl)			;ae5e
	ret nz			;ae5f
	ld a,(ix+018h)		;ae60
	and a			;ae63
	jr nz,L_AE7C		;ae64
	inc (ix+018h)		;ae66
	ld (hl),00fh		;ae69
	ld (ix+002h),004h		;ae6b
	ld a,(ix+001h)		;ae6f
	ld (ix+017h),a		;ae72
	xor a			;ae75
	call L_ADE9		;ae76
	or 0ffh		;ae79
	ret			;ae7b
L_AE7C:
	call L_AE81		;ae7c
	xor a			;ae7f
	ret			;ae80
L_AE81:
	ld a,(0ec80h)		;ae81
	cp 007h		;ae84
	jp z,L_B09E		;ae86
	ld de,0ae91h		;ae89
	ld b,004h		;ae8c
	jp L_B0A9		;ae8e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xae91..0xae9c  (11 bytes)
DATA_AE91:
	defb 028h,078h,048h,088h,070h,088h,098h,078h,030h,078h,0c0h	; ae91  (xH.p..x0x.

; ======================================================================
; CODIGO 0xae9c..0xaea6  (10 bytes)
; ======================================================================


L_AE9C:
	ld ix,0ec80h		;ae9c
	ld a,(0e641h)		;aea0
	call 040ceh		;aea3

; ----------------------------------------------------------------------
; DATOS tabla_AEA6: 7 destinos del despachador p00:40CE (call en p11:AEA3, el
;   indice en A): AECA, AED3, AEE2, AF11, AF23, AF45, B4BF; lo leen p11:AEA3
;   (14 bytes)
;   0xaea6..0xaeb4  (14 bytes)
DATA_tabla_AEA6:
	defw 0aecah,0aed3h,0aee2h,0af11h,0af23h,0af45h,0b4bfh	; aea6

; ======================================================================
; CODIGO 0xaeb4..0xaebe  (10 bytes)
; ======================================================================


L_AEB4:
	ld ix,0ec80h		;aeb4
	ld a,(0e641h)		;aeb8
	call 040ceh		;aebb

; ----------------------------------------------------------------------
; DATOS tabla_AEBE: 6 destinos del despachador p00:40CE (call en p11:AEBB, el
;   indice en A): AF5E, ACDC, AFA8, AFB5, B543, B4BF; lo leen p11:AEBB (12
;   bytes)
;   0xaebe..0xaeca  (12 bytes)
DATA_tabla_AEBE:
	defw 0af5eh,0acdch,0afa8h,0afb5h,0b543h,0b4bfh	; aebe

; ======================================================================
; CODIGO 0xaeca..0xaf05  (59 bytes)
; ======================================================================


L_AECA:
	ld hl,00001h		;aeca
	ld (0e6aah),hl		;aecd
	jp L_B51E		;aed0
L_AED3:
	call L_A32A		;aed3
	ld a,(0e6aeh)		;aed6
	and a			;aed9
	ret z			;aeda
	xor a			;aedb
	ld (0e6aah),a		;aedc
	jp L_B51E		;aedf
L_AEE2:
	call L_B523		;aee2
	ret nz			;aee5
	ld hl,0af05h		;aee6
	call L_A7C6		;aee9
	ld a,030h		;aeec
	ld (0e646h),a		;aeee
	ld a,00fh		;aef1
	ld (0e647h),a		;aef3
	xor a			;aef6
	ld (ix+014h),a		;aef7
	ld (ix+015h),a		;aefa
	ld a,058h		;aefd
	call 04d6eh		;aeff
	jp L_B51E		;af02

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaf05..0xaf11  (12 bytes)
DATA_AF05:
	defb 008h,000h,002h,0a0h,000h,040h,000h,00eh,001h,020h,020h,028h	; af05  .....@...  (

; ======================================================================
; CODIGO 0xaf11..0xaf43  (50 bytes)
; ======================================================================


L_AF11:
	ld bc,00000h		;af11
	ld a,002h		;af14
	call L_A7A4		;af16
	call z,L_B51E		;af19
	ld (ix+00fh),008h		;af1c
	jp L_B078		;af20
L_AF23:
	call L_B011		;af23
	call L_B074		;af26
	ld hl,0af43h		;af29
	exx			;af2c
	ld b,001h		;af2d
	call L_B5A4		;af2f
	call L_B060		;af32
	ret nz			;af35
	call L_AFD4		;af36
	ld (0e644h),a		;af39
	ld (ix+002h),01eh		;af3c
	jp L_B51E		;af40

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaf43..0xaf45  (2 bytes)
DATA_AF43:
	defb 050h,030h	; af43

; ======================================================================
; CODIGO 0xaf45..0xaf86  (65 bytes)
; ======================================================================


L_AF45:
	ld a,(ix+002h)		;af45
	ld de,00008h		;af48
	bit 0,a		;af4b
	call z,05adfh		;af4d
	ld hl,(0ec85h)		;af50
	add hl,de			;af53
	ld (0ec85h),hl		;af54
	dec (ix+002h)		;af57
	ret nz			;af5a
	jp L_B4B3		;af5b
L_AF5E:
	call L_B523		;af5e
	ret nz			;af61
	ld hl,0af8bh		;af62
	call L_A7C6		;af65
	ld a,02eh		;af68
	ld (0e646h),a		;af6a
	ld a,01eh		;af6d
	ld (0e647h),a		;af6f
	ld hl,0af86h		;af72
	ld c,005h		;af75
	call L_B69B		;af77
	call L_AFEE		;af7a
	ld hl,0e30dh		;af7d
	call L_AFA3		;af80
	jp L_B51A		;af83

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaf86..0xafa3  (29 bytes)
DATA_AF86:
	defb 01fh,022h,021h,020h,023h,007h,001h,008h,0d0h,0ffh,000h,000h,00fh,005h,028h,018h	; af86  ."! #.........(.
	defb 028h,018h,028h,018h,028h,018h,028h,018h,019h,019h,019h,019h,019h	; af96  (.(.(.(......

; ======================================================================
; CODIGO 0xafa3..0xafd9  (54 bytes)
; ======================================================================


L_AFA3:
	ld a,(hl)			;afa3
	ld (0ecfeh),a		;afa4
	ret			;afa7
L_AFA8:
	ld (ix+00fh),004h		;afa8
	call L_AE4C		;afac
	call L_ADD0		;afaf
	jp L_B51E		;afb2
L_AFB5:
	call L_AE48		;afb5
	call L_AD7D		;afb8
	call L_AFEE		;afbb
	ld hl,0afd9h		;afbe
	exx			;afc1
	ld b,005h		;afc2
	call L_B5A4		;afc4
L_AFC7:
	call L_AFE3		;afc7
	call L_B066		;afca
	ret nz			;afcd
	call L_AFD4		;afce
	jp L_B53A		;afd1
L_AFD4:
	ld a,015h		;afd4
	jp 04d6eh		;afd6

; ----------------------------------------------------------------------
; DATOS sin identificar  0xafd9..0xafe3  (10 bytes)
DATA_AFD9:
	defb 050h,010h,038h,038h,070h,070h,038h,0a8h,050h,0d0h	; afd9  P.88pp8.P.

; ======================================================================
; CODIGO 0xafe3..0xaffb  (24 bytes)
; ======================================================================


L_AFE3:
	ld a,(0ecffh)		;afe3
	and a			;afe6
	ret nz			;afe7
	ld a,0e0h		;afe8
	ld (0eccbh),a		;afea
	ret			;afed
L_AFEE:
	exx			;afee
	ld hl,0affbh		;afef
	call L_B64B		;aff2
	ld hl,0ecc3h		;aff5
	jp L_AD5E		;aff8

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaffb..0xb011  (22 bytes)
DATA_AFFB:
	defb 005h,010h,048h,038h,030h,070h,068h,0a8h,030h,0d0h,048h,005h,010h,030h,038h,018h	; affb  ..H80ph.0.H..08.
	defb 0a8h,018h,0d0h,030h,070h,098h	; b00b

; ======================================================================
; CODIGO 0xb011..0xb0de  (205 bytes)
; ======================================================================


L_B011:
	dec (ix+00fh)		;b011
	ret nz			;b014
	ld (ix+00fh),008h		;b015
	call L_B024		;b019
	bit 0,(ix+014h)		;b01c
	jr z,L_B02C		;b020
	jr L_B038		;b022
L_B024:
	bit 0,(ix+015h)		;b024
	jr z,L_B032		;b028
	jr L_B040		;b02a
L_B02C:
	call L_B048		;b02c
	jr z,L_B03C		;b02f
	ret			;b031
L_B032:
	call L_B054		;b032
	jr z,L_B044		;b035
	ret			;b037
L_B038:
	call L_B04E		;b038
	ret nz			;b03b
L_B03C:
	inc (ix+014h)		;b03c
	ret			;b03f
L_B040:
	call L_B05A		;b040
	ret nz			;b043
L_B044:
	inc (ix+015h)		;b044
	ret			;b047
L_B048:
	ld de,00080h		;b048
	jp L_A769		;b04b
L_B04E:
	ld de,00000h		;b04e
	jp L_A77B		;b051
L_B054:
	ld de,00028h		;b054
	jp L_A786		;b057
L_B05A:
	ld de,00000h		;b05a
	jp L_A79A		;b05d
L_B060:
	ld a,(0e644h)		;b060
	cp 002h		;b063
	ret			;b065
L_B066:
	xor a			;b066
	ld (0e644h),a		;b067
	ld a,(0ecf6h)		;b06a
	and a			;b06d
	ret			;b06e
L_B06F:
	ld a,005h		;b06f
	jp L_AE27		;b071
L_B074:
	call L_B083		;b074
	ret nz			;b077
L_B078:
	ld a,(0e64fh)		;b078
	neg		;b07b
	add a,038h		;b07d
	ld (ix+010h),a		;b07f
	ret			;b082
L_B083:
	dec (ix+010h)		;b083
	ret nz			;b086
	ld de,03050h		;b087
	ld a,(ix+003h)		;b08a
	add a,e			;b08d
	ld e,a			;b08e
	ld a,(ix+005h)		;b08f
	add a,d			;b092
	ld d,a			;b093
	ld bc,00100h		;b094
	ld a,023h		;b097
	call 065b5h		;b099
	xor a			;b09c
	ret			;b09d
L_B09E:
	call L_B0EA		;b09e
	call L_B12D		;b0a1
	ld de,0b0deh		;b0a4
	ld b,006h		;b0a7
L_B0A9:
	push bc			;b0a9
	push de			;b0aa
	ld a,(de)			;b0ab
	ld c,a			;b0ac
	ld b,000h		;b0ad
	call L_B148		;b0af
	jr nz,L_B0D0		;b0b2
	push hl			;b0b4
	inc de			;b0b5
	ld a,(de)			;b0b6
	ld c,a			;b0b7
	ld b,000h		;b0b8
	call L_B14D		;b0ba
	jr nz,L_B0DB		;b0bd
	ld a,l			;b0bf
	cp 0a8h		;b0c0
	jr nc,L_B0DB		;b0c2
	pop hl			;b0c4
	ld h,l			;b0c5
	ld l,a			;b0c6
	ex de,hl			;b0c7
	ld bc,00000h		;b0c8
	ld a,03eh		;b0cb
	call 065b5h		;b0cd
L_B0D0:
	pop de			;b0d0
	pop bc			;b0d1
	inc de			;b0d2
	inc de			;b0d3
	djnz L_B0A9		;b0d4
	ld a,013h		;b0d6
	jp 04d6eh		;b0d8
L_B0DB:
	pop hl			;b0db
	jr L_B0D0		;b0dc

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb0de..0xb0ea  (12 bytes)
DATA_B0DE:
	defb 008h,088h,020h,078h,050h,098h,0a0h,098h,0d0h,078h,0e8h,088h	; b0de  .. xP....x..

; ======================================================================
; CODIGO 0xb0ea..0xb121  (55 bytes)
; ======================================================================


L_B0EA:
	ld b,002h		;b0ea
L_B0EC:
	push bc			;b0ec
	call 04e58h		;b0ed
	and 003h		;b0f0
	ld hl,0b121h		;b0f2
	add a,a			;b0f5
	call 040c4h		;b0f6
	ld c,(hl)			;b0f9
	inc hl			;b0fa
	ld b,000h		;b0fb
	push hl			;b0fd
	call L_B14D		;b0fe
	jr nz,L_B11E		;b101
	ld a,l			;b103
	cp 0a8h		;b104
	jr nc,L_B11E		;b106
	ld e,a			;b108
	pop hl			;b109
	ld c,(hl)			;b10a
	ld b,000h		;b10b
	call L_B148		;b10d
	jr nz,L_B11A		;b110
	ld d,l			;b112
	ld c,000h		;b113
	ld a,00eh		;b115
	call 065b5h		;b117
L_B11A:
	pop bc			;b11a
	djnz L_B0EC		;b11b
	ret			;b11d
L_B11E:
	pop hl			;b11e
	jr L_B11A		;b11f

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb121..0xb12d  (12 bytes)
DATA_B121:
	defb 098h,050h,000h,098h,098h,000h,080h,0a8h,000h,070h,0d8h,000h	; b121  .P.......p..

; ======================================================================
; CODIGO 0xb12d..0xb15e  (49 bytes)
; ======================================================================


L_B12D:
	ld bc,000b8h		;b12d
	call L_B14D		;b130
	ret nz			;b133
	ld a,l			;b134
	cp 0a8h		;b135
	ret nc			;b137
	ld e,a			;b138
	ld bc,00078h		;b139
	call L_B148		;b13c
	ret nz			;b13f
	ld d,l			;b140
	ld c,000h		;b141
	ld a,032h		;b143
	jp 065b5h		;b145
L_B148:
	ld hl,(0ec85h)		;b148
	jr L_B150		;b14b
L_B14D:
	ld hl,(0ec83h)		;b14d
L_B150:
	add hl,bc			;b150
	ld a,h			;b151
	and a			;b152
	ret			;b153
L_B154:
	ld ix,0ec80h		;b154
	ld a,(0e641h)		;b158
	call 040ceh		;b15b

; ----------------------------------------------------------------------
; DATOS tabla_B15E: 5 destinos del despachador p00:40CE (call en p11:B15B, el
;   indice en A): B168, B1CC, B1E7, B543, B4BF; lo leen p11:B15B (10 bytes)
;   0xb15e..0xb168  (10 bytes)
DATA_tabla_B15E:
	defw 0b168h,0b1cch,0b1e7h,0b543h,0b4bfh	; b15e

; ======================================================================
; CODIGO 0xb168..0xb19e  (54 bytes)
; ======================================================================


L_B168:
	call L_B523		;b168
	ret nz			;b16b
	ld hl,0b19eh		;b16c
	call L_A7C6		;b16f
	ld hl,0c800h		;b172
	xor a			;b175
	ld (ix+017h),l		;b176
	ld (0ec98h),a		;b179
	ld (ix+019h),h		;b17c
	ld (0ec9ah),a		;b17f
	ld (ix+07fh),a		;b182
	ld a,008h		;b185
	ld (0ecfdh),a		;b187
	ld c,010h		;b18a
	ld hl,0b1bch		;b18c
	call L_B691		;b18f
	call L_B27D		;b192
	ld hl,0e30ch		;b195
	call L_AFA3		;b198
	jp L_B51E		;b19b

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb19e..0xb1cc  (46 bytes)
DATA_B19E:
	defb 006h,000h,008h,000h,000h,0f8h,000h,00dh,007h,010h,030h,010h,030h,010h,030h,010h	; b19e  ..........0.0.0.
	defb 030h,010h,030h,010h,010h,010h,018h,018h,018h,018h,018h,018h,010h,024h,00dh,00dh	; b1ae  0.0..........$..
	defb 00dh,00dh,00ch,004h,004h,006h,004h,004h,005h,009h,00ah,007h,00bh,008h	; b1be  ..............

; ======================================================================
; CODIGO 0xb1cc..0xb26f  (163 bytes)
; ======================================================================


L_B1CC:
	ld c,070h		;b1cc
	ld a,008h		;b1ce
	call L_A9FB		;b1d0
	call z,L_B51E		;b1d3
	call L_B27D		;b1d6
	ld (ix+07bh),004h		;b1d9
	ld a,004h		;b1dd
	ld (0e65bh),a		;b1df
L_B1E2:
	ld (ix+07ch),018h		;b1e2
	ret			;b1e6
L_B1E7:
	call L_B2C2		;b1e7
	call L_B3C7		;b1ea
	call L_B27D		;b1ed
	ld hl,0b26fh		;b1f0
	exx			;b1f3
	ld b,007h		;b1f4
	call L_B5A4		;b1f6
	ld a,(0ecffh)		;b1f9
	and a			;b1fc
	jr nz,L_B204		;b1fd
	ld a,0e0h		;b1ff
	ld (0ecd3h),a		;b201
L_B204:
	ld a,(0ecfdh)		;b204
	ld c,a			;b207
	rr c		;b208
	ld hl,0ecc8h		;b20a
	ld de,0ecf4h		;b20d
	exx			;b210
	ld hl,0ec9bh		;b211
	ld b,006h		;b214
L_B216:
	exx			;b216
	call L_B22D		;b217
	exx			;b21a
	djnz L_B216		;b21b
	exx			;b21d
	ld a,(0ecfdh)		;b21e
	bit 3,a		;b221
	jr z,L_B22A		;b223
	ld a,0e0h		;b225
	ld (0ecd1h),a		;b227
L_B22A:
	jp L_B52F		;b22a
L_B22D:
	rr c		;b22d
	jr c,L_B257		;b22f
	exx			;b231
	ld a,b			;b232
	exx			;b233
	cp 004h		;b234
	jr z,L_B24C		;b236
	dec a			;b238
	ld a,(hl)			;b239
	ld b,010h		;b23a
	jr z,L_B240		;b23c
	ld b,030h		;b23e
L_B240:
	sub b			;b240
	ld (hl),a			;b241
L_B242:
	inc l			;b242
	inc l			;b243
	exx			;b244
L_B245:
	inc l			;b245
	inc l			;b246
	inc l			;b247
	inc l			;b248
	exx			;b249
	inc e			;b24a
	ret			;b24b
L_B24C:
	ld a,(de)			;b24c
	or a			;b24d
	jr nz,L_B242		;b24e
L_B250:
	ld a,0e0h		;b250
	ld (0eccbh),a		;b252
	jr L_B242		;b255
L_B257:
	exx			;b257
	ld a,b			;b258
	exx			;b259
	cp 004h		;b25a
	jr z,L_B250		;b25c
	ld a,(de)			;b25e
	or a			;b25f
	jp nz,L_B268		;b260
	ld a,0e0h		;b263
	dec l			;b265
	ld (hl),a			;b266
	inc l			;b267
L_B268:
	inc l			;b268
	inc l			;b269
	exx			;b26a
	ld (hl),0e0h		;b26b
	jr L_B245		;b26d

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb26f..0xb27d  (14 bytes)
DATA_B26F:
	defb 018h,028h,058h,028h,098h,0f9h,0d8h,028h,019h,028h,098h,038h,050h,000h	; b26f  .(X(...(.(.8P.

; ======================================================================
; CODIGO 0xb27d..0xb2aa  (45 bytes)
; ======================================================================


L_B27D:
	exx			;b27d
	ld hl,0b2aah		;b27e
	call L_B64B		;b281
	ld hl,(0ec83h)		;b284
	ld bc,00040h		;b287
	add hl,bc			;b28a
	ld (0ec87h),hl		;b28b
	add hl,bc			;b28e
	ld (0ec8bh),hl		;b28f
	add hl,bc			;b292
	ld (0ec8fh),hl		;b293
	add hl,bc			;b296
	ld (0ec93h),hl		;b297
	ld hl,(0ec85h)		;b29a
	ld (0ec89h),hl		;b29d
	ld (0ec8dh),hl		;b2a0
	ld (0ec91h),hl		;b2a3
	ld (0ec95h),hl		;b2a6
	ret			;b2a9

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb2aa..0xb2c2  (24 bytes)
DATA_B2AA:
	defb 006h,000h,018h,000h,058h,000h,098h,000h,0d8h,000h,019h,030h,098h,005h,030h,018h	; b2aa  ....X......0..0.
	defb 030h,058h,040h,098h,030h,0d8h,030h,019h	; b2ba  0X@.0.0.

; ======================================================================
; CODIGO 0xb2c2..0xb2d0  (14 bytes)
; ======================================================================


L_B2C2:
	dec (ix+07bh)		;b2c2
	ret nz			;b2c5
	ld (ix+07bh),004h		;b2c6
	ld a,(ix+001h)		;b2ca
	call 040ceh		;b2cd

; ----------------------------------------------------------------------
; DATOS tabla_B2D0: 5 destinos del despachador p00:40CE (call en p11:B2CD, el
;   indice en A): B2DA, B320, B32A, B32F, B359; lo leen p11:B2CD (10 bytes)
;   0xb2d0..0xb2da  (10 bytes)
DATA_tabla_B2D0:
	defw 0b2dah,0b320h,0b32ah,0b32fh,0b359h	; b2d0

; ======================================================================
; CODIGO 0xb2da..0xb400  (294 bytes)
; ======================================================================


L_B2DA:
	ld a,(0ecfdh)		;b2da
	rra			;b2dd
	ld bc,00000h		;b2de
	ld de,00008h		;b2e1
	jr c,L_B2EC		;b2e4
	ld de,0fff8h		;b2e6
	ld bc,0ff68h		;b2e9
L_B2EC:
	ld hl,(0ec83h)		;b2ec
	add hl,de			;b2ef
	ld (0ec83h),hl		;b2f0
	push hl			;b2f3
	push bc			;b2f4
	call L_B27D		;b2f5
	pop bc			;b2f8
	pop hl			;b2f9
	or a			;b2fa
	sbc hl,bc		;b2fb
	call z,L_B30F		;b2fd
	dec (ix+07ch)		;b300
	ret nz			;b303
	call L_B1E2		;b304
	ld (ix+002h),005h		;b307
L_B30B:
	inc (ix+001h)		;b30b
	ret			;b30e
L_B30F:
	ld a,(ix+07bh)		;b30f
	add a,018h		;b312
	ld (ix+07bh),a		;b314
	ld a,(0ecfdh)		;b317
	xor 001h		;b31a
	ld (0ecfdh),a		;b31c
	ret			;b31f
L_B320:
	dec (ix+002h)		;b320
	ret nz			;b323
L_B324:
	ld (ix+002h),00ch		;b324
	jr L_B30B		;b328
L_B32A:
	ld de,0fff8h		;b32a
	jr L_B332		;b32d
L_B32F:
	ld de,00008h		;b32f
L_B332:
	ld a,(ix+07bh)		;b332
	sub 002h		;b335
	ld (ix+07bh),a		;b337
	ld bc,0ec85h		;b33a
	exx			;b33d
	ld b,005h		;b33e
L_B340:
	exx			;b340
	ld a,(bc)			;b341
	ld l,a			;b342
	inc c			;b343
	ld a,(bc)			;b344
	ld h,a			;b345
	add hl,de			;b346
	ld a,h			;b347
	ld (bc),a			;b348
	dec c			;b349
	ld a,l			;b34a
	ld (bc),a			;b34b
	inc c			;b34c
	inc c			;b34d
	inc c			;b34e
	inc c			;b34f
	exx			;b350
	djnz L_B340		;b351
	dec (ix+002h)		;b353
	ret nz			;b356
	jr L_B324		;b357
L_B359:
	ld (ix+001h),000h		;b359
	ret			;b35d
L_B35E:
	call L_B6A3		;b35e
	ret z			;b361
	exx			;b362
	ld b,005h		;b363
	exx			;b365
	call L_B6E9		;b366
	ld a,000h		;b369
	ld de,00404h		;b36b
	ld b,006h		;b36e
	exx			;b370
	ld b,005h		;b371
	ld e,001h		;b373
	call L_B7B6		;b375
	ld a,(0ecfdh)		;b378
	bit 3,a		;b37b
	jr z,L_B384		;b37d
	ld a,005h		;b37f
	call L_B6F1		;b381
L_B384:
	ld a,001h		;b384
	ld de,00608h		;b386
	ld b,002h		;b389
	exx			;b38b
	ld bc,00132h		;b38c
	ld e,b			;b38f
	ld hl,0ecf9h		;b390
	call L_B7C1		;b393
	ld b,005h		;b396
	ld a,(0ecfdh)		;b398
	rla			;b39b
	rla			;b39c
	ld e,a			;b39d
L_B39E:
	push bc			;b39e
	call L_B3A6		;b39f
	pop bc			;b3a2
	djnz L_B39E		;b3a3
	ret			;b3a5
L_B3A6:
	ld a,b			;b3a6
	ld hl,0ece8h		;b3a7
	call 05ad8h		;b3aa
	rl e		;b3ad
	ret c			;b3af
	add a,a			;b3b0
	add a,a			;b3b1
	add a,a			;b3b2
	ld c,a			;b3b3
	ld hl,0ecc6h		;b3b4
	ld a,b			;b3b7
	add a,a			;b3b8
	call 05ad8h		;b3b9
	add a,c			;b3bc
	ld (hl),a			;b3bd
	ld a,l			;b3be
	add a,00eh		;b3bf
	ld l,a			;b3c1
	ld a,030h		;b3c2
	sub c			;b3c4
	ld (hl),a			;b3c5
	ret			;b3c6
L_B3C7:
	ld a,(0ec81h)		;b3c7
	and a			;b3ca
	ret nz			;b3cb
	ld hl,0e65bh		;b3cc
	dec (hl)			;b3cf
	ret nz			;b3d0
	ld (hl),004h		;b3d1
	ld b,005h		;b3d3
	ld hl,0b400h		;b3d5
L_B3D8:
	push bc			;b3d8
	push hl			;b3d9
	ld a,(hl)			;b3da
	ld d,000h		;b3db
	rra			;b3dd
	jr nc,L_B3E1		;b3de
	inc d			;b3e0
L_B3E1:
	and 07fh		;b3e1
	ld e,a			;b3e3
	ld l,(ix+003h)		;b3e4
	ld h,(ix+004h)		;b3e7
	add hl,de			;b3ea
	ld a,h			;b3eb
	and a			;b3ec
	jr nz,L_B3FA		;b3ed
	ld a,l			;b3ef
	cp 0a0h		;b3f0
	jr nc,L_B3FA		;b3f2
	ld e,a			;b3f4
	ld d,070h		;b3f5
	call 074c5h		;b3f7
L_B3FA:
	pop hl			;b3fa
	inc hl			;b3fb
	pop bc			;b3fc
	djnz L_B3D8		;b3fd
	ret			;b3ff

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb400..0xb405  (5 bytes)
DATA_B400:
	defb 028h,068h,0a8h,0e8h,029h	; b400

; ======================================================================
; CODIGO 0xb405..0xb40f  (10 bytes)
; ======================================================================


L_B405:
	ld ix,0ec80h		;b405
	ld a,(0e641h)		;b409
	call 040ceh		;b40c

; ----------------------------------------------------------------------
; DATOS tabla_B40F: 5 destinos del despachador p00:40CE (call en p11:B40C, el
;   indice en A): B419, B464, B470, B4AE, B4BF; lo leen p11:B40C (10 bytes)
;   0xb40f..0xb419  (10 bytes)
DATA_tabla_B40F:
	defw 0b419h,0b464h,0b470h,0b4aeh,0b4bfh	; b40f

; ======================================================================
; CODIGO 0xb419..0xb450  (55 bytes)
; ======================================================================


L_B419:
	call L_B523		;b419
	ret nz			;b41c
	ld hl,0b450h		;b41d
	call L_A7C6		;b420
	ld hl,00070h		;b423
	ld (0ec89h),hl		;b426
	ld hl,000b8h		;b429
	ld (0ec8dh),hl		;b42c
	ld c,002h		;b42f
	ld hl,0b462h		;b431
	call L_B691		;b434
	xor a			;b437
	ld (0e644h),a		;b438
	ld hl,0ecb0h		;b43b
	ld (hl),a			;b43e
	inc hl			;b43f
	ld a,020h		;b440
	ld (hl),a			;b442
	inc hl			;b443
	ld a,004h		;b444
	ld (hl),a			;b446
	call L_AE4C		;b447
	call L_B4FC		;b44a
	jp L_B51E		;b44d

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb450..0xb464  (20 bytes)
DATA_B450:
	defb 003h,000h,008h,0b8h,0ffh,028h,000h,01ah,003h,028h,018h,028h,018h,028h,018h,020h	; b450  .....(...(.(.(.
	defb 020h,020h,01ah,01ah	; b460

; ======================================================================
; CODIGO 0xb464..0xb50c  (168 bytes)
; ======================================================================


L_B464:
	ld bc,00000h		;b464
	call L_A7A2		;b467
	call z,L_B51E		;b46a
	jp L_B4FC		;b46d
L_B470:
	ld hl,0ecb0h		;b470
	ld a,(hl)			;b473
	dec a			;b474
	jr z,L_B499		;b475
	inc hl			;b477
	dec (hl)			;b478
	jr nz,L_B499		;b479
	ld (hl),010h		;b47b
	ld e,050h		;b47d
	call 04e58h		;b47f
	and 07fh		;b482
	add a,040h		;b484
	ld d,a			;b486
	ld bc,00100h		;b487
	ld a,024h		;b48a
	call 065b5h		;b48c
	ld hl,0ecb2h		;b48f
	dec (hl)			;b492
	jr nz,L_B499		;b493
	ld hl,0ecb0h		;b495
	inc (hl)			;b498
L_B499:
	ld hl,0b514h		;b499
	exx			;b49c
	ld b,003h		;b49d
	call L_B5A4		;b49f
	call L_B4D2		;b4a2
	ret nz			;b4a5
	ld a,01eh		;b4a6
	ld (0e642h),a		;b4a8
	jp L_B51E		;b4ab
L_B4AE:
	ld hl,0e642h		;b4ae
	dec (hl)			;b4b1
	ret nz			;b4b2
L_B4B3:
	ld hl,00001h		;b4b3
	ld (0e6aah),hl		;b4b6
	call L_A3BC		;b4b9
	jp L_B51E		;b4bc
L_B4BF:
	call L_B4CA		;b4bf
	ret z			;b4c2
	xor a			;b4c3
	ld (0e6aah),a		;b4c4
	jp L_B58D		;b4c7
L_B4CA:
	call L_A32A		;b4ca
	ld a,(0e6aeh)		;b4cd
	or a			;b4d0
	ret			;b4d1
L_B4D2:
	ld b,003h		;b4d2
	call L_B060		;b4d4
	ret nz			;b4d7
	call L_AFD4		;b4d8
	xor a			;b4db
	ld (0e644h),a		;b4dc
	ld hl,0ecf4h		;b4df
L_B4E2:
	ld a,(hl)			;b4e2
	inc l			;b4e3
	and a			;b4e4
	ret nz			;b4e5
	djnz L_B4E2		;b4e6
	ret			;b4e8
L_B4E9:
	call L_B6A3		;b4e9
	ret z			;b4ec
	ld a,003h		;b4ed
	ld de,01b08h		;b4ef
	ld b,004h		;b4f2
	exx			;b4f4
	ld b,003h		;b4f5
	ld e,000h		;b4f7
	jp L_B7B6		;b4f9
L_B4FC:
	ld hl,(0ec83h)		;b4fc
	ld (0ec87h),hl		;b4ff
	ld (0ec8bh),hl		;b502
	exx			;b505
	ld hl,0b50ch		;b506
	jp L_B64B		;b509

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb50c..0xb51a  (14 bytes)
DATA_B50C:
	defb 003h,008h,020h,050h,020h,098h,020h,000h,028h,008h,028h,050h,028h,098h	; b50c  .. P . .(.(P(.

; ======================================================================
; CODIGO 0xb51a..0xb564  (74 bytes)
; ======================================================================


L_B51A:
	xor a			;b51a
	ld (0ecffh),a		;b51b
L_B51E:
	ld hl,0e641h		;b51e
	inc (hl)			;b521
	ret			;b522
L_B523:
	call 04e3ah		;b523
	ret nz			;b526
	ld hl,0e642h		;b527
	ld a,(hl)			;b52a
	and a			;b52b
	ret z			;b52c
	dec (hl)			;b52d
	ret			;b52e
L_B52F:
	ld a,(0e644h)		;b52f
	cp 002h		;b532
	ret nz			;b534
	ld a,015h		;b535
	call 04d6eh		;b537
L_B53A:
	ld hl,0003ch		;b53a
	ld (0e642h),hl		;b53d
	jp L_B51E		;b540
L_B543:
	ld hl,(0e642h)		;b543
	dec hl			;b546
	ld (0e642h),hl		;b547
	ld a,h			;b54a
	or l			;b54b
	jr z,$+28		;b54c
	ld a,(0e640h)		;b54e
	dec a			;b551
	ret nz			;b552
	ld a,(0e203h)		;b553
	rra			;b556
	rra			;b557
	and 003h		;b558
	ld hl,0b564h		;b55a
	call 05ad8h		;b55d
	ld (0ecefh),a		;b560
	ret			;b563

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb564..0xb568  (4 bytes)
DATA_B564:
	defb 015h,016h,017h,016h	; b564

; ======================================================================
; CODIGO 0xb568..0xb696  (302 bytes)
; ======================================================================


L_B568:
	ld a,(0e640h)		;b568
	cp 003h		;b56b
	jr z,L_B580		;b56d
	sub 005h		;b56f
	cp 002h		;b571
	jr c,L_B580		;b573
	ld a,025h		;b575
	call 04d6eh		;b577
	call L_B619		;b57a
	jp L_B51E		;b57d
L_B580:
	ld a,024h		;b580
	call 04d6eh		;b582
	jp L_B4B3		;b585
L_B588:
	ld hl,0e642h		;b588
	dec (hl)			;b58b
	ret nz			;b58c
L_B58D:
	ld hl,0e640h		;b58d
	ld c,(hl)			;b590
	xor a			;b591
	ld (hl),a			;b592
	ld (0ec80h),a		;b593
	inc a			;b596
	ld (0e644h),a		;b597
	ld a,c			;b59a
	cp 006h		;b59b
	ret nz			;b59d
	ld a,001h		;b59e
	ld (0e226h),a		;b5a0
	ret			;b5a3
L_B5A4:
	ld hl,0ecc7h		;b5a4
L_B5A7:
	ld a,b			;b5a7
	exx			;b5a8
	ld e,(hl)			;b5a9
	call L_B5C2		;b5aa
	inc hl			;b5ad
	ld c,(hl)			;b5ae
	ld b,000h		;b5af
	bit 0,c		;b5b1
	jr z,L_B5B7		;b5b3
	dec b			;b5b5
	dec c			;b5b6
L_B5B7:
	inc hl			;b5b7
	push hl			;b5b8
	call L_B5CA		;b5b9
	pop hl			;b5bc
	exx			;b5bd
	djnz L_B5A7		;b5be
	exx			;b5c0
	ret			;b5c1
L_B5C2:
	bit 0,e		;b5c2
	ld d,000h		;b5c4
	ret z			;b5c6
	inc d			;b5c7
	dec e			;b5c8
	ret			;b5c9
L_B5CA:
	call L_B5F1		;b5ca
	add hl,de			;b5cd
	ld a,h			;b5ce
	and a			;b5cf
	jr nz,L_B5E6		;b5d0
	ld a,l			;b5d2
	exx			;b5d3
	ld (hl),a			;b5d4
	inc l			;b5d5
	ld a,b			;b5d6
	exx			;b5d7
	call L_B605		;b5d8
	add hl,bc			;b5db
	ld a,h			;b5dc
	or a			;b5dd
	jr nz,L_B5ED		;b5de
	ld a,l			;b5e0
	exx			;b5e1
	ld (hl),a			;b5e2
	inc l			;b5e3
	exx			;b5e4
	ret			;b5e5
L_B5E6:
	exx			;b5e6
L_B5E7:
	ld (hl),0e0h		;b5e7
	inc l			;b5e9
	inc l			;b5ea
	exx			;b5eb
	ret			;b5ec
L_B5ED:
	exx			;b5ed
	dec l			;b5ee
	jr L_B5E7		;b5ef
L_B5F1:
	ld l,a			;b5f1
	ld a,(0ec80h)		;b5f2
	cp 006h		;b5f5
	jr nz,L_B601		;b5f7
	ld a,l			;b5f9
	dec a			;b5fa
	jr nz,L_B601		;b5fb
	ld hl,(0ec97h)		;b5fd
	ret			;b600
L_B601:
	ld hl,(0ec83h)		;b601
	ret			;b604
L_B605:
	ld l,a			;b605
	ld a,(0ec80h)		;b606
	cp 006h		;b609
	jr nz,L_B615		;b60b
	ld a,l			;b60d
	dec a			;b60e
	jr nz,L_B615		;b60f
	ld hl,(0ec99h)		;b611
	ret			;b614
L_B615:
	ld hl,(0ec85h)		;b615
	ret			;b618
L_B619:
	ld a,03ch		;b619
	ld (0e642h),a		;b61b
	ld (0e638h),a		;b61e
	ld a,(0ec80h)		;b621
	ld (ix+000h),000h		;b624
	cp 006h		;b628
	jr z,L_B642		;b62a
	ld e,(ix+003h)		;b62c
	ld a,(ix+004h)		;b62f
	inc a			;b632
	jr nz,L_B636		;b633
	ld e,a			;b635
L_B636:
	ld d,(ix+005h)		;b636
	ld a,(ix+006h)		;b639
	dec a			;b63c
	jr nz,L_B640		;b63d
	ld d,a			;b63f
L_B640:
	jr L_B648		;b640
L_B642:
	ld e,(ix+017h)		;b642
	ld d,(ix+019h)		;b645
L_B648:
	jp 08ec6h		;b648
L_B64B:
	ld a,(hl)			;b64b
	inc hl			;b64c
	and a			;b64d
	jr z,L_B656		;b64e
	ld de,0ec9bh		;b650
	call L_B65D		;b653
L_B656:
	ld a,(hl)			;b656
	inc hl			;b657
	and a			;b658
	ret z			;b659
	ld de,0ecb3h		;b65a
L_B65D:
	ld b,a			;b65d
L_B65E:
	ld a,(hl)			;b65e
	exx			;b65f
	ld b,a			;b660
	exx			;b661
	inc hl			;b662
	ld a,(hl)			;b663
	inc hl			;b664
	exx			;b665
	ld c,a			;b666
	call L_B601		;b667
	ld d,000h		;b66a
	bit 0,c		;b66c
	jr z,L_B672		;b66e
	inc d			;b670
	dec c			;b671
L_B672:
	ld e,c			;b672
	add hl,de			;b673
	ld a,l			;b674
	call L_B687		;b675
	exx			;b678
	call L_B615		;b679
	ld e,b			;b67c
	call L_B5C2		;b67d
	add hl,de			;b680
	call L_B687		;b681
	djnz L_B65E		;b684
	ret			;b686
L_B687:
	ld a,l			;b687
	exx			;b688
	ld (de),a			;b689
	inc e			;b68a
	exx			;b68b
	ld a,h			;b68c
	exx			;b68d
	ld (de),a			;b68e
	inc e			;b68f
	ret			;b690
L_B691:
	ld de,0ece4h		;b691
	jr $+10		;b694

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb696..0xb69b  (5 bytes)
DATA_B696:
	defb 011h,0e9h,0ech,018h,003h	; b696

; ======================================================================
; CODIGO 0xb69b..0xb8ba  (543 bytes)
; ======================================================================


L_B69B:
	ld de,0ecefh		;b69b
L_B69E:
	ld b,000h		;b69e
	ldir		;b6a0
	ret			;b6a2
L_B6A3:
	ld a,(0ec80h)		;b6a3
	and a			;b6a6
	ret			;b6a7
L_B6A8:
	push af			;b6a8
	call L_B6AE		;b6a9
	pop af			;b6ac
	ret			;b6ad
L_B6AE:
	ld a,(0ec80h)		;b6ae
	cp 006h		;b6b1
	jr z,L_B6D0		;b6b3
	cp 003h		;b6b5
	jr z,L_B6C8		;b6b7
	cp 004h		;b6b9
	jr z,L_B6E2		;b6bb
	cp 007h		;b6bd
	jr nc,L_B6E2		;b6bf
	call L_B710		;b6c1
	ret c			;b6c4
	jp 05027h		;b6c5
L_B6C8:
	ld hl,0ece3h		;b6c8
	exx			;b6cb
	ld b,003h		;b6cc
	jr L_B6DE		;b6ce
L_B6D0:
	ld hl,0ece3h		;b6d0
	exx			;b6d3
	ld a,(0e641h)		;b6d4
	cp 002h		;b6d7
	ld b,005h		;b6d9
	jr c,L_B6DE		;b6db
	inc b			;b6dd
L_B6DE:
	ld c,006h		;b6de
	jr L_B6F6		;b6e0
L_B6E2:
	call L_B710		;b6e2
	ret c			;b6e5
	jp 04feah		;b6e6
L_B6E9:
	ld hl,0ecefh		;b6e9
	exx			;b6ec
	ld c,036h		;b6ed
	jr L_B6F6		;b6ef
L_B6F1:
	exx			;b6f1
	ld c,026h		;b6f2
	jr L_B709		;b6f4
L_B6F6:
	push bc			;b6f6
	exx			;b6f7
	push hl			;b6f8
	call L_B707		;b6f9
	pop hl			;b6fc
	inc hl			;b6fd
	exx			;b6fe
	pop bc			;b6ff
	inc c			;b700
	inc c			;b701
	inc c			;b702
	inc c			;b703
	djnz L_B6F6		;b704
	ret			;b706
L_B707:
	ld a,(hl)			;b707
	exx			;b708
L_B709:
	call L_B716		;b709
	ret c			;b70c
L_B70D:
	jp 05027h		;b70d
L_B710:
	ld a,(0ece3h)		;b710
	exx			;b713
	ld c,006h		;b714
L_B716:
	exx			;b716
	ld de,06079h		;b717
	call 04e21h		;b71a
	ex de,hl			;b71d
L_B71E:
	ld a,(hl)			;b71e
	ld (0f001h),a		;b71f
	ld c,a			;b722
	inc hl			;b723
	ld b,(hl)			;b724
	inc hl			;b725
	ex de,hl			;b726
	exx			;b727
	ld hl,0ec80h		;b728
	ld b,000h		;b72b
	add hl,bc			;b72d
	ld d,(hl)			;b72e
	dec hl			;b72f
	ld e,(hl)			;b730
	dec hl			;b731
	ld a,(hl)			;b732
	exx			;b733
	ld h,a			;b734
	exx			;b735
	dec hl			;b736
	ld a,(hl)			;b737
	exx			;b738
	ld l,a			;b739
L_B73A:
	ld a,h			;b73a
	and a			;b73b
	jr z,L_B76C		;b73c
	inc a			;b73e
	scf			;b73f
	ret nz			;b740
	ld a,l			;b741
	neg		;b742
	rra			;b744
	rra			;b745
	rra			;b746
	and 01fh		;b747
	sub c			;b749
	ccf			;b74a
	ret c			;b74b
	ret z			;b74c
	neg		;b74d
	ld c,a			;b74f
	push bc			;b750
	ld a,(0f001h)		;b751
	sub c			;b754
	ld c,a			;b755
	ld a,b			;b756
	ld b,c			;b757
	ld c,a			;b758
L_B759:
	ld a,c			;b759
	call 040c9h		;b75a
	djnz L_B759		;b75d
	pop bc			;b75f
	ld a,c			;b760
	cp 015h		;b761
	jr c,L_B767		;b763
	ld c,015h		;b765
L_B767:
	ld hl,00000h		;b767
	or a			;b76a
	ret			;b76b
L_B76C:
	ld a,l			;b76c
	sub 0a8h		;b76d
	ccf			;b76f
	ret c			;b770
	ret z			;b771
	neg		;b772
	rra			;b774
	rra			;b775
	rra			;b776
	and 01fh		;b777
	cp c			;b779
	ret nc			;b77a
	ld c,a			;b77b
	or a			;b77c
	ret			;b77d
L_B77E:
	exx			;b77e
	ld c,01eh		;b77f
	exx			;b781
	ld hl,0ecf4h		;b782
	ld a,(hl)			;b785
	inc l			;b786
	add a,b			;b787
	dec a			;b788
L_B789:
	sub b			;b789
	jr c,L_B792		;b78a
	jp m,L_B792		;b78c
	inc c			;b78f
	jr L_B789		;b790
L_B792:
	ld a,c			;b792
	ld de,06079h		;b793
	call 04e21h		;b796
	ld b,002h		;b799
	ld c,b			;b79b
	ld hl,0c400h		;b79c
	ld (hl),b			;b79f
	inc l			;b7a0
	ld (hl),c			;b7a1
	inc l			;b7a2
	ex de,hl			;b7a3
L_B7A4:
	push bc			;b7a4
	ld b,000h		;b7a5
	ldir		;b7a7
	pop bc			;b7a9
	djnz L_B7A4		;b7aa
L_B7AC:
	ld hl,0c400h		;b7ac
	call L_B71E		;b7af
	ret c			;b7b2
	jp 05027h		;b7b3
L_B7B6:
	ld hl,0ece9h		;b7b6
	ld (0c509h),hl		;b7b9
	ld hl,0ecf4h		;b7bc
	ld c,01eh		;b7bf
L_B7C1:
	ld (0c507h),a		;b7c1
	ld a,e			;b7c4
	ld (0c500h),a		;b7c5
	exx			;b7c8
	ld a,e			;b7c9
	ld (0c501h),a		;b7ca
	ld a,b			;b7cd
	ld (0c502h),a		;b7ce
	ld a,d			;b7d1
	ld de,06079h		;b7d2
	call 04e21h		;b7d5
	ld a,(de)			;b7d8
	ld l,a			;b7d9
	inc de			;b7da
	ld a,(de)			;b7db
	ld h,a			;b7dc
	ld (0c503h),hl		;b7dd
	inc de			;b7e0
	ex de,hl			;b7e1
	ld (0c505h),hl		;b7e2
	exx			;b7e5
L_B7E6:
	exx			;b7e6
	xor a			;b7e7
	ld (0f012h),a		;b7e8
	ld a,(0c507h)		;b7eb
	ld hl,0b8bah		;b7ee
	call 04e28h		;b7f1
	ld hl,0c400h		;b7f4
	ld (hl),e			;b7f7
	inc l			;b7f8
	ld (hl),d			;b7f9
	inc l			;b7fa
	ld a,(0c500h)		;b7fb
	and a			;b7fe
	jr z,L_B808		;b7ff
	ld a,(0c502h)		;b801
	dec a			;b804
	call 040c4h		;b805
L_B808:
	exx			;b808
	ld a,(hl)			;b809
	inc l			;b80a
	exx			;b80b
	push af			;b80c
	ld a,(0c501h)		;b80d
	ld e,a			;b810
	pop af			;b811
	add a,e			;b812
	dec a			;b813
L_B814:
	sub e			;b814
	jr c,L_B823		;b815
	jp m,L_B823		;b817
	push af			;b81a
	push de			;b81b
	call L_B884		;b81c
	pop de			;b81f
	pop af			;b820
	jr L_B814		;b821
L_B823:
	ld a,(0f012h)		;b823
	ld b,a			;b826
	ld a,(0c502h)		;b827
	sub b			;b82a
	push af			;b82b
	call L_B872		;b82c
	pop af			;b82f
	call nz,L_B845		;b830
	exx			;b833
	push bc			;b834
	push hl			;b835
	exx			;b836
	call L_B7AC		;b837
	exx			;b83a
	pop hl			;b83b
	pop bc			;b83c
	inc c			;b83d
	inc c			;b83e
	inc c			;b83f
	inc c			;b840
	djnz L_B7E6		;b841
	exx			;b843
	ret			;b844
L_B845:
	ld e,a			;b845
	ld a,(0c500h)		;b846
	and a			;b849
	jr z,L_B864		;b84a
	ld a,(0c503h)		;b84c
	ld d,a			;b84f
	ld hl,0c402h		;b850
L_B853:
	ld b,e			;b853
L_B854:
	ld (hl),000h		;b854
	inc l			;b856
	djnz L_B854		;b857
	ld a,(0c502h)		;b859
	sub e			;b85c
	call 040c4h		;b85d
	dec d			;b860
	jr nz,L_B853		;b861
	ret			;b863
L_B864:
	ld a,(0c504h)		;b864
	ld d,a			;b867
L_B868:
	ld b,d			;b868
L_B869:
	ld (hl),000h		;b869
	inc l			;b86b
	djnz L_B869		;b86c
	dec e			;b86e
	jr nz,L_B868		;b86f
	ret			;b871
L_B872:
	ld e,a			;b872
	ld a,(0ec80h)		;b873
	cp 006h		;b876
	ret nz			;b878
	push hl			;b879
	ld hl,(0c509h)		;b87a
	ld (hl),e			;b87d
	inc l			;b87e
	ld (0c509h),hl		;b87f
	pop hl			;b882
	ret			;b883
L_B884:
	ld (0f016h),hl		;b884
	ex de,hl			;b887
	ld a,(0c503h)		;b888
	ld b,a			;b88b
	ld a,(0c504h)		;b88c
	ld c,a			;b88f
	ld hl,(0c505h)		;b890
L_B893:
	push bc			;b893
	ld b,000h		;b894
	ldir		;b896
	pop bc			;b898
	ld a,(0c500h)		;b899
	and a			;b89c
	jr z,L_B8A6		;b89d
	ld a,(0c502h)		;b89f
	dec a			;b8a2
	call 040c9h		;b8a3
L_B8A6:
	djnz L_B893		;b8a6
	ld a,(0f012h)		;b8a8
	inc a			;b8ab
	ld (0f012h),a		;b8ac
	ex de,hl			;b8af
	ld a,(0c500h)		;b8b0
	and a			;b8b3
	ret z			;b8b4
	ld hl,(0f016h)		;b8b5
	dec l			;b8b8
	ret			;b8b9

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb8ba..0xb8c2  (8 bytes)
DATA_B8BA:
	defb 002h,006h,002h,002h,004h,002h,005h,003h	; b8ba  ........

; ======================================================================
; CODIGO 0xb8c2..0xb9b4  (242 bytes)
; ======================================================================


L_B8C2:
	ld (ix+029h),000h		;b8c2
	res 2,(ix+010h)		;b8c6
	ld (ix+014h),001h		;b8ca
	ld (ix+013h),001h		;b8ce
	ld (ix+002h),001h		;b8d2
	ret			;b8d6
L_B8D7:
	ld de,0b9f9h		;b8d7
	ld hl,02080h		;b8da
	ld bc,00068h		;b8dd
	call 04cc1h		;b8e0
	ld de,0ba61h		;b8e3
	ld hl,02100h		;b8e6
	ld bc,000d8h		;b8e9
	call 04cc1h		;b8ec
	ld a,0f0h		;b8ef
	ld hl,00080h		;b8f1
	ld bc,00158h		;b8f4
	jp 04cd4h		;b8f7
L_B8FA:
	ld de,0ba61h		;b8fa
	ld hl,02200h		;b8fd
	ld bc,000d8h		;b900
	call 04cc1h		;b903
	ld a,090h		;b906
	ld hl,00200h		;b908
	ld bc,000d8h		;b90b
	jp 04cd4h		;b90e
L_B911:
	ld de,0b9f9h		;b911
	ld hl,02080h		;b914
	ld bc,00068h		;b917
	call 04cbdh		;b91a
	ld de,0ba61h		;b91d
	ld hl,02100h		;b920
	ld bc,000d8h		;b923
	call 04cbdh		;b926
	ld a,0f0h		;b929
	ld hl,00080h		;b92b
	ld bc,00158h		;b92e
	call 00056h		;b931   ; BIOS FILVRM - Fills VRAM with value
	ld de,0b9f9h		;b934
	ld hl,02880h		;b937
	ld bc,00068h		;b93a
	call 04cbdh		;b93d
	ld de,0ba61h		;b940
	ld hl,02900h		;b943
	ld bc,000d8h		;b946
	call 04cbdh		;b949
	ld a,0f0h		;b94c
	ld hl,00880h		;b94e
	ld bc,00158h		;b951
	jp 00056h		;b954   ; BIOS FILVRM - Fills VRAM with value
L_B957:
	ld hl,01008h		;b957
	ld bc,00050h		;b95a
	ld a,0f0h		;b95d
	call 00056h		;b95f   ; BIOS FILVRM - Fills VRAM with value
	ld hl,00080h		;b962
	ld bc,00050h		;b965
	ld a,0f0h		;b968
	call 00056h		;b96a   ; BIOS FILVRM - Fills VRAM with value
	ld hl,00880h		;b96d
	ld bc,00050h		;b970
	ld a,0f0h		;b973
	call 00056h		;b975   ; BIOS FILVRM - Fills VRAM with value
	ld de,0b9f9h		;b978
	ld hl,03008h		;b97b
	ld bc,00050h		;b97e
	call 04cbdh		;b981
	ld de,0b9b4h		;b984
	ld hl,02080h		;b987
	call L_B993		;b98a
	ld de,0b9b4h		;b98d
	ld hl,02880h		;b990
L_B993:
	push de			;b993
	call 04cb1h		;b994
	exx			;b997
	pop hl			;b998
L_B999:
	ld a,(hl)			;b999
	inc hl			;b99a
	and a			;b99b
	ret z			;b99c
	push hl			;b99d
	ld l,a			;b99e
	ld h,000h		;b99f
	add hl,hl			;b9a1
	add hl,hl			;b9a2
	add hl,hl			;b9a3
	ld de,0b9f9h		;b9a4
	add hl,de			;b9a7
	ex de,hl			;b9a8
	pop hl			;b9a9
	ld b,008h		;b9aa
L_B9AC:
	ld a,(de)			;b9ac
	inc de			;b9ad
	out (c),a		;b9ae
	djnz L_B9AC		;b9b0
	jr L_B999		;b9b2

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb9b4..0xb9bf  (11 bytes)
DATA_B9B4:
	defb 001h,002h,010h,00eh,01dh,021h,022h,01fh,012h,011h,000h	; b9b4  .....!"....

; ======================================================================
; CODIGO 0xb9bf..0xb9f9  (58 bytes)
; ======================================================================


L_B9BF:
	ld de,0b9f9h		;b9bf
	ld hl,(0f010h)		;b9c2
	ld a,070h		;b9c5
	call 040c4h		;b9c7
	ld bc,00050h		;b9ca
	call 04cbdh		;b9cd
	ld de,0ba69h		;b9d0
	ld hl,(0f010h)		;b9d3
	ld a,0c0h		;b9d6
	call 040c4h		;b9d8
	ld bc,000d8h		;b9db
	jp 04cbdh		;b9de
L_B9E1:
	ld hl,02070h		;b9e1
	ld de,0b9f9h		;b9e4
	ld bc,00050h		;b9e7
	call 04cc1h		;b9ea
	ld hl,020c0h		;b9ed
	ld de,0ba69h		;b9f0
	ld bc,000d0h		;b9f3
	jp 04cc1h		;b9f6

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb9f9..0xbb39  (320 bytes)
DATA_B9F9:
	defb 000h,01ch,022h,063h,063h,063h,022h,01ch,000h,018h,038h,018h,018h,018h,018h,07eh	; b9f9  .."ccc"...8....~
	defb 000h,03eh,063h,003h,00eh,03ch,070h,07fh,000h,03eh,063h,003h,00eh,003h,063h,03eh	; ba09  .>c..<p..>c...c>
	defb 000h,00eh,01eh,036h,066h,066h,07fh,006h,000h,07fh,060h,07eh,063h,003h,063h,03eh	; ba19  ...6ff....`~c.c>
	defb 000h,03eh,063h,060h,07eh,063h,063h,03eh,000h,07fh,063h,006h,00ch,018h,018h,018h	; ba29  .>c`~cc>..c.....
	defb 000h,03eh,063h,063h,03eh,063h,063h,03eh,000h,03eh,063h,063h,03fh,003h,063h,03eh	; ba39  .>cc>cc>.>cc?.c>
	defb 03ch,042h,099h,0a1h,0a1h,099h,042h,03ch,030h,03ch,03fh,0ffh,03fh,07fh,01ch,00fh	; ba49  <B....B<0<?.?...
	defb 000h,000h,0c0h,0feh,0e0h,000h,000h,000h,000h,000h,000h,000h,07eh,000h,000h,000h	; ba59  ............~...
	defb 000h,01ch,036h,063h,063h,07fh,063h,063h,000h,07eh,063h,063h,07eh,063h,063h,07eh	; ba69  ..6cc.cc.~cc~cc~
	defb 000h,03eh,063h,060h,060h,060h,063h,03eh,000h,07ch,066h,063h,063h,063h,066h,07ch	; ba79  .>c```c>.|fcccf|
	defb 000h,07fh,060h,060h,07eh,060h,060h,07fh,000h,07fh,060h,060h,07eh,060h,060h,060h	; ba89  ..``~``...``~```
	defb 000h,03eh,063h,060h,067h,063h,063h,03fh,000h,063h,063h,063h,07fh,063h,063h,063h	; ba99  .>c`gcc?.ccc.ccc
	defb 000h,03ch,018h,018h,018h,018h,018h,03ch,000h,01fh,006h,006h,006h,006h,066h,03ch	; baa9  .<.....<......f<
	defb 000h,063h,066h,06ch,078h,07ch,06eh,067h,000h,060h,060h,060h,060h,060h,060h,07fh	; bab9  .cflx|ng.``````.
	defb 000h,063h,077h,07fh,07fh,06bh,063h,063h,000h,063h,073h,07bh,07fh,06fh,067h,063h	; bac9  .cw..kcc.cs{.ogc
	defb 000h,03eh,063h,063h,063h,063h,063h,03eh,000h,07eh,063h,063h,063h,07eh,060h,060h	; bad9  .>ccccc>.~ccc~``
	defb 000h,03eh,063h,063h,063h,06fh,066h,03dh,000h,07eh,063h,063h,062h,07ch,066h,063h	; bae9  .>cccof=.~ccb|fc
	defb 000h,03eh,063h,060h,03eh,003h,063h,03eh,000h,07eh,018h,018h,018h,018h,018h,018h	; baf9  .>c`>.c>.~......
	defb 000h,063h,063h,063h,063h,063h,063h,03eh,000h,063h,063h,063h,063h,036h,01ch,008h	; bb09  .cccccc>.cccc6..
	defb 000h,063h,063h,06bh,06bh,07fh,077h,022h,000h,063h,076h,03ch,01ch,01eh,037h,063h	; bb19  .cckk.w".cv<..7c
	defb 000h,066h,066h,07eh,03ch,018h,018h,018h,000h,07fh,007h,00eh,01ch,038h,070h,07fh	; bb29  .ff~<........8p.

; ======================================================================
; CODIGO 0xbb39..0xbbd6  (157 bytes)
; ======================================================================


L_BB39:
	ld a,(0e301h)		;bb39
	cp 004h		;bb3c
	ret nz			;bb3e
	call L_BB5B		;bb3f
	jr z,L_BB39		;bb42
	ret c			;bb44
	ld hl,0e66bh		;bb45
	inc (hl)			;bb48
	jr L_BB39		;bb49
L_BB4B:
	ld a,(0e301h)		;bb4b
	cp 004h		;bb4e
	ret nz			;bb50
	ld a,(0e627h)		;bb51
	or a			;bb54
	ret z			;bb55
	ld a,0f8h		;bb56
	ld (0f004h),a		;bb58
L_BB5B:
	ld hl,0bbd6h		;bb5b
	ld a,(0e66bh)		;bb5e
	call 04e28h		;bb61
	ld hl,(0e302h)		;bb64
	rst 20h			;bb67
	ret nz			;bb68
	ld hl,0e66bh		;bb69
	inc (hl)			;bb6c
	xor a			;bb6d
	ld hl,0eb80h		;bb6e
	cp (hl)			;bb71
	jr z,L_BB79		;bb72
	ld hl,0eb90h		;bb74
	cp (hl)			;bb77
	ret nz			;bb78
L_BB79:
	call 04e58h		;bb79
	and 003h		;bb7c
	cp 003h		;bb7e
	jr c,L_BB83		;bb80
	xor a			;bb82
L_BB83:
	add a,a			;bb83
	add a,a			;bb84
	add a,a			;bb85
	add a,a			;bb86
	add a,a			;bb87
	add a,028h		;bb88
	ld c,a			;bb8a
	ld a,(0f004h)		;bb8b
	cp 0d9h		;bb8e
	ld de,00205h		;bb90
	jr c,L_BB9F		;bb93
	ld d,001h		;bb95
	neg		;bb97
	rra			;bb99
	rra			;bb9a
	rra			;bb9b
	and 00fh		;bb9c
	ld e,a			;bb9e
L_BB9F:
	ld (hl),d			;bb9f
	inc l			;bba0
	ld (hl),018h		;bba1
	inc l			;bba3
	ld a,018h		;bba4
	add a,c			;bba6
	ld (hl),a			;bba7
	inc l			;bba8
	ld (hl),c			;bba9
	inc l			;bbaa
	ld a,(0f004h)		;bbab
	ld (hl),a			;bbae
	inc l			;bbaf
	ld (hl),e			;bbb0
	inc l			;bbb1
	ld a,e			;bbb2
	add a,a			;bbb3
	add a,a			;bbb4
	add a,a			;bbb5
	ld (hl),a			;bbb6
	inc l			;bbb7
	ld (hl),000h		;bbb8
	inc l			;bbba
	sub 008h		;bbbb
	ld (hl),a			;bbbd
	inc l			;bbbe
	ld a,c			;bbbf
	sub 018h		;bbc0
	ld (hl),a			;bbc2
	inc l			;bbc3
	add a,018h		;bbc4
	ld c,a			;bbc6
	ld a,078h		;bbc7
	sub c			;bbc9
	ld (hl),a			;bbca
	inc l			;bbcb
	ld (hl),020h		;bbcc
	inc l			;bbce
	ld (hl),008h		;bbcf
	inc l			;bbd1
	ld (hl),002h		;bbd2
	xor a			;bbd4
	ret			;bbd5

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbbd6..0xbbe2  (12 bytes)
DATA_BBD6:
	defb 0e8h,001h,0f6h,001h,004h,002h,012h,002h,020h,002h,0ffh,0ffh	; bbd6  ........ ...

; ======================================================================
; CODIGO 0xbbe2..0xbd29  (327 bytes)
; ======================================================================


L_BBE2:
	ld a,(0e301h)		;bbe2
	cp 004h		;bbe5
	ret nz			;bbe7
	ld ix,0eb80h		;bbe8
	call L_BBF3		;bbec
	ld ix,0eb90h		;bbef
L_BBF3:
	ld a,(ix+000h)		;bbf3
	or a			;bbf6
	ret z			;bbf7
	call L_BC1D		;bbf8
	ret c			;bbfb
	dec (ix+00dh)		;bbfc
	jr nz,L_BC08		;bbff
	ld (ix+00dh),002h		;bc01
	call L_BC22		;bc05
L_BC08:
	call L_BD20		;bc08
	add a,a			;bc0b
	add a,a			;bc0c
	add a,a			;bc0d
	ld (ix+007h),a		;bc0e
	ld c,a			;bc11
	ld a,(ix+006h)		;bc12
	sub c			;bc15
	jr nc,L_BC19		;bc16
	xor a			;bc18
L_BC19:
	ld (ix+008h),a		;bc19
	ret			;bc1c
L_BC1D:
	ld a,(0e627h)		;bc1d
	or a			;bc20
	ret z			;bc21
L_BC22:
	ld a,(ix+004h)		;bc22
	sub 008h		;bc25
	jr c,L_BC47		;bc27
	ld (ix+004h),a		;bc29
	cp 0e0h		;bc2c
	jr nc,L_BC3D		;bc2e
	ld (ix+000h),002h		;bc30
	ld (ix+005h),005h		;bc34
	ld a,040h		;bc38
	jp L_BC56		;bc3a
L_BC3D:
	ld (ix+000h),001h		;bc3d
	inc (ix+005h)		;bc41
	jp L_BC50		;bc44
L_BC47:
	ld (ix+000h),003h		;bc47
	dec (ix+005h)		;bc4b
	jr z,L_BC5B		;bc4e
L_BC50:
	ld a,(ix+005h)		;bc50
	add a,a			;bc53
	add a,a			;bc54
	add a,a			;bc55
L_BC56:
	ld (ix+006h),a		;bc56
	or a			;bc59
	ret			;bc5a
L_BC5B:
	ld (ix+000h),000h		;bc5b
	scf			;bc5f
	ret			;bc60
L_BC61:
	ld a,(0e301h)		;bc61
	cp 004h		;bc64
	ret nz			;bc66
	ld ix,0eb80h		;bc67
	call L_BC72		;bc6b
	ld ix,0eb90h		;bc6e
L_BC72:
	ld a,(ix+000h)		;bc72
	or a			;bc75
	ret z			;bc76
	call L_BCD7		;bc77
	ld l,(ix+003h)		;bc7a
	ld h,(ix+004h)		;bc7d
	call 05a99h		;bc80
	push hl			;bc83
	call L_BD20		;bc84
	ld hl,0bd29h		;bc87
	call 04e31h		;bc8a
	pop de			;bc8d
	ld a,003h		;bc8e
L_BC90:
	ld (0f000h),a		;bc90
	ld a,(ix+000h)		;bc93
	sub 002h		;bc96
	jr z,L_BCC4		;bc98
	jp p,L_BCB8		;bc9a
L_BC9D:
	ld c,(ix+005h)		;bc9d
	ld a,(0f000h)		;bca0
	ld b,a			;bca3
L_BCA4:
	push bc			;bca4
	push hl			;bca5
	push de			;bca6
	ld b,000h		;bca7
	ldir		;bca9
	pop hl			;bcab
	ld c,040h		;bcac
	add hl,bc			;bcae
	ex de,hl			;bcaf
	pop hl			;bcb0
	ld c,005h		;bcb1
	add hl,bc			;bcb3
	pop bc			;bcb4
	djnz L_BCA4		;bcb5
	ret			;bcb7
L_BCB8:
	ld a,005h		;bcb8
	sub (ix+005h)		;bcba
	ld c,a			;bcbd
	ld b,000h		;bcbe
	add hl,bc			;bcc0
	jp L_BC9D		;bcc1
L_BCC4:
	ld a,(0f000h)		;bcc4
	ld b,a			;bcc7
L_BCC8:
	push bc			;bcc8
	ld bc,00005h		;bcc9
	ldir		;bccc
	ld a,03bh		;bcce
	call 040c9h		;bcd0
	pop bc			;bcd3
	djnz L_BCC8		;bcd4
	ret			;bcd6
L_BCD7:
	ld l,018h		;bcd7
	ld h,(ix+004h)		;bcd9
	call 05a99h		;bcdc
	ld (ix+00eh),l		;bcdf
	ld (ix+00fh),h		;bce2
	ex de,hl			;bce5
	ld hl,0bd7eh		;bce6
	ld a,00fh		;bce9
	jp L_BC90		;bceb
L_BCEE:
	ld a,(0e301h)		;bcee
	cp 004h		;bcf1
	ret nz			;bcf3
	ld ix,0eb80h		;bcf4
	call L_BCFF		;bcf8
	ld ix,0eb90h		;bcfb
L_BCFF:
	ld a,(ix+000h)		;bcff
	or a			;bd02
	ret z			;bd03
	ld l,(ix+00eh)		;bd04
	ld h,(ix+00fh)		;bd07
	ld c,00fh		;bd0a
L_BD0C:
	ld b,(ix+005h)		;bd0c
L_BD0F:
	ld (hl),000h		;bd0f
	inc hl			;bd11
	djnz L_BD0F		;bd12
	ld a,040h		;bd14
	sub (ix+005h)		;bd16
	call 040c4h		;bd19
	dec c			;bd1c
	jr nz,L_BD0C		;bd1d
	ret			;bd1f
L_BD20:
	ld a,008h		;bd20
	sub (ix+00ch)		;bd22
	rra			;bd25
	and 00fh		;bd26
	ret			;bd28

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbd29..0xbdc9  (160 bytes)
DATA_BD29:
	defb 033h,0bdh,042h,0bdh,051h,0bdh,060h,0bdh,06fh,0bdh,000h,0cfh,0cfh,0cfh,0cfh,000h	; bd29  3.B.Q.`.o.......
	defb 0d0h,0d0h,0d0h,0d0h,000h,0d2h,0d2h,0d2h,0d2h,000h,000h,0cfh,0cfh,0cfh,000h,000h	; bd39  ................
	defb 0d0h,0d0h,0d0h,000h,000h,0d2h,0d2h,0d2h,000h,000h,000h,0cfh,0cfh,000h,000h,000h	; bd49  ................
	defb 0d0h,0d0h,000h,000h,000h,0d2h,0d2h,000h,000h,000h,000h,0cfh,000h,000h,000h,000h	; bd59  ................
	defb 0d0h,000h,000h,000h,000h,0d2h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bd69  ................
	defb 000h,000h,000h,000h,000h,000h,07dh,056h,057h,055h,0d1h,064h,05dh,05ch,05fh,055h	; bd79  ......}VWU.d]\_U
	defb 05ah,066h,053h,055h,055h,076h,082h,053h,055h,0d1h,077h,079h,078h,07bh,000h,067h	; bd89  ZfSUUv.SU.wyx{.g
	defb 07eh,087h,055h,000h,000h,0d1h,05ah,055h,000h,055h,055h,053h,000h,000h,000h,0d1h	; bd99  ~.U...ZU.UUS....
	defb 076h,055h,000h,083h,062h,06bh,055h,0d1h,05bh,05dh,05ch,05fh,055h,05ah,066h,053h	; bda9  vU..bkU.[]\_UZfS
	defb 055h,055h,076h,082h,053h,055h,0d1h,080h,079h,078h,07bh,000h,061h,072h,073h,055h	; bdb9  UUv.SU..yx{.arsU

; ======================================================================
; CODIGO 0xbdc9..0xbeb8  (239 bytes)
; ======================================================================


L_BDC9:
	call 07ad2h		;bdc9
	ret nz			;bdcc
	call 07af6h		;bdcd
	call L_BE09		;bdd0
	ld a,(ix+001h)		;bdd3
	dec a			;bdd6
	jr z,L_BDE7		;bdd7
	dec a			;bdd9
	ret z			;bdda
	dec (ix+002h)		;bddb
	ret nz			;bdde
	inc (ix+001h)		;bddf
L_BDE2:
	ld (ix+002h),010h		;bde2
	ret			;bde6
L_BDE7:
	dec (ix+002h)		;bde7
	ret nz			;bdea
	call L_BF98		;bdeb
	call L_BDE2		;bdee
	ld a,(ix+00ah)		;bdf1
	cp 004h		;bdf4
	ret nz			;bdf6
	jp L_BEDC		;bdf7
L_BDFA:
	ld c,004h		;bdfa
	ld a,(ix+00bh)		;bdfc
	and a			;bdff
	jr nz,L_BE03		;be00
	dec c			;be02
L_BE03:
	ld (ix+00dh),c		;be03
	call 07af6h		;be06
L_BE09:
	call 07ad2h		;be09
	ret nz			;be0c
	dec (ix+00ch)		;be0d
	ret nz			;be10
	call L_BE8B		;be11
	ld b,004h		;be14
L_BE16:
	ld a,(ix+00bh)		;be16
	ld e,0f8h		;be19
	and a			;be1b
	jr z,L_BE25		;be1c
	ld a,(ix+00ah)		;be1e
	add a,a			;be21
	add a,a			;be22
	add a,a			;be23
	ld e,a			;be24
L_BE25:
	ld a,(ix+004h)		;be25
	add a,e			;be28
	ld e,a			;be29
	ld a,(ix+006h)		;be2a
	add a,008h		;be2d
	ld d,a			;be2f
	ld c,000h		;be30
	ld a,(0e67ah)		;be32
	inc a			;be35
	ld (0e67ah),a		;be36
	and 00fh		;be39
	jr nz,L_BE3E		;be3b
	inc c			;be3d
L_BE3E:
	push bc			;be3e
	ld a,(ix+00bh)		;be3f
	rra			;be42
	rl b		;be43
	ld a,034h		;be45
	call 065b5h		;be47
	pop bc			;be4a
	djnz L_BE16		;be4b
	ret			;be4d
L_BE4E:
	ld (ix+002h),002h		;be4e
	ld (ix+00ah),002h		;be52
	ld a,(ix+00bh)		;be56
	and a			;be59
	ld b,006h		;be5a
	jr nz,L_BE60		;be5c
	ld b,007h		;be5e
L_BE60:
	jr L_BE74		;be60
L_BE62:
	ld (ix+002h),030h		;be62
	ld (ix+00ah),001h		;be66
	ld a,(ix+00bh)		;be6a
	and a			;be6d
	ld b,008h		;be6e
	jr nz,L_BE74		;be70
	ld b,00ch		;be72
L_BE74:
	ld (ix+00dh),0ffh		;be74
	ld (ix+007h),b		;be78
	ld b,007h		;be7b
	ld a,(0e305h)		;be7d
	jr z,L_BE84		;be80
	ld b,00ah		;be82
L_BE84:
	ld (ix+008h),b		;be84
	ld (ix+009h),004h		;be87
L_BE8B:
	ld b,010h		;be8b
	ld a,(0e305h)		;be8d
	and a			;be90
	jr nz,L_BEA6		;be91
	ld b,030h		;be93
	ld a,(0e320h)		;be95
	cp 002h		;be98
	jr nz,L_BEA6		;be9a
	ld a,(0e64fh)		;be9c
	srl a		;be9f
	ld c,a			;bea1
	ld a,020h		;bea2
	sub c			;bea4
	ld b,a			;bea5
L_BEA6:
	ld a,(ix+002h)		;bea6
	dec a			;bea9
	jr nz,L_BEAE		;beaa
	ld b,010h		;beac
L_BEAE:
	ld (ix+00ch),b		;beae
	ret			;beb1
L_BEB2:
	ld a,(ix+001h)		;beb2
	call 040ceh		;beb5

; ----------------------------------------------------------------------
; DATOS tabla_BEB8: 4 destinos del despachador p00:40CE (call en p11:BEB5, el
;   indice en A): BEC0, BECC, BEC0, BEE1; lo leen p11:BEB5 (8 bytes)
;   0xbeb8..0xbec0  (8 bytes)
DATA_tabla_BEB8:
	defw 0bec0h,0becch,0bec0h,0bee1h	; beb8  -> L_BEC0 L_BECC L_BEC0 L_BEE1

; ======================================================================
; CODIGO 0xbec0..0xbf0b  (75 bytes)
; ======================================================================


L_BEC0:
	dec (ix+002h)		;bec0
	ret nz			;bec3
L_BEC4:
	inc (ix+001h)		;bec4
L_BEC7:
	ld (ix+002h),002h		;bec7
	ret			;becb
L_BECC:
	dec (ix+002h)		;becc
	ret nz			;becf
	call L_BF98		;bed0
	call L_BEC7		;bed3
	ld a,(ix+00ah)		;bed6
	cp 00eh		;bed9
	ret nz			;bedb
L_BEDC:
	inc (ix+001h)		;bedc
	xor a			;bedf
	ret			;bee0
L_BEE1:
	dec (ix+002h)		;bee1
	ret nz			;bee4
	ld a,(ix+00bh)		;bee5
	and a			;bee8
	jr nz,L_BEF5		;bee9
	ld a,(ix+004h)		;beeb
	add a,008h		;beee
	ld (ix+004h),a		;bef0
	jr L_BEF5		;bef3
L_BEF5:
	dec (ix+00ah)		;bef5
	call L_BEC7		;bef8
	ld a,(ix+00ah)		;befb
	and a			;befe
	ret nz			;beff
L_BF00:
	ld (ix+001h),000h		;bf00
	ret			;bf04
L_BF05:
	ld a,(ix+001h)		;bf05
	call 040ceh		;bf08

; ----------------------------------------------------------------------
; DATOS tabla_BF0B: 5 destinos del despachador p00:40CE (call en p11:BF08, el
;   indice en A): BF15, BF20, BF69, BF84, BF8D; lo leen p11:BF08 (10 bytes)
;   0xbf0b..0xbf15  (10 bytes)
DATA_tabla_BF0B:
	defw 0bf15h,0bf20h,0bf69h,0bf84h,0bf8dh	; bf0b

; ======================================================================
; CODIGO 0xbf15..0xbfd6  (193 bytes)
; ======================================================================


L_BF15:
	call 07ad2h		;bf15
	ret nz			;bf18
	dec (ix+002h)		;bf19
	ret nz			;bf1c
	jp L_BEC4		;bf1d
L_BF20:
	dec (ix+002h)		;bf20
	ret nz			;bf23
	call L_BF98		;bf24
	call L_BEC7		;bf27
	ld a,(ix+00ah)		;bf2a
	cp 014h		;bf2d
	jr z,L_BF74		;bf2f
	ld l,(ix+004h)		;bf31
	ld h,(ix+003h)		;bf34
	ld a,(ix+00bh)		;bf37
	and a			;bf3a
	jr nz,L_BF40		;bf3b
	dec hl			;bf3d
	jr L_BF49		;bf3e
L_BF40:
	ld a,(ix+00ah)		;bf40
	add a,a			;bf43
	add a,a			;bf44
	add a,a			;bf45
	call 040c4h		;bf46
L_BF49:
	ld e,(ix+006h)		;bf49
	ld d,(ix+005h)		;bf4c
	call 05aadh		;bf4f
	ld b,006h		;bf52
L_BF54:
	call 07eeeh		;bf54
	jr c,L_BF5D		;bf57
	inc hl			;bf59
	djnz L_BF54		;bf5a
	ret			;bf5c
L_BF5D:
	ld a,014h		;bf5d
	sub (ix+00ah)		;bf5f
	ld (ix+00ch),a		;bf62
	inc (ix+001h)		;bf65
	ret			;bf68
L_BF69:
	dec (ix+002h)		;bf69
	ret nz			;bf6c
	call L_BEC7		;bf6d
	dec (ix+00ch)		;bf70
	ret nz			;bf73
L_BF74:
	ld a,(ix+00bh)		;bf74
	xor 001h		;bf77
	ld (ix+00bh),a		;bf79
	call L_BEDC		;bf7c
	ld (ix+001h),003h		;bf7f
	ret			;bf83
L_BF84:
	call L_BEE1		;bf84
	ret nz			;bf87
	ld (ix+001h),004h		;bf88
	ret			;bf8c
L_BF8D:
	dec (ix+002h)		;bf8d
	ret nz			;bf90
	ld (ix+002h),010h		;bf91
	jp L_BF00		;bf95
L_BF98:
	ld a,(ix+00bh)		;bf98
	and a			;bf9b
	jr nz,L_BFAE		;bf9c
	ld l,(ix+004h)		;bf9e
	ld h,(ix+003h)		;bfa1
	ld de,0fff8h		;bfa4
	add hl,de			;bfa7
	ld (ix+004h),l		;bfa8
	ld (ix+003h),h		;bfab
L_BFAE:
	ld a,(ix+000h)		;bfae
	cp 008h		;bfb1
	jr nz,L_BFB8		;bfb3
	inc (ix+007h)		;bfb5
L_BFB8:
	inc (ix+00ah)		;bfb8
	cp 008h		;bfbb
	ret nz			;bfbd
	ld hl,0bfd5h		;bfbe
	ld a,(ix+00bh)		;bfc1
	and a			;bfc4
	jr nz,L_BFCA		;bfc5
	ld hl,0bfd9h		;bfc7
L_BFCA:
	ld a,(ix+00ah)		;bfca
	call 05ad8h		;bfcd
	ld (ix+00dh),a		;bfd0
	jp 07af6h		;bfd3

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbfd6..0xbfde  (8 bytes)
DATA_BFD6:
	defb 0ffh,0ffh,005h,006h,0ffh,0ffh,003h,003h	; bfd6  ........

; ======================================================================
; CODIGO 0xbfde..0xbfef  (17 bytes)
; ======================================================================


L_BFDE:
	ld (ix+007h),01eh		;bfde
	ld (ix+002h),030h		;bfe2
	ld (ix+009h),006h		;bfe6
	ld (ix+00ah),000h		;bfea
	ret			;bfee

; ----------------------------------------------------------------------
; DATOS relleno_ff: 17 bytes a 0xFF hasta el final del banco: relleno; lo leen
;   nadie (17 bytes)
;   0xbfef..0xc000  (17 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfef  ................
	defb 0ffh	; bfff
