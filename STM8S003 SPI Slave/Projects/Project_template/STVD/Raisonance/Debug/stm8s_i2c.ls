   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 61 void I2C_DeInit(void)
  32                     ; 62 {
  34                     	switch	.text
  35  0000               _I2C_DeInit:
  39                     ; 63   I2C->CR1 = I2C_CR1_RESET_VALUE;
  41  0000 725f5210      	clr	21008
  42                     ; 64   I2C->CR2 = I2C_CR2_RESET_VALUE;
  44  0004 725f5211      	clr	21009
  45                     ; 65   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  47  0008 725f5212      	clr	21010
  48                     ; 66   I2C->OARL = I2C_OARL_RESET_VALUE;
  50  000c 725f5213      	clr	21011
  51                     ; 67   I2C->OARH = I2C_OARH_RESET_VALUE;
  53  0010 725f5214      	clr	21012
  54                     ; 68   I2C->ITR = I2C_ITR_RESET_VALUE;
  56  0014 725f521a      	clr	21018
  57                     ; 69   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  59  0018 725f521b      	clr	21019
  60                     ; 70   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  62  001c 725f521c      	clr	21020
  63                     ; 71   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  65  0020 3502521d      	mov	21021,#2
  66                     ; 72 }
  69  0024 81            	ret
 249                     .const:	section	.text
 250  0000               L44:
 251  0000 00061a81      	dc.l	400001
 252  0004               L05:
 253  0004 000186a1      	dc.l	100001
 254  0008               L25:
 255  0008 000f4240      	dc.l	1000000
 256                     ; 90 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 256                     ; 91               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 256                     ; 92               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 256                     ; 93 {
 257                     	switch	.text
 258  0025               _I2C_Init:
 260  0025 5209          	subw	sp,#9
 261       00000009      OFST:	set	9
 264                     ; 94   uint16_t result = 0x0004;
 266  0027 1e08          	ldw	x,(OFST-1,sp)
 267                     ; 95   uint16_t tmpval = 0;
 269  0029 1e05          	ldw	x,(OFST-4,sp)
 270                     ; 96   uint8_t tmpccrh = 0;
 272  002b 0f07          	clr	(OFST-2,sp)
 273                     ; 99   assert_param(IS_I2C_ACK_OK(Ack));
 275  002d 0d13          	tnz	(OFST+10,sp)
 276  002f 270c          	jreq	L21
 277  0031 7b13          	ld	a,(OFST+10,sp)
 278  0033 a101          	cp	a,#1
 279  0035 2706          	jreq	L21
 280  0037 7b13          	ld	a,(OFST+10,sp)
 281  0039 a102          	cp	a,#2
 282  003b 2603          	jrne	L01
 283  003d               L21:
 284  003d 4f            	clr	a
 285  003e 2010          	jra	L41
 286  0040               L01:
 287  0040 ae0063        	ldw	x,#99
 288  0043 89            	pushw	x
 289  0044 ae0000        	ldw	x,#0
 290  0047 89            	pushw	x
 291  0048 ae000c        	ldw	x,#L131
 292  004b cd0000        	call	_assert_failed
 294  004e 5b04          	addw	sp,#4
 295  0050               L41:
 296                     ; 100   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 298  0050 0d14          	tnz	(OFST+11,sp)
 299  0052 2706          	jreq	L02
 300  0054 7b14          	ld	a,(OFST+11,sp)
 301  0056 a180          	cp	a,#128
 302  0058 2603          	jrne	L61
 303  005a               L02:
 304  005a 4f            	clr	a
 305  005b 2010          	jra	L22
 306  005d               L61:
 307  005d ae0064        	ldw	x,#100
 308  0060 89            	pushw	x
 309  0061 ae0000        	ldw	x,#0
 310  0064 89            	pushw	x
 311  0065 ae000c        	ldw	x,#L131
 312  0068 cd0000        	call	_assert_failed
 314  006b 5b04          	addw	sp,#4
 315  006d               L22:
 316                     ; 101   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 318  006d 1e10          	ldw	x,(OFST+7,sp)
 319  006f a30400        	cpw	x,#1024
 320  0072 2403          	jruge	L42
 321  0074 4f            	clr	a
 322  0075 2010          	jra	L62
 323  0077               L42:
 324  0077 ae0065        	ldw	x,#101
 325  007a 89            	pushw	x
 326  007b ae0000        	ldw	x,#0
 327  007e 89            	pushw	x
 328  007f ae000c        	ldw	x,#L131
 329  0082 cd0000        	call	_assert_failed
 331  0085 5b04          	addw	sp,#4
 332  0087               L62:
 333                     ; 102   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 335  0087 0d12          	tnz	(OFST+9,sp)
 336  0089 2706          	jreq	L23
 337  008b 7b12          	ld	a,(OFST+9,sp)
 338  008d a140          	cp	a,#64
 339  008f 2603          	jrne	L03
 340  0091               L23:
 341  0091 4f            	clr	a
 342  0092 2010          	jra	L43
 343  0094               L03:
 344  0094 ae0066        	ldw	x,#102
 345  0097 89            	pushw	x
 346  0098 ae0000        	ldw	x,#0
 347  009b 89            	pushw	x
 348  009c ae000c        	ldw	x,#L131
 349  009f cd0000        	call	_assert_failed
 351  00a2 5b04          	addw	sp,#4
 352  00a4               L43:
 353                     ; 103   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 355  00a4 0d15          	tnz	(OFST+12,sp)
 356  00a6 2709          	jreq	L63
 357  00a8 7b15          	ld	a,(OFST+12,sp)
 358  00aa a111          	cp	a,#17
 359  00ac 2403          	jruge	L63
 360  00ae 4f            	clr	a
 361  00af 2010          	jra	L04
 362  00b1               L63:
 363  00b1 ae0067        	ldw	x,#103
 364  00b4 89            	pushw	x
 365  00b5 ae0000        	ldw	x,#0
 366  00b8 89            	pushw	x
 367  00b9 ae000c        	ldw	x,#L131
 368  00bc cd0000        	call	_assert_failed
 370  00bf 5b04          	addw	sp,#4
 371  00c1               L04:
 372                     ; 104   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 374  00c1 96            	ldw	x,sp
 375  00c2 1c000c        	addw	x,#OFST+3
 376  00c5 cd0000        	call	c_lzmp
 378  00c8 2712          	jreq	L24
 379  00ca 96            	ldw	x,sp
 380  00cb 1c000c        	addw	x,#OFST+3
 381  00ce cd0000        	call	c_ltor
 383  00d1 ae0000        	ldw	x,#L44
 384  00d4 cd0000        	call	c_lcmp
 386  00d7 2403          	jruge	L24
 387  00d9 4f            	clr	a
 388  00da 2010          	jra	L64
 389  00dc               L24:
 390  00dc ae0068        	ldw	x,#104
 391  00df 89            	pushw	x
 392  00e0 ae0000        	ldw	x,#0
 393  00e3 89            	pushw	x
 394  00e4 ae000c        	ldw	x,#L131
 395  00e7 cd0000        	call	_assert_failed
 397  00ea 5b04          	addw	sp,#4
 398  00ec               L64:
 399                     ; 109   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 401  00ec c65212        	ld	a,21010
 402  00ef a4c0          	and	a,#192
 403  00f1 c75212        	ld	21010,a
 404                     ; 111   I2C->FREQR |= InputClockFrequencyMHz;
 406  00f4 c65212        	ld	a,21010
 407  00f7 1a15          	or	a,(OFST+12,sp)
 408  00f9 c75212        	ld	21010,a
 409                     ; 115   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 411  00fc 72115210      	bres	21008,#0
 412                     ; 118   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 414  0100 c6521c        	ld	a,21020
 415  0103 a430          	and	a,#48
 416  0105 c7521c        	ld	21020,a
 417                     ; 119   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 419  0108 725f521b      	clr	21019
 420                     ; 122   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 422  010c 96            	ldw	x,sp
 423  010d 1c000c        	addw	x,#OFST+3
 424  0110 cd0000        	call	c_ltor
 426  0113 ae0004        	ldw	x,#L05
 427  0116 cd0000        	call	c_lcmp
 429  0119 2403          	jruge	L65
 430  011b cc01a8        	jp	L331
 431  011e               L65:
 432                     ; 125     tmpccrh = I2C_CCRH_FS;
 434  011e a680          	ld	a,#128
 435  0120 6b07          	ld	(OFST-2,sp),a
 436                     ; 127     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 438  0122 0d12          	tnz	(OFST+9,sp)
 439  0124 2630          	jrne	L531
 440                     ; 130       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 442  0126 96            	ldw	x,sp
 443  0127 1c000c        	addw	x,#OFST+3
 444  012a cd0000        	call	c_ltor
 446  012d a603          	ld	a,#3
 447  012f cd0000        	call	c_smul
 449  0132 96            	ldw	x,sp
 450  0133 1c0001        	addw	x,#OFST-8
 451  0136 cd0000        	call	c_rtol
 453  0139 7b15          	ld	a,(OFST+12,sp)
 454  013b b703          	ld	c_lreg+3,a
 455  013d 3f02          	clr	c_lreg+2
 456  013f 3f01          	clr	c_lreg+1
 457  0141 3f00          	clr	c_lreg
 458  0143 ae0008        	ldw	x,#L25
 459  0146 cd0000        	call	c_lmul
 461  0149 96            	ldw	x,sp
 462  014a 1c0001        	addw	x,#OFST-8
 463  014d cd0000        	call	c_ludv
 465  0150 be02          	ldw	x,c_lreg+2
 466  0152 1f08          	ldw	(OFST-1,sp),x
 468  0154 2034          	jra	L731
 469  0156               L531:
 470                     ; 135       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 472  0156 96            	ldw	x,sp
 473  0157 1c000c        	addw	x,#OFST+3
 474  015a cd0000        	call	c_ltor
 476  015d a619          	ld	a,#25
 477  015f cd0000        	call	c_smul
 479  0162 96            	ldw	x,sp
 480  0163 1c0001        	addw	x,#OFST-8
 481  0166 cd0000        	call	c_rtol
 483  0169 7b15          	ld	a,(OFST+12,sp)
 484  016b b703          	ld	c_lreg+3,a
 485  016d 3f02          	clr	c_lreg+2
 486  016f 3f01          	clr	c_lreg+1
 487  0171 3f00          	clr	c_lreg
 488  0173 ae0008        	ldw	x,#L25
 489  0176 cd0000        	call	c_lmul
 491  0179 96            	ldw	x,sp
 492  017a 1c0001        	addw	x,#OFST-8
 493  017d cd0000        	call	c_ludv
 495  0180 be02          	ldw	x,c_lreg+2
 496  0182 1f08          	ldw	(OFST-1,sp),x
 497                     ; 137       tmpccrh |= I2C_CCRH_DUTY;
 499  0184 7b07          	ld	a,(OFST-2,sp)
 500  0186 aa40          	or	a,#64
 501  0188 6b07          	ld	(OFST-2,sp),a
 502  018a               L731:
 503                     ; 141     if (result < (uint16_t)0x01)
 505  018a 1e08          	ldw	x,(OFST-1,sp)
 506  018c 2605          	jrne	L141
 507                     ; 144       result = (uint16_t)0x0001;
 509  018e ae0001        	ldw	x,#1
 510  0191 1f08          	ldw	(OFST-1,sp),x
 511  0193               L141:
 512                     ; 150     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 514  0193 7b15          	ld	a,(OFST+12,sp)
 515  0195 97            	ld	xl,a
 516  0196 a603          	ld	a,#3
 517  0198 42            	mul	x,a
 518  0199 a60a          	ld	a,#10
 519  019b cd0000        	call	c_sdivx
 521  019e 5c            	incw	x
 522  019f 1f05          	ldw	(OFST-4,sp),x
 523                     ; 151     I2C->TRISER = (uint8_t)tmpval;
 525  01a1 7b06          	ld	a,(OFST-3,sp)
 526  01a3 c7521d        	ld	21021,a
 528  01a6 2043          	jra	L341
 529  01a8               L331:
 530                     ; 158     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 532  01a8 96            	ldw	x,sp
 533  01a9 1c000c        	addw	x,#OFST+3
 534  01ac cd0000        	call	c_ltor
 536  01af 3803          	sll	c_lreg+3
 537  01b1 3902          	rlc	c_lreg+2
 538  01b3 3901          	rlc	c_lreg+1
 539  01b5 3900          	rlc	c_lreg
 540  01b7 96            	ldw	x,sp
 541  01b8 1c0001        	addw	x,#OFST-8
 542  01bb cd0000        	call	c_rtol
 544  01be 7b15          	ld	a,(OFST+12,sp)
 545  01c0 b703          	ld	c_lreg+3,a
 546  01c2 3f02          	clr	c_lreg+2
 547  01c4 3f01          	clr	c_lreg+1
 548  01c6 3f00          	clr	c_lreg
 549  01c8 ae0008        	ldw	x,#L25
 550  01cb cd0000        	call	c_lmul
 552  01ce 96            	ldw	x,sp
 553  01cf 1c0001        	addw	x,#OFST-8
 554  01d2 cd0000        	call	c_ludv
 556  01d5 be02          	ldw	x,c_lreg+2
 557  01d7 1f08          	ldw	(OFST-1,sp),x
 558                     ; 161     if (result < (uint16_t)0x0004)
 560  01d9 1e08          	ldw	x,(OFST-1,sp)
 561  01db a30004        	cpw	x,#4
 562  01de 2405          	jruge	L541
 563                     ; 164       result = (uint16_t)0x0004;
 565  01e0 ae0004        	ldw	x,#4
 566  01e3 1f08          	ldw	(OFST-1,sp),x
 567  01e5               L541:
 568                     ; 170     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 570  01e5 7b15          	ld	a,(OFST+12,sp)
 571  01e7 4c            	inc	a
 572  01e8 c7521d        	ld	21021,a
 573  01eb               L341:
 574                     ; 175   I2C->CCRL = (uint8_t)result;
 576  01eb 7b09          	ld	a,(OFST+0,sp)
 577  01ed c7521b        	ld	21019,a
 578                     ; 176   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 580  01f0 7b08          	ld	a,(OFST-1,sp)
 581  01f2 a40f          	and	a,#15
 582  01f4 1a07          	or	a,(OFST-2,sp)
 583  01f6 c7521c        	ld	21020,a
 584                     ; 179   I2C->CR1 |= I2C_CR1_PE;
 586  01f9 72105210      	bset	21008,#0
 587                     ; 182   I2C_AcknowledgeConfig(Ack);
 589  01fd 7b13          	ld	a,(OFST+10,sp)
 590  01ff cd0329        	call	_I2C_AcknowledgeConfig
 592                     ; 185   I2C->OARL = (uint8_t)(OwnAddress);
 594  0202 7b11          	ld	a,(OFST+8,sp)
 595  0204 c75213        	ld	21011,a
 596                     ; 186   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 596                     ; 187                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 598  0207 7b10          	ld	a,(OFST+7,sp)
 599  0209 97            	ld	xl,a
 600  020a 7b11          	ld	a,(OFST+8,sp)
 601  020c 9f            	ld	a,xl
 602  020d a403          	and	a,#3
 603  020f 97            	ld	xl,a
 604  0210 4f            	clr	a
 605  0211 02            	rlwa	x,a
 606  0212 a607          	ld	a,#7
 607  0214               L45:
 608  0214 54            	srlw	x
 609  0215 4a            	dec	a
 610  0216 26fc          	jrne	L45
 611  0218 9f            	ld	a,xl
 612  0219 6b04          	ld	(OFST-5,sp),a
 613  021b 7b14          	ld	a,(OFST+11,sp)
 614  021d aa40          	or	a,#64
 615  021f 1a04          	or	a,(OFST-5,sp)
 616  0221 c75214        	ld	21012,a
 617                     ; 188 }
 620  0224 5b09          	addw	sp,#9
 621  0226 81            	ret
 677                     ; 196 void I2C_Cmd(FunctionalState NewState)
 677                     ; 197 {
 678                     	switch	.text
 679  0227               _I2C_Cmd:
 681  0227 88            	push	a
 682       00000000      OFST:	set	0
 685                     ; 200   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 687  0228 4d            	tnz	a
 688  0229 2704          	jreq	L46
 689  022b a101          	cp	a,#1
 690  022d 2603          	jrne	L26
 691  022f               L46:
 692  022f 4f            	clr	a
 693  0230 2010          	jra	L66
 694  0232               L26:
 695  0232 ae00c8        	ldw	x,#200
 696  0235 89            	pushw	x
 697  0236 ae0000        	ldw	x,#0
 698  0239 89            	pushw	x
 699  023a ae000c        	ldw	x,#L131
 700  023d cd0000        	call	_assert_failed
 702  0240 5b04          	addw	sp,#4
 703  0242               L66:
 704                     ; 202   if (NewState != DISABLE)
 706  0242 0d01          	tnz	(OFST+1,sp)
 707  0244 2706          	jreq	L571
 708                     ; 205     I2C->CR1 |= I2C_CR1_PE;
 710  0246 72105210      	bset	21008,#0
 712  024a 2004          	jra	L771
 713  024c               L571:
 714                     ; 210     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 716  024c 72115210      	bres	21008,#0
 717  0250               L771:
 718                     ; 212 }
 721  0250 84            	pop	a
 722  0251 81            	ret
 758                     ; 220 void I2C_GeneralCallCmd(FunctionalState NewState)
 758                     ; 221 {
 759                     	switch	.text
 760  0252               _I2C_GeneralCallCmd:
 762  0252 88            	push	a
 763       00000000      OFST:	set	0
 766                     ; 224   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 768  0253 4d            	tnz	a
 769  0254 2704          	jreq	L47
 770  0256 a101          	cp	a,#1
 771  0258 2603          	jrne	L27
 772  025a               L47:
 773  025a 4f            	clr	a
 774  025b 2010          	jra	L67
 775  025d               L27:
 776  025d ae00e0        	ldw	x,#224
 777  0260 89            	pushw	x
 778  0261 ae0000        	ldw	x,#0
 779  0264 89            	pushw	x
 780  0265 ae000c        	ldw	x,#L131
 781  0268 cd0000        	call	_assert_failed
 783  026b 5b04          	addw	sp,#4
 784  026d               L67:
 785                     ; 226   if (NewState != DISABLE)
 787  026d 0d01          	tnz	(OFST+1,sp)
 788  026f 2706          	jreq	L712
 789                     ; 229     I2C->CR1 |= I2C_CR1_ENGC;
 791  0271 721c5210      	bset	21008,#6
 793  0275 2004          	jra	L122
 794  0277               L712:
 795                     ; 234     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 797  0277 721d5210      	bres	21008,#6
 798  027b               L122:
 799                     ; 236 }
 802  027b 84            	pop	a
 803  027c 81            	ret
 839                     ; 246 void I2C_GenerateSTART(FunctionalState NewState)
 839                     ; 247 {
 840                     	switch	.text
 841  027d               _I2C_GenerateSTART:
 843  027d 88            	push	a
 844       00000000      OFST:	set	0
 847                     ; 250   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 849  027e 4d            	tnz	a
 850  027f 2704          	jreq	L401
 851  0281 a101          	cp	a,#1
 852  0283 2603          	jrne	L201
 853  0285               L401:
 854  0285 4f            	clr	a
 855  0286 2010          	jra	L601
 856  0288               L201:
 857  0288 ae00fa        	ldw	x,#250
 858  028b 89            	pushw	x
 859  028c ae0000        	ldw	x,#0
 860  028f 89            	pushw	x
 861  0290 ae000c        	ldw	x,#L131
 862  0293 cd0000        	call	_assert_failed
 864  0296 5b04          	addw	sp,#4
 865  0298               L601:
 866                     ; 252   if (NewState != DISABLE)
 868  0298 0d01          	tnz	(OFST+1,sp)
 869  029a 2706          	jreq	L142
 870                     ; 255     I2C->CR2 |= I2C_CR2_START;
 872  029c 72105211      	bset	21009,#0
 874  02a0 2004          	jra	L342
 875  02a2               L142:
 876                     ; 260     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 878  02a2 72115211      	bres	21009,#0
 879  02a6               L342:
 880                     ; 262 }
 883  02a6 84            	pop	a
 884  02a7 81            	ret
 920                     ; 270 void I2C_GenerateSTOP(FunctionalState NewState)
 920                     ; 271 {
 921                     	switch	.text
 922  02a8               _I2C_GenerateSTOP:
 924  02a8 88            	push	a
 925       00000000      OFST:	set	0
 928                     ; 274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 930  02a9 4d            	tnz	a
 931  02aa 2704          	jreq	L411
 932  02ac a101          	cp	a,#1
 933  02ae 2603          	jrne	L211
 934  02b0               L411:
 935  02b0 4f            	clr	a
 936  02b1 2010          	jra	L611
 937  02b3               L211:
 938  02b3 ae0112        	ldw	x,#274
 939  02b6 89            	pushw	x
 940  02b7 ae0000        	ldw	x,#0
 941  02ba 89            	pushw	x
 942  02bb ae000c        	ldw	x,#L131
 943  02be cd0000        	call	_assert_failed
 945  02c1 5b04          	addw	sp,#4
 946  02c3               L611:
 947                     ; 276   if (NewState != DISABLE)
 949  02c3 0d01          	tnz	(OFST+1,sp)
 950  02c5 2706          	jreq	L362
 951                     ; 279     I2C->CR2 |= I2C_CR2_STOP;
 953  02c7 72125211      	bset	21009,#1
 955  02cb 2004          	jra	L562
 956  02cd               L362:
 957                     ; 284     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 959  02cd 72135211      	bres	21009,#1
 960  02d1               L562:
 961                     ; 286 }
 964  02d1 84            	pop	a
 965  02d2 81            	ret
1002                     ; 294 void I2C_SoftwareResetCmd(FunctionalState NewState)
1002                     ; 295 {
1003                     	switch	.text
1004  02d3               _I2C_SoftwareResetCmd:
1006  02d3 88            	push	a
1007       00000000      OFST:	set	0
1010                     ; 297   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1012  02d4 4d            	tnz	a
1013  02d5 2704          	jreq	L421
1014  02d7 a101          	cp	a,#1
1015  02d9 2603          	jrne	L221
1016  02db               L421:
1017  02db 4f            	clr	a
1018  02dc 2010          	jra	L621
1019  02de               L221:
1020  02de ae0129        	ldw	x,#297
1021  02e1 89            	pushw	x
1022  02e2 ae0000        	ldw	x,#0
1023  02e5 89            	pushw	x
1024  02e6 ae000c        	ldw	x,#L131
1025  02e9 cd0000        	call	_assert_failed
1027  02ec 5b04          	addw	sp,#4
1028  02ee               L621:
1029                     ; 299   if (NewState != DISABLE)
1031  02ee 0d01          	tnz	(OFST+1,sp)
1032  02f0 2706          	jreq	L503
1033                     ; 302     I2C->CR2 |= I2C_CR2_SWRST;
1035  02f2 721e5211      	bset	21009,#7
1037  02f6 2004          	jra	L703
1038  02f8               L503:
1039                     ; 307     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1041  02f8 721f5211      	bres	21009,#7
1042  02fc               L703:
1043                     ; 309 }
1046  02fc 84            	pop	a
1047  02fd 81            	ret
1084                     ; 318 void I2C_StretchClockCmd(FunctionalState NewState)
1084                     ; 319 {
1085                     	switch	.text
1086  02fe               _I2C_StretchClockCmd:
1088  02fe 88            	push	a
1089       00000000      OFST:	set	0
1092                     ; 321   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1094  02ff 4d            	tnz	a
1095  0300 2704          	jreq	L431
1096  0302 a101          	cp	a,#1
1097  0304 2603          	jrne	L231
1098  0306               L431:
1099  0306 4f            	clr	a
1100  0307 2010          	jra	L631
1101  0309               L231:
1102  0309 ae0141        	ldw	x,#321
1103  030c 89            	pushw	x
1104  030d ae0000        	ldw	x,#0
1105  0310 89            	pushw	x
1106  0311 ae000c        	ldw	x,#L131
1107  0314 cd0000        	call	_assert_failed
1109  0317 5b04          	addw	sp,#4
1110  0319               L631:
1111                     ; 323   if (NewState != DISABLE)
1113  0319 0d01          	tnz	(OFST+1,sp)
1114  031b 2706          	jreq	L723
1115                     ; 326     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1117  031d 721f5210      	bres	21008,#7
1119  0321 2004          	jra	L133
1120  0323               L723:
1121                     ; 332     I2C->CR1 |= I2C_CR1_NOSTRETCH;
1123  0323 721e5210      	bset	21008,#7
1124  0327               L133:
1125                     ; 334 }
1128  0327 84            	pop	a
1129  0328 81            	ret
1166                     ; 343 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
1166                     ; 344 {
1167                     	switch	.text
1168  0329               _I2C_AcknowledgeConfig:
1170  0329 88            	push	a
1171       00000000      OFST:	set	0
1174                     ; 347   assert_param(IS_I2C_ACK_OK(Ack));
1176  032a 4d            	tnz	a
1177  032b 2708          	jreq	L441
1178  032d a101          	cp	a,#1
1179  032f 2704          	jreq	L441
1180  0331 a102          	cp	a,#2
1181  0333 2603          	jrne	L241
1182  0335               L441:
1183  0335 4f            	clr	a
1184  0336 2010          	jra	L641
1185  0338               L241:
1186  0338 ae015b        	ldw	x,#347
1187  033b 89            	pushw	x
1188  033c ae0000        	ldw	x,#0
1189  033f 89            	pushw	x
1190  0340 ae000c        	ldw	x,#L131
1191  0343 cd0000        	call	_assert_failed
1193  0346 5b04          	addw	sp,#4
1194  0348               L641:
1195                     ; 349   if (Ack == I2C_ACK_NONE)
1197  0348 0d01          	tnz	(OFST+1,sp)
1198  034a 2606          	jrne	L153
1199                     ; 352     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1201  034c 72155211      	bres	21009,#2
1203  0350 2014          	jra	L353
1204  0352               L153:
1205                     ; 357     I2C->CR2 |= I2C_CR2_ACK;
1207  0352 72145211      	bset	21009,#2
1208                     ; 359     if (Ack == I2C_ACK_CURR)
1210  0356 7b01          	ld	a,(OFST+1,sp)
1211  0358 a101          	cp	a,#1
1212  035a 2606          	jrne	L553
1213                     ; 362       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1215  035c 72175211      	bres	21009,#3
1217  0360 2004          	jra	L353
1218  0362               L553:
1219                     ; 367       I2C->CR2 |= I2C_CR2_POS;
1221  0362 72165211      	bset	21009,#3
1222  0366               L353:
1223                     ; 370 }
1226  0366 84            	pop	a
1227  0367 81            	ret
1300                     ; 380 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1300                     ; 381 {
1301                     	switch	.text
1302  0368               _I2C_ITConfig:
1304  0368 89            	pushw	x
1305       00000000      OFST:	set	0
1308                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1310  0369 9e            	ld	a,xh
1311  036a a101          	cp	a,#1
1312  036c 271e          	jreq	L451
1313  036e 9e            	ld	a,xh
1314  036f a102          	cp	a,#2
1315  0371 2719          	jreq	L451
1316  0373 9e            	ld	a,xh
1317  0374 a104          	cp	a,#4
1318  0376 2714          	jreq	L451
1319  0378 9e            	ld	a,xh
1320  0379 a103          	cp	a,#3
1321  037b 270f          	jreq	L451
1322  037d 9e            	ld	a,xh
1323  037e a105          	cp	a,#5
1324  0380 270a          	jreq	L451
1325  0382 9e            	ld	a,xh
1326  0383 a106          	cp	a,#6
1327  0385 2705          	jreq	L451
1328  0387 9e            	ld	a,xh
1329  0388 a107          	cp	a,#7
1330  038a 2603          	jrne	L251
1331  038c               L451:
1332  038c 4f            	clr	a
1333  038d 2010          	jra	L651
1334  038f               L251:
1335  038f ae0180        	ldw	x,#384
1336  0392 89            	pushw	x
1337  0393 ae0000        	ldw	x,#0
1338  0396 89            	pushw	x
1339  0397 ae000c        	ldw	x,#L131
1340  039a cd0000        	call	_assert_failed
1342  039d 5b04          	addw	sp,#4
1343  039f               L651:
1344                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1346  039f 0d02          	tnz	(OFST+2,sp)
1347  03a1 2706          	jreq	L261
1348  03a3 7b02          	ld	a,(OFST+2,sp)
1349  03a5 a101          	cp	a,#1
1350  03a7 2603          	jrne	L061
1351  03a9               L261:
1352  03a9 4f            	clr	a
1353  03aa 2010          	jra	L461
1354  03ac               L061:
1355  03ac ae0181        	ldw	x,#385
1356  03af 89            	pushw	x
1357  03b0 ae0000        	ldw	x,#0
1358  03b3 89            	pushw	x
1359  03b4 ae000c        	ldw	x,#L131
1360  03b7 cd0000        	call	_assert_failed
1362  03ba 5b04          	addw	sp,#4
1363  03bc               L461:
1364                     ; 387   if (NewState != DISABLE)
1366  03bc 0d02          	tnz	(OFST+2,sp)
1367  03be 270a          	jreq	L514
1368                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1370  03c0 c6521a        	ld	a,21018
1371  03c3 1a01          	or	a,(OFST+1,sp)
1372  03c5 c7521a        	ld	21018,a
1374  03c8 2009          	jra	L714
1375  03ca               L514:
1376                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1378  03ca 7b01          	ld	a,(OFST+1,sp)
1379  03cc 43            	cpl	a
1380  03cd c4521a        	and	a,21018
1381  03d0 c7521a        	ld	21018,a
1382  03d3               L714:
1383                     ; 397 }
1386  03d3 85            	popw	x
1387  03d4 81            	ret
1424                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1424                     ; 406 {
1425                     	switch	.text
1426  03d5               _I2C_FastModeDutyCycleConfig:
1428  03d5 88            	push	a
1429       00000000      OFST:	set	0
1432                     ; 409   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1434  03d6 4d            	tnz	a
1435  03d7 2704          	jreq	L271
1436  03d9 a140          	cp	a,#64
1437  03db 2603          	jrne	L071
1438  03dd               L271:
1439  03dd 4f            	clr	a
1440  03de 2010          	jra	L471
1441  03e0               L071:
1442  03e0 ae0199        	ldw	x,#409
1443  03e3 89            	pushw	x
1444  03e4 ae0000        	ldw	x,#0
1445  03e7 89            	pushw	x
1446  03e8 ae000c        	ldw	x,#L131
1447  03eb cd0000        	call	_assert_failed
1449  03ee 5b04          	addw	sp,#4
1450  03f0               L471:
1451                     ; 411   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1453  03f0 7b01          	ld	a,(OFST+1,sp)
1454  03f2 a140          	cp	a,#64
1455  03f4 2606          	jrne	L734
1456                     ; 414     I2C->CCRH |= I2C_CCRH_DUTY;
1458  03f6 721c521c      	bset	21020,#6
1460  03fa 2004          	jra	L144
1461  03fc               L734:
1462                     ; 419     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1464  03fc 721d521c      	bres	21020,#6
1465  0400               L144:
1466                     ; 421 }
1469  0400 84            	pop	a
1470  0401 81            	ret
1493                     ; 428 uint8_t I2C_ReceiveData(void)
1493                     ; 429 {
1494                     	switch	.text
1495  0402               _I2C_ReceiveData:
1499                     ; 431   return ((uint8_t)I2C->DR);
1501  0402 c65216        	ld	a,21014
1504  0405 81            	ret
1570                     ; 441 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1570                     ; 442 {
1571                     	switch	.text
1572  0406               _I2C_Send7bitAddress:
1574  0406 89            	pushw	x
1575       00000000      OFST:	set	0
1578                     ; 444   assert_param(IS_I2C_ADDRESS_OK(Address));
1580  0407 9e            	ld	a,xh
1581  0408 a501          	bcp	a,#1
1582  040a 2603          	jrne	L202
1583  040c 4f            	clr	a
1584  040d 2010          	jra	L402
1585  040f               L202:
1586  040f ae01bc        	ldw	x,#444
1587  0412 89            	pushw	x
1588  0413 ae0000        	ldw	x,#0
1589  0416 89            	pushw	x
1590  0417 ae000c        	ldw	x,#L131
1591  041a cd0000        	call	_assert_failed
1593  041d 5b04          	addw	sp,#4
1594  041f               L402:
1595                     ; 445   assert_param(IS_I2C_DIRECTION_OK(Direction));
1597  041f 0d02          	tnz	(OFST+2,sp)
1598  0421 2706          	jreq	L012
1599  0423 7b02          	ld	a,(OFST+2,sp)
1600  0425 a101          	cp	a,#1
1601  0427 2603          	jrne	L602
1602  0429               L012:
1603  0429 4f            	clr	a
1604  042a 2010          	jra	L212
1605  042c               L602:
1606  042c ae01bd        	ldw	x,#445
1607  042f 89            	pushw	x
1608  0430 ae0000        	ldw	x,#0
1609  0433 89            	pushw	x
1610  0434 ae000c        	ldw	x,#L131
1611  0437 cd0000        	call	_assert_failed
1613  043a 5b04          	addw	sp,#4
1614  043c               L212:
1615                     ; 448   Address &= (uint8_t)0xFE;
1617  043c 7b01          	ld	a,(OFST+1,sp)
1618  043e a4fe          	and	a,#254
1619  0440 6b01          	ld	(OFST+1,sp),a
1620                     ; 451   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1622  0442 7b01          	ld	a,(OFST+1,sp)
1623  0444 1a02          	or	a,(OFST+2,sp)
1624  0446 c75216        	ld	21014,a
1625                     ; 452 }
1628  0449 85            	popw	x
1629  044a 81            	ret
1663                     ; 459 void I2C_SendData(uint8_t Data)
1663                     ; 460 {
1664                     	switch	.text
1665  044b               _I2C_SendData:
1669                     ; 462   I2C->DR = Data;
1671  044b c75216        	ld	21014,a
1672                     ; 463 }
1675  044e 81            	ret
1900                     ; 579 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1900                     ; 580 {
1901                     	switch	.text
1902  044f               _I2C_CheckEvent:
1904  044f 89            	pushw	x
1905  0450 5206          	subw	sp,#6
1906       00000006      OFST:	set	6
1909                     ; 581   __IO uint16_t lastevent = 0x00;
1911  0452 5f            	clrw	x
1912  0453 1f04          	ldw	(OFST-2,sp),x
1913                     ; 582   uint8_t flag1 = 0x00 ;
1915  0455 7b03          	ld	a,(OFST-3,sp)
1916  0457 97            	ld	xl,a
1917                     ; 583   uint8_t flag2 = 0x00;
1919  0458 7b06          	ld	a,(OFST+0,sp)
1920  045a 97            	ld	xl,a
1921                     ; 584   ErrorStatus status = ERROR;
1923  045b 7b06          	ld	a,(OFST+0,sp)
1924  045d 97            	ld	xl,a
1925                     ; 587   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1927  045e 1e07          	ldw	x,(OFST+1,sp)
1928  0460 a30682        	cpw	x,#1666
1929  0463 2769          	jreq	L222
1930  0465 1e07          	ldw	x,(OFST+1,sp)
1931  0467 a30202        	cpw	x,#514
1932  046a 2762          	jreq	L222
1933  046c 1e07          	ldw	x,(OFST+1,sp)
1934  046e a31200        	cpw	x,#4608
1935  0471 275b          	jreq	L222
1936  0473 1e07          	ldw	x,(OFST+1,sp)
1937  0475 a30240        	cpw	x,#576
1938  0478 2754          	jreq	L222
1939  047a 1e07          	ldw	x,(OFST+1,sp)
1940  047c a30350        	cpw	x,#848
1941  047f 274d          	jreq	L222
1942  0481 1e07          	ldw	x,(OFST+1,sp)
1943  0483 a30684        	cpw	x,#1668
1944  0486 2746          	jreq	L222
1945  0488 1e07          	ldw	x,(OFST+1,sp)
1946  048a a30794        	cpw	x,#1940
1947  048d 273f          	jreq	L222
1948  048f 1e07          	ldw	x,(OFST+1,sp)
1949  0491 a30004        	cpw	x,#4
1950  0494 2738          	jreq	L222
1951  0496 1e07          	ldw	x,(OFST+1,sp)
1952  0498 a30010        	cpw	x,#16
1953  049b 2731          	jreq	L222
1954  049d 1e07          	ldw	x,(OFST+1,sp)
1955  049f a30301        	cpw	x,#769
1956  04a2 272a          	jreq	L222
1957  04a4 1e07          	ldw	x,(OFST+1,sp)
1958  04a6 a30782        	cpw	x,#1922
1959  04a9 2723          	jreq	L222
1960  04ab 1e07          	ldw	x,(OFST+1,sp)
1961  04ad a30302        	cpw	x,#770
1962  04b0 271c          	jreq	L222
1963  04b2 1e07          	ldw	x,(OFST+1,sp)
1964  04b4 a30340        	cpw	x,#832
1965  04b7 2715          	jreq	L222
1966  04b9 1e07          	ldw	x,(OFST+1,sp)
1967  04bb a30784        	cpw	x,#1924
1968  04be 270e          	jreq	L222
1969  04c0 1e07          	ldw	x,(OFST+1,sp)
1970  04c2 a30780        	cpw	x,#1920
1971  04c5 2707          	jreq	L222
1972  04c7 1e07          	ldw	x,(OFST+1,sp)
1973  04c9 a30308        	cpw	x,#776
1974  04cc 2603          	jrne	L022
1975  04ce               L222:
1976  04ce 4f            	clr	a
1977  04cf 2010          	jra	L422
1978  04d1               L022:
1979  04d1 ae024b        	ldw	x,#587
1980  04d4 89            	pushw	x
1981  04d5 ae0000        	ldw	x,#0
1982  04d8 89            	pushw	x
1983  04d9 ae000c        	ldw	x,#L131
1984  04dc cd0000        	call	_assert_failed
1986  04df 5b04          	addw	sp,#4
1987  04e1               L422:
1988                     ; 589   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1990  04e1 1e07          	ldw	x,(OFST+1,sp)
1991  04e3 a30004        	cpw	x,#4
1992  04e6 260b          	jrne	L336
1993                     ; 591     lastevent = I2C->SR2 & I2C_SR2_AF;
1995  04e8 c65218        	ld	a,21016
1996  04eb a404          	and	a,#4
1997  04ed 5f            	clrw	x
1998  04ee 97            	ld	xl,a
1999  04ef 1f04          	ldw	(OFST-2,sp),x
2001  04f1 201f          	jra	L536
2002  04f3               L336:
2003                     ; 595     flag1 = I2C->SR1;
2005  04f3 c65217        	ld	a,21015
2006  04f6 6b03          	ld	(OFST-3,sp),a
2007                     ; 596     flag2 = I2C->SR3;
2009  04f8 c65219        	ld	a,21017
2010  04fb 6b06          	ld	(OFST+0,sp),a
2011                     ; 597     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
2013  04fd 7b03          	ld	a,(OFST-3,sp)
2014  04ff 5f            	clrw	x
2015  0500 97            	ld	xl,a
2016  0501 1f01          	ldw	(OFST-5,sp),x
2017  0503 7b06          	ld	a,(OFST+0,sp)
2018  0505 5f            	clrw	x
2019  0506 97            	ld	xl,a
2020  0507 4f            	clr	a
2021  0508 02            	rlwa	x,a
2022  0509 01            	rrwa	x,a
2023  050a 1a02          	or	a,(OFST-4,sp)
2024  050c 01            	rrwa	x,a
2025  050d 1a01          	or	a,(OFST-5,sp)
2026  050f 01            	rrwa	x,a
2027  0510 1f04          	ldw	(OFST-2,sp),x
2028  0512               L536:
2029                     ; 600   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
2031  0512 1e04          	ldw	x,(OFST-2,sp)
2032  0514 01            	rrwa	x,a
2033  0515 1408          	and	a,(OFST+2,sp)
2034  0517 01            	rrwa	x,a
2035  0518 1407          	and	a,(OFST+1,sp)
2036  051a 01            	rrwa	x,a
2037  051b 1307          	cpw	x,(OFST+1,sp)
2038  051d 2606          	jrne	L736
2039                     ; 603     status = SUCCESS;
2041  051f a601          	ld	a,#1
2042  0521 6b06          	ld	(OFST+0,sp),a
2044  0523 2002          	jra	L146
2045  0525               L736:
2046                     ; 608     status = ERROR;
2048  0525 0f06          	clr	(OFST+0,sp)
2049  0527               L146:
2050                     ; 612   return status;
2052  0527 7b06          	ld	a,(OFST+0,sp)
2055  0529 5b08          	addw	sp,#8
2056  052b 81            	ret
2109                     ; 629 I2C_Event_TypeDef I2C_GetLastEvent(void)
2109                     ; 630 {
2110                     	switch	.text
2111  052c               _I2C_GetLastEvent:
2113  052c 5206          	subw	sp,#6
2114       00000006      OFST:	set	6
2117                     ; 631   __IO uint16_t lastevent = 0;
2119  052e 5f            	clrw	x
2120  052f 1f05          	ldw	(OFST-1,sp),x
2121                     ; 632   uint16_t flag1 = 0;
2123  0531 1e01          	ldw	x,(OFST-5,sp)
2124                     ; 633   uint16_t flag2 = 0;
2126  0533 1e03          	ldw	x,(OFST-3,sp)
2127                     ; 635   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
2129  0535 c65218        	ld	a,21016
2130  0538 a504          	bcp	a,#4
2131  053a 2707          	jreq	L176
2132                     ; 637     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
2134  053c ae0004        	ldw	x,#4
2135  053f 1f05          	ldw	(OFST-1,sp),x
2137  0541 201b          	jra	L376
2138  0543               L176:
2139                     ; 642     flag1 = I2C->SR1;
2141  0543 c65217        	ld	a,21015
2142  0546 5f            	clrw	x
2143  0547 97            	ld	xl,a
2144  0548 1f01          	ldw	(OFST-5,sp),x
2145                     ; 643     flag2 = I2C->SR3;
2147  054a c65219        	ld	a,21017
2148  054d 5f            	clrw	x
2149  054e 97            	ld	xl,a
2150  054f 1f03          	ldw	(OFST-3,sp),x
2151                     ; 646     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
2153  0551 1e03          	ldw	x,(OFST-3,sp)
2154  0553 4f            	clr	a
2155  0554 02            	rlwa	x,a
2156  0555 01            	rrwa	x,a
2157  0556 1a02          	or	a,(OFST-4,sp)
2158  0558 01            	rrwa	x,a
2159  0559 1a01          	or	a,(OFST-5,sp)
2160  055b 01            	rrwa	x,a
2161  055c 1f05          	ldw	(OFST-1,sp),x
2162  055e               L376:
2163                     ; 649   return (I2C_Event_TypeDef)lastevent;
2165  055e 1e05          	ldw	x,(OFST-1,sp)
2168  0560 5b06          	addw	sp,#6
2169  0562 81            	ret
2385                     ; 680 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
2385                     ; 681 {
2386                     	switch	.text
2387  0563               _I2C_GetFlagStatus:
2389  0563 89            	pushw	x
2390  0564 89            	pushw	x
2391       00000002      OFST:	set	2
2394                     ; 682   uint8_t tempreg = 0;
2396  0565 0f02          	clr	(OFST+0,sp)
2397                     ; 683   uint8_t regindex = 0;
2399  0567 7b01          	ld	a,(OFST-1,sp)
2400  0569 97            	ld	xl,a
2401                     ; 684   FlagStatus bitstatus = RESET;
2403  056a 7b02          	ld	a,(OFST+0,sp)
2404  056c 97            	ld	xl,a
2405                     ; 687   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
2407  056d 1e03          	ldw	x,(OFST+1,sp)
2408  056f a30180        	cpw	x,#384
2409  0572 2769          	jreq	L432
2410  0574 1e03          	ldw	x,(OFST+1,sp)
2411  0576 a30140        	cpw	x,#320
2412  0579 2762          	jreq	L432
2413  057b 1e03          	ldw	x,(OFST+1,sp)
2414  057d a30110        	cpw	x,#272
2415  0580 275b          	jreq	L432
2416  0582 1e03          	ldw	x,(OFST+1,sp)
2417  0584 a30108        	cpw	x,#264
2418  0587 2754          	jreq	L432
2419  0589 1e03          	ldw	x,(OFST+1,sp)
2420  058b a30104        	cpw	x,#260
2421  058e 274d          	jreq	L432
2422  0590 1e03          	ldw	x,(OFST+1,sp)
2423  0592 a30102        	cpw	x,#258
2424  0595 2746          	jreq	L432
2425  0597 1e03          	ldw	x,(OFST+1,sp)
2426  0599 a30101        	cpw	x,#257
2427  059c 273f          	jreq	L432
2428  059e 1e03          	ldw	x,(OFST+1,sp)
2429  05a0 a30220        	cpw	x,#544
2430  05a3 2738          	jreq	L432
2431  05a5 1e03          	ldw	x,(OFST+1,sp)
2432  05a7 a30208        	cpw	x,#520
2433  05aa 2731          	jreq	L432
2434  05ac 1e03          	ldw	x,(OFST+1,sp)
2435  05ae a30204        	cpw	x,#516
2436  05b1 272a          	jreq	L432
2437  05b3 1e03          	ldw	x,(OFST+1,sp)
2438  05b5 a30202        	cpw	x,#514
2439  05b8 2723          	jreq	L432
2440  05ba 1e03          	ldw	x,(OFST+1,sp)
2441  05bc a30201        	cpw	x,#513
2442  05bf 271c          	jreq	L432
2443  05c1 1e03          	ldw	x,(OFST+1,sp)
2444  05c3 a30310        	cpw	x,#784
2445  05c6 2715          	jreq	L432
2446  05c8 1e03          	ldw	x,(OFST+1,sp)
2447  05ca a30304        	cpw	x,#772
2448  05cd 270e          	jreq	L432
2449  05cf 1e03          	ldw	x,(OFST+1,sp)
2450  05d1 a30302        	cpw	x,#770
2451  05d4 2707          	jreq	L432
2452  05d6 1e03          	ldw	x,(OFST+1,sp)
2453  05d8 a30301        	cpw	x,#769
2454  05db 2603          	jrne	L232
2455  05dd               L432:
2456  05dd 4f            	clr	a
2457  05de 2010          	jra	L632
2458  05e0               L232:
2459  05e0 ae02af        	ldw	x,#687
2460  05e3 89            	pushw	x
2461  05e4 ae0000        	ldw	x,#0
2462  05e7 89            	pushw	x
2463  05e8 ae000c        	ldw	x,#L131
2464  05eb cd0000        	call	_assert_failed
2466  05ee 5b04          	addw	sp,#4
2467  05f0               L632:
2468                     ; 690   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2470  05f0 7b03          	ld	a,(OFST+1,sp)
2471  05f2 6b01          	ld	(OFST-1,sp),a
2472                     ; 692   switch (regindex)
2474  05f4 7b01          	ld	a,(OFST-1,sp)
2476                     ; 709     default:
2476                     ; 710       break;
2477  05f6 4a            	dec	a
2478  05f7 2708          	jreq	L576
2479  05f9 4a            	dec	a
2480  05fa 270c          	jreq	L776
2481  05fc 4a            	dec	a
2482  05fd 2710          	jreq	L107
2483  05ff 2013          	jra	L5101
2484  0601               L576:
2485                     ; 695     case 0x01:
2485                     ; 696       tempreg = (uint8_t)I2C->SR1;
2487  0601 c65217        	ld	a,21015
2488  0604 6b02          	ld	(OFST+0,sp),a
2489                     ; 697       break;
2491  0606 200c          	jra	L5101
2492  0608               L776:
2493                     ; 700     case 0x02:
2493                     ; 701       tempreg = (uint8_t)I2C->SR2;
2495  0608 c65218        	ld	a,21016
2496  060b 6b02          	ld	(OFST+0,sp),a
2497                     ; 702       break;
2499  060d 2005          	jra	L5101
2500  060f               L107:
2501                     ; 705     case 0x03:
2501                     ; 706       tempreg = (uint8_t)I2C->SR3;
2503  060f c65219        	ld	a,21017
2504  0612 6b02          	ld	(OFST+0,sp),a
2505                     ; 707       break;
2507  0614               L307:
2508                     ; 709     default:
2508                     ; 710       break;
2510  0614               L5101:
2511                     ; 714   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2513  0614 7b04          	ld	a,(OFST+2,sp)
2514  0616 1502          	bcp	a,(OFST+0,sp)
2515  0618 2706          	jreq	L7101
2516                     ; 717     bitstatus = SET;
2518  061a a601          	ld	a,#1
2519  061c 6b02          	ld	(OFST+0,sp),a
2521  061e 2002          	jra	L1201
2522  0620               L7101:
2523                     ; 722     bitstatus = RESET;
2525  0620 0f02          	clr	(OFST+0,sp)
2526  0622               L1201:
2527                     ; 725   return bitstatus;
2529  0622 7b02          	ld	a,(OFST+0,sp)
2532  0624 5b04          	addw	sp,#4
2533  0626 81            	ret
2578                     ; 760 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2578                     ; 761 {
2579                     	switch	.text
2580  0627               _I2C_ClearFlag:
2582  0627 89            	pushw	x
2583  0628 89            	pushw	x
2584       00000002      OFST:	set	2
2587                     ; 762   uint16_t flagpos = 0;
2589  0629 5f            	clrw	x
2590  062a 1f01          	ldw	(OFST-1,sp),x
2591                     ; 764   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2593  062c 7b03          	ld	a,(OFST+1,sp)
2594  062e a5fd          	bcp	a,#253
2595  0630 2607          	jrne	L242
2596  0632 1e03          	ldw	x,(OFST+1,sp)
2597  0634 2703          	jreq	L242
2598  0636 4f            	clr	a
2599  0637 2010          	jra	L442
2600  0639               L242:
2601  0639 ae02fc        	ldw	x,#764
2602  063c 89            	pushw	x
2603  063d ae0000        	ldw	x,#0
2604  0640 89            	pushw	x
2605  0641 ae000c        	ldw	x,#L131
2606  0644 cd0000        	call	_assert_failed
2608  0647 5b04          	addw	sp,#4
2609  0649               L442:
2610                     ; 767   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2612  0649 7b03          	ld	a,(OFST+1,sp)
2613  064b 97            	ld	xl,a
2614  064c 7b04          	ld	a,(OFST+2,sp)
2615  064e a4ff          	and	a,#255
2616  0650 5f            	clrw	x
2617  0651 02            	rlwa	x,a
2618  0652 1f01          	ldw	(OFST-1,sp),x
2619  0654 01            	rrwa	x,a
2620                     ; 769   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2622  0655 7b02          	ld	a,(OFST+0,sp)
2623  0657 43            	cpl	a
2624  0658 c75218        	ld	21016,a
2625                     ; 770 }
2628  065b 5b04          	addw	sp,#4
2629  065d 81            	ret
2796                     ; 792 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2796                     ; 793 {
2797                     	switch	.text
2798  065e               _I2C_GetITStatus:
2800  065e 89            	pushw	x
2801  065f 5204          	subw	sp,#4
2802       00000004      OFST:	set	4
2805                     ; 794   ITStatus bitstatus = RESET;
2807  0661 7b04          	ld	a,(OFST+0,sp)
2808  0663 97            	ld	xl,a
2809                     ; 795   __IO uint8_t enablestatus = 0;
2811  0664 0f03          	clr	(OFST-1,sp)
2812                     ; 796   uint16_t tempregister = 0;
2814  0666 1e01          	ldw	x,(OFST-3,sp)
2815                     ; 799     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2817  0668 1e05          	ldw	x,(OFST+1,sp)
2818  066a a31680        	cpw	x,#5760
2819  066d 274d          	jreq	L252
2820  066f 1e05          	ldw	x,(OFST+1,sp)
2821  0671 a31640        	cpw	x,#5696
2822  0674 2746          	jreq	L252
2823  0676 1e05          	ldw	x,(OFST+1,sp)
2824  0678 a31210        	cpw	x,#4624
2825  067b 273f          	jreq	L252
2826  067d 1e05          	ldw	x,(OFST+1,sp)
2827  067f a31208        	cpw	x,#4616
2828  0682 2738          	jreq	L252
2829  0684 1e05          	ldw	x,(OFST+1,sp)
2830  0686 a31204        	cpw	x,#4612
2831  0689 2731          	jreq	L252
2832  068b 1e05          	ldw	x,(OFST+1,sp)
2833  068d a31202        	cpw	x,#4610
2834  0690 272a          	jreq	L252
2835  0692 1e05          	ldw	x,(OFST+1,sp)
2836  0694 a31201        	cpw	x,#4609
2837  0697 2723          	jreq	L252
2838  0699 1e05          	ldw	x,(OFST+1,sp)
2839  069b a32220        	cpw	x,#8736
2840  069e 271c          	jreq	L252
2841  06a0 1e05          	ldw	x,(OFST+1,sp)
2842  06a2 a32108        	cpw	x,#8456
2843  06a5 2715          	jreq	L252
2844  06a7 1e05          	ldw	x,(OFST+1,sp)
2845  06a9 a32104        	cpw	x,#8452
2846  06ac 270e          	jreq	L252
2847  06ae 1e05          	ldw	x,(OFST+1,sp)
2848  06b0 a32102        	cpw	x,#8450
2849  06b3 2707          	jreq	L252
2850  06b5 1e05          	ldw	x,(OFST+1,sp)
2851  06b7 a32101        	cpw	x,#8449
2852  06ba 2603          	jrne	L052
2853  06bc               L252:
2854  06bc 4f            	clr	a
2855  06bd 2010          	jra	L452
2856  06bf               L052:
2857  06bf ae031f        	ldw	x,#799
2858  06c2 89            	pushw	x
2859  06c3 ae0000        	ldw	x,#0
2860  06c6 89            	pushw	x
2861  06c7 ae000c        	ldw	x,#L131
2862  06ca cd0000        	call	_assert_failed
2864  06cd 5b04          	addw	sp,#4
2865  06cf               L452:
2866                     ; 801   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2868  06cf 7b05          	ld	a,(OFST+1,sp)
2869  06d1 97            	ld	xl,a
2870  06d2 7b06          	ld	a,(OFST+2,sp)
2871  06d4 9f            	ld	a,xl
2872  06d5 a407          	and	a,#7
2873  06d7 97            	ld	xl,a
2874  06d8 4f            	clr	a
2875  06d9 02            	rlwa	x,a
2876  06da 4f            	clr	a
2877  06db 01            	rrwa	x,a
2878  06dc 9f            	ld	a,xl
2879  06dd 5f            	clrw	x
2880  06de 97            	ld	xl,a
2881  06df 1f01          	ldw	(OFST-3,sp),x
2882                     ; 804   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2884  06e1 c6521a        	ld	a,21018
2885  06e4 1402          	and	a,(OFST-2,sp)
2886  06e6 6b03          	ld	(OFST-1,sp),a
2887                     ; 806   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2889  06e8 7b05          	ld	a,(OFST+1,sp)
2890  06ea 97            	ld	xl,a
2891  06eb 7b06          	ld	a,(OFST+2,sp)
2892  06ed 9f            	ld	a,xl
2893  06ee a430          	and	a,#48
2894  06f0 97            	ld	xl,a
2895  06f1 4f            	clr	a
2896  06f2 02            	rlwa	x,a
2897  06f3 a30100        	cpw	x,#256
2898  06f6 2615          	jrne	L3311
2899                     ; 809     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2901  06f8 c65217        	ld	a,21015
2902  06fb 1506          	bcp	a,(OFST+2,sp)
2903  06fd 270a          	jreq	L5311
2905  06ff 0d03          	tnz	(OFST-1,sp)
2906  0701 2706          	jreq	L5311
2907                     ; 812       bitstatus = SET;
2909  0703 a601          	ld	a,#1
2910  0705 6b04          	ld	(OFST+0,sp),a
2912  0707 2017          	jra	L1411
2913  0709               L5311:
2914                     ; 817       bitstatus = RESET;
2916  0709 0f04          	clr	(OFST+0,sp)
2917  070b 2013          	jra	L1411
2918  070d               L3311:
2919                     ; 823     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2921  070d c65218        	ld	a,21016
2922  0710 1506          	bcp	a,(OFST+2,sp)
2923  0712 270a          	jreq	L3411
2925  0714 0d03          	tnz	(OFST-1,sp)
2926  0716 2706          	jreq	L3411
2927                     ; 826       bitstatus = SET;
2929  0718 a601          	ld	a,#1
2930  071a 6b04          	ld	(OFST+0,sp),a
2932  071c 2002          	jra	L1411
2933  071e               L3411:
2934                     ; 831       bitstatus = RESET;
2936  071e 0f04          	clr	(OFST+0,sp)
2937  0720               L1411:
2938                     ; 835   return  bitstatus;
2940  0720 7b04          	ld	a,(OFST+0,sp)
2943  0722 5b06          	addw	sp,#6
2944  0724 81            	ret
2990                     ; 873 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2990                     ; 874 {
2991                     	switch	.text
2992  0725               _I2C_ClearITPendingBit:
2994  0725 89            	pushw	x
2995  0726 89            	pushw	x
2996       00000002      OFST:	set	2
2999                     ; 875   uint16_t flagpos = 0;
3001  0727 5f            	clrw	x
3002  0728 1f01          	ldw	(OFST-1,sp),x
3003                     ; 878   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
3005  072a 1e03          	ldw	x,(OFST+1,sp)
3006  072c a32220        	cpw	x,#8736
3007  072f 271c          	jreq	L262
3008  0731 1e03          	ldw	x,(OFST+1,sp)
3009  0733 a32108        	cpw	x,#8456
3010  0736 2715          	jreq	L262
3011  0738 1e03          	ldw	x,(OFST+1,sp)
3012  073a a32104        	cpw	x,#8452
3013  073d 270e          	jreq	L262
3014  073f 1e03          	ldw	x,(OFST+1,sp)
3015  0741 a32102        	cpw	x,#8450
3016  0744 2707          	jreq	L262
3017  0746 1e03          	ldw	x,(OFST+1,sp)
3018  0748 a32101        	cpw	x,#8449
3019  074b 2603          	jrne	L062
3020  074d               L262:
3021  074d 4f            	clr	a
3022  074e 2010          	jra	L462
3023  0750               L062:
3024  0750 ae036e        	ldw	x,#878
3025  0753 89            	pushw	x
3026  0754 ae0000        	ldw	x,#0
3027  0757 89            	pushw	x
3028  0758 ae000c        	ldw	x,#L131
3029  075b cd0000        	call	_assert_failed
3031  075e 5b04          	addw	sp,#4
3032  0760               L462:
3033                     ; 881   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
3035  0760 7b03          	ld	a,(OFST+1,sp)
3036  0762 97            	ld	xl,a
3037  0763 7b04          	ld	a,(OFST+2,sp)
3038  0765 a4ff          	and	a,#255
3039  0767 5f            	clrw	x
3040  0768 02            	rlwa	x,a
3041  0769 1f01          	ldw	(OFST-1,sp),x
3042  076b 01            	rrwa	x,a
3043                     ; 884   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
3045  076c 7b02          	ld	a,(OFST+0,sp)
3046  076e 43            	cpl	a
3047  076f c75218        	ld	21016,a
3048                     ; 885 }
3051  0772 5b04          	addw	sp,#4
3052  0774 81            	ret
3065                     	xdef	_I2C_ClearITPendingBit
3066                     	xdef	_I2C_GetITStatus
3067                     	xdef	_I2C_ClearFlag
3068                     	xdef	_I2C_GetFlagStatus
3069                     	xdef	_I2C_GetLastEvent
3070                     	xdef	_I2C_CheckEvent
3071                     	xdef	_I2C_SendData
3072                     	xdef	_I2C_Send7bitAddress
3073                     	xdef	_I2C_ReceiveData
3074                     	xdef	_I2C_ITConfig
3075                     	xdef	_I2C_FastModeDutyCycleConfig
3076                     	xdef	_I2C_AcknowledgeConfig
3077                     	xdef	_I2C_StretchClockCmd
3078                     	xdef	_I2C_SoftwareResetCmd
3079                     	xdef	_I2C_GenerateSTOP
3080                     	xdef	_I2C_GenerateSTART
3081                     	xdef	_I2C_GeneralCallCmd
3082                     	xdef	_I2C_Cmd
3083                     	xdef	_I2C_Init
3084                     	xdef	_I2C_DeInit
3085                     	xref	_assert_failed
3086                     	switch	.const
3087  000c               L131:
3088  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
3089  001e 6965735c7374  	dc.b	"ies\stm8s_stdperip"
3090  0030 685f64726976  	dc.b	"h_driver\src\stm8s"
3091  0042 5f6932632e63  	dc.b	"_i2c.c",0
3092                     	xref.b	c_lreg
3093                     	xref.b	c_x
3113                     	xref	c_sdivx
3114                     	xref	c_ludv
3115                     	xref	c_rtol
3116                     	xref	c_smul
3117                     	xref	c_lmul
3118                     	xref	c_lcmp
3119                     	xref	c_ltor
3120                     	xref	c_lzmp
3121                     	end
