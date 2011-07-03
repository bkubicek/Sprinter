#ifndef __MENU_BASE
#define __MENU_BASE
#include "LiquidCrystal.h"

class MenuPage
{
public:
  MenuPage();
  void lineUp();
  void lineDown();
  virtual void activate()=0;
	virtual void update()=0;

  short int line;
  short int items;
  short int xshift;
};

#define MAXPAGES 10


class MenuBase
{
public:
  MenuBase(); 
  ~MenuBase();


  void addMenuPage(MenuPage *_newpage);


  inline void pageUp() 
  { 
    //if(pages[curPage!=0])
    // pages[curPage]->deactivate();
    curPage++; 
    if(curPage>=maxPage)
    {
      curPage=0; 
    }
    if(pages[curPage]!=0)
      pages[curPage]->activate();

  };

  inline void pageDown() 
  { 
    //if(pages[curPage!=0])
    // pages[curPage]->deactivate();
    curPage--; 
    if(curPage<0)
    {
      curPage=maxPage-1; 
    }
    if(pages[curPage]!=0)
      pages[curPage]->activate();
  };

  inline void lineUp() 
  { 
    if(pages[curPage]!=0)
      pages[curPage]->lineUp();
  };

  inline void lineDown() 
  { 
    if(pages[curPage]!=0)
      pages[curPage]->lineDown();
  };
	
	  inline void update() 
  {
      pages[curPage]->update();
  };

public:
  short int curLine;
  short int curPage;
  short int maxPage;
  MenuPage *pages[MAXPAGES];
};


#endif



