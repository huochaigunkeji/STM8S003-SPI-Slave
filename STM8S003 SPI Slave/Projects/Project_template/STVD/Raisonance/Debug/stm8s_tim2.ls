   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 46 void TIM2_DeInit(void)
  32                     ; 47 {
  34                     	switch	.text
  35  0000               _TIM2_DeInit:
  39                     ; 49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  41  0000 725f5300      	clr	21248
  42                     ; 50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  44  0004 725f5303      	clr	21251
  45                     ; 51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  47  0008 725f5305      	clr	21253
  48                     ; 54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  50  000c 725f530a      	clr	21258
  51                     ; 55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  53  0010 725f530b      	clr	21259
  54                     ; 59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  56  0014 725f530a      	clr	21258
  57                     ; 60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  59  0018 725f530b      	clr	21259
  60                     ; 61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  62  001c 725f5307      	clr	21255
  63                     ; 62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  65  0020 725f5308      	clr	21256
  66                     ; 63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  68  0024 725f5309      	clr	21257
  69                     ; 64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  71  0028 725f530c      	clr	21260
  72                     ; 65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  74  002c 725f530d      	clr	21261
  75                     ; 66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  77  0030 725f530e      	clr	21262
  78                     ; 67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  80  0034 35ff530f      	mov	21263,#255
  81                     ; 68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  83  0038 35ff5310      	mov	21264,#255
  84                     ; 69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  86  003c 725f5311      	clr	21265
  87                     ; 70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
  89  0040 725f5312      	clr	21266
  90                     ; 71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
  92  0044 725f5313      	clr	21267
  93                     ; 72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
  95  0048 725f5314      	clr	21268
  96                     ; 73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
  98  004c 725f5315      	clr	21269
  99                     ; 74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 101  0050 725f5316      	clr	21270
 102                     ; 75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 104  0054 725f5304      	clr	21252
 105                     ; 76 }
 108  0058 81            	ret
 276                     ; 85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 276                     ; 86                         uint16_t TIM2_Period)
 276                     ; 87 {
 277                     	switch	.text
 278  0059               _TIM2_TimeBaseInit:
 280  0059 88            	push	a
 281       00000000      OFST:	set	0
 284                     ; 89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 286  005a c7530e        	ld	21262,a
 287                     ; 91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 289  005d 7b04          	ld	a,(OFST+4,sp)
 290  005f c7530f        	ld	21263,a
 291                     ; 92     TIM2->ARRL = (uint8_t)(TIM2_Period);
 293  0062 7b05          	ld	a,(OFST+5,sp)
 294  0064 c75310        	ld	21264,a
 295                     ; 93 }
 298  0067 84            	pop	a
 299  0068 81            	ret
 457                     ; 104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 457                     ; 105                   TIM2_OutputState_TypeDef TIM2_OutputState,
 457                     ; 106                   uint16_t TIM2_Pulse,
 457                     ; 107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 457                     ; 108 {
 458                     	switch	.text
 459  0069               _TIM2_OC1Init:
 461  0069 89            	pushw	x
 462  006a 88            	push	a
 463       00000001      OFST:	set	1
 466                     ; 110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 468  006b 9e            	ld	a,xh
 469  006c 4d            	tnz	a
 470  006d 2719          	jreq	L41
 471  006f 9e            	ld	a,xh
 472  0070 a110          	cp	a,#16
 473  0072 2714          	jreq	L41
 474  0074 9e            	ld	a,xh
 475  0075 a120          	cp	a,#32
 476  0077 270f          	jreq	L41
 477  0079 9e            	ld	a,xh
 478  007a a130          	cp	a,#48
 479  007c 270a          	jreq	L41
 480  007e 9e            	ld	a,xh
 481  007f a160          	cp	a,#96
 482  0081 2705          	jreq	L41
 483  0083 9e            	ld	a,xh
 484  0084 a170          	cp	a,#112
 485  0086 2603          	jrne	L21
 486  0088               L41:
 487  0088 4f            	clr	a
 488  0089 2010          	jra	L61
 489  008b               L21:
 490  008b ae006e        	ldw	x,#110
 491  008e 89            	pushw	x
 492  008f ae0000        	ldw	x,#0
 493  0092 89            	pushw	x
 494  0093 ae0000        	ldw	x,#L702
 495  0096 cd0000        	call	_assert_failed
 497  0099 5b04          	addw	sp,#4
 498  009b               L61:
 499                     ; 111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 501  009b 0d03          	tnz	(OFST+2,sp)
 502  009d 2706          	jreq	L22
 503  009f 7b03          	ld	a,(OFST+2,sp)
 504  00a1 a111          	cp	a,#17
 505  00a3 2603          	jrne	L02
 506  00a5               L22:
 507  00a5 4f            	clr	a
 508  00a6 2010          	jra	L42
 509  00a8               L02:
 510  00a8 ae006f        	ldw	x,#111
 511  00ab 89            	pushw	x
 512  00ac ae0000        	ldw	x,#0
 513  00af 89            	pushw	x
 514  00b0 ae0000        	ldw	x,#L702
 515  00b3 cd0000        	call	_assert_failed
 517  00b6 5b04          	addw	sp,#4
 518  00b8               L42:
 519                     ; 112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 521  00b8 0d08          	tnz	(OFST+7,sp)
 522  00ba 2706          	jreq	L03
 523  00bc 7b08          	ld	a,(OFST+7,sp)
 524  00be a122          	cp	a,#34
 525  00c0 2603          	jrne	L62
 526  00c2               L03:
 527  00c2 4f            	clr	a
 528  00c3 2010          	jra	L23
 529  00c5               L62:
 530  00c5 ae0070        	ldw	x,#112
 531  00c8 89            	pushw	x
 532  00c9 ae0000        	ldw	x,#0
 533  00cc 89            	pushw	x
 534  00cd ae0000        	ldw	x,#L702
 535  00d0 cd0000        	call	_assert_failed
 537  00d3 5b04          	addw	sp,#4
 538  00d5               L23:
 539                     ; 115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 541  00d5 c6530a        	ld	a,21258
 542  00d8 a4fc          	and	a,#252
 543  00da c7530a        	ld	21258,a
 544                     ; 117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 544                     ; 118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 546  00dd 7b08          	ld	a,(OFST+7,sp)
 547  00df a402          	and	a,#2
 548  00e1 6b01          	ld	(OFST+0,sp),a
 549  00e3 7b03          	ld	a,(OFST+2,sp)
 550  00e5 a401          	and	a,#1
 551  00e7 1a01          	or	a,(OFST+0,sp)
 552  00e9 ca530a        	or	a,21258
 553  00ec c7530a        	ld	21258,a
 554                     ; 121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 554                     ; 122                             (uint8_t)TIM2_OCMode);
 556  00ef c65307        	ld	a,21255
 557  00f2 a48f          	and	a,#143
 558  00f4 1a02          	or	a,(OFST+1,sp)
 559  00f6 c75307        	ld	21255,a
 560                     ; 125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 562  00f9 7b06          	ld	a,(OFST+5,sp)
 563  00fb c75311        	ld	21265,a
 564                     ; 126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 566  00fe 7b07          	ld	a,(OFST+6,sp)
 567  0100 c75312        	ld	21266,a
 568                     ; 127 }
 571  0103 5b03          	addw	sp,#3
 572  0105 81            	ret
 637                     ; 138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 637                     ; 139                   TIM2_OutputState_TypeDef TIM2_OutputState,
 637                     ; 140                   uint16_t TIM2_Pulse,
 637                     ; 141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 637                     ; 142 {
 638                     	switch	.text
 639  0106               _TIM2_OC2Init:
 641  0106 89            	pushw	x
 642  0107 88            	push	a
 643       00000001      OFST:	set	1
 646                     ; 144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 648  0108 9e            	ld	a,xh
 649  0109 4d            	tnz	a
 650  010a 2719          	jreq	L04
 651  010c 9e            	ld	a,xh
 652  010d a110          	cp	a,#16
 653  010f 2714          	jreq	L04
 654  0111 9e            	ld	a,xh
 655  0112 a120          	cp	a,#32
 656  0114 270f          	jreq	L04
 657  0116 9e            	ld	a,xh
 658  0117 a130          	cp	a,#48
 659  0119 270a          	jreq	L04
 660  011b 9e            	ld	a,xh
 661  011c a160          	cp	a,#96
 662  011e 2705          	jreq	L04
 663  0120 9e            	ld	a,xh
 664  0121 a170          	cp	a,#112
 665  0123 2603          	jrne	L63
 666  0125               L04:
 667  0125 4f            	clr	a
 668  0126 2010          	jra	L24
 669  0128               L63:
 670  0128 ae0090        	ldw	x,#144
 671  012b 89            	pushw	x
 672  012c ae0000        	ldw	x,#0
 673  012f 89            	pushw	x
 674  0130 ae0000        	ldw	x,#L702
 675  0133 cd0000        	call	_assert_failed
 677  0136 5b04          	addw	sp,#4
 678  0138               L24:
 679                     ; 145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 681  0138 0d03          	tnz	(OFST+2,sp)
 682  013a 2706          	jreq	L64
 683  013c 7b03          	ld	a,(OFST+2,sp)
 684  013e a111          	cp	a,#17
 685  0140 2603          	jrne	L44
 686  0142               L64:
 687  0142 4f            	clr	a
 688  0143 2010          	jra	L05
 689  0145               L44:
 690  0145 ae0091        	ldw	x,#145
 691  0148 89            	pushw	x
 692  0149 ae0000        	ldw	x,#0
 693  014c 89            	pushw	x
 694  014d ae0000        	ldw	x,#L702
 695  0150 cd0000        	call	_assert_failed
 697  0153 5b04          	addw	sp,#4
 698  0155               L05:
 699                     ; 146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 701  0155 0d08          	tnz	(OFST+7,sp)
 702  0157 2706          	jreq	L45
 703  0159 7b08          	ld	a,(OFST+7,sp)
 704  015b a122          	cp	a,#34
 705  015d 2603          	jrne	L25
 706  015f               L45:
 707  015f 4f            	clr	a
 708  0160 2010          	jra	L65
 709  0162               L25:
 710  0162 ae0092        	ldw	x,#146
 711  0165 89            	pushw	x
 712  0166 ae0000        	ldw	x,#0
 713  0169 89            	pushw	x
 714  016a ae0000        	ldw	x,#L702
 715  016d cd0000        	call	_assert_failed
 717  0170 5b04          	addw	sp,#4
 718  0172               L65:
 719                     ; 150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 721  0172 c6530a        	ld	a,21258
 722  0175 a4cf          	and	a,#207
 723  0177 c7530a        	ld	21258,a
 724                     ; 152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 724                     ; 153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 726  017a 7b08          	ld	a,(OFST+7,sp)
 727  017c a420          	and	a,#32
 728  017e 6b01          	ld	(OFST+0,sp),a
 729  0180 7b03          	ld	a,(OFST+2,sp)
 730  0182 a410          	and	a,#16
 731  0184 1a01          	or	a,(OFST+0,sp)
 732  0186 ca530a        	or	a,21258
 733  0189 c7530a        	ld	21258,a
 734                     ; 157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 734                     ; 158                             (uint8_t)TIM2_OCMode);
 736  018c c65308        	ld	a,21256
 737  018f a48f          	and	a,#143
 738  0191 1a02          	or	a,(OFST+1,sp)
 739  0193 c75308        	ld	21256,a
 740                     ; 162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 742  0196 7b06          	ld	a,(OFST+5,sp)
 743  0198 c75313        	ld	21267,a
 744                     ; 163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 746  019b 7b07          	ld	a,(OFST+6,sp)
 747  019d c75314        	ld	21268,a
 748                     ; 164 }
 751  01a0 5b03          	addw	sp,#3
 752  01a2 81            	ret
 817                     ; 175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 817                     ; 176                   TIM2_OutputState_TypeDef TIM2_OutputState,
 817                     ; 177                   uint16_t TIM2_Pulse,
 817                     ; 178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 817                     ; 179 {
 818                     	switch	.text
 819  01a3               _TIM2_OC3Init:
 821  01a3 89            	pushw	x
 822  01a4 88            	push	a
 823       00000001      OFST:	set	1
 826                     ; 181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 828  01a5 9e            	ld	a,xh
 829  01a6 4d            	tnz	a
 830  01a7 2719          	jreq	L46
 831  01a9 9e            	ld	a,xh
 832  01aa a110          	cp	a,#16
 833  01ac 2714          	jreq	L46
 834  01ae 9e            	ld	a,xh
 835  01af a120          	cp	a,#32
 836  01b1 270f          	jreq	L46
 837  01b3 9e            	ld	a,xh
 838  01b4 a130          	cp	a,#48
 839  01b6 270a          	jreq	L46
 840  01b8 9e            	ld	a,xh
 841  01b9 a160          	cp	a,#96
 842  01bb 2705          	jreq	L46
 843  01bd 9e            	ld	a,xh
 844  01be a170          	cp	a,#112
 845  01c0 2603          	jrne	L26
 846  01c2               L46:
 847  01c2 4f            	clr	a
 848  01c3 2010          	jra	L66
 849  01c5               L26:
 850  01c5 ae00b5        	ldw	x,#181
 851  01c8 89            	pushw	x
 852  01c9 ae0000        	ldw	x,#0
 853  01cc 89            	pushw	x
 854  01cd ae0000        	ldw	x,#L702
 855  01d0 cd0000        	call	_assert_failed
 857  01d3 5b04          	addw	sp,#4
 858  01d5               L66:
 859                     ; 182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 861  01d5 0d03          	tnz	(OFST+2,sp)
 862  01d7 2706          	jreq	L27
 863  01d9 7b03          	ld	a,(OFST+2,sp)
 864  01db a111          	cp	a,#17
 865  01dd 2603          	jrne	L07
 866  01df               L27:
 867  01df 4f            	clr	a
 868  01e0 2010          	jra	L47
 869  01e2               L07:
 870  01e2 ae00b6        	ldw	x,#182
 871  01e5 89            	pushw	x
 872  01e6 ae0000        	ldw	x,#0
 873  01e9 89            	pushw	x
 874  01ea ae0000        	ldw	x,#L702
 875  01ed cd0000        	call	_assert_failed
 877  01f0 5b04          	addw	sp,#4
 878  01f2               L47:
 879                     ; 183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 881  01f2 0d08          	tnz	(OFST+7,sp)
 882  01f4 2706          	jreq	L001
 883  01f6 7b08          	ld	a,(OFST+7,sp)
 884  01f8 a122          	cp	a,#34
 885  01fa 2603          	jrne	L67
 886  01fc               L001:
 887  01fc 4f            	clr	a
 888  01fd 2010          	jra	L201
 889  01ff               L67:
 890  01ff ae00b7        	ldw	x,#183
 891  0202 89            	pushw	x
 892  0203 ae0000        	ldw	x,#0
 893  0206 89            	pushw	x
 894  0207 ae0000        	ldw	x,#L702
 895  020a cd0000        	call	_assert_failed
 897  020d 5b04          	addw	sp,#4
 898  020f               L201:
 899                     ; 185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 901  020f c6530b        	ld	a,21259
 902  0212 a4fc          	and	a,#252
 903  0214 c7530b        	ld	21259,a
 904                     ; 187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 904                     ; 188                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 906  0217 7b08          	ld	a,(OFST+7,sp)
 907  0219 a402          	and	a,#2
 908  021b 6b01          	ld	(OFST+0,sp),a
 909  021d 7b03          	ld	a,(OFST+2,sp)
 910  021f a401          	and	a,#1
 911  0221 1a01          	or	a,(OFST+0,sp)
 912  0223 ca530b        	or	a,21259
 913  0226 c7530b        	ld	21259,a
 914                     ; 191     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 914                     ; 192                             (uint8_t)TIM2_OCMode);
 916  0229 c65309        	ld	a,21257
 917  022c a48f          	and	a,#143
 918  022e 1a02          	or	a,(OFST+1,sp)
 919  0230 c75309        	ld	21257,a
 920                     ; 195     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 922  0233 7b06          	ld	a,(OFST+5,sp)
 923  0235 c75315        	ld	21269,a
 924                     ; 196     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 926  0238 7b07          	ld	a,(OFST+6,sp)
 927  023a c75316        	ld	21270,a
 928                     ; 198 }
 931  023d 5b03          	addw	sp,#3
 932  023f 81            	ret
1126                     ; 210 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1126                     ; 211                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1126                     ; 212                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1126                     ; 213                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1126                     ; 214                  uint8_t TIM2_ICFilter)
1126                     ; 215 {
1127                     	switch	.text
1128  0240               _TIM2_ICInit:
1130  0240 89            	pushw	x
1131       00000000      OFST:	set	0
1134                     ; 217     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1136  0241 9e            	ld	a,xh
1137  0242 4d            	tnz	a
1138  0243 270a          	jreq	L011
1139  0245 9e            	ld	a,xh
1140  0246 a101          	cp	a,#1
1141  0248 2705          	jreq	L011
1142  024a 9e            	ld	a,xh
1143  024b a102          	cp	a,#2
1144  024d 2603          	jrne	L601
1145  024f               L011:
1146  024f 4f            	clr	a
1147  0250 2010          	jra	L211
1148  0252               L601:
1149  0252 ae00d9        	ldw	x,#217
1150  0255 89            	pushw	x
1151  0256 ae0000        	ldw	x,#0
1152  0259 89            	pushw	x
1153  025a ae0000        	ldw	x,#L702
1154  025d cd0000        	call	_assert_failed
1156  0260 5b04          	addw	sp,#4
1157  0262               L211:
1158                     ; 218     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1160  0262 0d02          	tnz	(OFST+2,sp)
1161  0264 2706          	jreq	L611
1162  0266 7b02          	ld	a,(OFST+2,sp)
1163  0268 a144          	cp	a,#68
1164  026a 2603          	jrne	L411
1165  026c               L611:
1166  026c 4f            	clr	a
1167  026d 2010          	jra	L021
1168  026f               L411:
1169  026f ae00da        	ldw	x,#218
1170  0272 89            	pushw	x
1171  0273 ae0000        	ldw	x,#0
1172  0276 89            	pushw	x
1173  0277 ae0000        	ldw	x,#L702
1174  027a cd0000        	call	_assert_failed
1176  027d 5b04          	addw	sp,#4
1177  027f               L021:
1178                     ; 219     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1180  027f 7b05          	ld	a,(OFST+5,sp)
1181  0281 a101          	cp	a,#1
1182  0283 270c          	jreq	L421
1183  0285 7b05          	ld	a,(OFST+5,sp)
1184  0287 a102          	cp	a,#2
1185  0289 2706          	jreq	L421
1186  028b 7b05          	ld	a,(OFST+5,sp)
1187  028d a103          	cp	a,#3
1188  028f 2603          	jrne	L221
1189  0291               L421:
1190  0291 4f            	clr	a
1191  0292 2010          	jra	L621
1192  0294               L221:
1193  0294 ae00db        	ldw	x,#219
1194  0297 89            	pushw	x
1195  0298 ae0000        	ldw	x,#0
1196  029b 89            	pushw	x
1197  029c ae0000        	ldw	x,#L702
1198  029f cd0000        	call	_assert_failed
1200  02a2 5b04          	addw	sp,#4
1201  02a4               L621:
1202                     ; 220     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1204  02a4 0d06          	tnz	(OFST+6,sp)
1205  02a6 2712          	jreq	L231
1206  02a8 7b06          	ld	a,(OFST+6,sp)
1207  02aa a104          	cp	a,#4
1208  02ac 270c          	jreq	L231
1209  02ae 7b06          	ld	a,(OFST+6,sp)
1210  02b0 a108          	cp	a,#8
1211  02b2 2706          	jreq	L231
1212  02b4 7b06          	ld	a,(OFST+6,sp)
1213  02b6 a10c          	cp	a,#12
1214  02b8 2603          	jrne	L031
1215  02ba               L231:
1216  02ba 4f            	clr	a
1217  02bb 2010          	jra	L431
1218  02bd               L031:
1219  02bd ae00dc        	ldw	x,#220
1220  02c0 89            	pushw	x
1221  02c1 ae0000        	ldw	x,#0
1222  02c4 89            	pushw	x
1223  02c5 ae0000        	ldw	x,#L702
1224  02c8 cd0000        	call	_assert_failed
1226  02cb 5b04          	addw	sp,#4
1227  02cd               L431:
1228                     ; 221     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1230  02cd 7b07          	ld	a,(OFST+7,sp)
1231  02cf a110          	cp	a,#16
1232  02d1 2403          	jruge	L631
1233  02d3 4f            	clr	a
1234  02d4 2010          	jra	L041
1235  02d6               L631:
1236  02d6 ae00dd        	ldw	x,#221
1237  02d9 89            	pushw	x
1238  02da ae0000        	ldw	x,#0
1239  02dd 89            	pushw	x
1240  02de ae0000        	ldw	x,#L702
1241  02e1 cd0000        	call	_assert_failed
1243  02e4 5b04          	addw	sp,#4
1244  02e6               L041:
1245                     ; 223     if (TIM2_Channel == TIM2_CHANNEL_1)
1247  02e6 0d01          	tnz	(OFST+1,sp)
1248  02e8 2614          	jrne	L304
1249                     ; 226         TI1_Config((uint8_t)TIM2_ICPolarity,
1249                     ; 227                    (uint8_t)TIM2_ICSelection,
1249                     ; 228                    (uint8_t)TIM2_ICFilter);
1251  02ea 7b07          	ld	a,(OFST+7,sp)
1252  02ec 88            	push	a
1253  02ed 7b06          	ld	a,(OFST+6,sp)
1254  02ef 97            	ld	xl,a
1255  02f0 7b03          	ld	a,(OFST+3,sp)
1256  02f2 95            	ld	xh,a
1257  02f3 cd0b1d        	call	L3_TI1_Config
1259  02f6 84            	pop	a
1260                     ; 231         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1262  02f7 7b06          	ld	a,(OFST+6,sp)
1263  02f9 cd08ca        	call	_TIM2_SetIC1Prescaler
1266  02fc 202c          	jra	L504
1267  02fe               L304:
1268                     ; 233     else if (TIM2_Channel == TIM2_CHANNEL_2)
1270  02fe 7b01          	ld	a,(OFST+1,sp)
1271  0300 a101          	cp	a,#1
1272  0302 2614          	jrne	L704
1273                     ; 236         TI2_Config((uint8_t)TIM2_ICPolarity,
1273                     ; 237                    (uint8_t)TIM2_ICSelection,
1273                     ; 238                    (uint8_t)TIM2_ICFilter);
1275  0304 7b07          	ld	a,(OFST+7,sp)
1276  0306 88            	push	a
1277  0307 7b06          	ld	a,(OFST+6,sp)
1278  0309 97            	ld	xl,a
1279  030a 7b03          	ld	a,(OFST+3,sp)
1280  030c 95            	ld	xh,a
1281  030d cd0b4d        	call	L5_TI2_Config
1283  0310 84            	pop	a
1284                     ; 241         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1286  0311 7b06          	ld	a,(OFST+6,sp)
1287  0313 cd08f9        	call	_TIM2_SetIC2Prescaler
1290  0316 2012          	jra	L504
1291  0318               L704:
1292                     ; 246         TI3_Config((uint8_t)TIM2_ICPolarity,
1292                     ; 247                    (uint8_t)TIM2_ICSelection,
1292                     ; 248                    (uint8_t)TIM2_ICFilter);
1294  0318 7b07          	ld	a,(OFST+7,sp)
1295  031a 88            	push	a
1296  031b 7b06          	ld	a,(OFST+6,sp)
1297  031d 97            	ld	xl,a
1298  031e 7b03          	ld	a,(OFST+3,sp)
1299  0320 95            	ld	xh,a
1300  0321 cd0b7d        	call	L7_TI3_Config
1302  0324 84            	pop	a
1303                     ; 251         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1305  0325 7b06          	ld	a,(OFST+6,sp)
1306  0327 cd0928        	call	_TIM2_SetIC3Prescaler
1308  032a               L504:
1309                     ; 253 }
1312  032a 85            	popw	x
1313  032b 81            	ret
1410                     ; 265 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1410                     ; 266                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1410                     ; 267                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1410                     ; 268                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1410                     ; 269                      uint8_t TIM2_ICFilter)
1410                     ; 270 {
1411                     	switch	.text
1412  032c               _TIM2_PWMIConfig:
1414  032c 89            	pushw	x
1415  032d 89            	pushw	x
1416       00000002      OFST:	set	2
1419                     ; 271     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1421  032e 7b01          	ld	a,(OFST-1,sp)
1422  0330 97            	ld	xl,a
1423                     ; 272     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1425  0331 7b02          	ld	a,(OFST+0,sp)
1426  0333 97            	ld	xl,a
1427                     ; 275     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1429  0334 0d03          	tnz	(OFST+1,sp)
1430  0336 2706          	jreq	L641
1431  0338 7b03          	ld	a,(OFST+1,sp)
1432  033a a101          	cp	a,#1
1433  033c 2603          	jrne	L441
1434  033e               L641:
1435  033e 4f            	clr	a
1436  033f 2010          	jra	L051
1437  0341               L441:
1438  0341 ae0113        	ldw	x,#275
1439  0344 89            	pushw	x
1440  0345 ae0000        	ldw	x,#0
1441  0348 89            	pushw	x
1442  0349 ae0000        	ldw	x,#L702
1443  034c cd0000        	call	_assert_failed
1445  034f 5b04          	addw	sp,#4
1446  0351               L051:
1447                     ; 276     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1449  0351 0d04          	tnz	(OFST+2,sp)
1450  0353 2706          	jreq	L451
1451  0355 7b04          	ld	a,(OFST+2,sp)
1452  0357 a144          	cp	a,#68
1453  0359 2603          	jrne	L251
1454  035b               L451:
1455  035b 4f            	clr	a
1456  035c 2010          	jra	L651
1457  035e               L251:
1458  035e ae0114        	ldw	x,#276
1459  0361 89            	pushw	x
1460  0362 ae0000        	ldw	x,#0
1461  0365 89            	pushw	x
1462  0366 ae0000        	ldw	x,#L702
1463  0369 cd0000        	call	_assert_failed
1465  036c 5b04          	addw	sp,#4
1466  036e               L651:
1467                     ; 277     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1469  036e 7b07          	ld	a,(OFST+5,sp)
1470  0370 a101          	cp	a,#1
1471  0372 270c          	jreq	L261
1472  0374 7b07          	ld	a,(OFST+5,sp)
1473  0376 a102          	cp	a,#2
1474  0378 2706          	jreq	L261
1475  037a 7b07          	ld	a,(OFST+5,sp)
1476  037c a103          	cp	a,#3
1477  037e 2603          	jrne	L061
1478  0380               L261:
1479  0380 4f            	clr	a
1480  0381 2010          	jra	L461
1481  0383               L061:
1482  0383 ae0115        	ldw	x,#277
1483  0386 89            	pushw	x
1484  0387 ae0000        	ldw	x,#0
1485  038a 89            	pushw	x
1486  038b ae0000        	ldw	x,#L702
1487  038e cd0000        	call	_assert_failed
1489  0391 5b04          	addw	sp,#4
1490  0393               L461:
1491                     ; 278     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1493  0393 0d08          	tnz	(OFST+6,sp)
1494  0395 2712          	jreq	L071
1495  0397 7b08          	ld	a,(OFST+6,sp)
1496  0399 a104          	cp	a,#4
1497  039b 270c          	jreq	L071
1498  039d 7b08          	ld	a,(OFST+6,sp)
1499  039f a108          	cp	a,#8
1500  03a1 2706          	jreq	L071
1501  03a3 7b08          	ld	a,(OFST+6,sp)
1502  03a5 a10c          	cp	a,#12
1503  03a7 2603          	jrne	L661
1504  03a9               L071:
1505  03a9 4f            	clr	a
1506  03aa 2010          	jra	L271
1507  03ac               L661:
1508  03ac ae0116        	ldw	x,#278
1509  03af 89            	pushw	x
1510  03b0 ae0000        	ldw	x,#0
1511  03b3 89            	pushw	x
1512  03b4 ae0000        	ldw	x,#L702
1513  03b7 cd0000        	call	_assert_failed
1515  03ba 5b04          	addw	sp,#4
1516  03bc               L271:
1517                     ; 281     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1519  03bc 7b04          	ld	a,(OFST+2,sp)
1520  03be a144          	cp	a,#68
1521  03c0 2706          	jreq	L164
1522                     ; 283         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1524  03c2 a644          	ld	a,#68
1525  03c4 6b01          	ld	(OFST-1,sp),a
1527  03c6 2002          	jra	L364
1528  03c8               L164:
1529                     ; 287         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1531  03c8 0f01          	clr	(OFST-1,sp)
1532  03ca               L364:
1533                     ; 291     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1535  03ca 7b07          	ld	a,(OFST+5,sp)
1536  03cc a101          	cp	a,#1
1537  03ce 2606          	jrne	L564
1538                     ; 293         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1540  03d0 a602          	ld	a,#2
1541  03d2 6b02          	ld	(OFST+0,sp),a
1543  03d4 2004          	jra	L764
1544  03d6               L564:
1545                     ; 297         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1547  03d6 a601          	ld	a,#1
1548  03d8 6b02          	ld	(OFST+0,sp),a
1549  03da               L764:
1550                     ; 300     if (TIM2_Channel == TIM2_CHANNEL_1)
1552  03da 0d03          	tnz	(OFST+1,sp)
1553  03dc 2626          	jrne	L174
1554                     ; 303         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1554                     ; 304                    (uint8_t)TIM2_ICFilter);
1556  03de 7b09          	ld	a,(OFST+7,sp)
1557  03e0 88            	push	a
1558  03e1 7b08          	ld	a,(OFST+6,sp)
1559  03e3 97            	ld	xl,a
1560  03e4 7b05          	ld	a,(OFST+3,sp)
1561  03e6 95            	ld	xh,a
1562  03e7 cd0b1d        	call	L3_TI1_Config
1564  03ea 84            	pop	a
1565                     ; 307         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1567  03eb 7b08          	ld	a,(OFST+6,sp)
1568  03ed cd08ca        	call	_TIM2_SetIC1Prescaler
1570                     ; 310         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1572  03f0 7b09          	ld	a,(OFST+7,sp)
1573  03f2 88            	push	a
1574  03f3 7b03          	ld	a,(OFST+1,sp)
1575  03f5 97            	ld	xl,a
1576  03f6 7b02          	ld	a,(OFST+0,sp)
1577  03f8 95            	ld	xh,a
1578  03f9 cd0b4d        	call	L5_TI2_Config
1580  03fc 84            	pop	a
1581                     ; 313         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1583  03fd 7b08          	ld	a,(OFST+6,sp)
1584  03ff cd08f9        	call	_TIM2_SetIC2Prescaler
1587  0402 2024          	jra	L374
1588  0404               L174:
1589                     ; 318         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1589                     ; 319                    (uint8_t)TIM2_ICFilter);
1591  0404 7b09          	ld	a,(OFST+7,sp)
1592  0406 88            	push	a
1593  0407 7b08          	ld	a,(OFST+6,sp)
1594  0409 97            	ld	xl,a
1595  040a 7b05          	ld	a,(OFST+3,sp)
1596  040c 95            	ld	xh,a
1597  040d cd0b4d        	call	L5_TI2_Config
1599  0410 84            	pop	a
1600                     ; 322         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1602  0411 7b08          	ld	a,(OFST+6,sp)
1603  0413 cd08f9        	call	_TIM2_SetIC2Prescaler
1605                     ; 325         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1607  0416 7b09          	ld	a,(OFST+7,sp)
1608  0418 88            	push	a
1609  0419 7b03          	ld	a,(OFST+1,sp)
1610  041b 97            	ld	xl,a
1611  041c 7b02          	ld	a,(OFST+0,sp)
1612  041e 95            	ld	xh,a
1613  041f cd0b1d        	call	L3_TI1_Config
1615  0422 84            	pop	a
1616                     ; 328         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1618  0423 7b08          	ld	a,(OFST+6,sp)
1619  0425 cd08ca        	call	_TIM2_SetIC1Prescaler
1621  0428               L374:
1622                     ; 330 }
1625  0428 5b04          	addw	sp,#4
1626  042a 81            	ret
1682                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1682                     ; 340 {
1683                     	switch	.text
1684  042b               _TIM2_Cmd:
1686  042b 88            	push	a
1687       00000000      OFST:	set	0
1690                     ; 342     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1692  042c 4d            	tnz	a
1693  042d 2704          	jreq	L002
1694  042f a101          	cp	a,#1
1695  0431 2603          	jrne	L671
1696  0433               L002:
1697  0433 4f            	clr	a
1698  0434 2010          	jra	L202
1699  0436               L671:
1700  0436 ae0156        	ldw	x,#342
1701  0439 89            	pushw	x
1702  043a ae0000        	ldw	x,#0
1703  043d 89            	pushw	x
1704  043e ae0000        	ldw	x,#L702
1705  0441 cd0000        	call	_assert_failed
1707  0444 5b04          	addw	sp,#4
1708  0446               L202:
1709                     ; 345     if (NewState != DISABLE)
1711  0446 0d01          	tnz	(OFST+1,sp)
1712  0448 2706          	jreq	L325
1713                     ; 347         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1715  044a 72105300      	bset	21248,#0
1717  044e 2004          	jra	L525
1718  0450               L325:
1719                     ; 351         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1721  0450 72115300      	bres	21248,#0
1722  0454               L525:
1723                     ; 353 }
1726  0454 84            	pop	a
1727  0455 81            	ret
1807                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1807                     ; 370 {
1808                     	switch	.text
1809  0456               _TIM2_ITConfig:
1811  0456 89            	pushw	x
1812       00000000      OFST:	set	0
1815                     ; 372     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1817  0457 9e            	ld	a,xh
1818  0458 4d            	tnz	a
1819  0459 2708          	jreq	L602
1820  045b 9e            	ld	a,xh
1821  045c a110          	cp	a,#16
1822  045e 2403          	jruge	L602
1823  0460 4f            	clr	a
1824  0461 2010          	jra	L012
1825  0463               L602:
1826  0463 ae0174        	ldw	x,#372
1827  0466 89            	pushw	x
1828  0467 ae0000        	ldw	x,#0
1829  046a 89            	pushw	x
1830  046b ae0000        	ldw	x,#L702
1831  046e cd0000        	call	_assert_failed
1833  0471 5b04          	addw	sp,#4
1834  0473               L012:
1835                     ; 373     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1837  0473 0d02          	tnz	(OFST+2,sp)
1838  0475 2706          	jreq	L412
1839  0477 7b02          	ld	a,(OFST+2,sp)
1840  0479 a101          	cp	a,#1
1841  047b 2603          	jrne	L212
1842  047d               L412:
1843  047d 4f            	clr	a
1844  047e 2010          	jra	L612
1845  0480               L212:
1846  0480 ae0175        	ldw	x,#373
1847  0483 89            	pushw	x
1848  0484 ae0000        	ldw	x,#0
1849  0487 89            	pushw	x
1850  0488 ae0000        	ldw	x,#L702
1851  048b cd0000        	call	_assert_failed
1853  048e 5b04          	addw	sp,#4
1854  0490               L612:
1855                     ; 375     if (NewState != DISABLE)
1857  0490 0d02          	tnz	(OFST+2,sp)
1858  0492 270a          	jreq	L565
1859                     ; 378         TIM2->IER |= (uint8_t)TIM2_IT;
1861  0494 c65303        	ld	a,21251
1862  0497 1a01          	or	a,(OFST+1,sp)
1863  0499 c75303        	ld	21251,a
1865  049c 2009          	jra	L765
1866  049e               L565:
1867                     ; 383         TIM2->IER &= (uint8_t)(~TIM2_IT);
1869  049e 7b01          	ld	a,(OFST+1,sp)
1870  04a0 43            	cpl	a
1871  04a1 c45303        	and	a,21251
1872  04a4 c75303        	ld	21251,a
1873  04a7               L765:
1874                     ; 385 }
1877  04a7 85            	popw	x
1878  04a8 81            	ret
1915                     ; 394 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1915                     ; 395 {
1916                     	switch	.text
1917  04a9               _TIM2_UpdateDisableConfig:
1919  04a9 88            	push	a
1920       00000000      OFST:	set	0
1923                     ; 397     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1925  04aa 4d            	tnz	a
1926  04ab 2704          	jreq	L422
1927  04ad a101          	cp	a,#1
1928  04af 2603          	jrne	L222
1929  04b1               L422:
1930  04b1 4f            	clr	a
1931  04b2 2010          	jra	L622
1932  04b4               L222:
1933  04b4 ae018d        	ldw	x,#397
1934  04b7 89            	pushw	x
1935  04b8 ae0000        	ldw	x,#0
1936  04bb 89            	pushw	x
1937  04bc ae0000        	ldw	x,#L702
1938  04bf cd0000        	call	_assert_failed
1940  04c2 5b04          	addw	sp,#4
1941  04c4               L622:
1942                     ; 400     if (NewState != DISABLE)
1944  04c4 0d01          	tnz	(OFST+1,sp)
1945  04c6 2706          	jreq	L706
1946                     ; 402         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1948  04c8 72125300      	bset	21248,#1
1950  04cc 2004          	jra	L116
1951  04ce               L706:
1952                     ; 406         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1954  04ce 72135300      	bres	21248,#1
1955  04d2               L116:
1956                     ; 408 }
1959  04d2 84            	pop	a
1960  04d3 81            	ret
2019                     ; 418 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2019                     ; 419 {
2020                     	switch	.text
2021  04d4               _TIM2_UpdateRequestConfig:
2023  04d4 88            	push	a
2024       00000000      OFST:	set	0
2027                     ; 421     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
2029  04d5 4d            	tnz	a
2030  04d6 2704          	jreq	L432
2031  04d8 a101          	cp	a,#1
2032  04da 2603          	jrne	L232
2033  04dc               L432:
2034  04dc 4f            	clr	a
2035  04dd 2010          	jra	L632
2036  04df               L232:
2037  04df ae01a5        	ldw	x,#421
2038  04e2 89            	pushw	x
2039  04e3 ae0000        	ldw	x,#0
2040  04e6 89            	pushw	x
2041  04e7 ae0000        	ldw	x,#L702
2042  04ea cd0000        	call	_assert_failed
2044  04ed 5b04          	addw	sp,#4
2045  04ef               L632:
2046                     ; 424     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
2048  04ef 0d01          	tnz	(OFST+1,sp)
2049  04f1 2706          	jreq	L146
2050                     ; 426         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
2052  04f3 72145300      	bset	21248,#2
2054  04f7 2004          	jra	L346
2055  04f9               L146:
2056                     ; 430         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
2058  04f9 72155300      	bres	21248,#2
2059  04fd               L346:
2060                     ; 432 }
2063  04fd 84            	pop	a
2064  04fe 81            	ret
2122                     ; 443 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2122                     ; 444 {
2123                     	switch	.text
2124  04ff               _TIM2_SelectOnePulseMode:
2126  04ff 88            	push	a
2127       00000000      OFST:	set	0
2130                     ; 446     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
2132  0500 a101          	cp	a,#1
2133  0502 2703          	jreq	L442
2134  0504 4d            	tnz	a
2135  0505 2603          	jrne	L242
2136  0507               L442:
2137  0507 4f            	clr	a
2138  0508 2010          	jra	L642
2139  050a               L242:
2140  050a ae01be        	ldw	x,#446
2141  050d 89            	pushw	x
2142  050e ae0000        	ldw	x,#0
2143  0511 89            	pushw	x
2144  0512 ae0000        	ldw	x,#L702
2145  0515 cd0000        	call	_assert_failed
2147  0518 5b04          	addw	sp,#4
2148  051a               L642:
2149                     ; 449     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
2151  051a 0d01          	tnz	(OFST+1,sp)
2152  051c 2706          	jreq	L376
2153                     ; 451         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
2155  051e 72165300      	bset	21248,#3
2157  0522 2004          	jra	L576
2158  0524               L376:
2159                     ; 455         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
2161  0524 72175300      	bres	21248,#3
2162  0528               L576:
2163                     ; 458 }
2166  0528 84            	pop	a
2167  0529 81            	ret
2236                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2236                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2236                     ; 491 {
2237                     	switch	.text
2238  052a               _TIM2_PrescalerConfig:
2240  052a 89            	pushw	x
2241       00000000      OFST:	set	0
2244                     ; 493     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2246  052b 9f            	ld	a,xl
2247  052c 4d            	tnz	a
2248  052d 2705          	jreq	L452
2249  052f 9f            	ld	a,xl
2250  0530 a101          	cp	a,#1
2251  0532 2603          	jrne	L252
2252  0534               L452:
2253  0534 4f            	clr	a
2254  0535 2010          	jra	L652
2255  0537               L252:
2256  0537 ae01ed        	ldw	x,#493
2257  053a 89            	pushw	x
2258  053b ae0000        	ldw	x,#0
2259  053e 89            	pushw	x
2260  053f ae0000        	ldw	x,#L702
2261  0542 cd0000        	call	_assert_failed
2263  0545 5b04          	addw	sp,#4
2264  0547               L652:
2265                     ; 494     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2267  0547 0d01          	tnz	(OFST+1,sp)
2268  0549 275a          	jreq	L262
2269  054b 7b01          	ld	a,(OFST+1,sp)
2270  054d a101          	cp	a,#1
2271  054f 2754          	jreq	L262
2272  0551 7b01          	ld	a,(OFST+1,sp)
2273  0553 a102          	cp	a,#2
2274  0555 274e          	jreq	L262
2275  0557 7b01          	ld	a,(OFST+1,sp)
2276  0559 a103          	cp	a,#3
2277  055b 2748          	jreq	L262
2278  055d 7b01          	ld	a,(OFST+1,sp)
2279  055f a104          	cp	a,#4
2280  0561 2742          	jreq	L262
2281  0563 7b01          	ld	a,(OFST+1,sp)
2282  0565 a105          	cp	a,#5
2283  0567 273c          	jreq	L262
2284  0569 7b01          	ld	a,(OFST+1,sp)
2285  056b a106          	cp	a,#6
2286  056d 2736          	jreq	L262
2287  056f 7b01          	ld	a,(OFST+1,sp)
2288  0571 a107          	cp	a,#7
2289  0573 2730          	jreq	L262
2290  0575 7b01          	ld	a,(OFST+1,sp)
2291  0577 a108          	cp	a,#8
2292  0579 272a          	jreq	L262
2293  057b 7b01          	ld	a,(OFST+1,sp)
2294  057d a109          	cp	a,#9
2295  057f 2724          	jreq	L262
2296  0581 7b01          	ld	a,(OFST+1,sp)
2297  0583 a10a          	cp	a,#10
2298  0585 271e          	jreq	L262
2299  0587 7b01          	ld	a,(OFST+1,sp)
2300  0589 a10b          	cp	a,#11
2301  058b 2718          	jreq	L262
2302  058d 7b01          	ld	a,(OFST+1,sp)
2303  058f a10c          	cp	a,#12
2304  0591 2712          	jreq	L262
2305  0593 7b01          	ld	a,(OFST+1,sp)
2306  0595 a10d          	cp	a,#13
2307  0597 270c          	jreq	L262
2308  0599 7b01          	ld	a,(OFST+1,sp)
2309  059b a10e          	cp	a,#14
2310  059d 2706          	jreq	L262
2311  059f 7b01          	ld	a,(OFST+1,sp)
2312  05a1 a10f          	cp	a,#15
2313  05a3 2603          	jrne	L062
2314  05a5               L262:
2315  05a5 4f            	clr	a
2316  05a6 2010          	jra	L462
2317  05a8               L062:
2318  05a8 ae01ee        	ldw	x,#494
2319  05ab 89            	pushw	x
2320  05ac ae0000        	ldw	x,#0
2321  05af 89            	pushw	x
2322  05b0 ae0000        	ldw	x,#L702
2323  05b3 cd0000        	call	_assert_failed
2325  05b6 5b04          	addw	sp,#4
2326  05b8               L462:
2327                     ; 497     TIM2->PSCR = (uint8_t)Prescaler;
2329  05b8 7b01          	ld	a,(OFST+1,sp)
2330  05ba c7530e        	ld	21262,a
2331                     ; 500     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2333  05bd 7b02          	ld	a,(OFST+2,sp)
2334  05bf c75306        	ld	21254,a
2335                     ; 501 }
2338  05c2 85            	popw	x
2339  05c3 81            	ret
2398                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2398                     ; 513 {
2399                     	switch	.text
2400  05c4               _TIM2_ForcedOC1Config:
2402  05c4 88            	push	a
2403       00000000      OFST:	set	0
2406                     ; 515     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2408  05c5 a150          	cp	a,#80
2409  05c7 2704          	jreq	L272
2410  05c9 a140          	cp	a,#64
2411  05cb 2603          	jrne	L072
2412  05cd               L272:
2413  05cd 4f            	clr	a
2414  05ce 2010          	jra	L472
2415  05d0               L072:
2416  05d0 ae0203        	ldw	x,#515
2417  05d3 89            	pushw	x
2418  05d4 ae0000        	ldw	x,#0
2419  05d7 89            	pushw	x
2420  05d8 ae0000        	ldw	x,#L702
2421  05db cd0000        	call	_assert_failed
2423  05de 5b04          	addw	sp,#4
2424  05e0               L472:
2425                     ; 518     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2425                     ; 519                               | (uint8_t)TIM2_ForcedAction);
2427  05e0 c65307        	ld	a,21255
2428  05e3 a48f          	and	a,#143
2429  05e5 1a01          	or	a,(OFST+1,sp)
2430  05e7 c75307        	ld	21255,a
2431                     ; 520 }
2434  05ea 84            	pop	a
2435  05eb 81            	ret
2472                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2472                     ; 532 {
2473                     	switch	.text
2474  05ec               _TIM2_ForcedOC2Config:
2476  05ec 88            	push	a
2477       00000000      OFST:	set	0
2480                     ; 534     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2482  05ed a150          	cp	a,#80
2483  05ef 2704          	jreq	L203
2484  05f1 a140          	cp	a,#64
2485  05f3 2603          	jrne	L003
2486  05f5               L203:
2487  05f5 4f            	clr	a
2488  05f6 2010          	jra	L403
2489  05f8               L003:
2490  05f8 ae0216        	ldw	x,#534
2491  05fb 89            	pushw	x
2492  05fc ae0000        	ldw	x,#0
2493  05ff 89            	pushw	x
2494  0600 ae0000        	ldw	x,#L702
2495  0603 cd0000        	call	_assert_failed
2497  0606 5b04          	addw	sp,#4
2498  0608               L403:
2499                     ; 537     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2499                     ; 538                             | (uint8_t)TIM2_ForcedAction);
2501  0608 c65308        	ld	a,21256
2502  060b a48f          	and	a,#143
2503  060d 1a01          	or	a,(OFST+1,sp)
2504  060f c75308        	ld	21256,a
2505                     ; 539 }
2508  0612 84            	pop	a
2509  0613 81            	ret
2546                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2546                     ; 551 {
2547                     	switch	.text
2548  0614               _TIM2_ForcedOC3Config:
2550  0614 88            	push	a
2551       00000000      OFST:	set	0
2554                     ; 553     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2556  0615 a150          	cp	a,#80
2557  0617 2704          	jreq	L213
2558  0619 a140          	cp	a,#64
2559  061b 2603          	jrne	L013
2560  061d               L213:
2561  061d 4f            	clr	a
2562  061e 2010          	jra	L413
2563  0620               L013:
2564  0620 ae0229        	ldw	x,#553
2565  0623 89            	pushw	x
2566  0624 ae0000        	ldw	x,#0
2567  0627 89            	pushw	x
2568  0628 ae0000        	ldw	x,#L702
2569  062b cd0000        	call	_assert_failed
2571  062e 5b04          	addw	sp,#4
2572  0630               L413:
2573                     ; 556     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2573                     ; 557                               | (uint8_t)TIM2_ForcedAction);
2575  0630 c65309        	ld	a,21257
2576  0633 a48f          	and	a,#143
2577  0635 1a01          	or	a,(OFST+1,sp)
2578  0637 c75309        	ld	21257,a
2579                     ; 558 }
2582  063a 84            	pop	a
2583  063b 81            	ret
2620                     ; 567 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2620                     ; 568 {
2621                     	switch	.text
2622  063c               _TIM2_ARRPreloadConfig:
2624  063c 88            	push	a
2625       00000000      OFST:	set	0
2628                     ; 570     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2630  063d 4d            	tnz	a
2631  063e 2704          	jreq	L223
2632  0640 a101          	cp	a,#1
2633  0642 2603          	jrne	L023
2634  0644               L223:
2635  0644 4f            	clr	a
2636  0645 2010          	jra	L423
2637  0647               L023:
2638  0647 ae023a        	ldw	x,#570
2639  064a 89            	pushw	x
2640  064b ae0000        	ldw	x,#0
2641  064e 89            	pushw	x
2642  064f ae0000        	ldw	x,#L702
2643  0652 cd0000        	call	_assert_failed
2645  0655 5b04          	addw	sp,#4
2646  0657               L423:
2647                     ; 573     if (NewState != DISABLE)
2649  0657 0d01          	tnz	(OFST+1,sp)
2650  0659 2706          	jreq	L1301
2651                     ; 575         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2653  065b 721e5300      	bset	21248,#7
2655  065f 2004          	jra	L3301
2656  0661               L1301:
2657                     ; 579         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2659  0661 721f5300      	bres	21248,#7
2660  0665               L3301:
2661                     ; 581 }
2664  0665 84            	pop	a
2665  0666 81            	ret
2702                     ; 590 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2702                     ; 591 {
2703                     	switch	.text
2704  0667               _TIM2_OC1PreloadConfig:
2706  0667 88            	push	a
2707       00000000      OFST:	set	0
2710                     ; 593     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2712  0668 4d            	tnz	a
2713  0669 2704          	jreq	L233
2714  066b a101          	cp	a,#1
2715  066d 2603          	jrne	L033
2716  066f               L233:
2717  066f 4f            	clr	a
2718  0670 2010          	jra	L433
2719  0672               L033:
2720  0672 ae0251        	ldw	x,#593
2721  0675 89            	pushw	x
2722  0676 ae0000        	ldw	x,#0
2723  0679 89            	pushw	x
2724  067a ae0000        	ldw	x,#L702
2725  067d cd0000        	call	_assert_failed
2727  0680 5b04          	addw	sp,#4
2728  0682               L433:
2729                     ; 596     if (NewState != DISABLE)
2731  0682 0d01          	tnz	(OFST+1,sp)
2732  0684 2706          	jreq	L3501
2733                     ; 598         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2735  0686 72165307      	bset	21255,#3
2737  068a 2004          	jra	L5501
2738  068c               L3501:
2739                     ; 602         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2741  068c 72175307      	bres	21255,#3
2742  0690               L5501:
2743                     ; 604 }
2746  0690 84            	pop	a
2747  0691 81            	ret
2784                     ; 613 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2784                     ; 614 {
2785                     	switch	.text
2786  0692               _TIM2_OC2PreloadConfig:
2788  0692 88            	push	a
2789       00000000      OFST:	set	0
2792                     ; 616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2794  0693 4d            	tnz	a
2795  0694 2704          	jreq	L243
2796  0696 a101          	cp	a,#1
2797  0698 2603          	jrne	L043
2798  069a               L243:
2799  069a 4f            	clr	a
2800  069b 2010          	jra	L443
2801  069d               L043:
2802  069d ae0268        	ldw	x,#616
2803  06a0 89            	pushw	x
2804  06a1 ae0000        	ldw	x,#0
2805  06a4 89            	pushw	x
2806  06a5 ae0000        	ldw	x,#L702
2807  06a8 cd0000        	call	_assert_failed
2809  06ab 5b04          	addw	sp,#4
2810  06ad               L443:
2811                     ; 619     if (NewState != DISABLE)
2813  06ad 0d01          	tnz	(OFST+1,sp)
2814  06af 2706          	jreq	L5701
2815                     ; 621         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2817  06b1 72165308      	bset	21256,#3
2819  06b5 2004          	jra	L7701
2820  06b7               L5701:
2821                     ; 625         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2823  06b7 72175308      	bres	21256,#3
2824  06bb               L7701:
2825                     ; 627 }
2828  06bb 84            	pop	a
2829  06bc 81            	ret
2866                     ; 636 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2866                     ; 637 {
2867                     	switch	.text
2868  06bd               _TIM2_OC3PreloadConfig:
2870  06bd 88            	push	a
2871       00000000      OFST:	set	0
2874                     ; 639     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2876  06be 4d            	tnz	a
2877  06bf 2704          	jreq	L253
2878  06c1 a101          	cp	a,#1
2879  06c3 2603          	jrne	L053
2880  06c5               L253:
2881  06c5 4f            	clr	a
2882  06c6 2010          	jra	L453
2883  06c8               L053:
2884  06c8 ae027f        	ldw	x,#639
2885  06cb 89            	pushw	x
2886  06cc ae0000        	ldw	x,#0
2887  06cf 89            	pushw	x
2888  06d0 ae0000        	ldw	x,#L702
2889  06d3 cd0000        	call	_assert_failed
2891  06d6 5b04          	addw	sp,#4
2892  06d8               L453:
2893                     ; 642     if (NewState != DISABLE)
2895  06d8 0d01          	tnz	(OFST+1,sp)
2896  06da 2706          	jreq	L7111
2897                     ; 644         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2899  06dc 72165309      	bset	21257,#3
2901  06e0 2004          	jra	L1211
2902  06e2               L7111:
2903                     ; 648         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2905  06e2 72175309      	bres	21257,#3
2906  06e6               L1211:
2907                     ; 650 }
2910  06e6 84            	pop	a
2911  06e7 81            	ret
2985                     ; 663 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2985                     ; 664 {
2986                     	switch	.text
2987  06e8               _TIM2_GenerateEvent:
2989  06e8 88            	push	a
2990       00000000      OFST:	set	0
2993                     ; 666     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2995  06e9 4d            	tnz	a
2996  06ea 2703          	jreq	L063
2997  06ec 4f            	clr	a
2998  06ed 2010          	jra	L263
2999  06ef               L063:
3000  06ef ae029a        	ldw	x,#666
3001  06f2 89            	pushw	x
3002  06f3 ae0000        	ldw	x,#0
3003  06f6 89            	pushw	x
3004  06f7 ae0000        	ldw	x,#L702
3005  06fa cd0000        	call	_assert_failed
3007  06fd 5b04          	addw	sp,#4
3008  06ff               L263:
3009                     ; 669     TIM2->EGR = (uint8_t)TIM2_EventSource;
3011  06ff 7b01          	ld	a,(OFST+1,sp)
3012  0701 c75306        	ld	21254,a
3013                     ; 670 }
3016  0704 84            	pop	a
3017  0705 81            	ret
3054                     ; 681 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3054                     ; 682 {
3055                     	switch	.text
3056  0706               _TIM2_OC1PolarityConfig:
3058  0706 88            	push	a
3059       00000000      OFST:	set	0
3062                     ; 684     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3064  0707 4d            	tnz	a
3065  0708 2704          	jreq	L073
3066  070a a122          	cp	a,#34
3067  070c 2603          	jrne	L663
3068  070e               L073:
3069  070e 4f            	clr	a
3070  070f 2010          	jra	L273
3071  0711               L663:
3072  0711 ae02ac        	ldw	x,#684
3073  0714 89            	pushw	x
3074  0715 ae0000        	ldw	x,#0
3075  0718 89            	pushw	x
3076  0719 ae0000        	ldw	x,#L702
3077  071c cd0000        	call	_assert_failed
3079  071f 5b04          	addw	sp,#4
3080  0721               L273:
3081                     ; 687     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3083  0721 0d01          	tnz	(OFST+1,sp)
3084  0723 2706          	jreq	L3711
3085                     ; 689         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
3087  0725 7212530a      	bset	21258,#1
3089  0729 2004          	jra	L5711
3090  072b               L3711:
3091                     ; 693         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3093  072b 7213530a      	bres	21258,#1
3094  072f               L5711:
3095                     ; 695 }
3098  072f 84            	pop	a
3099  0730 81            	ret
3136                     ; 706 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3136                     ; 707 {
3137                     	switch	.text
3138  0731               _TIM2_OC2PolarityConfig:
3140  0731 88            	push	a
3141       00000000      OFST:	set	0
3144                     ; 709     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3146  0732 4d            	tnz	a
3147  0733 2704          	jreq	L004
3148  0735 a122          	cp	a,#34
3149  0737 2603          	jrne	L673
3150  0739               L004:
3151  0739 4f            	clr	a
3152  073a 2010          	jra	L204
3153  073c               L673:
3154  073c ae02c5        	ldw	x,#709
3155  073f 89            	pushw	x
3156  0740 ae0000        	ldw	x,#0
3157  0743 89            	pushw	x
3158  0744 ae0000        	ldw	x,#L702
3159  0747 cd0000        	call	_assert_failed
3161  074a 5b04          	addw	sp,#4
3162  074c               L204:
3163                     ; 712     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3165  074c 0d01          	tnz	(OFST+1,sp)
3166  074e 2706          	jreq	L5121
3167                     ; 714         TIM2->CCER1 |= TIM2_CCER1_CC2P;
3169  0750 721a530a      	bset	21258,#5
3171  0754 2004          	jra	L7121
3172  0756               L5121:
3173                     ; 718         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
3175  0756 721b530a      	bres	21258,#5
3176  075a               L7121:
3177                     ; 720 }
3180  075a 84            	pop	a
3181  075b 81            	ret
3218                     ; 731 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3218                     ; 732 {
3219                     	switch	.text
3220  075c               _TIM2_OC3PolarityConfig:
3222  075c 88            	push	a
3223       00000000      OFST:	set	0
3226                     ; 734     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3228  075d 4d            	tnz	a
3229  075e 2704          	jreq	L014
3230  0760 a122          	cp	a,#34
3231  0762 2603          	jrne	L604
3232  0764               L014:
3233  0764 4f            	clr	a
3234  0765 2010          	jra	L214
3235  0767               L604:
3236  0767 ae02de        	ldw	x,#734
3237  076a 89            	pushw	x
3238  076b ae0000        	ldw	x,#0
3239  076e 89            	pushw	x
3240  076f ae0000        	ldw	x,#L702
3241  0772 cd0000        	call	_assert_failed
3243  0775 5b04          	addw	sp,#4
3244  0777               L214:
3245                     ; 737     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3247  0777 0d01          	tnz	(OFST+1,sp)
3248  0779 2706          	jreq	L7321
3249                     ; 739         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3251  077b 7212530b      	bset	21259,#1
3253  077f 2004          	jra	L1421
3254  0781               L7321:
3255                     ; 743         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3257  0781 7213530b      	bres	21259,#1
3258  0785               L1421:
3259                     ; 745 }
3262  0785 84            	pop	a
3263  0786 81            	ret
3309                     ; 759 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3309                     ; 760 {
3310                     	switch	.text
3311  0787               _TIM2_CCxCmd:
3313  0787 89            	pushw	x
3314       00000000      OFST:	set	0
3317                     ; 762     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3319  0788 9e            	ld	a,xh
3320  0789 4d            	tnz	a
3321  078a 270a          	jreq	L024
3322  078c 9e            	ld	a,xh
3323  078d a101          	cp	a,#1
3324  078f 2705          	jreq	L024
3325  0791 9e            	ld	a,xh
3326  0792 a102          	cp	a,#2
3327  0794 2603          	jrne	L614
3328  0796               L024:
3329  0796 4f            	clr	a
3330  0797 2010          	jra	L224
3331  0799               L614:
3332  0799 ae02fa        	ldw	x,#762
3333  079c 89            	pushw	x
3334  079d ae0000        	ldw	x,#0
3335  07a0 89            	pushw	x
3336  07a1 ae0000        	ldw	x,#L702
3337  07a4 cd0000        	call	_assert_failed
3339  07a7 5b04          	addw	sp,#4
3340  07a9               L224:
3341                     ; 763     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3343  07a9 0d02          	tnz	(OFST+2,sp)
3344  07ab 2706          	jreq	L624
3345  07ad 7b02          	ld	a,(OFST+2,sp)
3346  07af a101          	cp	a,#1
3347  07b1 2603          	jrne	L424
3348  07b3               L624:
3349  07b3 4f            	clr	a
3350  07b4 2010          	jra	L034
3351  07b6               L424:
3352  07b6 ae02fb        	ldw	x,#763
3353  07b9 89            	pushw	x
3354  07ba ae0000        	ldw	x,#0
3355  07bd 89            	pushw	x
3356  07be ae0000        	ldw	x,#L702
3357  07c1 cd0000        	call	_assert_failed
3359  07c4 5b04          	addw	sp,#4
3360  07c6               L034:
3361                     ; 765     if (TIM2_Channel == TIM2_CHANNEL_1)
3363  07c6 0d01          	tnz	(OFST+1,sp)
3364  07c8 2610          	jrne	L5621
3365                     ; 768         if (NewState != DISABLE)
3367  07ca 0d02          	tnz	(OFST+2,sp)
3368  07cc 2706          	jreq	L7621
3369                     ; 770             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3371  07ce 7210530a      	bset	21258,#0
3373  07d2 202a          	jra	L3721
3374  07d4               L7621:
3375                     ; 774             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3377  07d4 7211530a      	bres	21258,#0
3378  07d8 2024          	jra	L3721
3379  07da               L5621:
3380                     ; 778     else if (TIM2_Channel == TIM2_CHANNEL_2)
3382  07da 7b01          	ld	a,(OFST+1,sp)
3383  07dc a101          	cp	a,#1
3384  07de 2610          	jrne	L5721
3385                     ; 781         if (NewState != DISABLE)
3387  07e0 0d02          	tnz	(OFST+2,sp)
3388  07e2 2706          	jreq	L7721
3389                     ; 783             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3391  07e4 7218530a      	bset	21258,#4
3393  07e8 2014          	jra	L3721
3394  07ea               L7721:
3395                     ; 787             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3397  07ea 7219530a      	bres	21258,#4
3398  07ee 200e          	jra	L3721
3399  07f0               L5721:
3400                     ; 793         if (NewState != DISABLE)
3402  07f0 0d02          	tnz	(OFST+2,sp)
3403  07f2 2706          	jreq	L5031
3404                     ; 795             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3406  07f4 7210530b      	bset	21259,#0
3408  07f8 2004          	jra	L3721
3409  07fa               L5031:
3410                     ; 799             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3412  07fa 7211530b      	bres	21259,#0
3413  07fe               L3721:
3414                     ; 802 }
3417  07fe 85            	popw	x
3418  07ff 81            	ret
3464                     ; 824 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3464                     ; 825 {
3465                     	switch	.text
3466  0800               _TIM2_SelectOCxM:
3468  0800 89            	pushw	x
3469       00000000      OFST:	set	0
3472                     ; 827     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3474  0801 9e            	ld	a,xh
3475  0802 4d            	tnz	a
3476  0803 270a          	jreq	L634
3477  0805 9e            	ld	a,xh
3478  0806 a101          	cp	a,#1
3479  0808 2705          	jreq	L634
3480  080a 9e            	ld	a,xh
3481  080b a102          	cp	a,#2
3482  080d 2603          	jrne	L434
3483  080f               L634:
3484  080f 4f            	clr	a
3485  0810 2010          	jra	L044
3486  0812               L434:
3487  0812 ae033b        	ldw	x,#827
3488  0815 89            	pushw	x
3489  0816 ae0000        	ldw	x,#0
3490  0819 89            	pushw	x
3491  081a ae0000        	ldw	x,#L702
3492  081d cd0000        	call	_assert_failed
3494  0820 5b04          	addw	sp,#4
3495  0822               L044:
3496                     ; 828     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3498  0822 0d02          	tnz	(OFST+2,sp)
3499  0824 272a          	jreq	L444
3500  0826 7b02          	ld	a,(OFST+2,sp)
3501  0828 a110          	cp	a,#16
3502  082a 2724          	jreq	L444
3503  082c 7b02          	ld	a,(OFST+2,sp)
3504  082e a120          	cp	a,#32
3505  0830 271e          	jreq	L444
3506  0832 7b02          	ld	a,(OFST+2,sp)
3507  0834 a130          	cp	a,#48
3508  0836 2718          	jreq	L444
3509  0838 7b02          	ld	a,(OFST+2,sp)
3510  083a a160          	cp	a,#96
3511  083c 2712          	jreq	L444
3512  083e 7b02          	ld	a,(OFST+2,sp)
3513  0840 a170          	cp	a,#112
3514  0842 270c          	jreq	L444
3515  0844 7b02          	ld	a,(OFST+2,sp)
3516  0846 a150          	cp	a,#80
3517  0848 2706          	jreq	L444
3518  084a 7b02          	ld	a,(OFST+2,sp)
3519  084c a140          	cp	a,#64
3520  084e 2603          	jrne	L244
3521  0850               L444:
3522  0850 4f            	clr	a
3523  0851 2010          	jra	L644
3524  0853               L244:
3525  0853 ae033c        	ldw	x,#828
3526  0856 89            	pushw	x
3527  0857 ae0000        	ldw	x,#0
3528  085a 89            	pushw	x
3529  085b ae0000        	ldw	x,#L702
3530  085e cd0000        	call	_assert_failed
3532  0861 5b04          	addw	sp,#4
3533  0863               L644:
3534                     ; 830     if (TIM2_Channel == TIM2_CHANNEL_1)
3536  0863 0d01          	tnz	(OFST+1,sp)
3537  0865 2610          	jrne	L3331
3538                     ; 833         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3540  0867 7211530a      	bres	21258,#0
3541                     ; 836         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3541                     ; 837                                | (uint8_t)TIM2_OCMode);
3543  086b c65307        	ld	a,21255
3544  086e a48f          	and	a,#143
3545  0870 1a02          	or	a,(OFST+2,sp)
3546  0872 c75307        	ld	21255,a
3548  0875 2024          	jra	L5331
3549  0877               L3331:
3550                     ; 839     else if (TIM2_Channel == TIM2_CHANNEL_2)
3552  0877 7b01          	ld	a,(OFST+1,sp)
3553  0879 a101          	cp	a,#1
3554  087b 2610          	jrne	L7331
3555                     ; 842         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3557  087d 7219530a      	bres	21258,#4
3558                     ; 845         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3558                     ; 846                                 | (uint8_t)TIM2_OCMode);
3560  0881 c65308        	ld	a,21256
3561  0884 a48f          	and	a,#143
3562  0886 1a02          	or	a,(OFST+2,sp)
3563  0888 c75308        	ld	21256,a
3565  088b 200e          	jra	L5331
3566  088d               L7331:
3567                     ; 851         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3569  088d 7211530b      	bres	21259,#0
3570                     ; 854         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3570                     ; 855                                 | (uint8_t)TIM2_OCMode);
3572  0891 c65309        	ld	a,21257
3573  0894 a48f          	and	a,#143
3574  0896 1a02          	or	a,(OFST+2,sp)
3575  0898 c75309        	ld	21257,a
3576  089b               L5331:
3577                     ; 857 }
3580  089b 85            	popw	x
3581  089c 81            	ret
3615                     ; 866 void TIM2_SetCounter(uint16_t Counter)
3615                     ; 867 {
3616                     	switch	.text
3617  089d               _TIM2_SetCounter:
3621                     ; 869     TIM2->CNTRH = (uint8_t)(Counter >> 8);
3623  089d 9e            	ld	a,xh
3624  089e c7530c        	ld	21260,a
3625                     ; 870     TIM2->CNTRL = (uint8_t)(Counter);
3627  08a1 9f            	ld	a,xl
3628  08a2 c7530d        	ld	21261,a
3629                     ; 872 }
3632  08a5 81            	ret
3666                     ; 881 void TIM2_SetAutoreload(uint16_t Autoreload)
3666                     ; 882 {
3667                     	switch	.text
3668  08a6               _TIM2_SetAutoreload:
3672                     ; 885     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3674  08a6 9e            	ld	a,xh
3675  08a7 c7530f        	ld	21263,a
3676                     ; 886     TIM2->ARRL = (uint8_t)(Autoreload);
3678  08aa 9f            	ld	a,xl
3679  08ab c75310        	ld	21264,a
3680                     ; 888 }
3683  08ae 81            	ret
3717                     ; 897 void TIM2_SetCompare1(uint16_t Compare1)
3717                     ; 898 {
3718                     	switch	.text
3719  08af               _TIM2_SetCompare1:
3723                     ; 900     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3725  08af 9e            	ld	a,xh
3726  08b0 c75311        	ld	21265,a
3727                     ; 901     TIM2->CCR1L = (uint8_t)(Compare1);
3729  08b3 9f            	ld	a,xl
3730  08b4 c75312        	ld	21266,a
3731                     ; 903 }
3734  08b7 81            	ret
3768                     ; 912 void TIM2_SetCompare2(uint16_t Compare2)
3768                     ; 913 {
3769                     	switch	.text
3770  08b8               _TIM2_SetCompare2:
3774                     ; 915     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3776  08b8 9e            	ld	a,xh
3777  08b9 c75313        	ld	21267,a
3778                     ; 916     TIM2->CCR2L = (uint8_t)(Compare2);
3780  08bc 9f            	ld	a,xl
3781  08bd c75314        	ld	21268,a
3782                     ; 918 }
3785  08c0 81            	ret
3819                     ; 927 void TIM2_SetCompare3(uint16_t Compare3)
3819                     ; 928 {
3820                     	switch	.text
3821  08c1               _TIM2_SetCompare3:
3825                     ; 930     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3827  08c1 9e            	ld	a,xh
3828  08c2 c75315        	ld	21269,a
3829                     ; 931     TIM2->CCR3L = (uint8_t)(Compare3);
3831  08c5 9f            	ld	a,xl
3832  08c6 c75316        	ld	21270,a
3833                     ; 933 }
3836  08c9 81            	ret
3873                     ; 946 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3873                     ; 947 {
3874                     	switch	.text
3875  08ca               _TIM2_SetIC1Prescaler:
3877  08ca 88            	push	a
3878       00000000      OFST:	set	0
3881                     ; 949     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3883  08cb 4d            	tnz	a
3884  08cc 270c          	jreq	L664
3885  08ce a104          	cp	a,#4
3886  08d0 2708          	jreq	L664
3887  08d2 a108          	cp	a,#8
3888  08d4 2704          	jreq	L664
3889  08d6 a10c          	cp	a,#12
3890  08d8 2603          	jrne	L464
3891  08da               L664:
3892  08da 4f            	clr	a
3893  08db 2010          	jra	L074
3894  08dd               L464:
3895  08dd ae03b5        	ldw	x,#949
3896  08e0 89            	pushw	x
3897  08e1 ae0000        	ldw	x,#0
3898  08e4 89            	pushw	x
3899  08e5 ae0000        	ldw	x,#L702
3900  08e8 cd0000        	call	_assert_failed
3902  08eb 5b04          	addw	sp,#4
3903  08ed               L074:
3904                     ; 952     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3904                     ; 953                             | (uint8_t)TIM2_IC1Prescaler);
3906  08ed c65307        	ld	a,21255
3907  08f0 a4f3          	and	a,#243
3908  08f2 1a01          	or	a,(OFST+1,sp)
3909  08f4 c75307        	ld	21255,a
3910                     ; 954 }
3913  08f7 84            	pop	a
3914  08f8 81            	ret
3951                     ; 966 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3951                     ; 967 {
3952                     	switch	.text
3953  08f9               _TIM2_SetIC2Prescaler:
3955  08f9 88            	push	a
3956       00000000      OFST:	set	0
3959                     ; 969     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3961  08fa 4d            	tnz	a
3962  08fb 270c          	jreq	L674
3963  08fd a104          	cp	a,#4
3964  08ff 2708          	jreq	L674
3965  0901 a108          	cp	a,#8
3966  0903 2704          	jreq	L674
3967  0905 a10c          	cp	a,#12
3968  0907 2603          	jrne	L474
3969  0909               L674:
3970  0909 4f            	clr	a
3971  090a 2010          	jra	L005
3972  090c               L474:
3973  090c ae03c9        	ldw	x,#969
3974  090f 89            	pushw	x
3975  0910 ae0000        	ldw	x,#0
3976  0913 89            	pushw	x
3977  0914 ae0000        	ldw	x,#L702
3978  0917 cd0000        	call	_assert_failed
3980  091a 5b04          	addw	sp,#4
3981  091c               L005:
3982                     ; 972     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3982                     ; 973                             | (uint8_t)TIM2_IC2Prescaler);
3984  091c c65308        	ld	a,21256
3985  091f a4f3          	and	a,#243
3986  0921 1a01          	or	a,(OFST+1,sp)
3987  0923 c75308        	ld	21256,a
3988                     ; 974 }
3991  0926 84            	pop	a
3992  0927 81            	ret
4029                     ; 986 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
4029                     ; 987 {
4030                     	switch	.text
4031  0928               _TIM2_SetIC3Prescaler:
4033  0928 88            	push	a
4034       00000000      OFST:	set	0
4037                     ; 990     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
4039  0929 4d            	tnz	a
4040  092a 270c          	jreq	L605
4041  092c a104          	cp	a,#4
4042  092e 2708          	jreq	L605
4043  0930 a108          	cp	a,#8
4044  0932 2704          	jreq	L605
4045  0934 a10c          	cp	a,#12
4046  0936 2603          	jrne	L405
4047  0938               L605:
4048  0938 4f            	clr	a
4049  0939 2010          	jra	L015
4050  093b               L405:
4051  093b ae03de        	ldw	x,#990
4052  093e 89            	pushw	x
4053  093f ae0000        	ldw	x,#0
4054  0942 89            	pushw	x
4055  0943 ae0000        	ldw	x,#L702
4056  0946 cd0000        	call	_assert_failed
4058  0949 5b04          	addw	sp,#4
4059  094b               L015:
4060                     ; 992     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
4060                     ; 993                             | (uint8_t)TIM2_IC3Prescaler);
4062  094b c65309        	ld	a,21257
4063  094e a4f3          	and	a,#243
4064  0950 1a01          	or	a,(OFST+1,sp)
4065  0952 c75309        	ld	21257,a
4066                     ; 994 }
4069  0955 84            	pop	a
4070  0956 81            	ret
4122                     ; 1001 uint16_t TIM2_GetCapture1(void)
4122                     ; 1002 {
4123                     	switch	.text
4124  0957               _TIM2_GetCapture1:
4126  0957 5204          	subw	sp,#4
4127       00000004      OFST:	set	4
4130                     ; 1004     uint16_t tmpccr1 = 0;
4132  0959 1e03          	ldw	x,(OFST-1,sp)
4133                     ; 1005     uint8_t tmpccr1l=0, tmpccr1h=0;
4135  095b 7b01          	ld	a,(OFST-3,sp)
4136  095d 97            	ld	xl,a
4139  095e 7b02          	ld	a,(OFST-2,sp)
4140  0960 97            	ld	xl,a
4141                     ; 1007     tmpccr1h = TIM2->CCR1H;
4143  0961 c65311        	ld	a,21265
4144  0964 6b02          	ld	(OFST-2,sp),a
4145                     ; 1008     tmpccr1l = TIM2->CCR1L;
4147  0966 c65312        	ld	a,21266
4148  0969 6b01          	ld	(OFST-3,sp),a
4149                     ; 1010     tmpccr1 = (uint16_t)(tmpccr1l);
4151  096b 7b01          	ld	a,(OFST-3,sp)
4152  096d 5f            	clrw	x
4153  096e 97            	ld	xl,a
4154  096f 1f03          	ldw	(OFST-1,sp),x
4155                     ; 1011     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4157  0971 7b02          	ld	a,(OFST-2,sp)
4158  0973 5f            	clrw	x
4159  0974 97            	ld	xl,a
4160  0975 4f            	clr	a
4161  0976 02            	rlwa	x,a
4162  0977 01            	rrwa	x,a
4163  0978 1a04          	or	a,(OFST+0,sp)
4164  097a 01            	rrwa	x,a
4165  097b 1a03          	or	a,(OFST-1,sp)
4166  097d 01            	rrwa	x,a
4167  097e 1f03          	ldw	(OFST-1,sp),x
4168                     ; 1013     return (uint16_t)tmpccr1;
4170  0980 1e03          	ldw	x,(OFST-1,sp)
4173  0982 5b04          	addw	sp,#4
4174  0984 81            	ret
4226                     ; 1021 uint16_t TIM2_GetCapture2(void)
4226                     ; 1022 {
4227                     	switch	.text
4228  0985               _TIM2_GetCapture2:
4230  0985 5204          	subw	sp,#4
4231       00000004      OFST:	set	4
4234                     ; 1024     uint16_t tmpccr2 = 0;
4236  0987 1e03          	ldw	x,(OFST-1,sp)
4237                     ; 1025     uint8_t tmpccr2l=0, tmpccr2h=0;
4239  0989 7b01          	ld	a,(OFST-3,sp)
4240  098b 97            	ld	xl,a
4243  098c 7b02          	ld	a,(OFST-2,sp)
4244  098e 97            	ld	xl,a
4245                     ; 1027     tmpccr2h = TIM2->CCR2H;
4247  098f c65313        	ld	a,21267
4248  0992 6b02          	ld	(OFST-2,sp),a
4249                     ; 1028     tmpccr2l = TIM2->CCR2L;
4251  0994 c65314        	ld	a,21268
4252  0997 6b01          	ld	(OFST-3,sp),a
4253                     ; 1030     tmpccr2 = (uint16_t)(tmpccr2l);
4255  0999 7b01          	ld	a,(OFST-3,sp)
4256  099b 5f            	clrw	x
4257  099c 97            	ld	xl,a
4258  099d 1f03          	ldw	(OFST-1,sp),x
4259                     ; 1031     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4261  099f 7b02          	ld	a,(OFST-2,sp)
4262  09a1 5f            	clrw	x
4263  09a2 97            	ld	xl,a
4264  09a3 4f            	clr	a
4265  09a4 02            	rlwa	x,a
4266  09a5 01            	rrwa	x,a
4267  09a6 1a04          	or	a,(OFST+0,sp)
4268  09a8 01            	rrwa	x,a
4269  09a9 1a03          	or	a,(OFST-1,sp)
4270  09ab 01            	rrwa	x,a
4271  09ac 1f03          	ldw	(OFST-1,sp),x
4272                     ; 1033     return (uint16_t)tmpccr2;
4274  09ae 1e03          	ldw	x,(OFST-1,sp)
4277  09b0 5b04          	addw	sp,#4
4278  09b2 81            	ret
4330                     ; 1041 uint16_t TIM2_GetCapture3(void)
4330                     ; 1042 {
4331                     	switch	.text
4332  09b3               _TIM2_GetCapture3:
4334  09b3 5204          	subw	sp,#4
4335       00000004      OFST:	set	4
4338                     ; 1044     uint16_t tmpccr3 = 0;
4340  09b5 1e03          	ldw	x,(OFST-1,sp)
4341                     ; 1045     uint8_t tmpccr3l=0, tmpccr3h=0;
4343  09b7 7b01          	ld	a,(OFST-3,sp)
4344  09b9 97            	ld	xl,a
4347  09ba 7b02          	ld	a,(OFST-2,sp)
4348  09bc 97            	ld	xl,a
4349                     ; 1047     tmpccr3h = TIM2->CCR3H;
4351  09bd c65315        	ld	a,21269
4352  09c0 6b02          	ld	(OFST-2,sp),a
4353                     ; 1048     tmpccr3l = TIM2->CCR3L;
4355  09c2 c65316        	ld	a,21270
4356  09c5 6b01          	ld	(OFST-3,sp),a
4357                     ; 1050     tmpccr3 = (uint16_t)(tmpccr3l);
4359  09c7 7b01          	ld	a,(OFST-3,sp)
4360  09c9 5f            	clrw	x
4361  09ca 97            	ld	xl,a
4362  09cb 1f03          	ldw	(OFST-1,sp),x
4363                     ; 1051     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4365  09cd 7b02          	ld	a,(OFST-2,sp)
4366  09cf 5f            	clrw	x
4367  09d0 97            	ld	xl,a
4368  09d1 4f            	clr	a
4369  09d2 02            	rlwa	x,a
4370  09d3 01            	rrwa	x,a
4371  09d4 1a04          	or	a,(OFST+0,sp)
4372  09d6 01            	rrwa	x,a
4373  09d7 1a03          	or	a,(OFST-1,sp)
4374  09d9 01            	rrwa	x,a
4375  09da 1f03          	ldw	(OFST-1,sp),x
4376                     ; 1053     return (uint16_t)tmpccr3;
4378  09dc 1e03          	ldw	x,(OFST-1,sp)
4381  09de 5b04          	addw	sp,#4
4382  09e0 81            	ret
4416                     ; 1061 uint16_t TIM2_GetCounter(void)
4416                     ; 1062 {
4417                     	switch	.text
4418  09e1               _TIM2_GetCounter:
4420  09e1 89            	pushw	x
4421       00000002      OFST:	set	2
4424                     ; 1063      uint16_t tmpcntr = 0;
4426  09e2 5f            	clrw	x
4427  09e3 1f01          	ldw	(OFST-1,sp),x
4428                     ; 1065     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4430  09e5 c6530c        	ld	a,21260
4431  09e8 5f            	clrw	x
4432  09e9 97            	ld	xl,a
4433  09ea 4f            	clr	a
4434  09eb 02            	rlwa	x,a
4435  09ec 1f01          	ldw	(OFST-1,sp),x
4436                     ; 1067     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4438  09ee c6530d        	ld	a,21261
4439  09f1 5f            	clrw	x
4440  09f2 97            	ld	xl,a
4441  09f3 01            	rrwa	x,a
4442  09f4 1a02          	or	a,(OFST+0,sp)
4443  09f6 01            	rrwa	x,a
4444  09f7 1a01          	or	a,(OFST-1,sp)
4445  09f9 01            	rrwa	x,a
4448  09fa 5b02          	addw	sp,#2
4449  09fc 81            	ret
4473                     ; 1076 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4473                     ; 1077 {
4474                     	switch	.text
4475  09fd               _TIM2_GetPrescaler:
4479                     ; 1079     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4481  09fd c6530e        	ld	a,21262
4484  0a00 81            	ret
4624                     ; 1096 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4624                     ; 1097 {
4625                     	switch	.text
4626  0a01               _TIM2_GetFlagStatus:
4628  0a01 89            	pushw	x
4629  0a02 89            	pushw	x
4630       00000002      OFST:	set	2
4633                     ; 1098     FlagStatus bitstatus = RESET;
4635  0a03 7b02          	ld	a,(OFST+0,sp)
4636  0a05 97            	ld	xl,a
4637                     ; 1099     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4639  0a06 7b01          	ld	a,(OFST-1,sp)
4640  0a08 97            	ld	xl,a
4643  0a09 7b02          	ld	a,(OFST+0,sp)
4644  0a0b 97            	ld	xl,a
4645                     ; 1102     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4647  0a0c 1e03          	ldw	x,(OFST+1,sp)
4648  0a0e a30001        	cpw	x,#1
4649  0a11 272a          	jreq	L035
4650  0a13 1e03          	ldw	x,(OFST+1,sp)
4651  0a15 a30002        	cpw	x,#2
4652  0a18 2723          	jreq	L035
4653  0a1a 1e03          	ldw	x,(OFST+1,sp)
4654  0a1c a30004        	cpw	x,#4
4655  0a1f 271c          	jreq	L035
4656  0a21 1e03          	ldw	x,(OFST+1,sp)
4657  0a23 a30008        	cpw	x,#8
4658  0a26 2715          	jreq	L035
4659  0a28 1e03          	ldw	x,(OFST+1,sp)
4660  0a2a a30200        	cpw	x,#512
4661  0a2d 270e          	jreq	L035
4662  0a2f 1e03          	ldw	x,(OFST+1,sp)
4663  0a31 a30400        	cpw	x,#1024
4664  0a34 2707          	jreq	L035
4665  0a36 1e03          	ldw	x,(OFST+1,sp)
4666  0a38 a30800        	cpw	x,#2048
4667  0a3b 2603          	jrne	L625
4668  0a3d               L035:
4669  0a3d 4f            	clr	a
4670  0a3e 2010          	jra	L235
4671  0a40               L625:
4672  0a40 ae044e        	ldw	x,#1102
4673  0a43 89            	pushw	x
4674  0a44 ae0000        	ldw	x,#0
4675  0a47 89            	pushw	x
4676  0a48 ae0000        	ldw	x,#L702
4677  0a4b cd0000        	call	_assert_failed
4679  0a4e 5b04          	addw	sp,#4
4680  0a50               L235:
4681                     ; 1104     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4683  0a50 c65304        	ld	a,21252
4684  0a53 1404          	and	a,(OFST+2,sp)
4685  0a55 6b01          	ld	(OFST-1,sp),a
4686                     ; 1105     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4688  0a57 7b03          	ld	a,(OFST+1,sp)
4689  0a59 6b02          	ld	(OFST+0,sp),a
4690                     ; 1107     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4692  0a5b c65305        	ld	a,21253
4693  0a5e 1402          	and	a,(OFST+0,sp)
4694  0a60 1a01          	or	a,(OFST-1,sp)
4695  0a62 2706          	jreq	L7371
4696                     ; 1109         bitstatus = SET;
4698  0a64 a601          	ld	a,#1
4699  0a66 6b02          	ld	(OFST+0,sp),a
4701  0a68 2002          	jra	L1471
4702  0a6a               L7371:
4703                     ; 1113         bitstatus = RESET;
4705  0a6a 0f02          	clr	(OFST+0,sp)
4706  0a6c               L1471:
4707                     ; 1115     return (FlagStatus)bitstatus;
4709  0a6c 7b02          	ld	a,(OFST+0,sp)
4712  0a6e 5b04          	addw	sp,#4
4713  0a70 81            	ret
4749                     ; 1132 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4749                     ; 1133 {
4750                     	switch	.text
4751  0a71               _TIM2_ClearFlag:
4753  0a71 89            	pushw	x
4754       00000000      OFST:	set	0
4757                     ; 1135     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4759  0a72 01            	rrwa	x,a
4760  0a73 a4f0          	and	a,#240
4761  0a75 01            	rrwa	x,a
4762  0a76 a4f1          	and	a,#241
4763  0a78 01            	rrwa	x,a
4764  0a79 a30000        	cpw	x,#0
4765  0a7c 2607          	jrne	L635
4766  0a7e 1e01          	ldw	x,(OFST+1,sp)
4767  0a80 2703          	jreq	L635
4768  0a82 4f            	clr	a
4769  0a83 2010          	jra	L045
4770  0a85               L635:
4771  0a85 ae046f        	ldw	x,#1135
4772  0a88 89            	pushw	x
4773  0a89 ae0000        	ldw	x,#0
4774  0a8c 89            	pushw	x
4775  0a8d ae0000        	ldw	x,#L702
4776  0a90 cd0000        	call	_assert_failed
4778  0a93 5b04          	addw	sp,#4
4779  0a95               L045:
4780                     ; 1138     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4782  0a95 7b02          	ld	a,(OFST+2,sp)
4783  0a97 43            	cpl	a
4784  0a98 c75304        	ld	21252,a
4785                     ; 1139     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4787  0a9b 35ff5305      	mov	21253,#255
4788                     ; 1140 }
4791  0a9f 85            	popw	x
4792  0aa0 81            	ret
4857                     ; 1154 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4857                     ; 1155 {
4858                     	switch	.text
4859  0aa1               _TIM2_GetITStatus:
4861  0aa1 88            	push	a
4862  0aa2 89            	pushw	x
4863       00000002      OFST:	set	2
4866                     ; 1156     ITStatus bitstatus = RESET;
4868  0aa3 7b02          	ld	a,(OFST+0,sp)
4869  0aa5 97            	ld	xl,a
4870                     ; 1157     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4872  0aa6 7b01          	ld	a,(OFST-1,sp)
4873  0aa8 97            	ld	xl,a
4876  0aa9 7b02          	ld	a,(OFST+0,sp)
4877  0aab 97            	ld	xl,a
4878                     ; 1160     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4880  0aac 7b03          	ld	a,(OFST+1,sp)
4881  0aae a101          	cp	a,#1
4882  0ab0 2712          	jreq	L645
4883  0ab2 7b03          	ld	a,(OFST+1,sp)
4884  0ab4 a102          	cp	a,#2
4885  0ab6 270c          	jreq	L645
4886  0ab8 7b03          	ld	a,(OFST+1,sp)
4887  0aba a104          	cp	a,#4
4888  0abc 2706          	jreq	L645
4889  0abe 7b03          	ld	a,(OFST+1,sp)
4890  0ac0 a108          	cp	a,#8
4891  0ac2 2603          	jrne	L445
4892  0ac4               L645:
4893  0ac4 4f            	clr	a
4894  0ac5 2010          	jra	L055
4895  0ac7               L445:
4896  0ac7 ae0488        	ldw	x,#1160
4897  0aca 89            	pushw	x
4898  0acb ae0000        	ldw	x,#0
4899  0ace 89            	pushw	x
4900  0acf ae0000        	ldw	x,#L702
4901  0ad2 cd0000        	call	_assert_failed
4903  0ad5 5b04          	addw	sp,#4
4904  0ad7               L055:
4905                     ; 1162     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4907  0ad7 c65304        	ld	a,21252
4908  0ada 1403          	and	a,(OFST+1,sp)
4909  0adc 6b01          	ld	(OFST-1,sp),a
4910                     ; 1164     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4912  0ade c65303        	ld	a,21251
4913  0ae1 1403          	and	a,(OFST+1,sp)
4914  0ae3 6b02          	ld	(OFST+0,sp),a
4915                     ; 1166     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4917  0ae5 0d01          	tnz	(OFST-1,sp)
4918  0ae7 270a          	jreq	L3102
4920  0ae9 0d02          	tnz	(OFST+0,sp)
4921  0aeb 2706          	jreq	L3102
4922                     ; 1168         bitstatus = SET;
4924  0aed a601          	ld	a,#1
4925  0aef 6b02          	ld	(OFST+0,sp),a
4927  0af1 2002          	jra	L5102
4928  0af3               L3102:
4929                     ; 1172         bitstatus = RESET;
4931  0af3 0f02          	clr	(OFST+0,sp)
4932  0af5               L5102:
4933                     ; 1174     return (ITStatus)(bitstatus);
4935  0af5 7b02          	ld	a,(OFST+0,sp)
4938  0af7 5b03          	addw	sp,#3
4939  0af9 81            	ret
4976                     ; 1188 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4976                     ; 1189 {
4977                     	switch	.text
4978  0afa               _TIM2_ClearITPendingBit:
4980  0afa 88            	push	a
4981       00000000      OFST:	set	0
4984                     ; 1191     assert_param(IS_TIM2_IT_OK(TIM2_IT));
4986  0afb 4d            	tnz	a
4987  0afc 2707          	jreq	L455
4988  0afe a110          	cp	a,#16
4989  0b00 2403          	jruge	L455
4990  0b02 4f            	clr	a
4991  0b03 2010          	jra	L655
4992  0b05               L455:
4993  0b05 ae04a7        	ldw	x,#1191
4994  0b08 89            	pushw	x
4995  0b09 ae0000        	ldw	x,#0
4996  0b0c 89            	pushw	x
4997  0b0d ae0000        	ldw	x,#L702
4998  0b10 cd0000        	call	_assert_failed
5000  0b13 5b04          	addw	sp,#4
5001  0b15               L655:
5002                     ; 1194     TIM2->SR1 = (uint8_t)(~TIM2_IT);
5004  0b15 7b01          	ld	a,(OFST+1,sp)
5005  0b17 43            	cpl	a
5006  0b18 c75304        	ld	21252,a
5007                     ; 1195 }
5010  0b1b 84            	pop	a
5011  0b1c 81            	ret
5063                     ; 1214 static void TI1_Config(uint8_t TIM2_ICPolarity,
5063                     ; 1215                        uint8_t TIM2_ICSelection,
5063                     ; 1216                        uint8_t TIM2_ICFilter)
5063                     ; 1217 {
5064                     	switch	.text
5065  0b1d               L3_TI1_Config:
5067  0b1d 89            	pushw	x
5068  0b1e 88            	push	a
5069       00000001      OFST:	set	1
5072                     ; 1219     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
5074  0b1f 7211530a      	bres	21258,#0
5075                     ; 1222     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
5075                     ; 1223                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5077  0b23 7b06          	ld	a,(OFST+5,sp)
5078  0b25 97            	ld	xl,a
5079  0b26 a610          	ld	a,#16
5080  0b28 42            	mul	x,a
5081  0b29 9f            	ld	a,xl
5082  0b2a 1a03          	or	a,(OFST+2,sp)
5083  0b2c 6b01          	ld	(OFST+0,sp),a
5084  0b2e c65307        	ld	a,21255
5085  0b31 a40c          	and	a,#12
5086  0b33 1a01          	or	a,(OFST+0,sp)
5087  0b35 c75307        	ld	21255,a
5088                     ; 1226     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5090  0b38 0d02          	tnz	(OFST+1,sp)
5091  0b3a 2706          	jreq	L3602
5092                     ; 1228         TIM2->CCER1 |= TIM2_CCER1_CC1P;
5094  0b3c 7212530a      	bset	21258,#1
5096  0b40 2004          	jra	L5602
5097  0b42               L3602:
5098                     ; 1232         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
5100  0b42 7213530a      	bres	21258,#1
5101  0b46               L5602:
5102                     ; 1235     TIM2->CCER1 |= TIM2_CCER1_CC1E;
5104  0b46 7210530a      	bset	21258,#0
5105                     ; 1236 }
5108  0b4a 5b03          	addw	sp,#3
5109  0b4c 81            	ret
5161                     ; 1255 static void TI2_Config(uint8_t TIM2_ICPolarity,
5161                     ; 1256                        uint8_t TIM2_ICSelection,
5161                     ; 1257                        uint8_t TIM2_ICFilter)
5161                     ; 1258 {
5162                     	switch	.text
5163  0b4d               L5_TI2_Config:
5165  0b4d 89            	pushw	x
5166  0b4e 88            	push	a
5167       00000001      OFST:	set	1
5170                     ; 1260     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
5172  0b4f 7219530a      	bres	21258,#4
5173                     ; 1263     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
5173                     ; 1264                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5175  0b53 7b06          	ld	a,(OFST+5,sp)
5176  0b55 97            	ld	xl,a
5177  0b56 a610          	ld	a,#16
5178  0b58 42            	mul	x,a
5179  0b59 9f            	ld	a,xl
5180  0b5a 1a03          	or	a,(OFST+2,sp)
5181  0b5c 6b01          	ld	(OFST+0,sp),a
5182  0b5e c65308        	ld	a,21256
5183  0b61 a40c          	and	a,#12
5184  0b63 1a01          	or	a,(OFST+0,sp)
5185  0b65 c75308        	ld	21256,a
5186                     ; 1268     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5188  0b68 0d02          	tnz	(OFST+1,sp)
5189  0b6a 2706          	jreq	L5112
5190                     ; 1270         TIM2->CCER1 |= TIM2_CCER1_CC2P;
5192  0b6c 721a530a      	bset	21258,#5
5194  0b70 2004          	jra	L7112
5195  0b72               L5112:
5196                     ; 1274         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
5198  0b72 721b530a      	bres	21258,#5
5199  0b76               L7112:
5200                     ; 1278     TIM2->CCER1 |= TIM2_CCER1_CC2E;
5202  0b76 7218530a      	bset	21258,#4
5203                     ; 1280 }
5206  0b7a 5b03          	addw	sp,#3
5207  0b7c 81            	ret
5259                     ; 1296 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
5259                     ; 1297                        uint8_t TIM2_ICFilter)
5259                     ; 1298 {
5260                     	switch	.text
5261  0b7d               L7_TI3_Config:
5263  0b7d 89            	pushw	x
5264  0b7e 88            	push	a
5265       00000001      OFST:	set	1
5268                     ; 1300     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
5270  0b7f 7211530b      	bres	21259,#0
5271                     ; 1303     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
5271                     ; 1304                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5273  0b83 7b06          	ld	a,(OFST+5,sp)
5274  0b85 97            	ld	xl,a
5275  0b86 a610          	ld	a,#16
5276  0b88 42            	mul	x,a
5277  0b89 9f            	ld	a,xl
5278  0b8a 1a03          	or	a,(OFST+2,sp)
5279  0b8c 6b01          	ld	(OFST+0,sp),a
5280  0b8e c65309        	ld	a,21257
5281  0b91 a40c          	and	a,#12
5282  0b93 1a01          	or	a,(OFST+0,sp)
5283  0b95 c75309        	ld	21257,a
5284                     ; 1308     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5286  0b98 0d02          	tnz	(OFST+1,sp)
5287  0b9a 2706          	jreq	L7412
5288                     ; 1310         TIM2->CCER2 |= TIM2_CCER2_CC3P;
5290  0b9c 7212530b      	bset	21259,#1
5292  0ba0 2004          	jra	L1512
5293  0ba2               L7412:
5294                     ; 1314         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
5296  0ba2 7213530b      	bres	21259,#1
5297  0ba6               L1512:
5298                     ; 1317     TIM2->CCER2 |= TIM2_CCER2_CC3E;
5300  0ba6 7210530b      	bset	21259,#0
5301                     ; 1318 }
5304  0baa 5b03          	addw	sp,#3
5305  0bac 81            	ret
5318                     	xdef	_TIM2_ClearITPendingBit
5319                     	xdef	_TIM2_GetITStatus
5320                     	xdef	_TIM2_ClearFlag
5321                     	xdef	_TIM2_GetFlagStatus
5322                     	xdef	_TIM2_GetPrescaler
5323                     	xdef	_TIM2_GetCounter
5324                     	xdef	_TIM2_GetCapture3
5325                     	xdef	_TIM2_GetCapture2
5326                     	xdef	_TIM2_GetCapture1
5327                     	xdef	_TIM2_SetIC3Prescaler
5328                     	xdef	_TIM2_SetIC2Prescaler
5329                     	xdef	_TIM2_SetIC1Prescaler
5330                     	xdef	_TIM2_SetCompare3
5331                     	xdef	_TIM2_SetCompare2
5332                     	xdef	_TIM2_SetCompare1
5333                     	xdef	_TIM2_SetAutoreload
5334                     	xdef	_TIM2_SetCounter
5335                     	xdef	_TIM2_SelectOCxM
5336                     	xdef	_TIM2_CCxCmd
5337                     	xdef	_TIM2_OC3PolarityConfig
5338                     	xdef	_TIM2_OC2PolarityConfig
5339                     	xdef	_TIM2_OC1PolarityConfig
5340                     	xdef	_TIM2_GenerateEvent
5341                     	xdef	_TIM2_OC3PreloadConfig
5342                     	xdef	_TIM2_OC2PreloadConfig
5343                     	xdef	_TIM2_OC1PreloadConfig
5344                     	xdef	_TIM2_ARRPreloadConfig
5345                     	xdef	_TIM2_ForcedOC3Config
5346                     	xdef	_TIM2_ForcedOC2Config
5347                     	xdef	_TIM2_ForcedOC1Config
5348                     	xdef	_TIM2_PrescalerConfig
5349                     	xdef	_TIM2_SelectOnePulseMode
5350                     	xdef	_TIM2_UpdateRequestConfig
5351                     	xdef	_TIM2_UpdateDisableConfig
5352                     	xdef	_TIM2_ITConfig
5353                     	xdef	_TIM2_Cmd
5354                     	xdef	_TIM2_PWMIConfig
5355                     	xdef	_TIM2_ICInit
5356                     	xdef	_TIM2_OC3Init
5357                     	xdef	_TIM2_OC2Init
5358                     	xdef	_TIM2_OC1Init
5359                     	xdef	_TIM2_TimeBaseInit
5360                     	xdef	_TIM2_DeInit
5361                     	xref	_assert_failed
5362                     .const:	section	.text
5363  0000               L702:
5364  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
5365  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
5366  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
5367  0036 5f74696d322e  	dc.b	"_tim2.c",0
5387                     	end
