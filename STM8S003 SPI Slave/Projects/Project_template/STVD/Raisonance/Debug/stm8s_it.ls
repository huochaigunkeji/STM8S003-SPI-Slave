   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  33                     ; 47 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  33                     ; 48 {
  34                     	switch	.text
  35  0000               f_NonHandledInterrupt:
  39                     ; 52 }
  42  0000 80            	iret
  64                     ; 60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  64                     ; 61 {
  65                     	switch	.text
  66  0001               f_TRAP_IRQHandler:
  70                     ; 65 }
  73  0001 80            	iret
  95                     ; 72 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  95                     ; 73 
  95                     ; 74 {
  96                     	switch	.text
  97  0002               f_TLI_IRQHandler:
 101                     ; 78 }
 104  0002 80            	iret
 126                     ; 85 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 126                     ; 86 {
 127                     	switch	.text
 128  0003               f_AWU_IRQHandler:
 132                     ; 90 }
 135  0003 80            	iret
 157                     ; 97 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 157                     ; 98 {
 158                     	switch	.text
 159  0004               f_CLK_IRQHandler:
 163                     ; 102 }
 166  0004 80            	iret
 189                     ; 109 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 189                     ; 110 {
 190                     	switch	.text
 191  0005               f_EXTI_PORTA_IRQHandler:
 195                     ; 114 }
 198  0005 80            	iret
 221                     ; 121 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 221                     ; 122 {
 222                     	switch	.text
 223  0006               f_EXTI_PORTB_IRQHandler:
 227                     ; 126 }
 230  0006 80            	iret
 253                     ; 133 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 253                     ; 134 {
 254                     	switch	.text
 255  0007               f_EXTI_PORTC_IRQHandler:
 259                     ; 138 }
 262  0007 80            	iret
 285                     ; 145 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 285                     ; 146 {
 286                     	switch	.text
 287  0008               f_EXTI_PORTD_IRQHandler:
 291                     ; 150 }
 294  0008 80            	iret
 317                     ; 157 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 317                     ; 158 {
 318                     	switch	.text
 319  0009               f_EXTI_PORTE_IRQHandler:
 323                     ; 162 }
 326  0009 80            	iret
 348                     ; 209 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 348                     ; 210 {
 349                     	switch	.text
 350  000a               f_SPI_IRQHandler:
 354                     ; 214 }
 357  000a 80            	iret
 380                     ; 221 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 380                     ; 222 {
 381                     	switch	.text
 382  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 386                     ; 226 }
 389  000b 80            	iret
 412                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 412                     ; 234 {
 413                     	switch	.text
 414  000c               f_TIM1_CAP_COM_IRQHandler:
 418                     ; 238 }
 421  000c 80            	iret
 444                     ; 271  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 444                     ; 272  {
 445                     	switch	.text
 446  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 450                     ; 276  }
 453  000d 80            	iret
 476                     ; 283  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 476                     ; 284  {
 477                     	switch	.text
 478  000e               f_TIM2_CAP_COM_IRQHandler:
 482                     ; 288  }
 485  000e 80            	iret
 508                     ; 325  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 508                     ; 326  {
 509                     	switch	.text
 510  000f               f_UART1_TX_IRQHandler:
 514                     ; 330  }
 517  000f 80            	iret
 540                     ; 337  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 540                     ; 338  {
 541                     	switch	.text
 542  0010               f_UART1_RX_IRQHandler:
 546                     ; 342  }
 549  0010 80            	iret
 571                     ; 350 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 571                     ; 351 {
 572                     	switch	.text
 573  0011               f_I2C_IRQHandler:
 577                     ; 355 }
 580  0011 80            	iret
 602                     ; 429  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 602                     ; 430  {
 603                     	switch	.text
 604  0012               f_ADC1_IRQHandler:
 608                     ; 434  }
 611  0012 80            	iret
 634                     ; 455  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 634                     ; 456  {
 635                     	switch	.text
 636  0013               f_TIM4_UPD_OVF_IRQHandler:
 640                     ; 461  }
 643  0013 80            	iret
 666                     ; 469 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 666                     ; 470 {
 667                     	switch	.text
 668  0014               f_EEPROM_EEC_IRQHandler:
 672                     ; 474 }
 675  0014 80            	iret
 687                     	xdef	f_EEPROM_EEC_IRQHandler
 688                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 689                     	xdef	f_ADC1_IRQHandler
 690                     	xdef	f_I2C_IRQHandler
 691                     	xdef	f_UART1_RX_IRQHandler
 692                     	xdef	f_UART1_TX_IRQHandler
 693                     	xdef	f_TIM2_CAP_COM_IRQHandler
 694                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 695                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 696                     	xdef	f_TIM1_CAP_COM_IRQHandler
 697                     	xdef	f_SPI_IRQHandler
 698                     	xdef	f_EXTI_PORTE_IRQHandler
 699                     	xdef	f_EXTI_PORTD_IRQHandler
 700                     	xdef	f_EXTI_PORTC_IRQHandler
 701                     	xdef	f_EXTI_PORTB_IRQHandler
 702                     	xdef	f_EXTI_PORTA_IRQHandler
 703                     	xdef	f_CLK_IRQHandler
 704                     	xdef	f_AWU_IRQHandler
 705                     	xdef	f_TLI_IRQHandler
 706                     	xdef	f_TRAP_IRQHandler
 707                     	xdef	f_NonHandledInterrupt
 726                     	end
