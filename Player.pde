class Player extends Body{
    FBody[] body;
    Animate rightRest = new Animate("player/rightRest/rightRest.png",6);
    Animate leftRest = new Animate("player/leftRest/leftRest.png",6);
    Animate rightSwim = new Animate("player/rightSwim/rightSwim.png",6);
    Animate leftSwim = new Animate("player/leftSwim/leftSwim.png",6);
    
    
    
    float x = 10;
    float y = 10;
    float resizeImg = 5;
    float speed = 60;
    float live = 200;
    float liveProcent = 19;
    float wg = 500;   
    int rePress = 0; 
    Joistic joistic = new Joistic();
    public void setup(FWorld world, Scena scena) {
        body = createElement(world,1,scena,"player");
        isRotate(false);
        joistic.setupJoistic(75,60);
        rightRest.setup();
        leftRest.setup();
        rightSwim.setup();
        rightSwim.rate = 2;
        leftSwim.setup();
        leftSwim.rate = 2;
    }
    
    public void viewPlayer() {
        joistic.joistic(body,speed);
        rightRest.params();
        leftRest.params();
        rightSwim.params();
        leftSwim.params();
        imageMove();
        
    }

    public void rePressed() {
       rePress = 1;
    }
    
    public void pressed() {
        rePress = 0;
    }
    public void translates() {
        for(int i = 0; i < body.length; i++){
             translate(-body[i].getX() +  width / 2,-body[i].getY() + height / 2);
        }
        
    }

    private void imageMove(){
     if(mousePressed){
      vectorAnimateX (body,leftSwim,rightSwim,(int)resizeImg,(int)resizeImg);
     }else {
      vectorAnimateX (body,leftRest,rightRest,(int)resizeImg,(int)resizeImg);
     }


    }
}
