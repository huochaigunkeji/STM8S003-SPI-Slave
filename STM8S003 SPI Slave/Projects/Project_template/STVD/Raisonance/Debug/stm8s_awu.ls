   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     .const:	section	.text
   5  0000               _APR_Array:
   6  0000 00            	dc.b	0
   7  0001 1e            	dc.b	30
   8  0002 1e            	dc.b	30
   9  0003 1e            	dc.b	30
  10  0004 1e            	dc.b	30
  11  0005 1e            	dc.b	30
  12  0006 1e            	dc.b	30
  13  0007 1e            	dc.b	30
  14  0008 1e            	dc.b	30
  15  0009 1e            	dc.b	30
  16  000a 1e            	dc.b	30
  17  000b 1e            	dc.b	30
  18  000c 1e            	dc.b	30
  19  000d 3d            	dc.b	61
  20  000e 17            	dc.b	23
  21  000f 17            	dc.b	23
  22  0010 3e            	dc.b	62
  23  0011               _TBR_Array:
  24  0011 00            	dc.b	0
  25  0012 01            	dc.b	1
  26  0013 02            	dc.b	2
  27  0014 03            	dc.b	3
  28  0015 04            	dc.b	4
  29  0016 05            	dc.b	5
  30  0017 06            	dc.b	6
  31  0018 07            	dc.b	7
  32  0019 08            	dc.b	8
  33  001a 09            	dc.b	9
  34  001b 0a            	dc.b	10
  35  001c 0b            	dc.b	11
  36  001d 0c            	dc.b	12
  37  001e 0c            	dc.b	12
  38  001f 0e            	dc.b	14
  39  0020 0f            	dc.b	15
  40  0021 0f            	dc.b	15
  69                     ; 67 void AWU_DeInit(void)
  69                     ; 68 {
  71                     	switch	.text
  72  0000               _AWU_DeInit:
  76                     ; 69     AWU->CSR = AWU_CSR_RESET_VALUE;
  78  0000 725f50f0      	clr	20720
  79                     ; 70     AWU->APR = AWU_APR_RESET_VALUE;
  81  0004 353f50f1      	mov	20721,#63
  82                     ; 71     AWU->TBR = AWU_TBR_RESET_VALUE;
  84  0008 725f50f2      	clr	20722
  85                     ; 72 }
  88  000c 81            	ret
 251                     ; 82 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 251                     ; 83 {
 252                     	switch	.text
 253  000d               _AWU_Init:
 255  000d 88            	push	a
 256       00000000      OFST:	set	0
 259                     ; 86     assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 261  000e 4d            	tnz	a
 262  000f 2740          	jreq	L21
 263  0011 a101          	cp	a,#1
 264  0013 273c          	jreq	L21
 265  0015 a102          	cp	a,#2
 266  0017 2738          	jreq	L21
 267  0019 a103          	cp	a,#3
 268  001b 2734          	jreq	L21
 269  001d a104          	cp	a,#4
 270  001f 2730          	jreq	L21
 271  0021 a105          	cp	a,#5
 272  0023 272c          	jreq	L21
 273  0025 a106          	cp	a,#6
 274  0027 2728          	jreq	L21
 275  0029 a107          	cp	a,#7
 276  002b 2724          	jreq	L21
 277  002d a108          	cp	a,#8
 278  002f 2720          	jreq	L21
 279  0031 a109          	cp	a,#9
 280  0033 271c          	jreq	L21
 281  0035 a10a          	cp	a,#10
 282  0037 2718          	jreq	L21
 283  0039 a10b          	cp	a,#11
 284  003b 2714          	jreq	L21
 285  003d a10c          	cp	a,#12
 286  003f 2710          	jreq	L21
 287  0041 a10d          	cp	a,#13
 288  0043 270c          	jreq	L21
 289  0045 a10e          	cp	a,#14
 290  0047 2708          	jreq	L21
 291  0049 a10f          	cp	a,#15
 292  004b 2704          	jreq	L21
 293  004d a110          	cp	a,#16
 294  004f 2603          	jrne	L01
 295  0051               L21:
 296  0051 4f            	clr	a
 297  0052 2010          	jra	L41
 298  0054               L01:
 299  0054 ae0056        	ldw	x,#86
 300  0057 89            	pushw	x
 301  0058 ae0000        	ldw	x,#0
 302  005b 89            	pushw	x
 303  005c ae002e        	ldw	x,#L501
 304  005f cd0000        	call	_assert_failed
 306  0062 5b04          	addw	sp,#4
 307  0064               L41:
 308                     ; 89     AWU->CSR |= AWU_CSR_AWUEN;
 310  0064 721850f0      	bset	20720,#4
 311                     ; 92     AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 313  0068 c650f2        	ld	a,20722
 314  006b a4f0          	and	a,#240
 315  006d c750f2        	ld	20722,a
 316                     ; 93     AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 318  0070 7b01          	ld	a,(OFST+1,sp)
 319  0072 5f            	clrw	x
 320  0073 97            	ld	xl,a
 321  0074 c650f2        	ld	a,20722
 322  0077 da0011        	or	a,(_TBR_Array,x)
 323  007a c750f2        	ld	20722,a
 324                     ; 96     AWU->APR &= (uint8_t)(~AWU_APR_APR);
 326  007d c650f1        	ld	a,20721
 327  0080 a4c0          	and	a,#192
 328  0082 c750f1        	ld	20721,a
 329                     ; 97     AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 331  0085 7b01          	ld	a,(OFST+1,sp)
 332  0087 5f            	clrw	x
 333  0088 97            	ld	xl,a
 334  0089 c650f1        	ld	a,20721
 335  008c da0000        	or	a,(_APR_Array,x)
 336  008f c750f1        	ld	20721,a
 337                     ; 99 }
 340  0092 84            	pop	a
 341  0093 81            	ret
 396                     ; 108 void AWU_Cmd(FunctionalState NewState)
 396                     ; 109 {
 397                     	switch	.text
 398  0094               _AWU_Cmd:
 402                     ; 110     if (NewState != DISABLE)
 404  0094 4d            	tnz	a
 405  0095 2706          	jreq	L531
 406                     ; 113         AWU->CSR |= AWU_CSR_AWUEN;
 408  0097 721850f0      	bset	20720,#4
 410  009b 2004          	jra	L731
 411  009d               L531:
 412                     ; 118         AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 414  009d 721950f0      	bres	20720,#4
 415  00a1               L731:
 416                     ; 120 }
 419  00a1 81            	ret
 473                     	switch	.const
 474  0022               L42:
 475  0022 0001adb0      	dc.l	110000
 476  0026               L62:
 477  0026 000249f1      	dc.l	150001
 478  002a               L23:
 479  002a 000003e8      	dc.l	1000
 480                     ; 135 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 480                     ; 136 {
 481                     	switch	.text
 482  00a2               _AWU_LSICalibrationConfig:
 484  00a2 5206          	subw	sp,#6
 485       00000006      OFST:	set	6
 488                     ; 138     uint16_t lsifreqkhz = 0x0;
 490  00a4 1e03          	ldw	x,(OFST-3,sp)
 491                     ; 139     uint16_t A = 0x0;
 493  00a6 1e05          	ldw	x,(OFST-1,sp)
 494                     ; 142     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 496  00a8 96            	ldw	x,sp
 497  00a9 1c0009        	addw	x,#OFST+3
 498  00ac cd0000        	call	c_ltor
 500  00af ae0022        	ldw	x,#L42
 501  00b2 cd0000        	call	c_lcmp
 503  00b5 2512          	jrult	L22
 504  00b7 96            	ldw	x,sp
 505  00b8 1c0009        	addw	x,#OFST+3
 506  00bb cd0000        	call	c_ltor
 508  00be ae0026        	ldw	x,#L62
 509  00c1 cd0000        	call	c_lcmp
 511  00c4 2403          	jruge	L22
 512  00c6 4f            	clr	a
 513  00c7 2010          	jra	L03
 514  00c9               L22:
 515  00c9 ae008e        	ldw	x,#142
 516  00cc 89            	pushw	x
 517  00cd ae0000        	ldw	x,#0
 518  00d0 89            	pushw	x
 519  00d1 ae002e        	ldw	x,#L501
 520  00d4 cd0000        	call	_assert_failed
 522  00d7 5b04          	addw	sp,#4
 523  00d9               L03:
 524                     ; 144     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 526  00d9 96            	ldw	x,sp
 527  00da 1c0009        	addw	x,#OFST+3
 528  00dd cd0000        	call	c_ltor
 530  00e0 ae002a        	ldw	x,#L23
 531  00e3 cd0000        	call	c_ludv
 533  00e6 be02          	ldw	x,c_lreg+2
 534  00e8 1f03          	ldw	(OFST-3,sp),x
 535                     ; 148     A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 537  00ea 1e03          	ldw	x,(OFST-3,sp)
 538  00ec 54            	srlw	x
 539  00ed 54            	srlw	x
 540  00ee 1f05          	ldw	(OFST-1,sp),x
 541                     ; 150     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 543  00f0 1e05          	ldw	x,(OFST-1,sp)
 544  00f2 58            	sllw	x
 545  00f3 58            	sllw	x
 546  00f4 1f01          	ldw	(OFST-5,sp),x
 547  00f6 1e03          	ldw	x,(OFST-3,sp)
 548  00f8 72f001        	subw	x,(OFST-5,sp)
 549  00fb 1605          	ldw	y,(OFST-1,sp)
 550  00fd 9058          	sllw	y
 551  00ff 905c          	incw	y
 552  0101 cd0000        	call	c_imul
 554  0104 1605          	ldw	y,(OFST-1,sp)
 555  0106 9058          	sllw	y
 556  0108 9058          	sllw	y
 557  010a bf01          	ldw	c_x+1,x
 558  010c 90b301        	cpw	y,c_x+1
 559  010f 2509          	jrult	L761
 560                     ; 152         AWU->APR = (uint8_t)(A - 2U);
 562  0111 7b06          	ld	a,(OFST+0,sp)
 563  0113 a002          	sub	a,#2
 564  0115 c750f1        	ld	20721,a
 566  0118 2006          	jra	L171
 567  011a               L761:
 568                     ; 156         AWU->APR = (uint8_t)(A - 1U);
 570  011a 7b06          	ld	a,(OFST+0,sp)
 571  011c 4a            	dec	a
 572  011d c750f1        	ld	20721,a
 573  0120               L171:
 574                     ; 158 }
 577  0120 5b06          	addw	sp,#6
 578  0122 81            	ret
 601                     ; 165 void AWU_IdleModeEnable(void)
 601                     ; 166 {
 602                     	switch	.text
 603  0123               _AWU_IdleModeEnable:
 607                     ; 168     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 609  0123 721950f0      	bres	20720,#4
 610                     ; 171     AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 612  0127 35f050f2      	mov	20722,#240
 613                     ; 172 }
 616  012b 81            	ret
 660                     ; 180 FlagStatus AWU_GetFlagStatus(void)
 660                     ; 181 {
 661                     	switch	.text
 662  012c               _AWU_GetFlagStatus:
 666                     ; 182     return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 668  012c c650f0        	ld	a,20720
 669  012f a520          	bcp	a,#32
 670  0131 2603          	jrne	L04
 671  0133 4f            	clr	a
 672  0134 2002          	jra	L24
 673  0136               L04:
 674  0136 a601          	ld	a,#1
 675  0138               L24:
 678  0138 81            	ret
 713                     	xdef	_TBR_Array
 714                     	xdef	_APR_Array
 715                     	xdef	_AWU_GetFlagStatus
 716                     	xdef	_AWU_IdleModeEnable
 717                     	xdef	_AWU_LSICalibrationConfig
 718                     	xdef	_AWU_Cmd
 719                     	xdef	_AWU_Init
 720                     	xdef	_AWU_DeInit
 721                     	xref	_assert_failed
 722                     	switch	.const
 723  002e               L501:
 724  002e 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 725  0040 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 726  0052 685f64726976  	dc.b	"h_driver\src\stm8s"
 727  0064 5f6177752e63  	dc.b	"_awu.c",0
 728                     	xref.b	c_lreg
 729                     	xref.b	c_x
 749                     	xref	c_imul
 750                     	xref	c_ludv
 751                     	xref	c_lcmp
 752                     	xref	c_ltor
 753                     	end
