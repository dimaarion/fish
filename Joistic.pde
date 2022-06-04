public class Joistic extends Action{
    
    
    float xpos = 0;
    float ypos = 0;
    float xPosJ = 30;
    float yPosJ = 50;
    float xp = 0;
    float yp = 0;
    float wp = 0;
    float hp = 0;
    float wg = 500;
    boolean hitJ = false;
    boolean  hitJp = false;
    float imgSize;
    PImage joidticCenter;
    PImage joisticContur;
    PImage joisticSt;
    PImage health;
    float a;
    float hw = 0;
    int jPress = 0;
   
    
    public void setupJoistic(float xpr, float ypr) {
        xPosJ = xpr;
        yPosJ = ypr;
        joidticCenter = loadImage("joistic.png");
        joisticContur = loadImage("joisticContur.png");
        joisticSt = loadImage("joisticSt.png");
        health = loadImage("health.png");
        wg = width + height;
    }

    private void viewJoistic() {
        float x = procent(width,xPosJ);
        float y = procent(height,yPosJ);
        float w = procent(height,15);
        float wc = procent(height,30);
        
        
        push();
        /// rect (xp,yp,wp,hp);
        hitJ = touchRect(xp,yp,wp,hp, mouseX, mouseY);
        if (mousePressed) {
            if (hitJ) {
                pushMatrix();
                translate(x, y);
                rotate((float)(a - 0.8));
                image(joidticCenter,0,0,w * 2,w);
                popMatrix();
               // contactJ(a,rightJ,downJ,leftJ,upJ,urpJ,rdpJ);
            } else {
                image(joisticSt,x - w / 2,y - w / 2,w, w);
            }
        } else{
            image(joisticSt,x - w / 2,y - w / 2,w,w);
        }
        
        image(joisticContur,x - wc / 2,y - wc / 2,wc,wc);
        
        pop();
    }
    
    public void joistic(FBody[] body, float sp) {
        xp = procent(width,xPosJ - 25);
        yp = procent(height,yPosJ - 45);
        wp = procent(width,50);
        hp = procent(height,90);
        
        float x = 0;
        float y = 0;
        float MAX_DEFLECT = 0.3926991f;
        ypos =  map(mouseYRatio(), 1, -1, -MAX_DEFLECT, MAX_DEFLECT);
        xpos =  map(mouseXRatio(), -1, 1, -MAX_DEFLECT, MAX_DEFLECT);
        
        
        
        if (mousePressed) {
            
            hitJ = touchRect(xp,yp,wp,hp, mouseX, mouseY);
            if (hitJ) {
                float spX = 0;
                float spY = 0; 
                float speed = procentX(sp);
                a = atan2(mouseY - procent(height,yPosJ), mouseX - procent(width,xPosJ));
                
                for (int i = 0; i < body.length; i++) {
                    body[i].setRotation(a);
                    
                    float w = procent(height,15);
                    float wc = procent(height,30);
                    int rotateP = (int)(body[i].getRotation() * 10);
                    /*
                    if (rotateP > 3 && rotateP < 28) {
                        spY = speed;
                    } else if (rotateP < - 3 && rotateP > - 28) {
                        
                        spY = -speed;
                    }
                    
                    if (rotateP >= 0 && rotateP <= 11 || rotateP <= 0 && rotateP >= -11) {
                        spX = speed;
                    } else if (rotateP <= 31 && rotateP >=  20 || rotateP >= -31 && rotateP <= -20) {
                        spX = -speed;
                    }*/
                   
                    body[i].setVelocity(xpos  *  procentX(100) * 5,ypos * procentY(100) * 5);

                    // body[i].setRotatable(true);
                }
                
            } else{
                for (int i = 0; i < body.length; i++) {
                    
                    if (body[i].getVelocityX() < 0) {
                        body[i].setRotation(3);
                    } 
                    if (body[i].getVelocityX() >= 0) {
                        body[i].setRotation(0);
                    }
                }
                
            }
            
        } else{
            if (hitJ) {
                for (int i = 0; i < body.length; i++) {
                    
                    if (body[i].getVelocityX() < 0) {
                        body[i].setRotation(3);
                    } 
                    if (body[i].getVelocityX() >= 0) {
                        body[i].setRotation(0);
                    }
                }
                
            }
            
        }
        viewJoistic();
    }
    
    
    float mouseXRatio() {
        return mouseRatio(mouseX, procent(width,xPosJ));
    }
    
    float mouseYRatio() {
        return -mouseRatio(mouseY, procent(height,yPosJ));
    }
    
    
    float mouseRatio(float mouse,float half) {
        float mouseFromCenter = mouse - half;
        return constrain(mouseFromCenter, -half, half) / half;
    }
    
    
    
    
    
    
}
