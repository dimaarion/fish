import fisica.*;
MultiPlayer multiplayer = new MultiPlayer();
Game game = new Game();
Game game2 = new Game();
void setup() {
    size(1000, 500);
    game.setup(this, "scena.json");
    game2.setup(this, "scena2.json");
    multiplayer.setup();
}


void draw() {
   background(255);
   multiplayer.draw();
  
  // multiplayer.levelList();
   switch(multiplayer.btnLevel){
   case(0): multiplayer.levelList();break;
   case(1): game.draw();break;
   case(2): game2.draw();break;
   }
    
   
      multiplayer.btnLevelSelect();
   
      
 
}

void mouseReleased() {
    game.rePressed();
    multiplayer.mouseRePress();
    
}

void mousePressed() {
    game.pressed();
    multiplayer.mousePress();
}
