public class Action {
    float scaleX = 10;
    float scaleY = 0;
    float scaleOfset = 0;
    float c = 0;
    int cv = 0;
    String touchScale = "noscale";
    
    
    
    public  boolean touchRect(float x,float y,float w,float h,float x2,float y2) {
        if (x < x2 && x + w > x2 && y < y2 && y + h > y2) {
            return true;
        } else {
            return false;
        }
    };
    public boolean collidePointRect(float t,float o,float e,float i,float r,float l) {
        return t >= e && t <= e + r && o >= i && o <= i + l ? true : false;
    }
    public  boolean collideRectRect(float x, float y, float w, float h, float x2, float y2, float w2, float h2) {
        //2d
        //add in a thing to detect rectMode CENTER
        if (x + w >= x2 &&    // r1 right edge past r2 left
            x <= x2 + w2 &&    // r1 left edge past r2 right
            y + h >= y2 &&    // r1 top edge past r2 bottom
            y <= y2 + h2) {    // r1 bottom edge past r2 top
            return true;
        }
        return false;
    }
    
    public  boolean collideRectCircle(float rx, float ry, float rw, float rh, float cx, float cy, float diameter) {
        //2d
        // temporary variables to set edges for testing
        float testX = cx;
        float testY = cy;
        
        // which edge is closest?
        if (cx < rx) {         testX = rx;       // left edge
        } else if (cx > rx + rw) { testX = rx + rw;  }   // right edge
        
        if (cy < ry) {         testY = ry;      // top edge
        } else if (cy > ry + rh) { testY = ry + rh; }   // bottom edge
        
        // // get distance from closest edges
        float distance = dist(cx,cy,testX,testY);
        
        // if the distance is less than the radius, collision!
        if (distance <= diameter / 2) {
            return true;
        }
        return false;
    }
    
    public  boolean collideCircleCircle(float x, float y,float d, float x2, float y2, float d2) {
        // 2d
        if (dist(x,y,x2,y2) <= (d / 2) + (d2 / 2)) {
            return true;
        }
        return false;
    }
    
    public  boolean collidePointCircle(float x, float y, float cx, float cy, float d) {
        // 2d
        if (dist(x,y,cx,cy) <= d / 2) {
            return true;
        }
        return false;
    };
    
    
    
    public float procent(float n, float p) {
        return   n / 100 * p;
    }
    
    public float procent(float x) {
        float r = width + height;
        return  procent(r,x);
    }
    public float procentX(float x) {
        float r = width;
        return  procent(r,x);
    }
    public float procentY(float x) {
    float r = height;
    return  procent(r,x);
}
        
        public float procentInv(float n, float p) {
            return   p * 100 / n;
        }
        
        
        
        
        
        
    }
    