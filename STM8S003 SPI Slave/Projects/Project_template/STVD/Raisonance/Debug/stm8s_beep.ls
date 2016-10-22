   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 48 void BEEP_DeInit(void)
  32                     ; 49 {
  34                     	switch	.text
  35  0000               _BEEP_DeInit:
  39                     ; 50     BEEP->CSR = BEEP_CSR_RESET_VALUE;
  41  0000 351f50f3      	mov	20723,#31
  42                     ; 51 }
  45  0004 81            	ret
 111                     ; 61 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 111                     ; 62 {
 112                     	switch	.text
 113  0005               _BEEP_Init:
 115  0005 88            	push	a
 116       00000000      OFST:	set	0
 119                     ; 65     assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 121  0006 4d            	tnz	a
 122  0007 2708          	jreq	L21
 123  0009 a140          	cp	a,#64
 124  000b 2704          	jreq	L21
 125  000d a180          	cp	a,#128
 126  000f 2603          	jrne	L01
 127  0011               L21:
 128  0011 4f            	clr	a
 129  0012 2010          	jra	L41
 130  0014               L01:
 131  0014 ae0041        	ldw	x,#65
 132  0017 89            	pushw	x
 133  0018 ae0000        	ldw	x,#0
 134  001b 89            	pushw	x
 135  001c ae000c        	ldw	x,#L15
 136  001f cd0000        	call	_assert_failed
 138  0022 5b04          	addw	sp,#4
 139  0024               L41:
 140                     ; 68     if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 142  0024 c650f3        	ld	a,20723
 143  0027 a41f          	and	a,#31
 144  0029 a11f          	cp	a,#31
 145  002b 2610          	jrne	L35
 146                     ; 70         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 148  002d c650f3        	ld	a,20723
 149  0030 a4e0          	and	a,#224
 150  0032 c750f3        	ld	20723,a
 151                     ; 71         BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 153  0035 c650f3        	ld	a,20723
 154  0038 aa0b          	or	a,#11
 155  003a c750f3        	ld	20723,a
 156  003d               L35:
 157                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 159  003d c650f3        	ld	a,20723
 160  0040 a43f          	and	a,#63
 161  0042 c750f3        	ld	20723,a
 162                     ; 76     BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 164  0045 c650f3        	ld	a,20723
 165  0048 1a01          	or	a,(OFST+1,sp)
 166  004a c750f3        	ld	20723,a
 167                     ; 78 }
 170  004d 84            	pop	a
 171  004e 81            	ret
 226                     ; 87 void BEEP_Cmd(FunctionalState NewState)
 226                     ; 88 {
 227                     	switch	.text
 228  004f               _BEEP_Cmd:
 232                     ; 89     if (NewState != DISABLE)
 234  004f 4d            	tnz	a
 235  0050 2706          	jreq	L301
 236                     ; 92         BEEP->CSR |= BEEP_CSR_BEEPEN;
 238  0052 721a50f3      	bset	20723,#5
 240  0056 2004          	jra	L501
 241  0058               L301:
 242                     ; 97         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 244  0058 721b50f3      	bres	20723,#5
 245  005c               L501:
 246                     ; 99 }
 249  005c 81            	ret
 303                     .const:	section	.text
 304  0000               L42:
 305  0000 0001adb0      	dc.l	110000
 306  0004               L62:
 307  0004 000249f1      	dc.l	150001
 308  0008               L23:
 309  0008 000003e8      	dc.l	1000
 310                     ; 114 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 310                     ; 115 {
 311                     	switch	.text
 312  005d               _BEEP_LSICalibrationConfig:
 314  005d 5206          	subw	sp,#6
 315       00000006      OFST:	set	6
 318                     ; 121     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 320  005f 96            	ldw	x,sp
 321  0060 1c0009        	addw	x,#OFST+3
 322  0063 cd0000        	call	c_ltor
 324  0066 ae0000        	ldw	x,#L42
 325  0069 cd0000        	call	c_lcmp
 327  006c 2512          	jrult	L22
 328  006e 96            	ldw	x,sp
 329  006f 1c0009        	addw	x,#OFST+3
 330  0072 cd0000        	call	c_ltor
 332  0075 ae0004        	ldw	x,#L62
 333  0078 cd0000        	call	c_lcmp
 335  007b 2403          	jruge	L22
 336  007d 4f            	clr	a
 337  007e 2010          	jra	L03
 338  0080               L22:
 339  0080 ae0079        	ldw	x,#121
 340  0083 89            	pushw	x
 341  0084 ae0000        	ldw	x,#0
 342  0087 89            	pushw	x
 343  0088 ae000c        	ldw	x,#L15
 344  008b cd0000        	call	_assert_failed
 346  008e 5b04          	addw	sp,#4
 347  0090               L03:
 348                     ; 123     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 350  0090 96            	ldw	x,sp
 351  0091 1c0009        	addw	x,#OFST+3
 352  0094 cd0000        	call	c_ltor
 354  0097 ae0008        	ldw	x,#L23
 355  009a cd0000        	call	c_ludv
 357  009d be02          	ldw	x,c_lreg+2
 358  009f 1f03          	ldw	(OFST-3,sp),x
 359                     ; 127     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 361  00a1 c650f3        	ld	a,20723
 362  00a4 a4e0          	and	a,#224
 363  00a6 c750f3        	ld	20723,a
 364                     ; 129     A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 366  00a9 1e03          	ldw	x,(OFST-3,sp)
 367  00ab 54            	srlw	x
 368  00ac 54            	srlw	x
 369  00ad 54            	srlw	x
 370  00ae 1f05          	ldw	(OFST-1,sp),x
 371                     ; 131     if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 373  00b0 1e05          	ldw	x,(OFST-1,sp)
 374  00b2 58            	sllw	x
 375  00b3 58            	sllw	x
 376  00b4 58            	sllw	x
 377  00b5 1f01          	ldw	(OFST-5,sp),x
 378  00b7 1e03          	ldw	x,(OFST-3,sp)
 379  00b9 72f001        	subw	x,(OFST-5,sp)
 380  00bc 1605          	ldw	y,(OFST-1,sp)
 381  00be 9058          	sllw	y
 382  00c0 905c          	incw	y
 383  00c2 cd0000        	call	c_imul
 385  00c5 1605          	ldw	y,(OFST-1,sp)
 386  00c7 9058          	sllw	y
 387  00c9 9058          	sllw	y
 388  00cb 9058          	sllw	y
 389  00cd bf01          	ldw	c_x+1,x
 390  00cf 90b301        	cpw	y,c_x+1
 391  00d2 250c          	jrult	L531
 392                     ; 133         BEEP->CSR |= (uint8_t)(A - 2U);
 394  00d4 7b06          	ld	a,(OFST+0,sp)
 395  00d6 a002          	sub	a,#2
 396  00d8 ca50f3        	or	a,20723
 397  00db c750f3        	ld	20723,a
 399  00de 2009          	jra	L731
 400  00e0               L531:
 401                     ; 137         BEEP->CSR |= (uint8_t)(A - 1U);
 403  00e0 7b06          	ld	a,(OFST+0,sp)
 404  00e2 4a            	dec	a
 405  00e3 ca50f3        	or	a,20723
 406  00e6 c750f3        	ld	20723,a
 407  00e9               L731:
 408                     ; 139 }
 411  00e9 5b06          	addw	sp,#6
 412  00eb 81            	ret
 425                     	xdef	_BEEP_LSICalibrationConfig
 426                     	xdef	_BEEP_Cmd
 427                     	xdef	_BEEP_Init
 428                     	xdef	_BEEP_DeInit
 429                     	xref	_assert_failed
 430                     	switch	.const
 431  000c               L15:
 432  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 433  001e 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 434  0030 685f64726976  	dc.b	"h_driver\src\stm8s"
 435  0042 5f626565702e  	dc.b	"_beep.c",0
 436                     	xref.b	c_lreg
 437                     	xref.b	c_x
 457                     	xref	c_imul
 458                     	xref	c_ludv
 459                     	xref	c_lcmp
 460                     	xref	c_ltor
 461                     	end
