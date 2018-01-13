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

typedef struct 
{ 
  GPIO_TypeDef* displayPort; //port
  GPIO_Pin_TypeDef StbPin; // pin STB
  GPIO_Pin_TypeDef ClkPin; // pin CLK
  GPIO_Pin_TypeDef DataPin; // pin DIO
  uint8_t intensity; // current Led brightness
  uint8_t displays; // number led
  bool active; // enable
}TM1638_Struct;

//void TM1638_Init(void);
void TM1638_Init(GPIO_TypeDef* displayPort,
                    GPIO_Pin_TypeDef StbPin,
                    GPIO_Pin_TypeDef ClkPin,
                    GPIO_Pin_TypeDef DataPin);
void sendChar(uint8_t pos, uint8_t data, bool dot);
void configDisplay(bool active, uint8_t intensity);
void setDisplayDigit(uint8_t digit, uint8_t pos, bool dot, const uint8_t numberFont[]);
void clearDisplayDigit(uint8_t pos, bool dot);
void setDisplay(const uint8_t values[], uint8_t size);
void clearDisplay(void);
void displayNumber(uint8_t pos, uint8_t number, bool dot);
uint8_t getKey(void);
void setLed(uint8_t color, uint8_t pos);

#endif