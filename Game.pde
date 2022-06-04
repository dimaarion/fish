class Game extends Scena{
FWorld world;


Scena scena =  new Scena();
Scena scena2 =  new Scena();
Animate animate = new Animate("bg.png");
Player player = new Player();
Platform platform = new Platform();

public void setup(PApplet applet, String scenaStr){
    frameRate(procentX(6));
    scena.setup(scenaStr,"bg",width, height);
    scena2.setup(scenaStr,"bg2",width, height);
    animate.setup();
    Fisica.init(applet);
    world = new FWorld();
    world =  createWorld(scena, width,height); 
    world.setGravity (0,0);
    player.setup(world, scena);
    platform.setup(world, scena);
   println(procentX(6));
   

}

public void draw(){
    push(); 
     player.translates();
     scena.backGround(width,height);
     scena.viewMap(width,height,0,0);
     platform.draw();
     world.step();
     world.draw();
    pop();
      player.viewPlayer();
     
      
}

public void rePressed() {
       player.rePressed();
    }
    
    public void pressed() {
         player.pressed();
    }

public FWorld createWorld(Scena scena, float width, float height){
      float  sizeG = width + height;
        return new FWorld(-scena.scenaWidth * sizeG, -scena.scenaHeight * sizeG, scena.scenaWidth * sizeG, scena.scenaHeight * sizeG);
    }

    

}
