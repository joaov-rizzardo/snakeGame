PFont gotham;
Board b;
Snake snake;
Food f;
Theme theme;
Menu m;

int scl = 20;
int score = 0;
int highScore = 0;
int level = 0;
int screen = 0;
int difficulty = 1;
boolean pressed = false;

import ddf.minim.*;

// Declaração de um objeto da classe Minim. Será utilizada para controlar os áudios do programa.
Minim manager;

AudioPlayer pointEffect;
AudioPlayer gameoverEffect;
AudioPlayer selectEffect;

void setup() {
  size(900, 800);
  
  manager = new Minim(this);
  // Carrega o arquivo de áudio.
  pointEffect = manager.loadFile("scorePoint.mp3");
  gameoverEffect = manager.loadFile("gameover.mp3");
  selectEffect = manager.loadFile("select.mp3");
  
  // SELECIONA O TEMA PADRÃO
  // CADA FUNÇÃO THEME É RESPONSÁVEL POR SETAR AS CORES DO TEMA
  theme = new Theme();
  theme.theme01();
  
  // SELECIONA A FONTE
  gotham = createFont("Gotham-Bold.otf", 12);
  textFont(gotham);
  
  b = new Board(30, 30);
  
  snake = new Snake();
  
  f = new Food();
  
  m = new Menu();
  
  frameRate(5);
  
  
}

void draw() {
  
  if(screen == 0){
    m.screen0();
  }
  
  if(screen == 1){
    m.screen1();
  }
  
  if(screen == 2){
    m.screen2();
  }
  
  if(screen == 4){
    m.screen4();
  }
  
  if(screen == 5){
    m.screen5();
  }
  
  if(screen == 6){
    m.screen6();
  }
  
  if(screen == 3){
      
      // RESPONSÁVEL POR SELECIONAR DIFICULDADE DO JOGO
      // BASEADO EM FRAMERATE
      int rate = m.changeDifficulty(difficulty);
      frameRate(rate);
      
      background(0, 0, 0);
      translate((width/2)-((b.boardHeight/2)*scl)-100, (height/2)-((b.boardHeight/2)*scl));
      noStroke();
      
      // GERA O MENU LATERAL
      scoreBoard();
      
      // RENDERIZA A TELA DE JOGO
      b.render();
      
      // VERIFICA O LEVEL
      // A CADA 5 PONTOS AUMENTA UM LEVEL
      b.level();
      
      // RENDERIZA AS COMIDAS E OS VENENOS DE FORMA RANDOMICA NA TELA
      f.render();
      
      snake.update();
      snake.render();
      snake.death();
      
      f.foodLocation();
  }

  
}

void keyPressed() {
  
  if(key == 'm'){
    selectEffect.rewind();
    selectEffect.play();
    screen = 1;
  }
  
  if(screen == 0){
    if(key == ENTER){
      selectEffect.rewind();
      selectEffect.play();
      screen = 1;
    }
  }
  
  if(screen == 6){
    if(key == ENTER){
      selectEffect.rewind();
      selectEffect.play();
      screen = 3;
    }
  }
  
  if(screen == 1){
    if(key == '1'){
      selectEffect.rewind();
      selectEffect.play();
      screen = 2;
      pressed = true;
    }
    
    if(key == '2'){
      selectEffect.rewind();
      selectEffect.play();
      screen = 5;
    }
    
    if(key == '3'){
      selectEffect.rewind();
      selectEffect.play();
      screen = 4;
    }
  }
  
  if(screen == 2){
    if(key == '1'){
      if(pressed){
        pressed = false;
      }else{
        selectEffect.rewind();
        selectEffect.play();
        difficulty = 1;
        screen = 6;
      }

    }
    
    if(key == '2'){
      selectEffect.rewind();
      selectEffect.play();
      difficulty = 2;
      screen = 6;
    }
    
    if(key == '3'){
      selectEffect.rewind();
       selectEffect.play();
      difficulty = 3;
      screen = 6;
    }
  }
  
  
  if (key == CODED) {
    if (keyCode == UP) {
      snake.xDir = 0;
      snake.yDir = -1;
    } else if (keyCode == DOWN) {
      snake.xDir = 0;
      snake.yDir = 1;     
    } else if (keyCode == LEFT) {
      snake.xDir = -1;
      snake.yDir = 0;
    } else if (keyCode == RIGHT) {
      snake.xDir = 1;
      snake.yDir = 0;
    }
  }
  
  //RESTART
  if (key == 'r') {
    setup();
    loop();
    score = 0;
  } else if (key == 'p') {
    noLoop();
  } else if (key == 'o') {
    loop();
  } 
  
  // THEME CONTROL
  else if (key == '1') {
    theme.theme01();
  } else if (key == '2') {
    theme.theme02();
  } else if (key == '3') {
    theme.theme03();
  } else if (key == '4') {
    theme.theme04();
  } else if (key == '5') {
    theme.theme05();
  }
}

void scoreBoard() {
  int textLocx = (b.boardWidth+1)*scl;
  int textLocy = 20;
  
  //SCOREBOARD
  fill(255);
  textAlign(LEFT);
  text("PONTOS: ", textLocx, textLocy);
  text(score, textLocx+70, textLocy);
  text("RECORDE: ", textLocx, textLocy+15);
  text(highScore, textLocx+70, textLocy+15);
  text("PAUSAR: P", textLocx, textLocy+55);
  text("JOGAR: O", textLocx, textLocy+70);
  text("MENU: M", textLocx, textLocy+85);
  text("LEVEL:", textLocx, textLocy+100);
  text(level, textLocx+45, textLocy+100);
  
  //ITEM INFO
  fill(theme.food);
  rect(textLocx, textLocy+120, scl, scl); 
  text("COMIDA", textLocx+scl+5, textLocy+132);  
 
  fill(theme.snake);
  rect(textLocx, textLocy+145, scl, scl); 
  text("COBRA", textLocx+scl+5, textLocy+157);    
  
  stroke(theme.poisonStroke);
  fill(theme.poison);
  rect(textLocx, textLocy+170, scl, scl); 
  text("VENENO", textLocx+scl+5, textLocy+182); 
  
  
  //THEME INFO
  fill(255, 255, 255);
  rect(textLocx, textLocy+250, scl, scl); 
  text("TEMA 01: BASICO", textLocx+scl+5, textLocy+262);
  
  fill(55, 27, 88);
  rect(textLocx, textLocy+275, scl, scl); 
  text("TEMA 02: ROXO", textLocx+scl+5, textLocy+287);   
  
  stroke(87, 95, 104, 255);
  fill(128, 128, 128);
  rect(textLocx, textLocy+300, scl, scl);
  fill(87, 95, 104);
  text("TEMA 03: CINZA", textLocx+scl+5, textLocy+312); 
  
  noStroke();
  fill(238, 183, 107);
  rect(textLocx, textLocy+325, scl, scl); 
  text("TEMA 04: LARANJA", textLocx+scl+5, textLocy+337);   
 
  fill(253, 186, 248);
  rect(textLocx, textLocy+350, scl, scl); 
  text("TEMA 05: ROSA", textLocx+scl+5, textLocy+362);    
}
