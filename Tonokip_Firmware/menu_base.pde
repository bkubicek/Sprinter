#include "menu_base.h"
#include <LiquidCrystal.h>
extern LiquidCrystal lcd;
extern "C" {
  void __cxa_pure_virtual()
  {
    // put error handling here
  }
}

MenuBase::MenuBase()
{
//lcd=_lcd;
  curPage=0;
  curLine=0;
  maxPage=0; 
  for(int i=0;i<MAXPAGES;i++)
    pages[i]=0;
}
MenuBase::~MenuBase()
{
  
}
 
void MenuBase::addMenuPage(MenuPage *_newpage)
{
  if(maxPage<MAXPAGES-1)
  {
    
    pages[maxPage]=_newpage;
    if(maxPage==0)
     pages[0]->activate();
    maxPage++;
  }
}


MenuPage::MenuPage()
{
  line=0;
}

void MenuPage::lineUp()
{
  if(items>0)
  {
    lcd.setCursor((line/3)*xshift,1+line%3);
    lcd.print(" ");
  }
  if(line==0)
    line=items;
   else
    line--;
  if(items>0)
  {
    lcd.setCursor((line/3)*xshift,1+line%3);
    lcd.print("~");
  }
  
}

void MenuPage::lineDown()
{
  //empty indicator
  if(items>0)
  {
    lcd.setCursor((line/3)*xshift,1+line%3);
    lcd.print(" ");
  }
  if(line==items)
    line=0;
   else
    line++;
  if(items>0)
  {
    lcd.setCursor((line/3)*xshift,1+line%3);
    lcd.print("~");
  }
  
}

