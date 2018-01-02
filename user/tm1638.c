#include "tm1638.h"
TM1638_Struct tm1638;


uint16_t const tm_dat[2][14]={{'0','1','2','3','4','5',     //the char and its segment code 
            '6','7','8','9','.','-','_',' '},
            {0x3F,0x06,0x5B,0x4F,0x66,0x6D,
            0x7D,0x07,0x7F,0x6F,0x80,0x40,
            0x08,0x00}};

#define Set(pin) GPIO_WriteHigh(tm1638.displayPort, (pin))
#define Reset(pin) GPIO_WriteLow(tm1638.displayPort, (pin))
#define Get(pin) GPIO_ReadInputPin(GPIOC, (pin))

static void writeByte(uint8_t byte);
static uint8_t readByte(void);
static void writeCmd(uint8_t cmd);
static void writeData(uint8_t addr, uint8_t data);

void TM1638_Init(GPIO_TypeDef* displayPort, GPIO_Pin_TypeDef StbPin, GPIO_Pin_TypeDef ClkPin, GPIO_Pin_TypeDef DataPin)
{
	uint8_t i;
	tm1638.displayPort = displayPort;
	tm1638.StbPin = StbPin;
	tm1638.ClkPin = ClkPin;
	tm1638.DataPin = DataPin;
	tm1638.intensity = 4;
	tm1638.active = TRUE;
	GPIO_Init(tm1638.displayPort, tm1638.StbPin | tm1638.ClkPin | tm1638.DataPin, GPIO_MODE_OUT_OD_HIZ_FAST);
	Set(tm1638.StbPin);
	Set(tm1638.ClkPin);
	writeCmd(0x40); // send cmd write data
	writeCmd(0x80|tm1638.active ? 8 : 0| tm1638.intensity); //display and brightness = 4
	Reset(tm1638.StbPin);
	writeByte(0xC0);
	for(i = 0; i < 16; i++)
		writeByte(0x00);
	Set(tm1638.StbPin);
}

static void writeByte(uint8_t byte)
{
	uint8_t i = 0;
	for(i = 0; i < 8; i++)
	{
		Reset(tm1638.ClkPin); //input Data at rising edge of the clock
		if(byte&0x01) Set(tm1638.DataPin);
		else Reset(tm1638.DataPin);
		byte>>=1;
		Set(tm1638.ClkPin);
	}
}

static uint8_t readByte(void)
{
	uint8_t i = 0;
	uint8_t temp = 0x00;
	GPIO_Init(tm1638.displayPort, tm1638.DataPin, GPIO_MODE_IN_PU_NO_IT);
	Set(tm1638.DataPin);
	for(i = 0; i < 8; i++)
	{
		Set(tm1638.ClkPin); //Output Data at falling edge of the clock
		temp>>=1;
		if(Get(tm1638.DataPin)) temp |= 0x80;
		Reset(tm1638.ClkPin);
	}
	return temp;
}

static void writeCmd(uint8_t cmd)
{
	Set(tm1638.StbPin); 
	Reset(tm1638.StbPin); // falling edge STB is an instruction
	writeByte(cmd); // Send command
	//Set(tm1638.StbPin); 
}

static void writeData(uint8_t addr, uint8_t data)
{
	writeCmd(0x44); //Setting Data (B7B6: 01): Normal Mode, Fixed addr, Write data
	writeCmd(0xC0|addr); //Setting Address (B7B6: 11): Display addr: 00H-0FH
	writeByte(data); // Send Data
}


void sendChar(uint8_t pos, uint8_t data, bool dot)
{
	writeData(pos << 1, data | dot ? 0x80: 0x00);
}

void configDisplay(bool active, uint8_t intensity)
{
	tm1638.intensity = intensity;
	tm1638.active = active;
	writeCmd(0x80|tm1638.active ? 8 : 0 | tm1638.intensity); //Display control (B7B6: 10): B3: 1: enable, 0: disable; B2B1B0: 0-7: brighness
	Reset(tm1638.StbPin);
  	Reset(tm1638.ClkPin);
  	Set(tm1638.ClkPin);
	Set(tm1638.StbPin);
}

void setDisplayDigit(uint8_t digit, uint8_t pos, bool dot, const uint8_t numberFont[])
{
	sendChar(pos, numberFont[digit & 0xF], dot);
}

void clearDisplayDigit(uint8_t pos, bool dot)
{
  sendChar(pos, 0, dot);
}

void setDisplay(const uint8_t values[], uint8_t size)
{
	uint8_t i = 0;
  	for(i = 0; i<size; i++) 
    	sendChar(i, values[i], 0);
}

void clearDisplay(void)
{
	uint8_t i = 0;
  	for(i = 0; i < 8; i++)
    	writeData(i << 1, 0);
}

// uint8_t Read_key(void)
// {
// 	uint8_t i = 0;
// 	uint8_t key1 = 0x00;
// 	uint16_t key2 = 0x00;
// 	Write_Cmd(0x42);
// 	Set(TM_DIO);
// 	for(i = 0; i < 4; i++)
// 	{
// 		key1 = Read_Byte();
// 		key2 |= (key1<<i);
// 	}
// 	key2>=1;
// 	for(i = 0; i < 8; i++)
// 	{
// 		if(0x00<<i == key2) return i+1;
// 	}
// 	return 0;
// }


void TM1638_SendData(uint8_t i, char *str)
{
	uint8_t j, k;
	unsigned char chr;
	for(; i<8; i++)
	{
		k = 0;
		for(j = 0; j < 14; j++)
		{
			if(*str == tm_dat[0][j])
			{
				chr = tm_dat[1][j];
				k = 1;
				break;
			}
		}
		if(k == 0)
		{
			chr = 0x00;
		}
		if(*(str+1)=='.'){
            chr|=0x80;
            writeData(i*2,chr);
            str++;
        }else{
            writeData(i*2,chr);
        }
        str++;
        if(*str=='\0')break;
	}
}

void TM1638_SendIntData(uint8_t i, int num)
{
    char a;
    a = num + '0';
    TM1638_SendData(i,&a);
}
