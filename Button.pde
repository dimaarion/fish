public class Button extends Action{
    
    float x,y,w,h;
    float xi,yi,wi,hi;
    float xe,ye,we;
    boolean event = false;
    boolean hit = false;
    int element = 0;
    PImage img;
    String name = "noimage.png";
    String nameActive = "noimage.png";
    String fileImg = "noimage.png";
    int rePress = 0; 
    int press = 0;
    int value = 0;
    String txt = "";
    int c1 = 0;
    int c2 = 0;
    int c3 = 0;
    int c = 0;
    float[] btnX;
    float[] btnY;
    int[] valueGroup;
    String[] txtGroup; 
    Animate animate;
    Animate animateActive;
    Button(float x,float y, float w,float h) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.element = 0;
    }
    Button(float xe,float ye, float we) {
        this.xe = xe;
        this.ye = ye;
        this.we = we;
        this.element = 1;
        
    }
    Button(String name, float xi,float yi, float wi) {
        this.xi = xi;
        this.yi = yi;
        this.wi = wi;
        this.element = 2;
        this.name = name;
        
    }
    Button(String name,float[] btnX, float[] btnY, float wa) {
        this.element = 3;
        this.name = name;
        this.btnX = btnX;
        this.btnY = btnY;
        this.wi = wa;
    }
    
    Button() {
        
    }
    private void loadImg(String name) {
        animate = new Animate(name);
        animateActive = new Animate(nameActive);
        animate.setup();
        animateActive.setup();
    }
    public PImage setup() {
        img = loadImage(name);
        x = procent(width,x);
        y = procent(height,y);
        w = procent(width,w);
        h = procent(height,h);
        xe = procent(width,xe);
        ye = procent(height,ye);
        we = procent(width,we);
        xi = procent(width,xi);
        yi = procent(height,yi);
        wi = procent(width,wi);
        hi = procent(height,hi);
        return img;
        
    }
    
    public void setup(float x,float y, float w,float h) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.element = 0;
        setup();
        
        
    }
    
    public void setup(float xe,float ye, float we) {
        this.xe = xe;
        this.ye = ye;
        this.we = we;
        this.element = 1;
        setup();
        
        
    }
    
    public void setup(String name, float xi,float yi, float wi) {
        
        loadImg(name);
        this.xi = xi;
        this.yi = yi;
        this.wi = wi;
        this.element = 2;
        this.name = name;
        setup();
        
    }
    
    public void setup(String name,float[] btnX, float[] btnY, float wa) {
        loadImg(name);
        this.element = 3;
        this.name = name;
        this.btnX = btnX;
        this.btnY = btnY;
        this.wi = wa;
        setup();
        
    }
    public PImage setup(String name) {
        loadImg(name);
        this.name = name;
        return setup();
    }
    public void setupGroupImageBtn() {
        img = loadImage(name);
        wi = procent(width,wi);
    }
    
    public void rePressed() {
        rePress = 1;
        
        
    }
    
    public int pressed() {
        rePress = 0;
        if (element == 0) {
            hit =  touchRect(x,y,w,h,mouseX, mouseY);
        } else if (element == 1) {
            hit =  collidePointCircle(mouseX, mouseY,xe,ye,we);
        } else if (element == 2) {
            hit =  collidePointRect(mouseX, mouseY,xi,yi,wi,wi);
        } else if (element == 3) {
            for (int i = 0; i < btnX.length; i++) {
                x = procentX(btnX[i]);
                y = procentY(btnY[i]);
                
                hit =  collidePointRect(mouseX, mouseY,x,y,wi,wi);
                if (hit) {
                    println(valueGroup[i]);
                    events();
                    press = valueGroup[i];
                }
            }
            
        }
        if (element != 3 && hit) {
            events();
        }
        return press;
    }
    
    public void events() {
        if (hit) {
            event = hit;
            press = value;
        }
        
    }
    
    public void levelBtn(int v, String t, int c) {
        
        value = v;
        txt = t;
        c1 = c;
    }
    public void levelBtn(int[] v,String[] t, int c) {
        this.valueGroup = v;
        this.txtGroup = t;
        
        c1 = c;
        
        
    }
    
    
    
    private void colors() {
        if (c1 > 0 && c2 == 0 && c3 == 0) {
            fill(c1);
        } else{
            fill(c1, c2, c3);
        }
    }
    
    private void pusText(int txt, float xd, float yd, float wd) {
        textAlign(CENTER);
        if (value >= 10) {
            text(txt, procentX(xd) + procentX(wd) / 2 , procentY(yd) + procentX(wd) / 1.5  );
        } else{
            text(txt,  procentX(xd) + procentX(wd) / 2 , procentY(yd) + procentX(wd) / 1.5 );
        }
        
    }
    
    
    private void pusText(String txt, float xd, float yd, float wd) {
        textAlign(CENTER);
        if (value >= 10) {
            text(txt, procentX(xd) + procentX(wd) / 2, procentY(yd) + procentX(wd) / 1.5);
        } else{
            text(txt, procentX(xd) + procentX(wd) / 2, procentY(yd) + procentX(wd) / 1.5);
        }
    }
    
    
    private void texts(String txt, float xd, float yd, float wd) {
        if (txt != "") {
            push();
            colors();
            textSize(procentX(wd) / 1.8);
            pusText(txt,  xd,  yd,  wd);
            pop();
        }
    }
    private void texts(int txt, float xd, float yd, float wd) {
        if (txt != 0) {
            push();
            colors();
            textSize(procentX(wd) / 1.8);             
            pusText(txt,  xd,  yd,  wd);
            pop();
        }
    }
    
    private void texts(int txt,int size, float xd, float yd, float wd) {
        if (txt != 0) {
            push();
            colors();
            textSize(procentX(wd) / 1.8);
            pusText(txt,  xd,  yd,  wd);
            pop();
        }
    }
    
    private void texts(String txt,int size, float xd, float yd, float wd) {
        if (txt != "") {
            push();
            colors();
            textSize(procentX(wd) / 1.8);               
            pusText(txt,  xd,  yd,  wd);
            pop();
        }
    }
    
    private void pressed(float xd, float yd, float wd) {
        if (mousePressed) {
            hit =  collidePointRect(mouseX, mouseY,procentX(xd),procentY(yd),procentX(wd),procentX(wd));  
        } else{
            hit = false;
        }
        
    }

  
    
    
    
    
    private void paramsBtn(int v, float xd, float yd, float wd, float hd) {
        this.value = v;
        pressed(xd, yd,  wd);
        events();
        
    }
    
    private void viewImage(int v, PImage image, PImage imageActive, float xd, float yd, float wd, float hd) {
        if (v == press) {
            image(imageActive,procentX(xd),procentY(yd),procentX(wd),procentX(wd));
        } else{
            image(image,procentX(xd),procentY(yd),procentX(wd),procentX(wd));
        }
        
        }
    
    public void buttonImg(PImage image, PImage imageActive, int v, float xd, float yd, float wd) {
        viewImage(v, image, imageActive, xd, yd,  wd, wd);
        paramsBtn(v, xd, yd, wd, wd);
        events();
        }
    
    public void buttonImg(PImage image,PImage imageActive, String txt, int v, float xd, float yd, float wd) {
        
        paramsBtn(v, xd, yd, wd, wd);
        viewImage(v, image, imageActive, xd, yd,  wd, wd);
        texts(txt, xd,  yd,  wd);
        
        }
    
    public void buttonImg(PImage image,PImage imageActive, int txt, int v, float xd, float yd, float wd) {
        paramsBtn(v, xd, yd, wd, wd);
        viewImage(v, image, imageActive, xd, yd,  wd, wd);
        texts(txt, xd,  yd,  wd);
        }
    
    public void buttonImg(PImage image, PImage imageActive, int txt, int size, int v, float xd, float yd, float wd) {
        paramsBtn(v, xd, yd, wd, wd);
        viewImage(v, image, imageActive, xd, yd,  wd, wd);
        texts(txt, xd,  yd,  wd);
        }
    
    public void buttonImg(PImage image,PImage imageActive, String txt, int size, int v, float xd, float yd, float wd) {
        paramsBtn(v, xd, yd, wd, wd);
        viewImage(v, image, imageActive, xd, yd,  wd, wd);
        texts(txt, xd,  yd,  wd);
        }

        public void buttonElipse(int v, float xd, float yd, float wd) {
        push();
        colors();
        ellipse(xd, yd, wd, wd);
        pop();
        paramsBtn(v, xd, yd, wd, wd);
        events();
        }
    
    public void draw() {
        
        
        
        if (element == 0) {
            rect(x,y,w,h);
            } else if (element == 1) {
            ellipse(xe,ye,we,we);
            } else if (element == 2) {
            image(img,xi,yi,wi,wi);
            if (txt != "") {
                push();
                textSize(wi / 1.8);
                if (c1 > 0 && c2 == 0 && c3 == 0) {
                    fill(c1);
                } else{
                    fill(c1,c2, c3);
                    }
                
                text(txt, xi + wi / 3, yi + wi / 1.5);
                pop();
                }
            
            } else if (element == 3) {
            for (int i = 0; i < btnX.length; i++) {
                x = procentX(btnX[i]);
                y = procentY(btnY[i]);
                if (x > procentX(0) && x < procentX(85)) {
                    image(img,x,y,wi,wi);
                    if (txtGroup[i] != "") {
                        push();
                        textSize(wi / 1.8);
                        if (c1 > 0 && c2 == 0 && c3 == 0) {
                            fill(c1);
                        } else{
                            fill(c1,c2, c3);
                            }
                        
                        text(txtGroup[i], x + wi / 3, y + wi / 1.5);
                        pop();
                        }
                    }
                }
            
            
            
            }
        
        }
    
    
    }
