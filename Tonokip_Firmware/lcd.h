#ifndef __LCDH
#define __LCDH
#include "configuration.h"

//character in width
#define LCD_WIDTH 20
#define LCD_HEIGHT 2
void lcd_status();
void lcd_init();
void lcd_status(const char* message);



#endif
