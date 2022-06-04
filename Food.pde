class Food {
  PVector food = new PVector((floor(random(b.boardWidth))), (floor(random(b.boardHeight))));
  ArrayList<PVector> poison = new ArrayList<PVector>();
  
  int currentLevel = 0;
  
  void render() {
    
    stroke(theme.foodStroke);
    fill(theme.food);
    rect(food.x*scl, food.y*scl, scl, scl);
    
    // CADA VEZ QUE SUBIR UM LEVEL ADICIONA UM VENENO
    if (currentLevel == 1) {
      poison.add(new PVector((floor(random(b.boardWidth))), (floor(random(b.boardHeight)))));
      for (int i = 0; i < poison.size(); i++) {
        rect(poison.get(i).x*scl, poison.get(i).y*scl, scl, scl);
      }
      
      currentLevel = 0;
    }
    
    stroke(theme.poisonStroke);
    fill(theme.poison);
    for (PVector p : poison) {
        rect(p.x*scl, p.y*scl, scl, scl);
    }
    
    
  }
  
  void foodLocation() {

    if (snake.eat() == true) {
      score ++;
      b.currentScore++;
      
      food.x = (floor(random(b.boardHeight)));
      food.y = (floor(random(b.boardWidth)));
    }
    
    food.x = constrain(food.x, 0, b.boardHeight-1);
    food.y = constrain(food.y, 0, b.boardWidth-1); 
    
  }
  

}
