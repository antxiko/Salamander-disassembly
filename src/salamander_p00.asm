; ==========================================================================
; SALAMANDER - Konami (1987) - MSX - MegaROM RC-758 de 128 KB (Konami SCC) - banco 00 (se ejecuta en 0x4000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x04000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l5e52h:	equ 0x05e52

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4000..0x4030  (48 bytes)
DATA_4000:
	defb 041h,042h,0dah,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4000  AB.@............
	defb 043h,044h,007h,058h,008h,000h,0e2h,004h,001h,0e3h,006h,000h,0e3h,07ah,0e2h,075h	; 4010  CD.X.........z.u
	defb 0e2h,002h,0e2h,054h,040h,000h,000h,000h,080h,000h,000h,001h,0ffh,0ffh,000h,000h	; 4020  ...T@...........

; ======================================================================
; CODIGO 0x4030..0x4033  (3 bytes)
; ======================================================================


L_4030:
	jp L_4039		;4030

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4033..0x4039  (6 bytes)
DATA_4033:
	defb 0c3h,042h,040h,0c3h,04bh,040h	; 4033

; ======================================================================
; CODIGO 0x4039..0x4042  (9 bytes)
; ======================================================================


L_4039:
	call L_416E		;4039
	call 08263h		;403c
	jp L_4199		;403f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4042..0x4069  (39 bytes)
DATA_4042:
	defb 0cdh,06eh,041h,0cdh,0eeh,0a5h,0c3h,099h,041h,0cdh,06eh,041h,0cdh,008h,0a8h,0c3h	; 4042  .nA.....A.nA....
	defb 099h,041h,021h,001h,0e3h,07eh,0b7h,020h,002h,036h,001h,03ah,027h,0e2h,0b7h,0c8h	; 4052  .A!..~. .6.:'...
	defb 02ah,000h,0e3h,022h,080h,0e3h,0c9h	; 4062

; ======================================================================
; CODIGO 0x4069..0x416b  (258 bytes)
; ======================================================================


L_4069:
	call 0013eh		;4069   ; BIOS RDVDP - Reads VDP status register
	di			;406c
	ld hl,(0f0f7h)		;406d
	inc hl			;4070
	ld (0f0f7h),hl		;4071
	ld hl,0e23ah		;4074
	inc (hl)			;4077
	call L_4E7F		;4078
	ld hl,0e214h		;407b
	ld a,(hl)			;407e
	and a			;407f
	ld (hl),001h		;4080
	jp nz,L_40C2		;4082
	ld a,004h		;4085
	ld (07000h),a		;4087
	inc a			;408a
	ld (09000h),a		;408b
	inc a			;408e
	ld (0b000h),a		;408f
	call 06978h		;4092
	xor a			;4095
	ld (0e214h),a		;4096
	di			;4099
	ld a,(0f0f1h)		;409a
	ld (07000h),a		;409d
	ld a,(0f0f2h)		;40a0
	ld (09000h),a		;40a3
	ld a,(0f0f3h)		;40a6
	ld (0b000h),a		;40a9
	ld hl,0e205h		;40ac
	ld a,(hl)			;40af
	and a			;40b0
	jr nz,L_40C2		;40b1
	inc (hl)			;40b3
	ei			;40b4
	call L_51A7		;40b5
	call L_5208		;40b8
	call L_524C		;40bb
	xor a			;40be
	ld (0e205h),a		;40bf
L_40C2:
	ei			;40c2
	ret			;40c3
L_40C4:
	add a,l			;40c4
	ld l,a			;40c5
	ret nc			;40c6
	inc h			;40c7
	ret			;40c8
L_40C9:
	add a,e			;40c9
	ld e,a			;40ca
	ret nc			;40cb
	inc d			;40cc
	ret			;40cd
L_40CE:
	pop hl			;40ce
L_40CF:
	add a,a			;40cf
	add a,l			;40d0
	ld l,a			;40d1
	jr nc,L_40D5		;40d2
	inc h			;40d4
L_40D5:
	ld a,(hl)			;40d5
	inc hl			;40d6
	ld h,(hl)			;40d7
	ld l,a			;40d8
	jp (hl)			;40d9
L_40DA:
	di			;40da
	im 1		;40db
	ld a,0c3h		;40dd
	ld (0fd9ah),a		;40df
	ld hl,L_4069		;40e2
	ld (0fd9bh),hl		;40e5
	ld sp,0f0f0h		;40e8
	call L_412F		;40eb
	call L_414F		;40ee
	xor a			;40f1
	ld hl,0f0f0h		;40f2
	ld (05000h),a		;40f5
	ld (hl),a			;40f8
	inc hl			;40f9
	inc a			;40fa
	ld (07000h),a		;40fb
	ld (hl),a			;40fe
	inc hl			;40ff
	inc a			;4100
	ld (09000h),a		;4101
	ld (hl),a			;4104
	inc hl			;4105
	inc a			;4106
	ld (hl),a			;4107
	ld (0b000h),a		;4108
	ld hl,0e000h		;410b
	ld de,0e001h		;410e
	ld bc,00fffh		;4111
	xor a			;4114
	ld (hl),a			;4115
	ldir		;4116
	inc a			;4118
	ld (0e205h),a		;4119
	ld (0e206h),a		;411c
	call L_50D0		;411f
	call 0b599h		;4122
	xor a			;4125
	ld (0e205h),a		;4126
	call 0013eh		;4129   ; BIOS RDVDP - Reads VDP status register
	ei			;412c
L_412D:
	jr L_412D		;412d
L_412F:
	call 00138h		;412f   ; BIOS RSLREG - Reads the primary slot register
	rrca			;4132
	rrca			;4133
	and 003h		;4134
	ld c,a			;4136
	ld b,000h		;4137
	ld hl,0fcc1h		;4139
	add hl,bc			;413c
	ld a,(hl)			;413d
	and 080h		;413e
	or c			;4140
	ld c,a			;4141
	inc hl			;4142
	inc hl			;4143
	inc hl			;4144
	inc hl			;4145
	ld a,(hl)			;4146
	and 00ch		;4147
	or c			;4149
	ld h,080h		;414a
	jp 00024h		;414c   ; BIOS ENASLT - Switches to specified slot and page definitively
L_414F:
	call 00138h		;414f   ; BIOS RSLREG - Reads the primary slot register
	rrca			;4152
	rrca			;4153
	and 003h		;4154
	ld c,a			;4156
	ld b,000h		;4157
	ld hl,0fcc1h		;4159
	add hl,bc			;415c
	or (hl)			;415d
	ld c,a			;415e
	inc hl			;415f
	inc hl			;4160
	inc hl			;4161
	inc hl			;4162
	ld a,(hl)			;4163
	and 00ch		;4164
	or c			;4166
	ld (0f0f6h),a		;4167
	ret			;416a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x416b..0x416e  (3 bytes)
DATA_416B:
	defb 0c3h,06eh,04dh	; 416b

; ======================================================================
; CODIGO 0x416e..0x4173  (5 bytes)
; ======================================================================


L_416E:
	push af			;416e
	ld a,001h		;416f
	jr $+15		;4171

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4173..0x4178  (5 bytes)
DATA_4173:
	defb 0f5h,03eh,004h,018h,008h	; 4173

; ======================================================================
; CODIGO 0x4178..0x41b0  (56 bytes)
; ======================================================================


L_4178:
	push af			;4178
	ld a,007h		;4179
	jr L_4180		;417b
L_417D:
	push af			;417d
	ld a,00dh		;417e
L_4180:
	di			;4180
	push hl			;4181
	ld hl,0f0f1h		;4182
	ld (07000h),a		;4185
	ld (hl),a			;4188
	inc a			;4189
	inc l			;418a
	ld (09000h),a		;418b
	ld (hl),a			;418e
	inc a			;418f
	inc l			;4190
	ld (0b000h),a		;4191
	ld (hl),a			;4194
	pop hl			;4195
	pop af			;4196
	ei			;4197
	ret			;4198
L_4199:
	di			;4199
	ld a,00ah		;419a
	ld (09000h),a		;419c
	ld (0f0f2h),a		;419f
	ld a,00fh		;41a2
	ld (0b000h),a		;41a4
	ld (0f0f3h),a		;41a7
	ei			;41aa
	ret			;41ab
L_41AC:
	ld a,00eh		;41ac
	jr $+4		;41ae

; ----------------------------------------------------------------------
; DATOS sin identificar  0x41b0..0x41b2  (2 bytes)
DATA_41B0:
	defb 03eh,00ah	; 41b0

; ======================================================================
; CODIGO 0x41b2..0x41d4  (34 bytes)
; ======================================================================


L_41B2:
	di			;41b2
	ld (09000h),a		;41b3
	ld (0f0f2h),a		;41b6
	ei			;41b9
	ret			;41ba
L_41BB:
	ld a,006h		;41bb
	jr L_41CD		;41bd
L_41BF:
	ld a,00bh		;41bf
	jr L_41CD		;41c1
L_41C3:
	ld a,00fh		;41c3
	jr L_41CD		;41c5
L_41C7:
	ld a,009h		;41c7
	jr L_41CD		;41c9
L_41CB:
	ld a,00ch		;41cb
L_41CD:
	di			;41cd
	jr $+20		;41ce
L_41D0:
	ld a,002h		;41d0
	jr $+8		;41d2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x41d4..0x41d8  (4 bytes)
DATA_41D4:
	defb 03eh,008h,018h,002h	; 41d4

; ======================================================================
; CODIGO 0x41d8..0x4868  (1680 bytes)
; ======================================================================


L_41D8:
	ld a,00eh		;41d8
L_41DA:
	di			;41da
	ld (09000h),a		;41db
	ld (0f0f2h),a		;41de
	inc a			;41e1
L_41E2:
	ld (0b000h),a		;41e2
	ld (0f0f3h),a		;41e5
	ei			;41e8
	ret			;41e9
L_41EA:
	ld a,001h		;41ea
	jr L_41F0		;41ec
L_41EE:
	ld a,007h		;41ee
L_41F0:
	di			;41f0
	ld (07000h),a		;41f1
	ld (0f0f1h),a		;41f4
	inc a			;41f7
	ld (09000h),a		;41f8
	ld (0f0f2h),a		;41fb
	ei			;41fe
	ret			;41ff
L_4200:
	call L_5EA7		;4200
	xor a			;4203
	ld (0e607h),a		;4204
	ld (0e608h),a		;4207
	ld (0e609h),a		;420a
	call L_5F69		;420d
	call L_41D8		;4210
	call 06055h		;4213
	call L_416E		;4216
	call L_4EAF		;4219
	call 08510h		;421c
	ld a,(0e21ah)		;421f
	and a			;4222
	ret nz			;4223
	call 08720h		;4224
	call L_41CB		;4227
	call 0a5ceh		;422a
	call L_41D0		;422d
	ld a,(0e6d0h)		;4230
	or a			;4233
	ret nz			;4234
	call L_417D		;4235
	call L_4959		;4238
	call L_416E		;423b
	call L_5C77		;423e
	call 08263h		;4241
	ld a,(0e213h)		;4244
	or a			;4247
	ret z			;4248
	call 08929h		;4249
	call 0a5eeh		;424c
	call 0a808h		;424f
	call 0a8b7h		;4252
	call 0a851h		;4255
	ld a,(0e6aah)		;4258
	or a			;425b
	jr nz,L_4267		;425c
	call 068a7h		;425e
	call 07436h		;4261
	call 06e99h		;4264
L_4267:
	call 08b61h		;4267
	call 07bf0h		;426a
	call L_41BF		;426d
	call 0bbe2h		;4270
	call 0bb4bh		;4273
	call L_41D0		;4276
	call 0794dh		;4279
	call 07963h		;427c
	call 077a1h		;427f
	call 09183h		;4282
	call L_41CB		;4285
	call 0a000h		;4288
	call L_41D0		;428b
	call 09c7bh		;428e
	call 06e76h		;4291
	call L_5B35		;4294
	ld a,(0e6aah)		;4297
	or a			;429a
	jr nz,L_42C4		;429b
	call 08fa0h		;429d
	call 09837h		;42a0
	call 09a1ah		;42a3
	call 09c43h		;42a6
	call 09c3bh		;42a9
	call 08bc8h		;42ac
	call 08d66h		;42af
	call 095cdh		;42b2
	call 095a5h		;42b5
	call 098d3h		;42b8
	call 09649h		;42bb
	call 09473h		;42be
	call 0996eh		;42c1
L_42C4:
	call 08b97h		;42c4
	call 062c2h		;42c7
	call L_41CB		;42ca
	call 0b7e2h		;42cd
	call L_416E		;42d0
	call L_41BF		;42d3
	call 0bc61h		;42d6
	call L_41D0		;42d9
	call 07f08h		;42dc
	call 07473h		;42df
	call 07c56h		;42e2
	ld a,(0e6aah)		;42e5
	or a			;42e8
	call z,07a9fh		;42e9
	call L_41CB		;42ec
	call 0bdfch		;42ef
	call 0bd67h		;42f2
	call L_41D0		;42f5
	call 08ef1h		;42f8
	call 091e1h		;42fb
	call L_41CB		;42fe
	call 0a1c2h		;4301
	call L_41BF		;4304
	call 0a0d0h		;4307
	call L_41D0		;430a
	call 0925ah		;430d
	call 0610ch		;4310
	call 060d4h		;4313
	call L_41BF		;4316
	call 0a000h		;4319
	call 0a06ah		;431c
	call 0a09ch		;431f
	call 0a224h		;4322
	call L_41D0		;4325
	call L_41CB		;4328
	call 0a4a9h		;432b
	call L_416E		;432e
	call L_4B1A		;4331
	call L_5FC5		;4334
	call L_5F0C		;4337
	call L_41BF		;433a
	call 0a177h		;433d
	call L_41CB		;4340
	call 0a26ah		;4343
	call L_41D0		;4346
	call 09221h		;4349
	call L_5B64		;434c
	call 08bb4h		;434f
	call 06263h		;4352
	call L_41BF		;4355
	call 0bceeh		;4358
	call L_41D0		;435b
	call L_5F76		;435e
	ld a,(0e203h)		;4361
	and 007h		;4364
	dec a			;4366
	jp z,L_5A3D		;4367
	ret			;436a
L_436B:
	call L_41BF		;436b
	call 0b957h		;436e
	call L_4178		;4371
	call L_438C		;4374
	call L_5C3A		;4377
	ld a,(0ec20h)		;437a
	ld c,a			;437d
	or a			;437e
	call nz,L_4882		;437f
	ld a,(0e640h)		;4382
	or a			;4385
	call nz,L_4DC8		;4386
	jp L_416E		;4389
L_438C:
	call L_44B7		;438c
	call L_483F		;438f
	call L_4178		;4392
	call L_444F		;4395
	call L_4494		;4398
	ld hl,08bd3h		;439b
	ld a,(0e301h)		;439e
	call L_4E28		;43a1
	push de			;43a4
	pop ix		;43a5
L_43A7:
	ld a,(ix+000h)		;43a7
	dec a			;43aa
	ret m			;43ab
	push af			;43ac
	call z,L_43BB		;43ad
	pop af			;43b0
	call nz,L_442B		;43b1
	ld bc,00004h		;43b4
	add ix,bc		;43b7
	jr L_43A7		;43b9
L_43BB:
	ld a,(ix+001h)		;43bb
	or a			;43be
	ret z			;43bf
	ld (0f010h),a		;43c0
	ld l,(ix+002h)		;43c3
	ld h,000h		;43c6
	add hl,hl			;43c8
	add hl,hl			;43c9
	add hl,hl			;43ca
	ld bc,01800h		;43cb
	add hl,bc			;43ce
	ld (0f012h),hl		;43cf
	ld l,(ix+003h)		;43d2
	ld h,000h		;43d5
	add hl,hl			;43d7
	add hl,hl			;43d8
	add hl,hl			;43d9
	add hl,bc			;43da
	ld (0f014h),hl		;43db
L_43DE:
	ld hl,(0f012h)		;43de
	ld de,0c600h		;43e1
	ld bc,00020h		;43e4
	call 00059h		;43e7   ; BIOS LDIRMV - Block transfers to memory from VRAM
	call L_4411		;43ea
	ld hl,(0f014h)		;43ed
	ld de,0c620h		;43f0
	ld bc,00020h		;43f3
	call L_4CBD		;43f6
	ld bc,00020h		;43f9
	ld hl,(0f012h)		;43fc
	add hl,bc			;43ff
	ld (0f012h),hl		;4400
	ld hl,(0f014h)		;4403
	add hl,bc			;4406
	ld (0f014h),hl		;4407
	ld hl,0f010h		;440a
	dec (hl)			;440d
	jr nz,L_43DE		;440e
	ret			;4410
L_4411:
	ld hl,0c600h		;4411
	ld de,0c62fh		;4414
	ld b,010h		;4417
	call L_4424		;4419
	ld hl,0c610h		;441c
	ld de,0c63fh		;441f
	ld b,010h		;4422
L_4424:
	ld a,(hl)			;4424
	ld (de),a			;4425
	inc hl			;4426
	dec de			;4427
	djnz L_4424		;4428
	ret			;442a
L_442B:
	ld a,(ix+001h)		;442b
	or a			;442e
	ret z			;442f
	ld l,(ix+003h)		;4430
	ld h,000h		;4433
	add hl,hl			;4435
	add hl,hl			;4436
	add hl,hl			;4437
	ld bc,01810h		;4438
	add hl,bc			;443b
	ex de,hl			;443c
	ld l,(ix+002h)		;443d
	ld h,000h		;4440
	add hl,hl			;4442
	add hl,hl			;4443
	add hl,hl			;4444
	ld bc,01800h		;4445
	add hl,bc			;4448
	ld c,(ix+001h)		;4449
	jp L_4D3B		;444c
L_444F:
	ld de,0a130h		;444f
	ld hl,01880h		;4452
	call L_4D16		;4455
	ld de,0a06fh		;4458
	ld hl,01960h		;445b
	call L_4D16		;445e
	call L_4835		;4461
	ld de,0a042h		;4464
	jr nc,L_446C		;4467
	ld de,0a009h		;4469
L_446C:
	ld hl,018c0h		;446c
	call L_4D16		;446f
	call L_4835		;4472
	ld de,0a0d8h		;4475
	jr nc,L_447D		;4478
	ld de,0a0f3h		;447a
L_447D:
	ld hl,01900h		;447d
	call L_4D16		;4480
	call L_4835		;4483
	ld de,0a113h		;4486
	jr nc,L_448E		;4489
	ld de,0a122h		;448b
L_448E:
	ld hl,018a0h		;448e
	jp L_4D16		;4491
L_4494:
	ld a,(0e301h)		;4494
	ld hl,08b26h		;4497
	call L_4E28		;449a
	ex de,hl			;449d
L_449E:
	ld a,(hl)			;449e
	or a			;449f
	ret z			;44a0
	inc hl			;44a1
	ld e,(hl)			;44a2
	inc hl			;44a3
	ld d,(hl)			;44a4
	inc hl			;44a5
	push hl			;44a6
	ld l,a			;44a7
	ld h,000h		;44a8
	add hl,hl			;44aa
	add hl,hl			;44ab
	add hl,hl			;44ac
	ld bc,01800h		;44ad
	add hl,bc			;44b0
	call L_4D16		;44b1
	pop hl			;44b4
	jr L_449E		;44b5
L_44B7:
	ld ix,06c63h		;44b7
	call L_4546		;44bb
	call L_4835		;44be
	ld ix,06c8eh		;44c1
	jr nc,L_44CB		;44c5
	ld ix,06c95h		;44c7
L_44CB:
	call L_4546		;44cb
	ld a,(0e301h)		;44ce
	cp 007h		;44d1
	call z,L_5B91		;44d3
	ld a,(0e301h)		;44d6
	ld hl,06c37h		;44d9
	call L_4540		;44dc
	xor a			;44df
	ld (0f000h),a		;44e0
	ld hl,06c45h		;44e3
	call L_44F0		;44e6
	ld hl,0f000h		;44e9
	inc (hl)			;44ec
	ld hl,06c53h		;44ed
L_44F0:
	ld a,(0e301h)		;44f0
L_44F3:
	call L_4E28		;44f3
	push de			;44f6
	pop ix		;44f7
L_44F9:
	ld a,(ix+000h)		;44f9
	and a			;44fc
	ret z			;44fd
	ld a,(ix+002h)		;44fe
	rlca			;4501
	rlca			;4502
	and 003h		;4503
	jr nz,L_4518		;4505
	ld l,(ix+003h)		;4507
	ld a,l			;450a
	ld (0f003h),a		;450b
	call L_4526		;450e
	ld de,00004h		;4511
	add ix,de		;4514
	jr L_44F9		;4516
L_4518:
	ld l,a			;4518
	ld (0f003h),a		;4519
	call L_4526		;451c
	ld de,00003h		;451f
	add ix,de		;4522
	jr L_44F9		;4524
L_4526:
	ld h,000h		;4526
	add hl,hl			;4528
	add hl,hl			;4529
	add hl,hl			;452a
	ld (0f001h),hl		;452b
	call L_467B		;452e
	ld a,(0f000h)		;4531
	and a			;4534
	push af			;4535
	call z,L_45E0		;4536
	pop af			;4539
	call nz,L_459B		;453a
	jp L_45FF		;453d
L_4540:
	call L_4E28		;4540
	push de			;4543
	pop ix		;4544
L_4546:
	ld a,(ix+000h)		;4546
	and a			;4549
	ret z			;454a
	rra			;454b
	ld de,01000h		;454c
	call c,L_456D		;454f
	bit 1,(ix+000h)		;4552
	ld de,00800h		;4556
	call nz,L_456D		;4559
	bit 2,(ix+000h)		;455c
	ld de,00000h		;4560
	call nz,L_456D		;4563
	ld de,00006h		;4566
	add ix,de		;4569
	jr L_4546		;456b
L_456D:
	ld l,(ix+003h)		;456d
	ld h,000h		;4570
	add hl,hl			;4572
	add hl,hl			;4573
	add hl,hl			;4574
	add hl,de			;4575
	push hl			;4576
	ld de,02000h		;4577
	add hl,de			;457a
	ld e,(ix+001h)		;457b
	ld d,(ix+002h)		;457e
	push ix		;4581
	call L_4D16		;4583
	pop ix		;4586
	pop hl			;4588
	ld de,00000h		;4589
	add hl,de			;458c
	ld e,(ix+004h)		;458d
	ld d,(ix+005h)		;4590
	push ix		;4593
	call L_4D16		;4595
	pop ix		;4598
	ret			;459a
L_459B:
	ld hl,0c600h		;459b
	ld de,0c607h		;459e
	ld a,(0e63ah)		;45a1
	and a			;45a4
	jr z,L_45AD		;45a5
	ld hl,0e700h		;45a7
	ld de,0e707h		;45aa
L_45AD:
	call L_45C2		;45ad
	ld hl,0c800h		;45b0
	ld de,0c807h		;45b3
	ld a,(0e63ah)		;45b6
	and a			;45b9
	jr z,L_45C2		;45ba
	ld hl,0e900h		;45bc
	ld de,0e907h		;45bf
L_45C2:
	exx			;45c2
	ld a,(0f003h)		;45c3
	ld b,a			;45c6
L_45C7:
	exx			;45c7
	ld b,004h		;45c8
L_45CA:
	ld c,(hl)			;45ca
	ld a,(de)			;45cb
	ld (hl),a			;45cc
	ld a,c			;45cd
	ld (de),a			;45ce
	inc hl			;45cf
	dec de			;45d0
	djnz L_45CA		;45d1
	inc hl			;45d3
	inc hl			;45d4
	inc hl			;45d5
	inc hl			;45d6
	ld a,00ch		;45d7
	call L_40C9		;45d9
	exx			;45dc
	djnz L_45C7		;45dd
	ret			;45df
L_45E0:
	ld hl,0c600h		;45e0
	ld a,(0e63ah)		;45e3
	and a			;45e6
	jr z,L_45EC		;45e7
	ld hl,0e700h		;45e9
L_45EC:
	ld de,(0f001h)		;45ec
L_45F0:
	ld b,008h		;45f0
L_45F2:
	rr (hl)		;45f2
	adc a,a			;45f4
	djnz L_45F2		;45f5
	ld (hl),a			;45f7
	inc hl			;45f8
	dec de			;45f9
	ld a,d			;45fa
	or e			;45fb
	jr nz,L_45F0		;45fc
	ret			;45fe
L_45FF:
	ld a,(0e63ah)		;45ff
	and a			;4602
	jr nz,L_4623		;4603
	bit 3,(ix+002h)		;4605
	ld de,01000h		;4609
	call nz,L_463D		;460c
	bit 4,(ix+002h)		;460f
	ld de,00800h		;4613
	call nz,L_463D		;4616
	bit 5,(ix+002h)		;4619
	ld de,00000h		;461d
	ret z			;4620
	jr L_463D		;4621
L_4623:
	push af			;4623
	bit 4,a		;4624
	ld de,00000h		;4626
	call nz,L_463D		;4629
	pop af			;462c
	push af			;462d
	bit 5,a		;462e
	ld de,00800h		;4630
	call nz,L_463D		;4633
	pop af			;4636
	bit 6,a		;4637
	ld de,01000h		;4639
	ret z			;463c
L_463D:
	push ix		;463d
	ld l,(ix+001h)		;463f
	ld h,000h		;4642
	add hl,hl			;4644
	add hl,hl			;4645
	add hl,hl			;4646
	add hl,de			;4647
	push hl			;4648
	ld de,02000h		;4649
	add hl,de			;464c
	ld de,0c600h		;464d
	ld a,(0e63ah)		;4650
	and a			;4653
	jr z,L_4659		;4654
	ld de,0e700h		;4656
L_4659:
	ld bc,(0f001h)		;4659
	call L_4CBD		;465d
	pop hl			;4660
	ld de,00000h		;4661
	add hl,de			;4664
	ld de,0c800h		;4665
	ld a,(0e63ah)		;4668
	and a			;466b
	jr z,L_4671		;466c
	ld de,0e900h		;466e
L_4671:
	ld bc,(0f001h)		;4671
	call L_4CBD		;4675
	pop ix		;4678
	ret			;467a
L_467B:
	ld bc,(0f001h)		;467b
	ld l,(ix+000h)		;467f
	ld h,000h		;4682
	add hl,hl			;4684
	add hl,hl			;4685
	add hl,hl			;4686
	ld a,(0e63ah)		;4687
	and a			;468a
	jr nz,L_46C2		;468b
	push hl			;468d
	ld de,02000h		;468e
	bit 2,(ix+002h)		;4691
	jr nz,L_46A1		;4695
	ld d,028h		;4697
	bit 1,(ix+002h)		;4699
	jr nz,L_46A1		;469d
	ld d,030h		;469f
L_46A1:
	add hl,de			;46a1
	ld de,0c600h		;46a2
	push ix		;46a5
	call 00059h		;46a7   ; BIOS LDIRMV - Block transfers to memory from VRAM
	pop ix		;46aa
	pop hl			;46ac
	ld de,00000h		;46ad
	bit 2,(ix+002h)		;46b0
	jr nz,L_46EF		;46b4
	ld d,008h		;46b6
	bit 1,(ix+002h)		;46b8
	jr nz,L_46EF		;46bc
	ld d,010h		;46be
	jr L_46EF		;46c0
L_46C2:
	push hl			;46c2
	ld de,02000h		;46c3
	bit 4,a		;46c6
	jr nz,L_46D2		;46c8
	ld d,028h		;46ca
	bit 5,a		;46cc
	jr nz,L_46D2		;46ce
	ld d,030h		;46d0
L_46D2:
	add hl,de			;46d2
	push af			;46d3
	ld de,0e700h		;46d4
	push ix		;46d7
	call 00059h		;46d9   ; BIOS LDIRMV - Block transfers to memory from VRAM
	pop ix		;46dc
	pop af			;46de
	pop hl			;46df
	ld de,00000h		;46e0
	bit 4,a		;46e3
	jr nz,L_46EF		;46e5
	ld d,008h		;46e7
	bit 5,a		;46e9
	jr nz,L_46EF		;46eb
	ld d,010h		;46ed
L_46EF:
	add hl,de			;46ef
	ld de,0c800h		;46f0
	ld a,(0e63ah)		;46f3
	and a			;46f6
	jr z,L_46FC		;46f7
	ld de,0e900h		;46f9
L_46FC:
	ld bc,(0f001h)		;46fc
	push ix		;4700
	call 00059h		;4702   ; BIOS LDIRMV - Block transfers to memory from VRAM
	pop ix		;4705
	ret			;4707
L_4708:
	ld a,(0e21dh)		;4708
	dec a			;470b
	jr z,L_4731		;470c
	dec a			;470e
	jr z,L_474E		;470f
	xor a			;4711
	ld (0e21eh),a		;4712
	ld c,000h		;4715
	call L_4763		;4717
	ld a,001h		;471a
	ld (0e21eh),a		;471c
	ld c,0f0h		;471f
	call L_4763		;4721
	call L_47E1		;4724
	ld a,001h		;4727
	ld (0e21fh),a		;4729
L_472C:
	ld hl,0e21dh		;472c
	inc (hl)			;472f
	ret			;4730
L_4731:
	xor a			;4731
	ld (0e21eh),a		;4732
	ld a,(0e21fh)		;4735
	ld c,a			;4738
	call L_4763		;4739
	call L_47E1		;473c
	ld hl,0e21fh		;473f
	ld a,(hl)			;4742
	cp 0ffh		;4743
	jr z,L_472C		;4745
	rlca			;4747
	rlca			;4748
	rlca			;4749
	or 001h		;474a
	ld (hl),a			;474c
	ret			;474d
L_474E:
	ld a,001h		;474e
	ld (0e21eh),a		;4750
	ld c,0ffh		;4753
	call L_4763		;4755
	call L_47E1		;4758
	call L_4DB1		;475b
	xor a			;475e
	ld (0e21ch),a		;475f
	ret			;4762
L_4763:
	ld ix,(0e220h)		;4763
	ld a,(0e63ah)		;4767
	and a			;476a
	jr nz,L_4794		;476b
L_476D:
	ld a,(ix+000h)		;476d
	and a			;4770
	ret z			;4771
	rra			;4772
	ld de,01000h		;4773
	call c,L_47AE		;4776
	bit 1,(ix+000h)		;4779
	ld de,00800h		;477d
	call nz,L_47AE		;4780
	bit 2,(ix+000h)		;4783
	ld de,00000h		;4787
	call nz,L_47AE		;478a
	ld de,00006h		;478d
	add ix,de		;4790
	jr L_476D		;4792
L_4794:
	ld a,(ix+000h)		;4794
	and a			;4797
	ret z			;4798
	dec ix		;4799
	ld de,00800h		;479b
	call L_47AE		;479e
	ld de,00000h		;47a1
	call L_47AE		;47a4
	ld de,00006h		;47a7
	add ix,de		;47aa
	jr L_4794		;47ac
L_47AE:
	ld l,(ix+003h)		;47ae
	ld h,000h		;47b1
	add hl,hl			;47b3
	add hl,hl			;47b4
	add hl,hl			;47b5
	add hl,de			;47b6
	ld a,(0e21eh)		;47b7
	dec a			;47ba
	jr z,L_47CF		;47bb
	ld de,02000h		;47bd
	add hl,de			;47c0
	ld e,(ix+001h)		;47c1
	ld d,(ix+002h)		;47c4
	push ix		;47c7
	call L_47F7		;47c9
	pop ix		;47cc
	ret			;47ce
L_47CF:
	ld de,00000h		;47cf
	add hl,de			;47d2
	ld e,(ix+004h)		;47d3
	ld d,(ix+005h)		;47d6
	push ix		;47d9
	call L_47F7		;47db
	pop ix		;47de
	ret			;47e0
L_47E1:
	xor a			;47e1
	ld (0f000h),a		;47e2
	ld ix,(0e222h)		;47e5
	call L_44F9		;47e9
	ld hl,0f000h		;47ec
	inc (hl)			;47ef
	ld ix,(0e224h)		;47f0
	jp L_44F9		;47f4
L_47F7:
	call L_4CB1		;47f7
L_47FA:
	ld a,(de)			;47fa
	and a			;47fb
	ret z			;47fc
	inc de			;47fd
	ld b,a			;47fe
	and 07fh		;47ff
	cp b			;4801
	jr z,L_481C		;4802
	ld b,a			;4804
L_4805:
	ld a,(de)			;4805
	and c			;4806
	inc de			;4807
	exx			;4808
	out (c),a		;4809
	exx			;480b
	ld a,(0e21eh)		;480c
	and a			;480f
	jr nz,L_4818		;4810
	rrc c		;4812
	rrc c		;4814
	rrc c		;4816
L_4818:
	djnz L_4805		;4818
	jr L_47FA		;481a
L_481C:
	ld a,(de)			;481c
	inc de			;481d
L_481E:
	and c			;481e
	exx			;481f
	out (c),a		;4820
	exx			;4822
	ex af,af'			;4823
	ld a,(0e21eh)		;4824
	and a			;4827
	jr nz,L_4830		;4828
	rrc c		;482a
	rrc c		;482c
	rrc c		;482e
L_4830:
	ex af,af'			;4830
	djnz L_481E		;4831
	jr L_47FA		;4833
L_4835:
	ld a,(0e301h)		;4835
	ld b,a			;4838
	ld a,026h		;4839
L_483B:
	rra			;483b
	djnz L_483B		;483c
	ret			;483e
L_483F:
	call L_4835		;483f
	jr nc,L_4856		;4842
	ld de,04876h		;4844
	ld hl,02280h		;4847
	call L_4CE5		;484a
	ld de,04879h		;484d
	ld hl,00280h		;4850
	jp L_4CE5		;4853
L_4856:
	ld de,04868h		;4856
	ld hl,02280h		;4859
	call L_4CE5		;485c
	ld de,0486bh		;485f
	ld hl,00280h		;4862
	jp L_4CE5		;4865

; ----------------------------------------------------------------------
; DATOS rachas3_4868: rachas a la VRAM en los tres tercios (p00:4CE5 ->
;   p00:4D16); lo leen p00:485C (3 bytes)
;   0x4868..0x486b  (3 bytes)
DATA_rachas3_4868:
	defb 010h,000h,000h	; 4868

; ----------------------------------------------------------------------
; DATOS rachas3_486B: rachas a la VRAM en los tres tercios (p00:4CE5 ->
;   p00:4D16); lo leen p00:4865 (11 bytes)
;   0x486b..0x4876  (11 bytes)
DATA_rachas3_486B:
	defb 002h,000h,081h,0b0h,008h,000h,081h,070h,004h,000h,000h	; 486b  .......p...

; ----------------------------------------------------------------------
; DATOS rachas3_4876: rachas a la VRAM en los tres tercios (p00:4CE5 ->
;   p00:4D16); lo leen p00:484A (3 bytes)
;   0x4876..0x4879  (3 bytes)
DATA_rachas3_4876:
	defb 010h,001h,000h	; 4876

; ----------------------------------------------------------------------
; DATOS rachas3_4879: rachas a la VRAM en los tres tercios (p00:4CE5 ->
;   p00:4D16); lo leen p00:4853 (9 bytes)
;   0x4879..0x4882  (9 bytes)
DATA_rachas3_4879:
	defb 081h,0b0h,007h,000h,081h,070h,007h,000h,000h	; 4879  .....p...

; ======================================================================
; CODIGO 0x4882..0x4b87  (773 bytes)
; ======================================================================


L_4882:
	call L_41C7		;4882
	ld l,c			;4885
	ld h,000h		;4886
	add hl,hl			;4888
	add hl,hl			;4889
	ld de,0a331h		;488a
	add hl,de			;488d
	ld e,(hl)			;488e
	inc hl			;488f
	ld d,(hl)			;4890
	push hl			;4891
	ld hl,02120h		;4892
	call L_4CE5		;4895
	pop hl			;4898
	inc hl			;4899
	ld e,(hl)			;489a
	inc hl			;489b
	ld d,(hl)			;489c
	ld hl,00120h		;489d
	call L_4CE5		;48a0
	jp L_416E		;48a3
L_48A6:
	ld a,(0e620h)		;48a6
	or a			;48a9
	jp nz,L_48F1		;48aa
	xor a			;48ad
	ld (0f004h),a		;48ae
	ld hl,(0e302h)		;48b1
	ld de,00020h		;48b4
	sbc hl,de		;48b7
	ld (0e302h),hl		;48b9
	ld hl,0ca00h		;48bc
	ld (0f000h),hl		;48bf
	ld b,020h		;48c2
L_48C4:
	push bc			;48c4
	call L_417D		;48c5
	call L_499E		;48c8
	call L_416E		;48cb
	call L_50B2		;48ce
	ld hl,(0f000h)		;48d1
	inc hl			;48d4
	ld (0f000h),hl		;48d5
	ld hl,0f004h		;48d8
	ld a,(hl)			;48db
	add a,008h		;48dc
	ld (hl),a			;48de
	ld hl,(0e302h)		;48df
	inc hl			;48e2
	ld (0e302h),hl		;48e3
	pop bc			;48e6
	djnz L_48C4		;48e7
	ld hl,(0e302h)		;48e9
	dec hl			;48ec
	ld (0e302h),hl		;48ed
	ret			;48f0
L_48F1:
	ld a,0a0h		;48f1
	ld (0f004h),a		;48f3
	ld hl,(0e302h)		;48f6
	ld de,0ffebh		;48f9
	add hl,de			;48fc
	ld (0e302h),hl		;48fd
	ld hl,0cf00h		;4900
	ld (0f000h),hl		;4903
	ld b,015h		;4906
L_4908:
	push bc			;4908
	call L_417D		;4909
	call L_4A6B		;490c
	call L_416E		;490f
	call L_50B2		;4912
	ld hl,(0f000h)		;4915
	ld bc,0ffc0h		;4918
	add hl,bc			;491b
	ld (0f000h),hl		;491c
	ld hl,0f004h		;491f
	ld a,(hl)			;4922
	sub 008h		;4923
	ld (hl),a			;4925
	ld hl,(0e302h)		;4926
	inc hl			;4929
	ld (0e302h),hl		;492a
	pop bc			;492d
	djnz L_4908		;492e
	ld hl,(0e302h)		;4930
	dec hl			;4933
	ld (0e302h),hl		;4934
	ld a,(0e301h)		;4937
	sub 003h		;493a
	ret nz			;493c
	ld bc,000ffh		;493d
	ld a,005h		;4940
	or a			;4942
	sbc hl,bc		;4943
	ret c			;4945
	ld (0e65eh),a		;4946
	ret			;4949
L_494A:
	ld a,001h		;494a
	ld (0e629h),a		;494c
	ret			;494f
L_4950:
	ld de,0e616h		;4950
	ld a,(de)			;4953
	rlca			;4954
	ld (de),a			;4955
	and 001h		;4956
	ret			;4958
L_4959:
	xor a			;4959
	ld (0e627h),a		;495a
	ld (0e628h),a		;495d
	ld (0e629h),a		;4960
	ld a,(0e630h)		;4963
	dec a			;4966
	ret z			;4967
	ld a,(0e610h)		;4968
	or a			;496b
	jp nz,L_4BE6		;496c
	ld de,(0e625h)		;496f
	ld hl,(0e302h)		;4973
	rst 20h			;4976
	jr nc,L_494A		;4977
	ld de,0e62ah		;4979
	ld a,(de)			;497c
	inc a			;497d
	and 007h		;497e
	ld (de),a			;4980
	call L_4950		;4981
	ret z			;4984
	inc hl			;4985
	ld (0e302h),hl		;4986
	ld a,(0e620h)		;4989
	or a			;498c
	jp nz,L_4A45		;498d
	ld a,001h		;4990
	ld (0e627h),a		;4992
	call L_4A0C		;4995
	ld hl,0ca1fh		;4998
	ld (0f000h),hl		;499b
L_499E:
	ld hl,(0e302h)		;499e
	ld de,(0e623h)		;49a1
	rst 20h			;49a5
	ccf			;49a6
	jp c,L_4AD5		;49a7
	ld de,(0e621h)		;49aa
	and a			;49ae
	sbc hl,de		;49af
	jp c,L_4AD5		;49b1
	push hl			;49b4
	ld hl,06f4ch		;49b5
	ld a,(0e301h)		;49b8
	call L_4E28		;49bb
	pop hl			;49be
L_49BF:
	ld a,l			;49bf
	srl h		;49c0
	rra			;49c2
	and 0feh		;49c3
	ld l,a			;49c5
	ld c,l			;49c6
	ld b,h			;49c7
	add hl,hl			;49c8
	add hl,bc			;49c9
	add hl,de			;49ca
	ld (0f002h),hl		;49cb
	ld hl,(0f000h)		;49ce
	ld b,006h		;49d1
L_49D3:
	push bc			;49d3
	push hl			;49d4
	ld hl,(0f002h)		;49d5
	ld a,(hl)			;49d8
	inc hl			;49d9
	ld (0f002h),hl		;49da
	call L_4A25		;49dd
	ld a,(0e302h)		;49e0
	and 003h		;49e3
	add a,e			;49e5
	ld e,a			;49e6
	jr nc,L_49EA		;49e7
	inc d			;49e9
L_49EA:
	pop hl			;49ea
	ld bc,00040h		;49eb
	ld a,(de)			;49ee
	ld (hl),a			;49ef
	add hl,bc			;49f0
	inc de			;49f1
	inc de			;49f2
	inc de			;49f3
	inc de			;49f4
	ld a,(de)			;49f5
	ld (hl),a			;49f6
	add hl,bc			;49f7
	inc de			;49f8
	inc de			;49f9
	inc de			;49fa
	inc de			;49fb
	ld a,(de)			;49fc
	ld (hl),a			;49fd
	add hl,bc			;49fe
	inc de			;49ff
	inc de			;4a00
	inc de			;4a01
	inc de			;4a02
	ld a,(de)			;4a03
	ld (hl),a			;4a04
	add hl,bc			;4a05
	pop bc			;4a06
	dec b			;4a07
	jp nz,L_49D3		;4a08
	ret			;4a0b
L_4A0C:
	ld hl,0ca01h		;4a0c
	ld e,l			;4a0f
	ld d,h			;4a10
	dec de			;4a11
	ld b,018h		;4a12
L_4A14:
	push bc			;4a14
	ld bc,0001fh		;4a15
	ldir		;4a18
	ld bc,00021h		;4a1a
	add hl,bc			;4a1d
	ld e,l			;4a1e
	ld d,h			;4a1f
	dec de			;4a20
	pop bc			;4a21
	djnz L_4A14		;4a22
	ret			;4a24
L_4A25:
	sub 004h		;4a25
	jr nc,L_4A30		;4a27
	add a,004h		;4a29
	ld de,0600eh		;4a2b
	jr L_4A3B		;4a2e
L_4A30:
	ld b,a			;4a30
	ld a,(0e301h)		;4a31
	ld hl,05ffeh		;4a34
	call L_4E28		;4a37
	ld a,b			;4a3a
L_4A3B:
	ld l,a			;4a3b
	ld h,000h		;4a3c
	add hl,hl			;4a3e
	add hl,hl			;4a3f
	add hl,hl			;4a40
	add hl,hl			;4a41
	add hl,de			;4a42
	ex de,hl			;4a43
	ret			;4a44
L_4A45:
	ld a,001h		;4a45
	ld (0e628h),a		;4a47
	ld hl,0cec0h		;4a4a
	ld de,0cf00h		;4a4d
	ld b,014h		;4a50
L_4A52:
	push bc			;4a52
	ld bc,00020h		;4a53
	ldir		;4a56
	ld bc,0ffe0h		;4a58
	add hl,bc			;4a5b
	ld e,l			;4a5c
	ld d,h			;4a5d
	ld bc,0ffc0h		;4a5e
	add hl,bc			;4a61
	pop bc			;4a62
	djnz L_4A52		;4a63
	ld hl,0ca00h		;4a65
	ld (0f000h),hl		;4a68
L_4A6B:
	ld hl,(0e302h)		;4a6b
	ld de,(0e623h)		;4a6e
	rst 20h			;4a72
	ccf			;4a73
	jp c,L_4AF9		;4a74
	ld de,(0e621h)		;4a77
	and a			;4a7b
	sbc hl,de		;4a7c
	jp c,L_4AF9		;4a7e
	push hl			;4a81
	ld hl,06f4ch		;4a82
	ld a,(0e301h)		;4a85
	call L_4E28		;4a88
	pop hl			;4a8b
L_4A8C:
	ld a,l			;4a8c
	and 0fch		;4a8d
	ld l,a			;4a8f
	add hl,hl			;4a90
	add hl,de			;4a91
	ld (0f002h),hl		;4a92
	ld de,(0f000h)		;4a95
	ld b,008h		;4a99
L_4A9B:
	push bc			;4a9b
	push de			;4a9c
	ld hl,(0f002h)		;4a9d
	ld a,(hl)			;4aa0
	inc hl			;4aa1
	ld (0f002h),hl		;4aa2
	call L_4AC8		;4aa5
	ld a,(0e302h)		;4aa8
	and 003h		;4aab
	sub 003h		;4aad
	neg		;4aaf
	add a,a			;4ab1
	add a,a			;4ab2
	add a,e			;4ab3
	ld e,a			;4ab4
	jr nc,L_4AB8		;4ab5
	inc d			;4ab7
L_4AB8:
	ex de,hl			;4ab8
	pop de			;4ab9
	ldi		;4aba
	ldi		;4abc
	ldi		;4abe
	ldi		;4ac0
	pop bc			;4ac2
	dec b			;4ac3
	jp nz,L_4A9B		;4ac4
	ret			;4ac7
L_4AC8:
	sub 004h		;4ac8
	jp nc,L_4A30		;4aca
	add a,004h		;4acd
	ld de,0600eh		;4acf
	jp L_4A3B		;4ad2
L_4AD5:
	ld a,(0e302h)		;4ad5
	and 01fh		;4ad8
	ld hl,09e1fh		;4ada
	call L_40C4		;4add
	ld c,(hl)			;4ae0
	ld a,c			;4ae1
	ex af,af'			;4ae2
	ld b,015h		;4ae3
	ld de,00040h		;4ae5
	ld hl,(0f000h)		;4ae8
L_4AEB:
	xor a			;4aeb
	dec c			;4aec
	jr nz,L_4AF4		;4aed
	ex af,af'			;4aef
	and 001h		;4af0
	add a,050h		;4af2
L_4AF4:
	ld (hl),a			;4af4
	add hl,de			;4af5
	djnz L_4AEB		;4af6
	ret			;4af8
L_4AF9:
	ld a,(0e302h)		;4af9
	and 01fh		;4afc
	ld hl,09e3fh		;4afe
	call L_40C4		;4b01
	ld c,(hl)			;4b04
	ld a,c			;4b05
	ex af,af'			;4b06
	ld b,020h		;4b07
	ld hl,(0f000h)		;4b09
L_4B0C:
	xor a			;4b0c
	dec c			;4b0d
	jr nz,L_4B15		;4b0e
	ex af,af'			;4b10
	and 001h		;4b11
	add a,050h		;4b13
L_4B15:
	ld (hl),a			;4b15
	inc hl			;4b16
	djnz L_4B0C		;4b17
	ret			;4b19
L_4B1A:
	ld a,(0e630h)		;4b1a
	dec a			;4b1d
	ret z			;4b1e
	ld a,(0e610h)		;4b1f
	or a			;4b22
	ret nz			;4b23
	ld a,(0e620h)		;4b24
	or a			;4b27
	jr nz,L_4B49		;4b28
	ld a,(0e203h)		;4b2a
	and 006h		;4b2d
	ld hl,04b87h		;4b2f
	ld e,a			;4b32
	ld d,000h		;4b33
	add hl,de			;4b35
	ld c,(hl)			;4b36
	inc hl			;4b37
	ld b,(hl)			;4b38
	ld hl,02282h		;4b39
	call L_4B43		;4b3c
	ld c,b			;4b3f
	ld hl,0228bh		;4b40
L_4B43:
	ld a,(0e616h)		;4b43
	and c			;4b46
	jr L_4B79		;4b47
L_4B49:
	ld a,(0e203h)		;4b49
	and 006h		;4b4c
	ld e,a			;4b4e
	ld d,000h		;4b4f
	ld hl,04b8fh		;4b51
	add hl,de			;4b54
	ld c,(hl)			;4b55
	inc hl			;4b56
	ld b,(hl)			;4b57
	ld hl,00280h		;4b58
	call L_4B62		;4b5b
	ld c,b			;4b5e
	ld hl,00288h		;4b5f
L_4B62:
	ld a,(0e62ah)		;4b62
	add a,l			;4b65
	ld l,a			;4b66
	push hl			;4b67
	ld a,c			;4b68
	call L_4B79		;4b69
	pop hl			;4b6c
	dec hl			;4b6d
	ld a,(0e62ah)		;4b6e
	or a			;4b71
	jr nz,L_4B78		;4b72
	ld a,l			;4b74
	add a,008h		;4b75
	ld l,a			;4b77
L_4B78:
	xor a			;4b78
L_4B79:
	call 0004dh		;4b79   ; BIOS WRTVRM - Writes data in VRAM
	ld de,00800h		;4b7c
	add hl,de			;4b7f
	call 0004dh		;4b80   ; BIOS WRTVRM - Writes data in VRAM
	add hl,de			;4b83
	jp 0004dh		;4b84   ; BIOS WRTVRM - Writes data in VRAM

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4b87..0x4b97  (16 bytes)
DATA_4B87:
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,0ffh,030h,000h,050h,090h,000h,0b0h,070h,0f0h	; 4b87  ........0.P...p.

; ======================================================================
; CODIGO 0x4b97..0x4bd8  (65 bytes)
; ======================================================================


L_4B97:
	call L_417D		;4b97
	ld ix,09e1fh		;4b9a
	ld a,(0e302h)		;4b9e
	sub 01fh		;4ba1
	and 01fh		;4ba3
	ld e,a			;4ba5
	ld d,000h		;4ba6
	add ix,de		;4ba8
	sub 020h		;4baa
	neg		;4bac
	ld c,a			;4bae
	ld de,0ca00h		;4baf
	ld b,020h		;4bb2
L_4BB4:
	push de			;4bb4
	ld a,(ix+000h)		;4bb5
	ld l,a			;4bb8
	dec l			;4bb9
	ld h,000h		;4bba
	add hl,hl			;4bbc
	add hl,hl			;4bbd
	add hl,hl			;4bbe
	add hl,hl			;4bbf
	add hl,hl			;4bc0
	add hl,hl			;4bc1
	add hl,de			;4bc2
	and 001h		;4bc3
	add a,050h		;4bc5
	ld (hl),a			;4bc7
	dec c			;4bc8
	jr nz,L_4BCF		;4bc9
	ld ix,09e1fh		;4bcb
L_4BCF:
	pop de			;4bcf
	inc de			;4bd0
	inc ix		;4bd1
	djnz L_4BB4		;4bd3
	jp L_416E		;4bd5

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4bd8..0x4be6  (14 bytes)
DATA_4BD8:
	defb 0d9h,021h,00eh,060h,011h,040h,0ech,001h,010h,000h,0edh,0b0h,0d9h,0c9h	; 4bd8  .!.`.@........

; ======================================================================
; CODIGO 0x4be6..0x4c9c  (182 bytes)
; ======================================================================


L_4BE6:
	ld hl,(0e612h)		;4be6
	ld de,(0e614h)		;4be9
	rst 20h			;4bed
	jp z,L_494A		;4bee
	call L_4950		;4bf1
	ret z			;4bf4
	ld a,(0e610h)		;4bf5
	dec a			;4bf8
	jr z,L_4C55		;4bf9
	dec a			;4bfb
	jr z,L_4C54		;4bfc
	dec a			;4bfe
	jr z,L_4C19		;4bff
	inc hl			;4c01
	ld (0e612h),hl		;4c02
	ld a,001h		;4c05
	ld (0e627h),a		;4c07
	call L_4A0C		;4c0a
	ld hl,0ca1fh		;4c0d
	ld (0f000h),hl		;4c10
	ld hl,0ca1fh		;4c13
	jp L_4C3D		;4c16
L_4C19:
	dec hl			;4c19
	ld (0e612h),hl		;4c1a
	ld a,0ffh		;4c1d
	ld (0e627h),a		;4c1f
	ld hl,0ca1eh		;4c22
	ld e,l			;4c25
	ld d,h			;4c26
	inc de			;4c27
	ld b,015h		;4c28
L_4C2A:
	push bc			;4c2a
	ld bc,0001fh		;4c2b
	lddr		;4c2e
	ld bc,0005fh		;4c30
	add hl,bc			;4c33
	ld e,l			;4c34
	ld d,h			;4c35
	inc de			;4c36
	pop bc			;4c37
	djnz L_4C2A		;4c38
	ld hl,0ca00h		;4c3a
L_4C3D:
	ld (0f000h),hl		;4c3d
	ld hl,(0e302h)		;4c40
	push hl			;4c43
	ld hl,(0e612h)		;4c44
	ld (0e302h),hl		;4c47
	ld de,0818ch		;4c4a
	call L_49BF		;4c4d
	pop hl			;4c50
	ld (0e302h),hl		;4c51
L_4C54:
	ret			;4c54
L_4C55:
	dec hl			;4c55
	ld (0e612h),hl		;4c56
	ld a,0ffh		;4c59
	ld (0e628h),a		;4c5b
	ld hl,0ca40h		;4c5e
	ld de,0ca00h		;4c61
	ld b,017h		;4c64
L_4C66:
	push bc			;4c66
	push hl			;4c67
	ld bc,00020h		;4c68
	ldir		;4c6b
	ld bc,00020h		;4c6d
	add hl,bc			;4c70
	pop de			;4c71
	pop bc			;4c72
	djnz L_4C66		;4c73
	ld hl,0cfc0h		;4c75
	ld (0f000h),hl		;4c78
	ld hl,(0e302h)		;4c7b
	push hl			;4c7e
	ld hl,(0e612h)		;4c7f
	ld (0e302h),hl		;4c82
	call L_4C8D		;4c85
	pop hl			;4c88
	ld (0e302h),hl		;4c89
	ret			;4c8c
L_4C8D:
	ld a,(0e301h)		;4c8d
	ld de,080fch		;4c90
	dec a			;4c93
	jr z,L_4C99		;4c94
	ld de,0815ch		;4c96
L_4C99:
	jp L_4A8C		;4c99

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4c9c..0x4ca4  (8 bytes)
DATA_4C9C:
	defb 0cdh,009h,059h,001h,0a0h,002h,018h,006h	; 4c9c  ..Y.....

; ======================================================================
; CODIGO 0x4ca4..0x4f3d  (665 bytes)
; ======================================================================


L_4CA4:
	call L_5909		;4ca4
	ld bc,00300h		;4ca7
	ld hl,03800h		;4caa
	xor a			;4cad
	jp 00056h		;4cae   ; BIOS FILVRM - Fills VRAM with value
L_4CB1:
	ex af,af'			;4cb1
	call 00053h		;4cb2   ; BIOS SETWRT - Enables VDP to write
	exx			;4cb5
	ld a,(00007h)		;4cb6
	ld c,a			;4cb9
	exx			;4cba
	ex af,af'			;4cbb
	ret			;4cbc
L_4CBD:
	ex de,hl			;4cbd
L_4CBE:
	jp 0005ch		;4cbe   ; BIOS LDIRVM - Block transfers to VRAM from memory
L_4CC1:
	exx			;4cc1
	ld b,003h		;4cc2
L_4CC4:
	exx			;4cc4
	push bc			;4cc5
	push de			;4cc6
	call L_4CBD		;4cc7
	ld de,00800h		;4cca
	add hl,de			;4ccd
	pop de			;4cce
	pop bc			;4ccf
	exx			;4cd0
	djnz L_4CC4		;4cd1
	ret			;4cd3
L_4CD4:
	ld d,003h		;4cd4
L_4CD6:
	push bc			;4cd6
	push de			;4cd7
	call 00056h		;4cd8   ; BIOS FILVRM - Fills VRAM with value
	ld de,00800h		;4cdb
	add hl,de			;4cde
	pop de			;4cdf
	pop bc			;4ce0
	dec d			;4ce1
	jr nz,L_4CD6		;4ce2
	ret			;4ce4
L_4CE5:
	ld b,003h		;4ce5
L_4CE7:
	push bc			;4ce7
	push de			;4ce8
	call L_4D16		;4ce9
	ld de,00800h		;4cec
	add hl,de			;4cef
	pop de			;4cf0
	pop bc			;4cf1
	djnz L_4CE7		;4cf2
	ret			;4cf4
L_4CF5:
	ld c,0ffh		;4cf5
L_4CF7:
	ex de,hl			;4cf7
	ld e,(hl)			;4cf8
	inc hl			;4cf9
	ld d,(hl)			;4cfa
	ex de,hl			;4cfb
	inc de			;4cfc
L_4CFD:
	ld a,(de)			;4cfd
	inc de			;4cfe
	ld b,a			;4cff
	inc b			;4d00
	ret z			;4d01
	inc b			;4d02
	jr z,L_4CF7		;4d03
	and c			;4d05
	call 0004dh		;4d06   ; BIOS WRTVRM - Writes data in VRAM
	inc hl			;4d09
	jr L_4CFD		;4d0a
L_4D0C:
	ld c,000h		;4d0c
	jr L_4CF7		;4d0e
L_4D10:
	ex de,hl			;4d10
	ld e,(hl)			;4d11
	inc hl			;4d12
	ld d,(hl)			;4d13
	ex de,hl			;4d14
	inc de			;4d15
L_4D16:
	call L_4CB1		;4d16
L_4D19:
	ld a,(de)			;4d19
	and a			;4d1a
	ret z			;4d1b
	inc de			;4d1c
	ld b,a			;4d1d
	and 07fh		;4d1e
	cp b			;4d20
	jr z,L_4D31		;4d21
	and a			;4d23
	jr z,L_4D10		;4d24
	ld b,a			;4d26
L_4D27:
	ld a,(de)			;4d27
	inc de			;4d28
	exx			;4d29
	out (c),a		;4d2a
	exx			;4d2c
	djnz L_4D27		;4d2d
	jr L_4D19		;4d2f
L_4D31:
	ld a,(de)			;4d31
	inc de			;4d32
L_4D33:
	exx			;4d33
	out (c),a		;4d34
	exx			;4d36
	djnz L_4D33		;4d37
	jr L_4D19		;4d39
L_4D3B:
	call L_4D47		;4d3b
	ld a,020h		;4d3e
	call L_40C9		;4d40
	dec c			;4d43
	jr nz,L_4D3B		;4d44
	ret			;4d46
L_4D47:
	push de			;4d47
L_4D48:
	ld b,010h		;4d48
L_4D4A:
	call 0004ah		;4d4a   ; BIOS RDVRM - Reads the content of VRAM
	call L_4D63		;4d4d
	ex de,hl			;4d50
	call 0004dh		;4d51   ; BIOS WRTVRM - Writes data in VRAM
	ex de,hl			;4d54
	inc e			;4d55
	inc hl			;4d56
	djnz L_4D4A		;4d57
	ld a,e			;4d59
	sub 020h		;4d5a
	ld e,a			;4d5c
	bit 4,e		;4d5d
	jr z,L_4D48		;4d5f
	pop de			;4d61
	ret			;4d62
L_4D63:
	push bc			;4d63
	ld c,a			;4d64
	ld b,008h		;4d65
L_4D67:
	rr c		;4d67
	rla			;4d69
	djnz L_4D67		;4d6a
	pop bc			;4d6c
	ret			;4d6d
L_4D6E:
	di			;4d6e
	push hl			;4d6f
	push de			;4d70
	push bc			;4d71
	push ix		;4d72
	push af			;4d74
	ld a,004h		;4d75
	ld (07000h),a		;4d77
	inc a			;4d7a
	ld (09000h),a		;4d7b
	inc a			;4d7e
	ld (0b000h),a		;4d7f
	pop af			;4d82
	push af			;4d83
	call 06472h		;4d84
	ld a,(0f0f1h)		;4d87
	ld (07000h),a		;4d8a
	ld a,(0f0f2h)		;4d8d
	ld (09000h),a		;4d90
	ld a,(0f0f3h)		;4d93
	ld (0b000h),a		;4d96
	pop af			;4d99
	pop ix		;4d9a
	pop bc			;4d9c
	pop de			;4d9d
	pop hl			;4d9e
	ei			;4d9f
	ret			;4da0
L_4DA1:
	ld hl,(0f0f7h)		;4da1
	rst 20h			;4da4
	ret			;4da5
L_4DA6:
	push iy		;4da6
	pop bc			;4da8
	ld a,c			;4da9
	xor 080h		;4daa
	ld c,a			;4dac
	push bc			;4dad
	pop iy		;4dae
	ret			;4db0
L_4DB1:
	ld hl,0c600h		;4db1
	ld a,(0e63ah)		;4db4
	and a			;4db7
	jr z,L_4DBD		;4db8
	ld hl,0e700h		;4dba
L_4DBD:
	ld d,h			;4dbd
	ld e,l			;4dbe
	inc de			;4dbf
	ld bc,003ffh		;4dc0
	ld (hl),000h		;4dc3
	ldir		;4dc5
	ret			;4dc7
L_4DC8:
	ld a,(0e640h)		;4dc8
	cp 008h		;4dcb
	ret z			;4dcd
	cp 003h		;4dce
	jr z,L_4E08		;4dd0
	cp 006h		;4dd2
	jr z,L_4E08		;4dd4
	push ix		;4dd6
	call L_4178		;4dd8
	ld a,(0e640h)		;4ddb
	ld hl,067d6h		;4dde
	call L_4540		;4de1
	xor a			;4de4
	ld (0f000h),a		;4de5
	ld a,(0e640h)		;4de8
	ld hl,067e4h		;4deb
	call L_44F3		;4dee
	ld hl,0f000h		;4df1
	inc (hl)			;4df4
	ld a,(0e640h)		;4df5
	ld hl,067f2h		;4df8
	call L_44F3		;4dfb
	call L_416E		;4dfe
	call L_41BF		;4e01
	pop ix		;4e04
	jr L_4DB1		;4e06
L_4E08:
	ld hl,00001h		;4e08
	ld (0e21ch),hl		;4e0b
	ld hl,06822h		;4e0e
	ld (0e220h),hl		;4e11
	ld hl,06895h		;4e14
	ld (0e222h),hl		;4e17
	ld hl,068c0h		;4e1a
	ld (0e224h),hl		;4e1d
	ret			;4e20
L_4E21:
	ld l,a			;4e21
	ld h,000h		;4e22
	add hl,hl			;4e24
	add hl,de			;4e25
	jr L_4E2D		;4e26
L_4E28:
	add a,a			;4e28
	ld e,a			;4e29
	ld d,000h		;4e2a
	add hl,de			;4e2c
L_4E2D:
	ld e,(hl)			;4e2d
	inc hl			;4e2e
	ld d,(hl)			;4e2f
	ret			;4e30
L_4E31:
	add a,a			;4e31
	call L_40C4		;4e32
	ld a,(hl)			;4e35
	inc hl			;4e36
	ld h,(hl)			;4e37
	ld l,a			;4e38
	ret			;4e39
L_4E3A:
	ld hl,0e700h		;4e3a
	ld de,00040h		;4e3d
	ld b,00ch		;4e40
L_4E42:
	ld a,(hl)			;4e42
	and a			;4e43
	ret nz			;4e44
	add hl,de			;4e45
	djnz L_4E42		;4e46
	ld hl,0ea00h		;4e48
	ld de,00010h		;4e4b
	ld b,008h		;4e4e
L_4E50:
	ld a,(hl)			;4e50
	and a			;4e51
	ret nz			;4e52
	add hl,de			;4e53
	djnz L_4E50		;4e54
	xor a			;4e56
	ret			;4e57
L_4E58:
	ld a,r		;4e58
	ld b,a			;4e5a
	add a,a			;4e5b
	add a,b			;4e5c
	ld b,a			;4e5d
	ld a,(0e606h)		;4e5e
	add a,b			;4e61
	ld (0e606h),a		;4e62
	ret			;4e65
L_4E66:
	push af			;4e66
	ld a,(0e301h)		;4e67
	call L_4E28		;4e6a
	pop af			;4e6d
L_4E6E:
	ld c,a			;4e6e
	add a,a			;4e6f
	add a,c			;4e70
	call L_40C9		;4e71
	ex de,hl			;4e74
	ld e,(hl)			;4e75
	inc hl			;4e76
	ld d,(hl)			;4e77
	inc hl			;4e78
	ld c,(hl)			;4e79
	ld hl,(0e302h)		;4e7a
	rst 20h			;4e7d
	ret			;4e7e
L_4E7F:
	ld a,(0e200h)		;4e7f
	cp 002h		;4e82
	jr z,L_4E89		;4e84
	cp 005h		;4e86
	ret nz			;4e88
L_4E89:
	ld a,(0e630h)		;4e89
	or a			;4e8c
	ret z			;4e8d
	ld hl,0e215h		;4e8e
	ld a,(hl)			;4e91
	or a			;4e92
	ret nz			;4e93
	ld hl,0e632h		;4e94
	dec (hl)			;4e97
	ret nz			;4e98
	ld (hl),03ch		;4e99
	dec l			;4e9b
	ld a,(hl)			;4e9c
	sub 001h		;4e9d
	daa			;4e9f
	ld (hl),a			;4ea0
	ld a,001h		;4ea1
	jr nz,L_4EA6		;4ea3
	inc a			;4ea5
L_4EA6:
	ld (0e215h),a		;4ea6
	ret			;4ea9
L_4EAA:
	set 4,(ix+010h)		;4eaa
	ret			;4eae
L_4EAF:
	ld hl,0ef80h		;4eaf
	ld de,0ef81h		;4eb2
	ld (hl),0e0h		;4eb5
	ld bc,0007fh		;4eb7
	ldir		;4eba
	ret			;4ebc
L_4EBD:
	ld a,(ix+014h)		;4ebd
	or a			;4ec0
	ret z			;4ec1
	ld b,a			;4ec2
	ld l,(ix+011h)		;4ec3
	ld h,(ix+012h)		;4ec6
	ld a,(ix+000h)		;4ec9
	sub 03ah		;4ecc
	jr z,L_4EF1		;4ece
	ld c,002h		;4ed0
	sub 002h		;4ed2
	jr z,L_4EE2		;4ed4
	inc c			;4ed6
	dec a			;4ed7
	jr z,L_4EE2		;4ed8
L_4EDA:
	ld a,(ix+032h)		;4eda
L_4EDD:
	ld (hl),a			;4edd
	inc l			;4ede
	djnz L_4EDD		;4edf
	ret			;4ee1
L_4EE2:
	push hl			;4ee2
	push bc			;4ee3
	call L_4EDA		;4ee4
	pop bc			;4ee7
	pop hl			;4ee8
	ld de,00020h		;4ee9
	add hl,de			;4eec
	dec c			;4eed
	jr nz,L_4EE2		;4eee
	ret			;4ef0
L_4EF1:
	ld a,038h		;4ef1
	push hl			;4ef3
	push bc			;4ef4
	call L_4F00		;4ef5
	pop bc			;4ef8
	pop hl			;4ef9
	ld de,00020h		;4efa
	add hl,de			;4efd
	ld a,039h		;4efe
L_4F00:
	ld (hl),a			;4f00
	xor 001h		;4f01
	inc l			;4f03
	djnz L_4F00		;4f04
	ret			;4f06
L_4F07:
	ld a,(ix+013h)		;4f07
	or a			;4f0a
	ret z			;4f0b
	ld b,a			;4f0c
	ld l,(ix+011h)		;4f0d
	ld h,(ix+012h)		;4f10
	ld a,(ix+032h)		;4f13
	ld de,00040h		;4f16
L_4F19:
	ld (hl),a			;4f19
	add hl,de			;4f1a
	djnz L_4F19		;4f1b
	ret			;4f1d
L_4F1E:
	push af			;4f1e
	ld hl,04f5dh		;4f1f
	call L_4E28		;4f22
	ld hl,00000h		;4f25
	push bc			;4f28
L_4F29:
	add hl,de			;4f29
	djnz L_4F29		;4f2a
	pop bc			;4f2c
	pop af			;4f2d
	push hl			;4f2e
	ld hl,04f3dh		;4f2f
	call L_4E28		;4f32
	ld hl,00000h		;4f35
L_4F38:
	add hl,de			;4f38
	djnz L_4F38		;4f39
	pop de			;4f3b
	ret			;4f3c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4f3d..0x4f7d  (64 bytes)
DATA_4F3D:
	defb 000h,000h,080h,0ffh,04bh,0ffh,023h,0ffh,000h,0ffh,023h,0ffh,04bh,0ffh,080h,0ffh	; 4f3d  ....K.#...#.K...
	defb 000h,000h,080h,000h,0b5h,000h,0ddh,000h,000h,001h,0ddh,000h,0b5h,000h,080h,000h	; 4f4d  ................
	defb 000h,001h,0ddh,000h,0b5h,000h,080h,000h,000h,000h,080h,0ffh,04bh,0ffh,023h,0ffh	; 4f5d  ............K.#.
	defb 000h,0ffh,023h,0ffh,04bh,0ffh,080h,0ffh,000h,000h,080h,000h,0b5h,000h,0ddh,000h	; 4f6d  ..#.K...........

; ======================================================================
; CODIGO 0x4f7d..0x4f97  (26 bytes)
; ======================================================================


L_4F7D:
	ld hl,04f97h		;4f7d
L_4F80:
	ld c,000h		;4f80
	dec (ix+024h)		;4f82
	ld a,(ix+024h)		;4f85
	rra			;4f88
	rra			;4f89
	dec c			;4f8a
	jr nz,L_4F8E		;4f8b
	rra			;4f8d
L_4F8E:
	and 003h		;4f8e
	call L_5AD8		;4f90
	ld (ix+030h),a		;4f93
	ret			;4f96

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4f97..0x4f9b  (4 bytes)
DATA_4F97:
	defb 090h,094h,098h,094h	; 4f97

; ======================================================================
; CODIGO 0x4f9b..0x4fb3  (24 bytes)
; ======================================================================


L_4F9B:
	set 3,(ix+010h)		;4f9b
	ret			;4f9f
L_4FA0:
	ld a,(ix+013h)		;4fa0
	add a,a			;4fa3
	add a,a			;4fa4
	add a,a			;4fa5
	ld (ix+00eh),a		;4fa6
L_4FA9:
	ld a,(ix+014h)		;4fa9
	add a,a			;4fac
	add a,a			;4fad
	add a,a			;4fae
	ld (ix+00fh),a		;4faf
	ret			;4fb2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4fb3..0x4fc2  (15 bytes)
DATA_4FB3:
	defb 0cdh,087h,050h,03ah,047h,0e6h,03ch,047h,018h,017h,0cdh,087h,050h,018h,012h	; 4fb3  ..P:G.<G....P..

; ======================================================================
; CODIGO 0x4fc2..0x4fc7  (5 bytes)
; ======================================================================


L_4FC2:
	call L_5092		;4fc2
	jr $+15		;4fc5

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4fc7..0x4fd4  (13 bytes)
DATA_4FC7:
	defb 0cdh,09fh,050h,018h,008h,0cdh,06eh,050h,018h,003h,0cdh,078h,050h	; 4fc7  ..P...nP...xP

; ======================================================================
; CODIGO 0x4fd4..0x5034  (96 bytes)
; ======================================================================


L_4FD4:
	ld e,b			;4fd4
L_4FD5:
	ld a,h			;4fd5
	cp 0d0h		;4fd6
	ret nc			;4fd8
	ld b,e			;4fd9
	xor a			;4fda
	push hl			;4fdb
L_4FDC:
	ld (hl),a			;4fdc
	inc hl			;4fdd
	djnz L_4FDC		;4fde
	pop hl			;4fe0
	ld a,040h		;4fe1
	call L_40C4		;4fe3
	dec c			;4fe6
	jr nz,L_4FD5		;4fe7
	ret			;4fe9
L_4FEA:
	push bc			;4fea
	call L_5087		;4feb
	pop af			;4fee
	push hl			;4fef
	push de			;4ff0
	push bc			;4ff1
	call L_5047		;4ff2
	pop bc			;4ff5
	pop hl			;4ff6
	pop de			;4ff7
	ld a,(0e647h)		;4ff8
	call L_40C9		;4ffb
	ld a,(0e647h)		;4ffe
	inc a			;5001
	sub b			;5002
	ld b,a			;5003
L_5004:
	push de			;5004
	push bc			;5005
L_5006:
	ld a,(0e646h)		;5006
	add a,(hl)			;5009
	cp 031h		;500a
	jr nc,L_500F		;500c
	xor a			;500e
L_500F:
	ld (de),a			;500f
	inc hl			;5010
	dec de			;5011
	djnz L_5006		;5012
	pop bc			;5014
	pop de			;5015
	ld a,040h		;5016
	call L_40C9		;5018
	ld a,(0ec80h)		;501b
	cp 008h		;501e
	jr nc,L_5023		;5020
	inc hl			;5022
L_5023:
	dec c			;5023
	jr nz,L_5004		;5024
	ret			;5026
L_5027:
	push bc			;5027
	call L_5087		;5028
	jr L_5031		;502b
L_502D:
	push bc			;502d
	call L_5092		;502e
L_5031:
	pop af			;5031
	jr $+21		;5032

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5034..0x5042  (14 bytes)
DATA_5034:
	defb 0c5h,0cdh,09fh,050h,0f1h,018h,00ch,0c5h,0cdh,06eh,050h,0f1h,018h,005h	; 5034  ...P.....nP...

; ======================================================================
; CODIGO 0x5042..0x506e  (44 bytes)
; ======================================================================


L_5042:
	push bc			;5042
	call L_5078		;5043
	pop af			;5046
L_5047:
	sub b			;5047
	exx			;5048
	ld c,a			;5049
	exx			;504a
	ld a,040h		;504b
	sub b			;504d
	exx			;504e
	ld d,a			;504f
	exx			;5050
	ld a,c			;5051
	ld c,b			;5052
	ld b,a			;5053
	ex de,hl			;5054
L_5055:
	ld a,d			;5055
	cp 0d0h		;5056
	ret nc			;5058
	push bc			;5059
	ld b,000h		;505a
	ldir		;505c
	pop bc			;505e
	exx			;505f
	ld a,c			;5060
	exx			;5061
	call L_40C4		;5062
	exx			;5065
	ld a,d			;5066
	exx			;5067
	call L_40C9		;5068
	djnz L_5055		;506b
	ret			;506d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x506e..0x5078  (10 bytes)
DATA_506E:
	defb 0d5h,0cdh,0f8h,064h,0cdh,0adh,05ah,0d1h,018h,003h	; 506e  ...d..Z...

; ======================================================================
; CODIGO 0x5078..0x509f  (39 bytes)
; ======================================================================


L_5078:
	call L_5A99		;5078
	ld a,l			;507b
	and 01fh		;507c
	add a,b			;507e
	sub 020h		;507f
	ret c			;5081
	neg		;5082
	add a,b			;5084
	ld b,a			;5085
	ret			;5086
L_5087:
	push de			;5087
	exx			;5088
	ld a,e			;5089
	exx			;508a
	ld e,a			;508b
	exx			;508c
	ld a,d			;508d
	exx			;508e
	ld d,a			;508f
	jr L_5096		;5090
L_5092:
	push de			;5092
	call 064f8h		;5093
L_5096:
	ld a,l			;5096
	push af			;5097
	call L_5AAD		;5098
	pop af			;509b
	pop de			;509c
	jr $+8		;509d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x509f..0x50a5  (6 bytes)
DATA_509F:
	defb 07dh,0f5h,0cdh,099h,05ah,0f1h	; 509f

; ======================================================================
; CODIGO 0x50a5..0x5130  (139 bytes)
; ======================================================================


L_50A5:
	rra			;50a5
	rra			;50a6
	rra			;50a7
	and 01fh		;50a8
	sub 015h		;50aa
	neg		;50ac
	cp c			;50ae
	ret nc			;50af
	ld c,a			;50b0
	ret			;50b1
L_50B2:
	call 08025h		;50b2
	call 0777ah		;50b5
	call 0706ah		;50b8
	call 07be3h		;50bb
	call L_41BF		;50be
	call 0bb39h		;50c1
	call L_41CB		;50c4
	call 0bd55h		;50c7
	call 0a639h		;50ca
	jp L_416E		;50cd
L_50D0:
	ld a,0ffh		;50d0
	ld hl,0e1d8h		;50d2
	ld (hl),a			;50d5
	inc hl			;50d6
	ld (hl),a			;50d7
	inc hl			;50d8
	ld de,0e1dbh		;50d9
	ld (hl),001h		;50dc
	ld bc,00009h		;50de
	ldir		;50e1
	ld a,004h		;50e3
	ld (07000h),a		;50e5
	inc a			;50e8
	ld (09000h),a		;50e9
	inc a			;50ec
	ld (0b000h),a		;50ed
	call 0728eh		;50f0
	ld a,(0f0f1h)		;50f3
	ld (07000h),a		;50f6
	ld a,(0f0f2h)		;50f9
	ld (09000h),a		;50fc
	ld a,(0f0f3h)		;50ff
	ld (0b000h),a		;5102
	ld a,0bfh		;5105
	ld (0e1d0h),a		;5107
	ld e,a			;510a
	ld a,007h		;510b
	call 00093h		;510d   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,001h		;5110
	call L_4D6E		;5112
	ld hl,00000h		;5115
	ld bc,04000h		;5118
	xor a			;511b
	call 00056h		;511c   ; BIOS FILVRM - Fills VRAM with value
L_511F:
	ld hl,05130h		;511f
	ld c,000h		;5122
	ld d,008h		;5124
L_5126:
	ld b,(hl)			;5126
	call 00047h		;5127   ; BIOS WRTVDP - Writes data in the VDP-register
	inc hl			;512a
	inc c			;512b
	dec d			;512c
	jr nz,L_5126		;512d
	ret			;512f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5130..0x5138  (8 bytes)
DATA_5130:
	defb 002h,0e2h,00eh,07fh,007h,076h,003h,0e4h	; 5130  .....v..

; ======================================================================
; CODIGO 0x5138..0x51ff  (199 bytes)
; ======================================================================


L_5138:
	ld c,007h		;5138
	jp 00047h		;513a   ; BIOS WRTVDP - Writes data in the VDP-register
L_513D:
	ld iy,0e300h		;513d
	call L_5148		;5141
	ld iy,0e380h		;5144
L_5148:
	push iy		;5148
	pop hl			;514a
	ld bc,0000fh		;514b
	add hl,bc			;514e
	bit 0,(iy+021h)		;514f
	jr nz,L_515C		;5153
	push hl			;5155
	call L_51BF		;5156
	pop hl			;5159
	jr L_51B8		;515a
L_515C:
	push hl			;515c
	ld e,0cfh		;515d
	call L_51F1		;515f
	and 03fh		;5162
	call L_516A		;5164
	pop hl			;5167
	jr L_51B8		;5168
L_516A:
	push af			;516a
	ld a,006h		;516b
	call 00141h		;516d   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5170
	rlca			;5171
	rlca			;5172
	rlca			;5173
	rlca			;5174
	and 030h		;5175
	ld e,a			;5177
	ld a,003h		;5178
	call 00141h		;517a   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;517d
	ld c,a			;517e
	and 008h		;517f
	ld d,a			;5181
	ld a,c			;5182
	rla			;5183
	and 002h		;5184
	or d			;5186
	ld d,a			;5187
	ld a,c			;5188
	rra			;5189
	rra			;518a
	and 001h		;518b
	or d			;518d
	ld d,a			;518e
	ld a,005h		;518f
	call 00141h		;5191   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5194
	ld c,a			;5195
	rla			;5196
	rla			;5197
	and 004h		;5198
	or d			;519a
	or e			;519b
	ex af,af'			;519c
	ld a,c			;519d
	and 0e0h		;519e
	ld (0e60dh),a		;51a0
	ex af,af'			;51a3
	pop bc			;51a4
	or b			;51a5
	ret			;51a6
L_51A7:
	ld a,(0e200h)		;51a7
	cp 005h		;51aa
	jr z,L_513D		;51ac
	cp 009h		;51ae
	jr z,L_513D		;51b0
	call L_51BF		;51b2
	ld hl,0e30fh		;51b5
L_51B8:
	ld c,(hl)			;51b8
	ld (hl),a			;51b9
	xor c			;51ba
	and (hl)			;51bb
	dec hl			;51bc
	ld (hl),a			;51bd
	ret			;51be
L_51BF:
	ld e,08fh		;51bf
	call L_51F1		;51c1
	and 03fh		;51c4
	push af			;51c6
	ld a,004h		;51c7
	call 00141h		;51c9   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;51cc
	and 00ch		;51cd
	ld e,a			;51cf
	jr z,L_51D4		;51d0
	ld e,020h		;51d2
L_51D4:
	ld a,008h		;51d4
	call 00141h		;51d6   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;51d9
	rrca			;51da
	rrca			;51db
	ld b,a			;51dc
	and 004h		;51dd
	or e			;51df
	ld c,a			;51e0
	ld a,b			;51e1
	rrca			;51e2
	rrca			;51e3
	ld b,a			;51e4
	and 018h		;51e5
	or c			;51e7
	ld c,a			;51e8
	ld a,b			;51e9
	rrca			;51ea
	and 003h		;51eb
	or c			;51ed
	pop bc			;51ee
	or b			;51ef
	ret			;51f0
L_51F1:
	ld a,00fh		;51f1
	call 00093h		;51f3   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,00eh		;51f6
	di			;51f8
	call 00096h		;51f9   ; BIOS RDPSG - Reads value from PSG-register
	ei			;51fc
	cpl			;51fd
	ret			;51fe

; ----------------------------------------------------------------------
; DATOS sin identificar  0x51ff..0x5208  (9 bytes)
DATA_51FF:
	defb 01eh,08fh,0cdh,0f1h,051h,0e6h,03fh,018h,0beh	; 51ff  ....Q.?..

; ======================================================================
; CODIGO 0x5208..0x5260  (88 bytes)
; ======================================================================


L_5208:
	ld a,(0e202h)		;5208
	and 040h		;520b
	ret z			;520d
	ld a,(0e30fh)		;520e
	and 01fh		;5211
	ret nz			;5213
	ld a,(0e38fh)		;5214
	and 01fh		;5217
	ret nz			;5219
	ld a,(0e60dh)		;521a
	or a			;521d
	ret nz			;521e
	ld a,006h		;521f
	call 00141h		;5221   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5224
	rlca			;5225
	rlca			;5226
	rlca			;5227
	push af			;5228
	ld a,007h		;5229
	call 00141h		;522b   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;522e
	rlca			;522f
	rlca			;5230
	rlca			;5231
	pop bc			;5232
	or b			;5233
	push af			;5234
	ld a,008h		;5235
	call 00141h		;5237   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;523a
	rrca			;523b
	rrca			;523c
	rrca			;523d
	pop bc			;523e
	or b			;523f
	and 03fh		;5240
	ld hl,0e219h		;5242
	ld c,(hl)			;5245
	ld (hl),a			;5246
	xor c			;5247
	and (hl)			;5248
	dec hl			;5249
	ld (hl),a			;524a
	ret			;524b
L_524C:
	ld hl,0e203h		;524c
	inc (hl)			;524f
	ld hl,057dch		;5250
	ld bc,(0e200h)		;5253
	ld a,c			;5257
	cp 003h		;5258
	jr nc,L_525D		;525a
	push hl			;525c
L_525D:
	call L_40CE		;525d

; ----------------------------------------------------------------------
; DATOS tabla_5260: 13 destinos del despachador p00:40CE (call en p00:525D, el
;   indice en A): 527A, 52B4, 52EB, 5340, 539F, 53FD, 543C, 54A9, 555F, 55CC,
;   56E7, 5601, 5670; lo leen p00:525D (26 bytes)
;   0x5260..0x527a  (26 bytes)
DATA_tabla_5260:
	defw 0527ah,052b4h,052ebh,05340h,0539fh,053fdh,0543ch,054a9h	; 5260
	defw 0555fh,055cch,056e7h,05601h,05670h	; 5270

; ======================================================================
; CODIGO 0x527a..0x57dc  (1378 bytes)
; ======================================================================


L_527A:
	djnz L_5291		;527a
	ld a,(0e203h)		;527c
	rra			;527f
	ret nc			;5280
	call L_41CB		;5281
	call 0a313h		;5284
	push af			;5287
	call L_41D0		;5288
	pop af			;528b
	ret nz			;528c
	xor a			;528d
	jp L_5338		;528e
L_5291:
	djnz L_529C		;5291
	ld hl,0e204h		;5293
	dec (hl)			;5296
	ret nz			;5297
	xor a			;5298
	jp L_538A		;5299
L_529C:
	call L_511F		;529c
	call L_4CA4		;529f
	call L_41BF		;52a2
	call 0b8d7h		;52a5
	call L_41CB		;52a8
	call 0a2e5h		;52ab
	call L_41D0		;52ae
	jp L_533B		;52b1
L_52B4:
	djnz L_52CC		;52b4
	call L_4199		;52b6
	call 081a3h		;52b9
	call 087e9h		;52bc
	call L_416E		;52bf
	ld hl,0e204h		;52c2
	dec (hl)			;52c5
	jp nz,090bah		;52c6
	jp L_5388		;52c9
L_52CC:
	call L_4CA4		;52cc
	call L_4199		;52cf
	call 080b9h		;52d2
	call 0813eh		;52d5
	ld de,081a9h		;52d8
	call L_4CF5		;52db
	call 087e9h		;52de
	call L_416E		;52e1
	xor a			;52e4
	ld (0e227h),a		;52e5
	jp L_5338		;52e8
L_52EB:
	djnz L_52FE		;52eb
	call L_4199		;52ed
	call 081e6h		;52f0
	call 087e9h		;52f3
	call L_416E		;52f6
	ld a,(0e217h)		;52f9
	and a			;52fc
	ret nz			;52fd
L_52FE:
	djnz L_5310		;52fe
	ld a,001h		;5300
	call L_4D6E		;5302
	call L_4CA4		;5305
	call L_582D		;5308
	call 0bf4eh		;530b
	jr L_533B		;530e
L_5310:
	djnz L_532B		;5310
	call 0bf85h		;5312
	ld a,(0e213h)		;5315
	or a			;5318
	ret nz			;5319
L_531A:
	ld a,001h		;531a
	call L_4D6E		;531c
	xor a			;531f
L_5320:
	ld (0e200h),a		;5320
	ld a,020h		;5323
	ld (0e204h),a		;5325
	jp L_5391		;5328
L_532B:
	call L_5F57		;532b
	call L_4CA4		;532e
	ld a,001h		;5331
	ld (0e217h),a		;5333
L_5336:
	ld a,020h		;5336
L_5338:
	ld (0e204h),a		;5338
L_533B:
	ld hl,0e201h		;533b
	inc (hl)			;533e
	ret			;533f
L_5340:
	djnz L_5362		;5340
	ld hl,0e204h		;5342
	dec (hl)			;5345
	jr z,L_533B		;5346
	ld a,(0e227h)		;5348
	or a			;534b
	ld de,0b64dh		;534c
	jr z,L_535A		;534f
	ld de,0b657h		;5351
	dec a			;5354
	jr z,L_535A		;5355
	ld de,0b662h		;5357
L_535A:
	bit 2,(hl)		;535a
	jp z,L_4CF5		;535c
	jp L_4D0C		;535f
L_5362:
	djnz L_536E		;5362
	call L_4CA4		;5364
	ld a,001h		;5367
	ld (0e217h),a		;5369
	jr L_533B		;536c
L_536E:
	djnz L_5380		;536e
	call L_4199		;5370
	call 08848h		;5373
	call L_416E		;5376
	ld a,(0e217h)		;5379
	and a			;537c
	ret nz			;537d
	jr L_533B		;537e
L_5380:
	djnz L_5396		;5380
	call L_4CA4		;5382
	call L_5835		;5385
L_5388:
	ld a,020h		;5388
L_538A:
	ld (0e204h),a		;538a
L_538D:
	ld hl,0e200h		;538d
	inc (hl)			;5390
L_5391:
	xor a			;5391
L_5392:
	ld (0e201h),a		;5392
	ret			;5395
L_5396:
	ld a,049h		;5396
	call L_4D6E		;5398
	ld a,050h		;539b
	jr L_5338		;539d
L_539F:
	djnz L_53B0		;539f
	ld hl,0e204h		;53a1
	dec (hl)			;53a4
	ret nz			;53a5
	call L_5AEF		;53a6
	ld a,001h		;53a9
	ld (0e213h),a		;53ab
	jr L_538D		;53ae
L_53B0:
	call L_58E9		;53b0
	ret p			;53b3
	call L_5F57		;53b4
	call L_53CB		;53b7
	call L_5553		;53ba
	call L_53F0		;53bd
	call L_5A12		;53c0
	call L_5D18		;53c3
	ld a,078h		;53c6
	jp L_5338		;53c8
L_53CB:
	ld a,(0e227h)		;53cb
	cp 002h		;53ce
	jr nz,L_53D9		;53d0
	ld iy,0e380h		;53d2
	call L_53DD		;53d6
L_53D9:
	ld iy,0e300h		;53d9
L_53DD:
	ld a,(iy+020h)		;53dd
	or a			;53e0
	ret nz			;53e1
	ld a,(iy+000h)		;53e2
	sub 001h		;53e5
	daa			;53e7
	ld (iy+000h),a		;53e8
	ld (iy+020h),0ffh		;53eb
	ret			;53ef
L_53F0:
	call L_4178		;53f0
	ld ix,06c63h		;53f3
	call L_4546		;53f7
	jp L_416E		;53fa
L_53FD:
	call L_4200		;53fd
	ld a,(0e213h)		;5400
	or a			;5403
	jp z,L_5388		;5404
	ld a,(0e226h)		;5407
	and a			;540a
	ld a,00ah		;540b
	jp nz,L_5320		;540d
	ld a,(0e21ah)		;5410
	and a			;5413
	ld a,008h		;5414
	jp nz,L_5320		;5416
	ld a,(0e6d0h)		;5419
	cp 002h		;541c
	ld a,00ch		;541e
	jp z,L_5320		;5420
	ld a,(0e6c0h)		;5423
	or a			;5426
	ret nz			;5427
	ld a,(0e6aah)		;5428
	or a			;542b
	ret nz			;542c
	ld a,(0e218h)		;542d
	rra			;5430
	ret nc			;5431
	ld a,0f3h		;5432
	call L_4D6E		;5434
	ld a,009h		;5437
	jp L_5320		;5439
L_543C:
	ld a,(0e227h)		;543c
	cp 002h		;543f
	jr z,L_5461		;5441
	ld a,(0e300h)		;5443
	or a			;5446
	jr z,L_547A		;5447
	ld a,(0e380h)		;5449
	or a			;544c
	jr z,L_5458		;544d
L_544F:
	xor a			;544f
	ld (0e320h),a		;5450
	call L_549E		;5453
	jr L_545C		;5456
L_5458:
	xor a			;5458
	ld (0e320h),a		;5459
L_545C:
	ld a,004h		;545c
	jp L_5320		;545e
L_5461:
	ld hl,0e301h		;5461
	ld de,0e381h		;5464
	ld bc,00005h		;5467
	ldir		;546a
	ld hl,(0e22eh)		;546c
	push hl			;546f
	pop iy		;5470
	ld a,(hl)			;5472
	or a			;5473
	jr nz,L_5498		;5474
	ld (iy+020h),000h		;5476
L_547A:
	call L_5480		;547a
	jp L_5388		;547d
L_5480:
	ld hl,03acfh		;5480
	call L_548C		;5483
	ld hl,03adfh		;5486
	call L_548C		;5489
L_548C:
	call L_4CB1		;548c
	exx			;548f
	xor a			;5490
	out (c),a		;5491
	exx			;5493
	exx			;5494
	out (c),a		;5495
	ret			;5497
L_5498:
	ld (iy+020h),000h		;5498
	jr L_545C		;549c
L_549E:
	ld hl,0e300h		;549e
	ld de,0e380h		;54a1
	ld b,080h		;54a4
	jp L_5A8F		;54a6
L_54A9:
	djnz L_5515		;54a9
	call L_55EA		;54ab
	ld hl,(0e649h)		;54ae
	dec hl			;54b1
	ld (0e649h),hl		;54b2
	ld a,l			;54b5
	or h			;54b6
	ret nz			;54b7
	ld a,001h		;54b8
	call L_4D6E		;54ba
	ld a,(0e227h)		;54bd
	cp 002h		;54c0
	jr z,L_54EE		;54c2
	xor a			;54c4
	ld (0e320h),a		;54c5
	ld a,(0e229h)		;54c8
	and a			;54cb
	jr z,L_54D6		;54cc
	call L_553D		;54ce
	ld a,003h		;54d1
	ld (0e300h),a		;54d3
L_54D6:
	ld a,(0e380h)		;54d6
	or a			;54d9
	jp nz,L_544F		;54da
	ld a,(0e229h)		;54dd
	and a			;54e0
	jp nz,L_545C		;54e1
L_54E4:
	ld hl,0e202h		;54e4
	ld a,(hl)			;54e7
	and 0bfh		;54e8
	ld (hl),a			;54ea
	jp L_531A		;54eb
L_54EE:
	ld hl,(0e22eh)		;54ee
	push hl			;54f1
	pop iy		;54f2
	ld (iy+020h),000h		;54f4
	ld a,(0e229h)		;54f8
	and a			;54fb
	jr z,L_5508		;54fc
	call L_553D		;54fe
	ld (iy+000h),003h		;5501
	jp L_545C		;5505
L_5508:
	bit 7,l		;5508
	call z,L_549E		;550a
	ld a,001h		;550d
	ld (0e227h),a		;550f
	jp L_545C		;5512
L_5515:
	call L_58E9		;5515
	ret p			;5518
	ld hl,001e0h		;5519
	ld (0e649h),hl		;551c
	ld a,032h		;551f
	call L_4D6E		;5521
	call L_5553		;5524
	ld de,0b686h		;5527
	call L_4CF5		;552a
	call L_581E		;552d
	call L_5A7E		;5530
	call L_5A12		;5533
	xor a			;5536
	ld (0e229h),a		;5537
	jp L_5338		;553a
L_553D:
	ld hl,0e27ah		;553d
	ld a,(0e22ch)		;5540
	or a			;5543
	jr z,L_5548		;5544
	ld l,075h		;5546
L_5548:
	xor a			;5548
	ld (hl),a			;5549
	inc l			;554a
	ld (hl),a			;554b
	inc l			;554c
	ld (hl),a			;554d
	inc l			;554e
	ld (hl),a			;554f
	inc l			;5550
	ld (hl),a			;5551
	ret			;5552
L_5553:
	call L_41BF		;5553
	call 0b957h		;5556
	call 0b911h		;5559
	jp L_41D0		;555c
L_555F:
	djnz L_5575		;555f
	call L_4199		;5561
	call 08bebh		;5564
	call 087e9h		;5567
	call L_416E		;556a
	ld a,(0e217h)		;556d
	and a			;5570
	ret nz			;5571
	jp L_533B		;5572
L_5575:
	djnz L_558E		;5575
	xor a			;5577
	ld (0e21ah),a		;5578
	call 08703h		;557b
L_557E:
	xor a			;557e
	ld (0e630h),a		;557f
	ld (0e215h),a		;5582
	ld (0e342h),a		;5585
	ld (0e3c2h),a		;5588
	jp L_545C		;558b
L_558E:
	call L_4CA4		;558e
	call L_41D8		;5591
	ld a,(0e301h)		;5594
	cp 004h		;5597
	ld de,09ddfh		;5599
	jr nc,L_55A1		;559c
	ld de,096bfh		;559e
L_55A1:
	push de			;55a1
	ld hl,01800h		;55a2
	ld bc,00040h		;55a5
	push bc			;55a8
	call L_4CBD		;55a9
	pop bc			;55ac
	pop de			;55ad
	ld hl,01840h		;55ae
	call L_4CBD		;55b1
	call L_416E		;55b4
	call L_5553		;55b7
	call L_4199		;55ba
	call 08b7bh		;55bd
	call L_416E		;55c0
	ld a,001h		;55c3
	ld (0e217h),a		;55c5
	xor a			;55c8
	jp L_5338		;55c9
L_55CC:
	call L_5F69		;55cc
	ld a,(0e218h)		;55cf
	rra			;55d2
	jp c,L_5641		;55d3
	ld a,(0e630h)		;55d6
	or a			;55d9
	ret nz			;55da
	call L_55F9		;55db
	ret c			;55de
	ld a,(0e227h)		;55df
	cp 002h		;55e2
	ret nc			;55e4
	ld a,00bh		;55e5
	jp L_5320		;55e7
L_55EA:
	call L_55F9		;55ea
	ret c			;55ed
	ld a,001h		;55ee
	ld (0e229h),a		;55f0
	ld de,0b693h		;55f3
	jp L_4D0C		;55f6
L_55F9:
	ld a,007h		;55f9
	call 00141h		;55fb   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	rra			;55fe
	rra			;55ff
	ret			;5600
L_5601:
	djnz L_5618		;5601
	call L_41CB		;5603
	call 0b877h		;5606
	call L_41D0		;5609
	ld a,(0e230h)		;560c
	or a			;560f
	ret z			;5610
	call L_4CA4		;5611
	xor a			;5614
	jp L_5338		;5615
L_5618:
	djnz L_5657		;5618
	ld hl,0e204h		;561a
	dec (hl)			;561d
	ret nz			;561e
	call L_564B		;561f
	ld a,(0e6a5h)		;5622
	or a			;5625
	jr z,L_563B		;5626
	ld a,002h		;5628
	ld (0e227h),a		;562a
	call L_53CB		;562d
	call L_5A12		;5630
	call L_5D18		;5633
	call 087a4h		;5636
	jr L_5641		;5639
L_563B:
	call L_5A12		;563b
	call L_5D18		;563e
L_5641:
	ld a,0f2h		;5641
	call L_4D6E		;5643
	ld a,005h		;5646
	jp L_5320		;5648
L_564B:
	call L_4CA4		;564b
	call L_5553		;564e
	call L_53F0		;5651
	jp L_436B		;5654
L_5657:
	call L_4CA4		;5657
	call L_41BF		;565a
	call 0b8d7h		;565d
	call 0b8fah		;5660
	call L_416E		;5663
	xor a			;5666
	ld (0e230h),a		;5667
	ld (0e6a4h),a		;566a
	jp L_533B		;566d
L_5670:
	djnz L_5681		;5670
L_5672:
	ld hl,(0e698h)		;5672
	dec hl			;5675
	ld (0e698h),hl		;5676
	ld a,h			;5679
	or l			;567a
	ret nz			;567b
	call L_564B		;567c
	jr L_563B		;567f
L_5681:
	djnz L_569A		;5681
	call L_4199		;5683
	call 09497h		;5686
	call L_416E		;5689
	ld a,(0ee21h)		;568c
	or a			;568f
	ret z			;5690
	ld de,0b6c0h		;5691
	call L_4CF5		;5694
L_5697:
	jp L_533B		;5697
L_569A:
	djnz L_56A7		;569a
	ld a,(0e30eh)		;569c
	bit 4,a		;569f
	ret z			;56a1
	call 07b97h		;56a2
	jr L_5697		;56a5
L_56A7:
	djnz L_56C0		;56a7
	call L_4199		;56a9
	call 09497h		;56ac
	call L_416E		;56af
	ld a,(0ee21h)		;56b2
	or a			;56b5
	ret z			;56b6
	ld hl,00384h		;56b7
	ld (0e698h),hl		;56ba
	jp L_5336		;56bd
L_56C0:
	djnz L_56C4		;56c0
	jr L_5672		;56c2
L_56C4:
	ld a,022h		;56c4
	call L_4D6E		;56c6
	xor a			;56c9
	ld (0e6d0h),a		;56ca
	ld a,(0e6d1h)		;56cd
	dec a			;56d0
	jr z,L_56DF		;56d1
	call 07b06h		;56d3
	ld hl,00384h		;56d6
	ld (0e698h),hl		;56d9
	jp L_533B		;56dc
L_56DF:
	ld a,002h		;56df
	ld (0e201h),a		;56e1
	jp 07b73h		;56e4
L_56E7:
	djnz L_571D		;56e7
	ld hl,0e204h		;56e9
	dec (hl)			;56ec
	ret nz			;56ed
	call L_41BF		;56ee
	call 0b9e1h		;56f1
	call L_41C3		;56f4
	ld hl,02190h		;56f7
	ld de,0a912h		;56fa
	call L_4CE5		;56fd
	ld hl,00008h		;5700
	ld a,0f0h		;5703
	ld bc,007f8h		;5705
	call L_4CD4		;5708
	call L_416E		;570b
	ld de,0b6adh		;570e
	call L_4CF5		;5711
	ld a,001h		;5714
	call L_4D6E		;5716
	xor a			;5719
	jp L_5338		;571a
L_571D:
	djnz L_5755		;571d
	call L_57CC		;571f
	jr z,L_5730		;5722
	call L_57D4		;5724
	jr z,L_5740		;5727
	ld hl,0e204h		;5729
	dec (hl)			;572c
	ret nz			;572d
	jr L_5740		;572e
L_5730:
	ld de,0b6adh		;5730
	call L_4D0C		;5733
	ld de,0b6dch		;5736
	call L_4CF5		;5739
	xor a			;573c
	jp L_5338		;573d
L_5740:
	ld de,0b6adh		;5740
	call L_4D0C		;5743
	ld de,0b6d1h		;5746
	call L_4CF5		;5749
	xor a			;574c
	ld (0e204h),a		;574d
	ld a,004h		;5750
	jp L_5392		;5752
L_5755:
	djnz L_5793		;5755
	ld hl,0e204h		;5757
	dec (hl)			;575a
	ret nz			;575b
	call L_4CA4		;575c
	ld a,001h		;575f
	ld (0e21bh),a		;5761
	call 08703h		;5764
	call L_576D		;5767
	jp L_557E		;576a
L_576D:
	ld iy,0e300h		;576d
	call L_577E		;5771
	ld a,(0e227h)		;5774
	cp 002h		;5777
	ret nz			;5779
	ld iy,0e380h		;577a
L_577E:
	xor a			;577e
	ld (iy+00ah),a		;577f
	push iy		;5782
	pop hl			;5784
	ld bc,00060h		;5785
	add hl,bc			;5788
	ld d,h			;5789
	ld e,l			;578a
	inc de			;578b
	ld bc,00007h		;578c
	ld (hl),a			;578f
	ldir		;5790
	ret			;5792
L_5793:
	djnz L_57B8		;5793
	ld hl,0e204h		;5795
	dec (hl)			;5798
	ret nz			;5799
	call L_4CA4		;579a
	xor a			;579d
	ld (0e300h),a		;579e
	ld a,(0e227h)		;57a1
	cp 002h		;57a4
	jr nc,L_57B1		;57a6
	ld a,(0e380h)		;57a8
	or a			;57ab
	jp nz,L_544F		;57ac
	jr L_57B5		;57af
L_57B1:
	xor a			;57b1
	ld (0e380h),a		;57b2
L_57B5:
	jp L_54E4		;57b5
L_57B8:
	call L_4199		;57b8
	call 08f7fh		;57bb
	call 087e9h		;57be
	call L_416E		;57c1
	ld a,(0e226h)		;57c4
	or a			;57c7
	ret nz			;57c8
	jp L_5336		;57c9
L_57CC:
	ld a,005h		;57cc
	call 00141h		;57ce   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 6,a		;57d1
	ret			;57d3
L_57D4:
	ld a,004h		;57d4
	call 00141h		;57d6   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 3,a		;57d9
	ret			;57db

; ----------------------------------------------------------------------
; DATOS sin identificar  0x57dc..0x581e  (66 bytes)
DATA_57DC:
	defb 0cdh,0ffh,051h,021h,011h,0e2h,0cdh,0b8h,051h,0b7h,0c8h,021h,004h,0e2h,036h,000h	; 57dc  ..Q!....Q..!..6.
	defb 021h,000h,0e2h,011h,027h,0e2h,046h,010h,013h,0e6h,030h,028h,01ch,03eh,040h,032h	; 57ec  !...'.F...0(.>@2
	defb 002h,0e2h,036h,003h,023h,00eh,000h,071h,00dh,0c3h,0c4h,090h,036h,001h,023h,0afh	; 57fc  ..6.#..q....6.#.
	defb 077h,032h,017h,0e2h,03eh,001h,0c3h,06eh,04dh,01ah,03ch,0feh,003h,038h,001h,0afh	; 580c  w2..>..nM.<..8..
	defb 012h,0c9h	; 581c

; ======================================================================
; CODIGO 0x581e..0x58be  (160 bytes)
; ======================================================================


L_581E:
	ld a,(0e22ch)		;581e
	or a			;5821
	ld de,0b670h		;5822
	jr z,L_582A		;5825
	ld de,0b67bh		;5827
L_582A:
	jp L_4CF5		;582a
L_582D:
	ld hl,0e280h		;582d
	ld bc,00dbfh		;5830
	jr L_583B		;5833
L_5835:
	ld hl,0e275h		;5835
	ld bc,00dcah		;5838
L_583B:
	ld e,l			;583b
	ld d,h			;583c
	inc de			;583d
	ld (hl),000h		;583e
	ldir		;5840
	xor a			;5842
	ld (0e21ah),a		;5843
	ld (0e21ch),a		;5846
	ld (0e215h),a		;5849
	ld hl,058beh		;584c
	ld de,0e300h		;584f
	ld bc,00007h		;5852
	ldir		;5855
	ld a,e			;5857
	add a,004h		;5858
	ld e,a			;585a
	ld a,(0e23ah)		;585b
	ld b,a			;585e
	and 001h		;585f
	ld (de),a			;5861
	ld a,b			;5862
	rra			;5863
	and 003h		;5864
	inc e			;5866
	ld (de),a			;5867
	ld a,b			;5868
	rlca			;5869
	and 003h		;586a
	inc e			;586c
	ld (de),a			;586d
	ld a,043h		;586e
	add a,e			;5870
	ld e,a			;5871
	ld a,b			;5872
	and 003h		;5873
	ld b,a			;5875
	add a,a			;5876
	add a,a			;5877
	add a,a			;5878
	add a,b			;5879
	ld hl,058c5h		;587a
	call L_40C4		;587d
	ld bc,00009h		;5880
	ldir		;5883
	ld a,005h		;5885
	ld (de),a			;5887
	ld a,(0f0f5h)		;5888
	rra			;588b
	call nc,L_58AE		;588c
	call L_58A2		;588f
	ld a,(0e227h)		;5892
	or a			;5895
	jr nz,L_589C		;5896
	xor a			;5898
	ld (0e380h),a		;5899
L_589C:
	ld a,001h		;589c
	ld (0e3a1h),a		;589e
	ret			;58a1
L_58A2:
	ld hl,0e300h		;58a2
	ld de,0e380h		;58a5
	ld bc,00080h		;58a8
	ldir		;58ab
	ret			;58ad
L_58AE:
	ld hl,0e350h		;58ae
	ld b,009h		;58b1
L_58B3:
	ld a,(hl)			;58b3
	dec a			;58b4
	jr z,L_58BB		;58b5
	inc hl			;58b7
	djnz L_58B3		;58b8
	ret			;58ba
L_58BB:
	ld (hl),000h		;58bb
	ret			;58bd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x58be..0x58e9  (43 bytes)
DATA_58BE:
	defb 003h,001h,020h,000h,000h,000h,010h,001h,000h,002h,000h,004h,000h,003h,000h,000h	; 58be  .. .............
	defb 002h,000h,000h,000h,004h,003h,000h,000h,001h,000h,000h,000h,002h,004h,001h,000h	; 58ce  ................
	defb 000h,003h,000h,002h,000h,001h,004h,000h,000h,003h,000h	; 58de  ...........

; ======================================================================
; CODIGO 0x58e9..0x5b53  (618 bytes)
; ======================================================================


L_58E9:
	ld hl,0e204h		;58e9
	dec (hl)			;58ec
	ret m			;58ed
	ld a,(hl)			;58ee
	ld h,038h		;58ef
	xor 01fh		;58f1
	ld l,a			;58f3
	ld b,015h		;58f4
	ld a,(0e200h)		;58f6
	cp 002h		;58f9
	jr nz,L_58FF		;58fb
	ld b,018h		;58fd
L_58FF:
	xor a			;58ff
	ld de,00020h		;5900
L_5903:
	call 0004dh		;5903   ; BIOS WRTVRM - Writes data in VRAM
	add hl,de			;5906
	djnz L_5903		;5907
L_5909:
	ld hl,03b00h		;5909
	call L_5912		;590c
	ld hl,03b80h		;590f
L_5912:
	ld a,0d0h		;5912
	call 0004dh		;5914   ; BIOS WRTVRM - Writes data in VRAM
	xor a			;5917
	ret			;5918
L_5919:
	ld a,(0e202h)		;5919
	add a,a			;591c
	ret p			;591d
	ld a,(iy+010h)		;591e
	push iy		;5921
	ld iy,0e300h		;5923
	xor (iy+021h)		;5927
	jr z,L_5930		;592a
	ld iy,0e380h		;592c
L_5930:
	call L_593B		;5930
	pop iy		;5933
	ret			;5935
L_5936:
	ld a,(0e202h)		;5936
	add a,a			;5939
	ret p			;593a
L_593B:
	bit 0,(iy+021h)		;593b
	ld hl,0e27bh		;593f
	jr z,L_5946		;5942
	ld l,076h		;5944
L_5946:
	ld a,(hl)			;5946
	add a,e			;5947
	daa			;5948
	ld (hl),a			;5949
	inc l			;594a
	ld a,(hl)			;594b
	adc a,d			;594c
	daa			;594d
	ld (hl),a			;594e
	inc hl			;594f
	ld a,(hl)			;5950
	adc a,000h		;5951
	daa			;5953
	ld (hl),a			;5954
	inc hl			;5955
	ld a,(hl)			;5956
	adc a,000h		;5957
	daa			;5959
	ld (hl),a			;595a
	jr nc,L_5970		;595b
	ld a,099h		;595d
	ld (hl),a			;595f
	dec l			;5960
	ld (hl),a			;5961
	dec l			;5962
	ld (hl),a			;5963
	dec l			;5964
	ld (hl),a			;5965
	ld hl,09999h		;5966
	ld (0e271h),hl		;5969
	ld (0e273h),hl		;596c
	ret			;596f
L_5970:
	ex de,hl			;5970
	push iy		;5971
	pop hl			;5973
	ld a,008h		;5974
	add a,l			;5976
	ld l,a			;5977
	ld a,(de)			;5978
	cp (hl)			;5979
	jr c,L_599C		;597a
	dec e			;597c
	dec l			;597d
	ld a,(de)			;597e
	cp (hl)			;597f
	jr c,L_599C		;5980
	dec e			;5982
	dec l			;5983
	ld a,(de)			;5984
	cp (hl)			;5985
	jr c,L_599C		;5986
	ld a,(hl)			;5988
	add a,010h		;5989
	daa			;598b
	ld (hl),a			;598c
	inc l			;598d
	ld a,(hl)			;598e
	adc a,000h		;598f
	daa			;5991
	ld (hl),a			;5992
	inc l			;5993
	ld a,(hl)			;5994
	adc a,000h		;5995
	daa			;5997
	ld (hl),a			;5998
	call L_59C1		;5999
L_599C:
	bit 0,(iy+021h)		;599c
	ld hl,0e27eh		;59a0
	jr z,L_59A8		;59a3
	ld hl,0e279h		;59a5
L_59A8:
	ld b,004h		;59a8
	ld de,0e274h		;59aa
	ld c,l			;59ad
L_59AE:
	ld a,(de)			;59ae
	sub (hl)			;59af
	jr c,L_59B8		;59b0
	ret nz			;59b2
	dec l			;59b3
	dec e			;59b4
	djnz L_59AE		;59b5
	ret			;59b7
L_59B8:
	ld l,c			;59b8
	ld bc,00004h		;59b9
	ld e,074h		;59bc
	lddr		;59be
	ret			;59c0
L_59C1:
	ld a,(iy+000h)		;59c1
	add a,001h		;59c4
	daa			;59c6
	ret c			;59c7
	ld (iy+000h),a		;59c8
	ld a,012h		;59cb
	call L_4D6E		;59cd
L_59D0:
	push iy		;59d0
	pop de			;59d2
	bit 0,(iy+021h)		;59d3
	ld hl,03ac2h		;59d7
	jr z,L_59DE		;59da
	ld l,0d2h		;59dc
L_59DE:
	ld a,(de)			;59de
	ld b,001h		;59df
	and 0f0h		;59e1
	jr nz,L_5A63		;59e3
	call L_4CB1		;59e5
	exx			;59e8
	ld a,c			;59e9
	exx			;59ea
	ld c,a			;59eb
	xor a			;59ec
	out (c),a		;59ed
	inc hl			;59ef
	jp L_5A74		;59f0
L_59F3:
	push iy		;59f3
	pop de			;59f5
	ld a,01bh		;59f6
	add a,e			;59f8
	ld e,a			;59f9
	bit 0,(iy+021h)		;59fa
	ld hl,03ac6h		;59fe
	jr z,L_5A05		;5a01
	ld l,0d6h		;5a03
L_5A05:
	ld b,001h		;5a05
	jr L_5A63		;5a07
L_5A09:
	call L_5A19		;5a09
	ld iy,0e380h		;5a0c
	jr L_5A1D		;5a10
L_5A12:
	ld a,(0e227h)		;5a12
	cp 002h		;5a15
	jr z,L_5A09		;5a17
L_5A19:
	ld iy,0e300h		;5a19
L_5A1D:
	bit 0,(iy+021h)		;5a1d
	ld de,0b62bh		;5a21
	jr z,L_5A29		;5a24
	ld de,0b63ch		;5a26
L_5A29:
	call L_4CF5		;5a29
	call L_5A48		;5a2c
	call L_59D0		;5a2f
	jr L_59F3		;5a32
L_5A34:
	call L_5A44		;5a34
	ld iy,0e380h		;5a37
	jr L_5A48		;5a3b
L_5A3D:
	ld a,(0e227h)		;5a3d
	cp 002h		;5a40
	jr z,L_5A34		;5a42
L_5A44:
	ld iy,0e300h		;5a44
L_5A48:
	bit 0,(iy+021h)		;5a48
	ld hl,03ae5h		;5a4c
	ld de,0e27eh		;5a4f
	jr z,L_5A58		;5a52
	ld l,0f5h		;5a54
	ld e,079h		;5a56
L_5A58:
	ld b,005h		;5a58
	call L_4CB1		;5a5a
	exx			;5a5d
	ld a,c			;5a5e
	exx			;5a5f
	ld c,a			;5a60
	jr L_5A74		;5a61
L_5A63:
	call L_4CB1		;5a63
	exx			;5a66
	ld a,c			;5a67
	exx			;5a68
	ld c,a			;5a69
L_5A6A:
	ld a,(de)			;5a6a
	rra			;5a6b
	rra			;5a6c
	rra			;5a6d
	rra			;5a6e
	and 00fh		;5a6f
	inc a			;5a71
	out (c),a		;5a72
L_5A74:
	ld a,(de)			;5a74
	and 00fh		;5a75
	inc a			;5a77
	out (c),a		;5a78
	dec de			;5a7a
	djnz L_5A6A		;5a7b
	ret			;5a7d
L_5A7E:
	ld de,0b6a2h		;5a7e
	call L_4CF5		;5a81
	ld de,0e274h		;5a84
	ld hl,03a2bh		;5a87
	ld b,005h		;5a8a
	jp L_5A63		;5a8c
L_5A8F:
	ld c,(hl)			;5a8f
	ld a,(de)			;5a90
	ld (hl),a			;5a91
	ld a,c			;5a92
	ld (de),a			;5a93
	inc hl			;5a94
	inc de			;5a95
	djnz L_5A8F		;5a96
	ret			;5a98
L_5A99:
	ld a,l			;5a99
	rra			;5a9a
	rra			;5a9b
	rra			;5a9c
	or a			;5a9d
	rr h		;5a9e
	rra			;5aa0
	rr h		;5aa1
	rra			;5aa3
	rr h		;5aa4
	ld l,h			;5aa6
	and 007h		;5aa7
	add a,0cah		;5aa9
	ld h,a			;5aab
	ret			;5aac
L_5AAD:
	ld a,040h		;5aad
	add a,l			;5aaf
	ld l,a			;5ab0
	jr nc,L_5AB4		;5ab1
	inc h			;5ab3
L_5AB4:
	ld a,080h		;5ab4
	add a,e			;5ab6
	ld e,a			;5ab7
	jr nc,L_5ABB		;5ab8
	inc d			;5aba
L_5ABB:
	ex de,hl			;5abb
	ld a,l			;5abc
	rr h		;5abd
	rra			;5abf
	rr d		;5ac0
	rr e		;5ac2
	rr e		;5ac4
	rr e		;5ac6
	rr e		;5ac8
	rra			;5aca
	rr e		;5acb
	rra			;5acd
	ld l,a			;5ace
	ld a,e			;5acf
	and 00fh		;5ad0
	ld h,a			;5ad2
	ld de,0c7f0h		;5ad3
	add hl,de			;5ad6
	ret			;5ad7
L_5AD8:
	add a,l			;5ad8
	ld l,a			;5ad9
	jr nc,L_5ADD		;5ada
	inc h			;5adc
L_5ADD:
	ld a,(hl)			;5add
	ret			;5ade
L_5ADF:
	ld a,e			;5adf
	cpl			;5ae0
	ld e,a			;5ae1
	ld a,d			;5ae2
	cpl			;5ae3
	ld d,a			;5ae4
	inc de			;5ae5
	ret			;5ae6
L_5AE7:
	ld a,l			;5ae7
	cpl			;5ae8
	ld l,a			;5ae9
	ld a,h			;5aea
	cpl			;5aeb
	ld h,a			;5aec
	inc hl			;5aed
	ret			;5aee
L_5AEF:
	xor a			;5aef
	ld (0e215h),a		;5af0
	ld (0e630h),a		;5af3
	ld (0e22ch),a		;5af6
	ld h,a			;5af9
	ld l,a			;5afa
	ld (0e22eh),hl		;5afb
	ld hl,0e400h		;5afe
	ld de,0e401h		;5b01
	ld bc,00bffh		;5b04
	ld (hl),a			;5b07
	ldir		;5b08
	call L_4EAF		;5b0a
	call L_5F57		;5b0d
	call 0886ah		;5b10
	call 0885bh		;5b13
	ld a,(0e202h)		;5b16
	bit 6,a		;5b19
	jr nz,L_5B21		;5b1b
	xor a			;5b1d
	ld (0e64fh),a		;5b1e
L_5B21:
	call L_436B		;5b21
	call 087a4h		;5b24
	ld hl,0c700h		;5b27
	ld de,0c701h		;5b2a
	ld bc,008ffh		;5b2d
	ldir		;5b30
	jp L_48A6		;5b32
L_5B35:
	ld a,(0e640h)		;5b35
	dec a			;5b38
	ret m			;5b39
	ld c,a			;5b3a
	call L_41EE		;5b3b
	call L_41BF		;5b3e
	call L_5B47		;5b41
	jp L_416E		;5b44
L_5B47:
	ld a,(0ec80h)		;5b47
	or a			;5b4a
	ret z			;5b4b
	ld a,c			;5b4c
	call 0b6a8h		;5b4d
	call L_40CE		;5b50

; ----------------------------------------------------------------------
; DATOS tabla_5B53: 8 destinos del despachador p00:40CE (call en p00:5B50, el
;   indice en A): AA1D, A80A, AE25, AC34, B35E, B06F, 5B63, B4E9; lo leen
;   p00:5B50 (16 bytes)
;   0x5b53..0x5b63  (16 bytes)
DATA_tabla_5B53:
	defw 0aa1dh,0a80ah,0ae25h,0ac34h,0b35eh,0b06fh,05b63h,0b4e9h	; 5b53

; ======================================================================
; CODIGO 0x5b63..0x5bfe  (155 bytes)
; ======================================================================


L_5B63:
	ret			;5b63
L_5B64:
	ld a,(0e640h)		;5b64
	and a			;5b67
	ret z			;5b68
	cp 008h		;5b69
	ret z			;5b6b
	ld a,(0ec80h)		;5b6c
	and a			;5b6f
	ret z			;5b70
	ld hl,0ca00h		;5b71
	ld de,0ca01h		;5b74
	ld bc,0151fh		;5b77
L_5B7A:
	push bc			;5b7a
	ld (hl),000h		;5b7b
	ld b,000h		;5b7d
	ldir		;5b7f
	ld a,021h		;5b81
	call L_40C4		;5b83
	ld a,021h		;5b86
	call L_40C9		;5b88
	pop bc			;5b8b
	djnz L_5B7A		;5b8c
	jp L_4B97		;5b8e
L_5B91:
	di			;5b91
	ld a,0c9h		;5b92
	ld (0fd9ah),a		;5b94
	ld hl,L_5BA5		;5b97
	ld de,0c000h		;5b9a
	ld bc,00095h		;5b9d
	ldir		;5ba0
	jp 0c000h		;5ba2
L_5BA5:
	call 0c010h		;5ba5
	call 0c03ch		;5ba8
	call 0c024h		;5bab
	ld a,0c3h		;5bae
	ld (0fd9ah),a		;5bb0
	ei			;5bb3
	ret			;5bb4
L_5BB5:
	ld a,(0f0f4h)		;5bb5
	call 0c030h		;5bb8
L_5BBB:
	ld a,007h		;5bbb
	ld (07000h),a		;5bbd
	inc a			;5bc0
	ld (09000h),a		;5bc1
	inc a			;5bc4
	ld (0b000h),a		;5bc5
	ret			;5bc8
L_5BC9:
	ld a,(0f0f6h)		;5bc9
	call 0c030h		;5bcc
	xor a			;5bcf
	ld (05000h),a		;5bd0
	jr L_5BBB		;5bd3
L_5BD5:
	push af			;5bd5
	ld h,040h		;5bd6
	call 00024h		;5bd8   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;5bdb
	ld h,080h		;5bdc
	jp 00024h		;5bde   ; BIOS ENASLT - Switches to specified slot and page definitively
L_5BE1:
	ld de,0c100h		;5be1
	ld hl,0c059h		;5be4
	ld b,014h		;5be7
L_5BE9:
	push bc			;5be9
	push hl			;5bea
	ld c,(hl)			;5beb
	ld b,000h		;5bec
	inc hl			;5bee
	ld a,(hl)			;5bef
	inc hl			;5bf0
	ld h,(hl)			;5bf1
	ld l,a			;5bf2
	ldir		;5bf3
	pop hl			;5bf5
	ld bc,00003h		;5bf6
	add hl,bc			;5bf9
	pop bc			;5bfa
	djnz L_5BE9		;5bfb
	ret			;5bfd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5bfe..0x5c3a  (60 bytes)
DATA_5BFE:
	defb 028h,0a7h,069h,0a7h,0b0h,06ah,020h,054h,071h,010h,057h,06bh,02eh,0cfh,069h,05dh	; 5bfe  (.i..j Tq.Wk..i]
	defb 0fdh,069h,011h,05ah,06ah,02bh,06bh,06ah,028h,0c6h,07fh,092h,098h,080h,01eh,00eh	; 5c0e  .i.Zj+kj(.......
	defb 087h,01eh,080h,087h,012h,0d4h,081h,02ch,0eeh,07fh,04ah,01ah,080h,012h,064h,080h	; 5c1e  .......,..J...d.
	defb 022h,076h,080h,076h,06dh,0bfh,022h,0c2h,099h,061h,001h,096h	; 5c2e  "v.vm."..a..

; ======================================================================
; CODIGO 0x5c3a..0x5cfa  (192 bytes)
; ======================================================================


L_5C3A:
	ld de,(0e302h)		;5c3a
	ld a,(0e301h)		;5c3e
	dec a			;5c41
	jr z,L_5C70		;5c42
	sub 002h		;5c44
	jr z,L_5C69		;5c46
	sub 003h		;5c48
	jr z,L_5C56		;5c4a
	dec a			;5c4c
	ret nz			;5c4d
	ld hl,001bfh		;5c4e
	rst 20h			;5c51
	ret nc			;5c52
	jp L_5C97		;5c53
L_5C56:
	ld hl,0019fh		;5c56
	ld hl,001a0h		;5c59
	rst 20h			;5c5c
	jr c,L_5CAD		;5c5d
	ld hl,000b7h		;5c5f
	rst 20h			;5c62
	ret nc			;5c63
	ld hl,05d06h		;5c64
	jr L_5CCB		;5c67
L_5C69:
	ld hl,0020eh		;5c69
	rst 20h			;5c6c
	ret nc			;5c6d
	jr L_5CBA		;5c6e
L_5C70:
	ld hl,0018fh		;5c70
	rst 20h			;5c73
	ret nc			;5c74
	jr L_5CC8		;5c75
L_5C77:
	ld bc,0e628h		;5c77
	ld de,(0e302h)		;5c7a
	ld a,(0e301h)		;5c7e
	dec a			;5c81
	jr z,L_5CBF		;5c82
	sub 002h		;5c84
	jr z,L_5CB2		;5c86
	sub 003h		;5c88
	jr z,L_5C9C		;5c8a
	dec a			;5c8c
	ret nz			;5c8d
	dec bc			;5c8e
	ld a,(bc)			;5c8f
	or a			;5c90
	ret z			;5c91
	ld hl,001c0h		;5c92
	rst 20h			;5c95
	ret nz			;5c96
L_5C97:
	ld hl,05d12h		;5c97
	jr L_5CCB		;5c9a
L_5C9C:
	ld a,(bc)			;5c9c
	or a			;5c9d
	ret z			;5c9e
	ld hl,000b8h		;5c9f
	rst 20h			;5ca2
	ld hl,05d06h		;5ca3
	jr z,L_5CCB		;5ca6
	ld hl,001a0h		;5ca8
	rst 20h			;5cab
	ret nz			;5cac
L_5CAD:
	ld hl,05d0ch		;5cad
	jr L_5CCB		;5cb0
L_5CB2:
	ld a,(bc)			;5cb2
	or a			;5cb3
	ret z			;5cb4
	ld hl,0020fh		;5cb5
	rst 20h			;5cb8
	ret nz			;5cb9
L_5CBA:
	ld hl,05d00h		;5cba
	jr L_5CCB		;5cbd
L_5CBF:
	dec bc			;5cbf
	ld a,(bc)			;5cc0
	or a			;5cc1
	ret z			;5cc2
	ld hl,00190h		;5cc3
	rst 20h			;5cc6
	ret nz			;5cc7
L_5CC8:
	ld hl,05cfah		;5cc8
L_5CCB:
	call L_4178		;5ccb
	ld e,(hl)			;5cce
	inc hl			;5ccf
	ld d,(hl)			;5cd0
	push hl			;5cd1
	push de			;5cd2
	pop ix		;5cd3
	call L_4546		;5cd5
	pop hl			;5cd8
	inc hl			;5cd9
	ld e,(hl)			;5cda
	inc hl			;5cdb
	ld d,(hl)			;5cdc
	push hl			;5cdd
	push de			;5cde
	pop ix		;5cdf
	xor a			;5ce1
	ld (0f000h),a		;5ce2
	call L_44F9		;5ce5
	pop hl			;5ce8
	inc hl			;5ce9
	ld e,(hl)			;5cea
	inc hl			;5ceb
	ld d,(hl)			;5cec
	push de			;5ced
	pop ix		;5cee
	ld hl,0f000h		;5cf0
	inc (hl)			;5cf3
	call L_44F9		;5cf4
	jp L_416E		;5cf7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5cfa..0x5d18  (30 bytes)
DATA_5CFA:
	defb 095h,094h,0ech,094h,007h,095h,09ch,094h,0f6h,094h,00bh,095h,0a9h,094h,0dch,094h	; 5cfa  ................
	defb 00ch,095h,0b6h,094h,0edh,094h,014h,095h,0c3h,094h,006h,095h,015h,095h	; 5d0a  ..............

; ======================================================================
; CODIGO 0x5d18..0x5e54  (316 bytes)
; ======================================================================


L_5D18:
	ld a,(0e227h)		;5d18
	or a			;5d1b
	jr z,L_5D25		;5d1c
	ld iy,0e380h		;5d1e
	call L_5D2C		;5d22
L_5D25:
	ld iy,0e300h		;5d25
	call L_5D2C		;5d29
L_5D2C:
	ld a,(iy+020h)		;5d2c
	or a			;5d2f
	ret z			;5d30
	inc a			;5d31
	jr nz,L_5D62		;5d32
	push iy		;5d34
	pop hl			;5d36
	ld bc,00011h		;5d37
	add hl,bc			;5d3a
	ld a,(hl)			;5d3b
	or a			;5d3c
	jr z,L_5D41		;5d3d
	ld a,001h		;5d3f
L_5D41:
	ld (hl),a			;5d41
	inc hl			;5d42
	xor a			;5d43
	ld (hl),a			;5d44
	inc hl			;5d45
	ld (hl),0ffh		;5d46
	inc hl			;5d48
	ld (hl),a			;5d49
	inc hl			;5d4a
	ld (hl),a			;5d4b
	inc hl			;5d4c
	ld (hl),a			;5d4d
	inc hl			;5d4e
	ld (hl),a			;5d4f
	inc hl			;5d50
	ld (hl),a			;5d51
	ld a,(0e6a5h)		;5d52
	or a			;5d55
	jr z,L_5D62		;5d56
	ld a,(0e60bh)		;5d58
	cp 003h		;5d5b
	jr c,L_5D62		;5d5d
	dec hl			;5d5f
	ld (hl),0ffh		;5d60
L_5D62:
	ld a,(iy+042h)		;5d62
	or a			;5d65
	jr nz,L_5D8E		;5d66
	ld hl,03acah		;5d68
	ld a,016h		;5d6b
	bit 0,(iy+021h)		;5d6d
	jr z,L_5D78		;5d71
	ld hl,03adah		;5d73
	ld a,01bh		;5d76
L_5D78:
	push af			;5d78
	call L_4CB1		;5d79
	pop af			;5d7c
	ld b,005h		;5d7d
L_5D7F:
	exx			;5d7f
	out (c),a		;5d80
	inc a			;5d82
	exx			;5d83
	djnz L_5D7F		;5d84
	exx			;5d86
	xor a			;5d87
	out (c),a		;5d88
	exx			;5d8a
	exx			;5d8b
	out (c),a		;5d8c
L_5D8E:
	ld hl,03aa1h		;5d8e
	bit 0,(iy+021h)		;5d91
	jr z,L_5D9A		;5d95
	ld hl,03ab1h		;5d97
L_5D9A:
	call L_4CB1		;5d9a
	push iy		;5d9d
	pop hl			;5d9f
	ld bc,00012h		;5da0
	add hl,bc			;5da3
	ld bc,00701h		;5da4
L_5DA7:
	call L_5E2F		;5da7
	inc hl			;5daa
	inc c			;5dab
	djnz L_5DA7		;5dac
	ld a,(iy+042h)		;5dae
	or a			;5db1
	ret nz			;5db2
	ld a,(0e630h)		;5db3
	or a			;5db6
	jr z,L_5DCC		;5db7
	cp 007h		;5db9
	jr nz,L_5DC5		;5dbb
	ld a,(0e631h)		;5dbd
	cp 010h		;5dc0
	ret nc			;5dc2
	jr L_5DCC		;5dc3
L_5DC5:
	ld a,(0e228h)		;5dc5
	xor (iy+021h)		;5dc8
	ret z			;5dcb
L_5DCC:
	ld a,(iy+011h)		;5dcc
	ld b,a			;5dcf
	or a			;5dd0
	jr z,L_5DF0		;5dd1
	push iy		;5dd3
	pop hl			;5dd5
	ld de,00011h		;5dd6
	add hl,de			;5dd9
	add a,l			;5dda
	ld l,a			;5ddb
	ld a,(hl)			;5ddc
	ld c,a			;5ddd
	cp 0ffh		;5dde
	jr z,L_5DF0		;5de0
	ld hl,l5e52h		;5de2
	ld a,b			;5de5
	call L_4E28		;5de6
	ex de,hl			;5de9
	ld b,000h		;5dea
	add hl,bc			;5dec
	ld a,(hl)			;5ded
	jr L_5DF1		;5dee
L_5DF0:
	xor a			;5df0
L_5DF1:
	ld hl,030b0h		;5df1
	bit 0,(iy+021h)		;5df4
	jr z,L_5DFD		;5df8
	ld hl,030d8h		;5dfa
L_5DFD:
	push hl			;5dfd
	push af			;5dfe
	call L_41D8		;5dff
	call L_4CB1		;5e02
	exx			;5e05
	pop af			;5e06
	ld b,a			;5e07
	ld hl,08849h		;5e08
	call L_4E28		;5e0b
	ex de,hl			;5e0e
	ld de,00500h		;5e0f
L_5E12:
	out (c),e		;5e12
	nop			;5e14
	ld b,007h		;5e15
L_5E17:
	outi		;5e17
	jp nz,L_5E17		;5e19
	nop			;5e1c
	dec d			;5e1d
	jr nz,L_5E12		;5e1e
	ld a,(hl)			;5e20
	pop hl			;5e21
	ld bc,0e000h		;5e22
	add hl,bc			;5e25
	ld bc,00028h		;5e26
	call 00056h		;5e29   ; BIOS FILVRM - Fills VRAM with value
	jp L_41D0		;5e2c
L_5E2F:
	ld a,(hl)			;5e2f
	inc a			;5e30
	jr nz,L_5E40		;5e31
	ld a,(iy+011h)		;5e33
	cp c			;5e36
	ld a,014h		;5e37
	jr nz,L_5E4A		;5e39
	ld a,014h		;5e3b
	jp L_5E4A		;5e3d
L_5E40:
	ld a,(iy+011h)		;5e40
	cp c			;5e43
	ld a,010h		;5e44
	jr nz,L_5E4A		;5e46
	ld a,012h		;5e48
L_5E4A:
	exx			;5e4a
	out (c),a		;5e4b
	exx			;5e4d
	inc a			;5e4e
	exx			;5e4f
	out (c),a		;5e50
L_5E52:
	exx			;5e52
	ret			;5e53

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5e54..0x5e79  (37 bytes)
DATA_5E54:
	defb 062h,05eh,069h,05eh,06ch,05eh,06fh,05eh,071h,05eh,074h,05eh,078h,05eh,001h,001h	; 5e54  b^i^l^o^q^t^x^..
	defb 001h,001h,001h,001h,001h,002h,00ch,00dh,003h,004h,005h,006h,00eh,007h,009h,008h	; 5e64  ................
	defb 00ah,00ah,00ah,00ah,00bh	; 5e74

; ======================================================================
; CODIGO 0x5e79..0x6000  (391 bytes)
; ======================================================================


L_5E79:
	ld a,b			;5e79
	call L_5DF1		;5e7a
	ld a,(0e630h)		;5e7d
	sub 003h		;5e80
	ret z			;5e82
L_5E83:
	ld a,(0e228h)		;5e83
	or a			;5e86
	ld hl,03aceh		;5e87
	jr z,L_5E8E		;5e8a
	ld l,0deh		;5e8c
L_5E8E:
	ld de,0e631h		;5e8e
	ld b,001h		;5e91
	call L_5A63		;5e93
L_5E96:
	ld a,(0e631h)		;5e96
	cp 004h		;5e99
	jr nc,L_5EA2		;5e9b
	ld a,017h		;5e9d
	call L_4D6E		;5e9f
L_5EA2:
	xor a			;5ea2
	ld (0e215h),a		;5ea3
	ret			;5ea6
L_5EA7:
	ld a,(0e215h)		;5ea7
	dec a			;5eaa
	jr z,L_5EB1		;5eab
	dec a			;5ead
	jr z,L_5EC3		;5eae
	ret			;5eb0
L_5EB1:
	ld a,(0e630h)		;5eb1
	cp 005h		;5eb4
	jr z,L_5E96		;5eb6
	cp 007h		;5eb8
	jr z,L_5E96		;5eba
	sub 003h		;5ebc
	cp 002h		;5ebe
	ret c			;5ec0
	jr L_5E83		;5ec1
L_5EC3:
	call L_5EA2		;5ec3
	ld hl,0e630h		;5ec6
	ld a,(hl)			;5ec9
	ld (hl),000h		;5eca
	dec a			;5ecc
	jp z,L_5EF7		;5ecd
	dec a			;5ed0
	jr z,L_5EF0		;5ed1
	sub 003h		;5ed3
	ret z			;5ed5
	dec a			;5ed6
	jr z,L_5EF7		;5ed7
	dec a			;5ed9
	ret nz			;5eda
	ld a,(0e228h)		;5edb
	ld iy,0e300h		;5ede
	xor (iy+021h)		;5ee2
	jr z,L_5EEB		;5ee5
	ld iy,0e380h		;5ee7
L_5EEB:
	call 094a3h		;5eeb
	jr L_5EF7		;5eee
L_5EF0:
	xor a			;5ef0
	ld (0e334h),a		;5ef1
	ld (0e3b4h),a		;5ef4
L_5EF7:
	ld a,(0e227h)		;5ef7
	cp 002h		;5efa
	jr nz,L_5F05		;5efc
	ld iy,0e380h		;5efe
	call L_5D62		;5f02
L_5F05:
	ld iy,0e300h		;5f05
	jp L_5D62		;5f09
L_5F0C:
	ld iy,0e300h		;5f0c
	call L_5F17		;5f10
	ld iy,0e380h		;5f13
L_5F17:
	ld a,(iy+020h)		;5f17
	dec a			;5f1a
	ret m			;5f1b
	ld a,(iy+068h)		;5f1c
	or a			;5f1f
	ret z			;5f20
	dec (iy+069h)		;5f21
	jr nz,L_5F2B		;5f24
	ld (iy+068h),000h		;5f26
	ret			;5f2a
L_5F2B:
	bit 2,(iy+069h)		;5f2b
	ret z			;5f2f
	ld hl,03947h		;5f30
	call L_4CB1		;5f33
	exx			;5f36
	bit 0,(iy+021h)		;5f37
	ld a,010h		;5f3b
	jr z,L_5F40		;5f3d
	inc a			;5f3f
L_5F40:
	out (c),a		;5f40
	exx			;5f42
	exx			;5f43
	ld a,014h		;5f44
	out (c),a		;5f46
	exx			;5f48
	exx			;5f49
	xor a			;5f4a
	out (c),a		;5f4b
	ld a,012h		;5f4d
	ld b,00eh		;5f4f
L_5F51:
	out (c),a		;5f51
	inc a			;5f53
	djnz L_5F51		;5f54
	ret			;5f56
L_5F57:
	xor a			;5f57
	ld (0e208h),a		;5f58
	ld hl,03b00h		;5f5b
	ld bc,00100h		;5f5e
	ld a,0e0h		;5f61
	jp 00056h		;5f63   ; BIOS FILVRM - Fills VRAM with value
L_5F66:
	xor a			;5f66
	jr L_5F6D		;5f67
L_5F69:
	ld a,(0e208h)		;5f69
	rra			;5f6c
L_5F6D:
	ld bc,07605h		;5f6d
	jr nc,L_5F73		;5f70
	inc b			;5f72
L_5F73:
	jp 00047h		;5f73   ; BIOS WRTVDP - Writes data in the VDP-register
L_5F76:
	ld hl,0e208h		;5f76
	inc (hl)			;5f79
	bit 0,(hl)		;5f7a
	ld hl,03b00h		;5f7c
	jr z,L_5F83		;5f7f
	ld l,080h		;5f81
L_5F83:
	call L_4CB1		;5f83
	exx			;5f86
	ld a,(0e6c0h)		;5f87
	or a			;5f8a
	jr nz,L_5FB0		;5f8b
	ld hl,0e604h		;5f8d
	ld a,(hl)			;5f90
	add a,01ch		;5f91
	and 07ch		;5f93
	ld (hl),a			;5f95
	ld e,a			;5f96
	ld d,020h		;5f97
L_5F99:
	ld a,e			;5f99
	ld hl,0ef80h		;5f9a
	add a,l			;5f9d
	ld l,a			;5f9e
	ld b,004h		;5f9f
L_5FA1:
	outi		;5fa1
	jp nz,L_5FA1		;5fa3
	ld a,e			;5fa6
	add a,00ch		;5fa7
	and 07ch		;5fa9
	ld e,a			;5fab
	dec d			;5fac
	jr nz,L_5F99		;5fad
	ret			;5faf
L_5FB0:
	ld hl,0efe0h		;5fb0
	ld b,020h		;5fb3
L_5FB5:
	outi		;5fb5
	jp nz,L_5FB5		;5fb7
	ld hl,0ef80h		;5fba
	ld b,060h		;5fbd
L_5FBF:
	outi		;5fbf
	jp nz,L_5FBF		;5fc1
	ret			;5fc4
L_5FC5:
	ld a,(0e301h)		;5fc5
	cp 004h		;5fc8
	jr nz,L_5FED		;5fca
	ld hl,(0e302h)		;5fcc
	ld de,00100h		;5fcf
	rst 20h			;5fd2
	jr c,L_5FED		;5fd3
	ld e,050h		;5fd5
	rst 20h			;5fd7
	push af			;5fd8
	call z,0603eh		;5fd9
	pop af			;5fdc
	jr nc,L_5FED		;5fdd
	ld a,(0e630h)		;5fdf
	cp 003h		;5fe2
	jr z,L_5FED		;5fe4
	ld a,(0e203h)		;5fe6
	and 03fh		;5fe9
	jr nz,$+43		;5feb
L_5FED:
	ld hl,03800h		;5fed
	call L_4CB1		;5ff0
	exx			;5ff3
	ld hl,0ca00h		;5ff4
	ld a,(0e645h)		;5ff7
	or a			;5ffa
	jr z,$+9		;5ffb
	ld de,00001h		;5ffd
