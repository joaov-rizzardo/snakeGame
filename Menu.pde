class Menu {
  
  void screen0(){
    PImage img = loadImage("data/screen0.png");
    
    image(img, 0,0);
  }
  
  void screen1(){
    PImage img = loadImage("data/screen1.jpg");
    
    image(img, 0,0);
  }
  
  void screen2(){
    PImage img = loadImage("data/screen2.jpg");
    
    image(img, 0,0);
  }
  
  void screen4(){
    PImage img = loadImage("data/screen4.jpg");
    
    image(img, 0,0);
  }
  
   void screen5(){
    PImage img = loadImage("data/screen5.jpg");
    
    image(img, 0,0);
  }
  
  void screen6(){
    PImage img = loadImage("data/screen6.jpg");
    
    image(img, 0,0);
  }
  
  int changeDifficulty(int difficulty){
    int rate = 0;
    
    switch(difficulty){
      case 1:
        rate = 10;
      break;
      
      case 2:
        rate = 15;
      break;
      
      case 3:
        rate = 25;
      break;
    }
    
    return rate;
  }
  
}
