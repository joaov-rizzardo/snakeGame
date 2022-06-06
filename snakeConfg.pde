class Snake {
  // POSIÇÃO INICIAL RANDOMICA DA COBRA
  PVector snakeLoc = new PVector((floor(random(b.boardWidth))), (floor(random(b.boardHeight))));
  
  // DIREÇÃO EM X QUE A COBRA ESTÁ PERCORRENDO
  float xDir = 1;

  // DIREÇÃO EM Y QUE A COBRA ESTÁ PERCORRENDO
  float yDir = 0;

  // TAMANHO TOTAL DA COBRA
  int total = 0;
  
  // VARIAVEL CONTENDO O CORPO DA COBRA
  ArrayList<PVector> body = new ArrayList<PVector>();

  void render() {
    fill(theme.snake);
    stroke(theme.snakeStroke);
    rect(snakeLoc.x*scl, snakeLoc.y*scl, scl, scl);
    
    for (int i = 0; i < body.size(); i++) {
      rect(body.get(i).x*scl, body.get(i).y*scl, scl, scl);
    }
    
  }
  
  boolean eat() {
    float d = dist(snakeLoc.x, snakeLoc.y, f.food.x, f.food.y);
    
    if (d < 1) {
      pointEffect.rewind();
      pointEffect.play();
    
      total++;
      return true;
    } else {
      return false;
    }
  }
  
  
  void death() {

    // VERIFICA SE A COBRA ESTÁ COLIDINDO COM SEU PRÓPRIO CORPO OS AS BORDAS DO MAPA
    for (int i = 0; i < body.size(); i++) {
      PVector pos = body.get(i);
      float d = dist(snakeLoc.x, snakeLoc.y, pos.x, pos.y);
      if (d < 1) {
        gameOver();
      }
    }

    // VERIFICA SE A COBRA COLIDIU COM UM VENENO
    if (level > 0) {
      float p;
      for (int i = 0; i < f.poison.size(); i++) {
        p = dist(snakeLoc.x, snakeLoc.y, f.poison.get(i).x, f.poison.get(i).y);

        if (p < 1) {
          gameOver();
        }
      }
    }
  }

  void gameOver() {
     gameoverEffect.rewind();
     gameoverEffect.play();
      
    fill(255, 0, 0);
    textSize(30);
    textAlign(CENTER);
    text("GAME OVER", b.boardWidth/2*scl, b.boardHeight/2*scl);
    textAlign(CENTER, TOP);
    text("PRESSIONE 'R' PARA RECOMEÇAR", b.boardWidth/2*scl, b.boardHeight/2*scl);
    body.clear();
    noLoop();
        
    if (score > highScore) {
      highScore = score;
    }
    level = 0; 
  }

  
  void update() {
    if (total > 0) {
      if (total == body.size()) {
        body.remove(0);
      }
      body.add(new PVector(snakeLoc.x, snakeLoc.y));
    } 
    
    snakeLoc.x += (1 * xDir);
    snakeLoc.y += (1 * yDir);
    
    snakeLoc.x = constrain(snakeLoc.x, 0, b.boardWidth-1);
    snakeLoc.y = constrain(snakeLoc.y, 0, b.boardHeight-1); 

  }
}
