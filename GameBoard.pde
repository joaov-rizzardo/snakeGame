class Board {
  int boardWidth;
  int boardHeight;
  int currentScore = 0;
  
  Board(int w, int h) {
    boardWidth = w;
    boardHeight = h;
  }
  
  void render() {
    noStroke();
    fill(theme.background);
    rect(0, 0, b.boardWidth*scl, b.boardHeight*scl);
  }
  
  void level() {
    // A CADA 5 PONTOS SOBE UM LEVEL
    if (currentScore == 5) {
      
      level++;
      
      // VARIAVEL UTILIZADA PARA GERAR O VENENO
      f.currentLevel++;
      currentScore = 0;
    }
  }
  
}
