#include "lcd.h"
#include "pins.h"

#ifdef FANCY_LCD
 #include <LiquidCrystal.h>
 LiquidCrystal lcd(LCD_PINS_RS, LCD_PINS_ENABLE, LCD_PINS_D4, LCD_PINS_D5,LCD_PINS_D6,LCD_PINS_D7);  //RS,Enable,D4,D5,D6,D7 
 
 unsigned long previous_millis_lcd=0;
#endif



void lcd_status(const char* message)
{
	lcd.setCursor(0,0);
	lcd.print(message);
}

void lcd_status()
{
#ifdef FANCY_LCD
	if((millis() - previous_millis_lcd) < LCD_UPDATE_INTERVAL)
    return;
  previous_millis_lcd = millis();
	char line1[25];
	static char blink=0;
	sprintf(line1,"%c%3i/%3i\1%c%c%c%c%c%c", ((blink++)%2==0)? (char)2:' ',
		int(analog2temp(current_raw)),
		int(analog2temp(target_raw)),
		(!digitalRead(X_MIN_PIN))? 'x':' ',
		(!digitalRead(X_MAX_PIN))? 'X':' ',
		(!digitalRead(Y_MIN_PIN))? 'y':' ',
		(!digitalRead(Y_MAX_PIN))? 'Y':' ',
		(!digitalRead(Z_MIN_PIN))? 'z':' ',
		(!digitalRead(Z_MAX_PIN))? 'Z':' ');
	
	lcd.setCursor(0,0); 
	lcd.print(line1);
#if 1
	lcd.setCursor(0, 1); 
	//copy last printed gcode line from the buffer onto the lcd
	char cline2[LCD_WIDTH];
	strncpy(cline2,cmdbuffer[(bufindr-1)%BUFSIZE],LCD_WIDTH-1); //the last processed line
	cline2[LCD_WIDTH-1]=0;
	bool print=(strlen(cline2)>0);
	for(int i=0;i<LCD_WIDTH-1;i++)  //fill up with spaces to overwrite old content
	{
 		if(cline2[i]==0)
			cline2[i]=' ';
	}
	cline2[LCD_WIDTH-1]=0;  //null termination
	if(1&&print)
	{
		lcd.print(cline2);
	}
#endif  

#endif
}

void lcd_init()
{
#ifdef FANCY_LCD
	byte Degree[8] =
	{
		B01100,
		B10010,
		B10010,
		B01100,
		B00000,
		B00000,
		B00000,
		B00000
	};
	byte Thermometer[8] =
	{
		B00100,
		B01010,
		B01010,
		B01010,
		B01010,
		B10001,
		B10001,
		B01110
	};

	lcd.begin(LCD_WIDTH, LCD_HEIGHT);
	lcd.createChar(1,Degree);
	lcd.createChar(2,Thermometer);
	lcd.clear();
	lcd.print("booting!");
	lcd.setCursor(0, 1);
	lcd.print("lets sprint!");
#endif
}

