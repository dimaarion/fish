public class MultiPlayer extends Action{
    PImage levelList;
    PImage levelS;
    PImage home;
    PImage homeActive;
    PImage right;
    PImage left;
    PImage leftActive;
    PImage rightActive;
    PImage noImage;
    int btnLevel = 0;
    int btnSelect = 0;
    int pressBtnL2 = 0;
    float yList = 0;
    float xList = 0;
    float xStep = 0;
    boolean hitSelectLevelL = false;
    boolean hitSelectLevelR = false;
    Button levelSelectList = new Button();
    Button levelG = new Button();
    Animate stars = new Animate("stars/1.png");
    Animate levelSelectHeader = new Animate("headlines/level select.png");
    
    public void setup() {
        levelList  = loadImage("multi/level.png");
        noImage = loadImage("noimage.png");
        home = loadImage("buttons/normal/home.png");
        homeActive = loadImage("buttons/click/home.png");
        levelS = levelG.setup("buttons/normal/round.png");
        right = levelSelectList.setup("buttons/normal/right.png");
        left = levelSelectList.setup("buttons/normal/left.png");
        leftActive = levelSelectList.setup("buttons/click/left.png");;
        rightActive = levelSelectList.setup("buttons/click/right.png");;
        stars.setup();
        levelSelectHeader.setup();
        
    }
    
    public void mousePress() {
         
    }
    
    public void mouseRePress() {
      
        levelSelectList.press = 3;
       
    }
    
    public void btnLevelSelect() {
        levelG.buttonImg(home,homeActive,"5",0,90,0,10);
    }
    
    
    public void levelList() {
        float yBtnL = 50;
        float sBtnL = 10;
        float d = 0;
        float xDop = 15;
       
            if (levelSelectList.press == 1) {
         //   d = xStep + 1;
                xList += -1; 
            } 
            if (levelSelectList.press == 4) {
                if (xList < 0) {
                 xList += 1;
                }
                
                
                
            
           
        }
        
        image(levelList,procentX(10),procentY(10), procentX(80),procentY(80));
        image(levelSelectHeader.sprite(),procentX(25),procentY(0), procentX(50),procentX(10));
        levelG.c1 = 255;
        for (int i = 0; i < 20; i++) {
          float xds = ((i * 12) + xDop) + xList; 
            hitSelectLevelL =  collideRectRect(0,procentY(yBtnL),procentX(sBtnL + 2),procentY(sBtnL),procentX(xds) ,procentY(yBtnL),procentX(sBtnL),procentY(sBtnL));
            hitSelectLevelR =  collideRectRect(procentX(86),procentY(yBtnL),procentX(sBtnL + 2),procentY(sBtnL),procentX(xds) ,procentY(yBtnL),procentX(sBtnL),procentY(sBtnL));
            if(!hitSelectLevelL && !hitSelectLevelR){
               levelG.buttonImg(levelS,noImage,i + 1,i + 1,xds ,yBtnL,sBtnL);
               image(stars.sprite(),procentX(xds + 2),procentY(yBtnL + 20),procentX(6),procentX(2.5));
            }
           
           
        }
        
       
         levelSelectList.buttonImg(left,leftActive,4,12,20,10);
         levelSelectList.buttonImg(right,rightActive,1,78,20,10);
    }
    
    public void draw() {
        btnLevel = levelG.press;

    }   
    }
        
        