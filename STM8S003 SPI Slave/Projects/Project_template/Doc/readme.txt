��������
1.��ʱ��8MHz.
2016.9.25
1.���Timer1 ch3��ΪPWM���������LED.
����v2.0.
2016.10.11
1.��LampAdj.c�ļ��е�GPIO_Init( SCR_CONTROL_PORT , SCR_CONTROL_PIN , GPIO_MODE_OUT_PP_LOW_FAST );��ΪGPIO_Init( SCR_CONTROL_PORT , SCR_CONTROL_PIN , GPIO_MODE_OUT_OD_LOW_FAST );
����v2.1�汾
2016.10.15
1.�޸���SpiIrqHandle( )��������if( RegAddrFlag == 0 ){...}else���RegAddrFlag = 0x01;��Ϊ��RegAddrFlag = 0x00;��������SPIд�Ĵ���ʧ�ܺ�SPIд�������ɻָ������⡣
����v2.2�汾
2016.10.16
1.�޸���SpiIrqHandle( )����,��if( Data & 0x80 == 0x80 )��Ϊ��:
  uint8_t temp;  
  temp = Data & 0x80; 
  
  if( temp == 0x80  )�޸�������'=='���ȼ�����'&'if( Data & 0x80 == 0x80 )ʼ��Ϊ�������;
2.�޸���SpiIrqHandle( )��������if( RegAddrFlag == 0 ){...}else���RegAddrFlag = 0x00;��Ϊ��RegAddrFlag = 0x01;
3.�޸���SpiIrqHandle( )����,��������´���:
    else if( RegAddrFlag == 0x01 )
    {
        RegAddrFlag = 0x02;
    }
  ʵ����SPI��������
����v2.3�汾
2016.10.20
1.�޸���LedPwm.c�ļ���LedPwmInit( )����;
2.�޸���LedPwm.c�ļ���LedPwmSetDuty( )����;
3.�������SPI�����жϺͶ�ʱ��2�ĸ����ж����ȼ��Ĵ��롣