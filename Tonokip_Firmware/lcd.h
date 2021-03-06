#ifndef __LCDH
#define __LCDH
#include "configuration.h"

//character in width
#define LCD_WIDTH 20
#define LCD_HEIGHT 4
void lcd_status();
void lcd_init();
void lcd_status(const char* message);

#define LCD_MESSAGE(x) lcd_status(x);
#define LCD_STATUS lcd_status()

#else
#define LCD_STATUS
#define LCD_MESSAGE(x)
#endif
