/**
  ******************************************************************************
  * @file    tm1638.h
  * @author  nhantt
  * @version V1.1.0
  * @date    30-September-2014
  * @brief   This file contains all functions prototype and macros for the CLK peripheral.
  * @Date:   2016-03-29 14:06:05
  * @Last Modified by:   nhantt
  * @Last Modified time: 2017-03-21 23:07:13
   ******************************************************************************
*/

#ifndef __TM1638_H
#define __TM1638_H

#include "stm8s.h"
#include "stm8s_gpio.h"

// #define TMPORT GPIOC
// #define TM_STB GPIO_PIN_4
// #define TM_CLK GPIO_PIN_5
// #define TM_DIO GPIO_PIN_6

// #define Set(x) GPIO_WriteHigh(GPIOC, (x))
// #define Reset(x) GPIO_WriteLow(GPIOC, (x))
// #define Get(x) GPIO_ReadInputPin(GPIOC, (x)) == 1

// const uint8_t NUMBER_FONT[] = {
//   0x3F, //0
//   0x06, //1
//   0x5B, //2
//   0x4F, //3
//   0x66, //4
//   0x6D, //5
//   0x7D, //6
//   0x07, //7
//   0x7F, //8
//   0x6F, //9
//   0x77, //A
//   0x7C, //B
//   0x39, //C
//   0x5E, //D
//   0x79, //E
//   0x71 //F
// };

typedef struct 
{ 
  GPIO_TypeDef* displayPort; //port
  GPIO_Pin_TypeDef StbPin; // pin STB
  GPIO_Pin_TypeDef ClkPin; // pin CLK
  GPIO_Pin_TypeDef DataPin; // pin DIO
  uint8_t intensity; // current Led brightness
  bool active; // enable
}TM1638_Struct;

void TM1638_Init(GPIO_TypeDef* displayPort,
                    GPIO_Pin_TypeDef StbPin,
                    GPIO_Pin_TypeDef ClkPin,
                    GPIO_Pin_TypeDef DataPin);
// uint8_t Read_Byte(void);
// void Write_Cmd(uint8_t cmd);
// void Write_Byte(uint8_t byte);
// uint8_t Read_Key(void);
// void Write_Data(uint8_t addr, uint8_t data);
// void TM1638_SendData(uint8_t i, char *str);
// void TM1638_SendIntData(uint8_t i, int num);
void sendChar(uint8_t pos, uint8_t data, bool dot);
void configDisplay(bool active, uint8_t intensity);
void setDisplayDigit(uint8_t digit, uint8_t pos, bool dot, const uint8_t numberFont[]);
void clearDisplayDigit(uint8_t pos, bool dot);
void setDisplay(const uint8_t values[], uint8_t size);
void clearDisplay(void);
void TM1638_SendData(uint8_t i, char *str);
void TM1638_SendIntData(uint8_t i,int num);
#endif