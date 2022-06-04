public class Animate extends Action{
    String name;
    PImage img;
    float x,y,w,h;
    int xr = 0;
    int xp = 0;
    int frame = 0;
    int widthI = 100;
    int heightI = 100;
    int widthSp = 0;
    int format = 0;
    int rate = 5;
    int orientation = 0;
    boolean animated = true;
   
    PImage[] image;
    Animate(String name,int frame,int format,float x,float y,float w,float h) {
        this.name = name;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.frame = frame;
        this.format = format;
        
    }
    Animate(String name,int frame,float x,float y,float w,float h) {
        this.name = name;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.frame = frame;
    }
    
    Animate(String name,int frame,int format) {
        this.name = name;
        this.frame = frame;
        this.format = format;
    }
    Animate(String name,int frame) {
        this.name = name;
        this.frame = frame;
    }
    Animate(String name) {
        this.name = name;
        animated = false;
    }
    
    
    public void setup() {
        
        
        img = loadImage(name);
        if (animated) {
            image = new PImage[frame];
            widthI = img.width;
            heightI = img.height;
            if (widthSp != 0) {
                img.resize(frame * widthSp,heightI);
            } else{
                widthSp = widthI / frame;
            }
            for (int i = 0; i < image.length; i++) {
                image[i] = img.get(i * widthSp,0,widthSp,heightI);
            }
        }
    }
    
    public void params() {
        if (format == 0) {
            xr += 1;
            if (xr > rate) {
                xp = xp + 1;
                xr = 0;
            }
            if (xp >  frame - 1) {
                xp = 0;
            }
        } else if (format == 1) {
            xr += 1;
            if (xr > rate) {
                xp = xp + 1;
                xr = 0;
            }
            if (xp > frame - 1) {
                xp = xp - 1;
            }
        }
    }
    
   

    public PImage sprite() {
        try{
            if (animated) {
                return image[xp];
            } else{
                return img;
            }
            
        } catch(Exception e) {
            return img;
        }
        
    }
    
    public void getImage(float x,float y) {
        image(img,0,0);
    }

    public PImage sprite(int w,int h) {
        try{
            if (animated) {
                image[xp].resize(w,h);
                return image[xp];
            } else{
                img.resize(w,h);
                return img;
            }
            
        } catch(Exception e) {
            return img;
        }
        
    }
    public PImage sprite(int w) {
        try{
            if (animated) {
                image[xp].resize(w,w);
                return image[xp];
            } else{
                img.resize(w,w);
                return img;
            }
            
        } catch(Exception e) {
            return img;
        }
        
    }
    
    public void draw() {
        params();
        try{
            if (animated) {
                image(image[xp],x,y ,w,h);
            }
            
        }
        catch(Exception e) {
            println("luiluiluilui");
        }
    }
}
