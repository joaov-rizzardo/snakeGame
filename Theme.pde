class Theme {
  
  color background;
  color poison;
  color poisonStroke;
  color snake;
  color snakeStroke;
  color food;
  color foodStroke;
  
  color poisonText;
  
  // BÁSICO
  void theme01 () {
    background = color(255, 255, 255);
    poison = color(255,0,0);
    poisonStroke = color(255, 255, 255, 0);
    snake = color(128, 128, 128);
    snakeStroke = color(255, 255, 255, 0);
    food = color(128, 128, 128);
    foodStroke = color(255, 255, 255, 0);
    
    poisonText = color(87, 95, 104);
  }
  
  // ROXO
  void theme02 () {
    background = color(55, 27, 88);
    poison = color(255, 0 ,0);
    poisonStroke = color(128, 128, 128);
    snake = color(76, 53, 117);
    snakeStroke = color(128, 128, 128);
    food = color(255);  
    foodStroke = color(128, 128, 128);
    
    poisonText = color(87, 95, 104);
  }
  
  // CINZA
  void theme03 () {
    background = color(128, 128, 128);
    poison = color(26, 26, 26);
    poisonStroke = color(87, 95, 104, 255);
    snake = color(255);
    snakeStroke = color(255, 255, 255);    
    food = color(255, 255, 255);  
    foodStroke = color(255, 255, 255);
    
  }
  
  // LARANJA
  void theme04 () {
    background = color(238, 183, 107);
    poison = color(49, 11, 11);
    poisonStroke = color(255, 255, 255, 0);
    snake = color(226, 112, 58);
    snakeStroke = color(226, 112, 58);
    food = color(156, 61, 84);
    foodStroke = color(255, 255, 255, 0);
    
  }
  
  // ROSA
  void theme05 () {
    background = color(253, 186, 248);
    poison = color(236, 163, 245);
    poisonStroke = color(255, 255, 255, 0);
    snake = color(237, 255, 169);
    snakeStroke = color(237, 255, 169);
    food = color(176, 239, 200);
    foodStroke = color(176, 239, 200);
    
    poison = color(247, 127, 127);
  }  
}
