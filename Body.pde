public class Body extends Scena{
    FBody body[];
    boolean finih = false;
    int cv = 0;
    boolean startTime = false;
    boolean restartTime = false;
    int timer = 0;
    public FBody[] createElement(FWorld world,int bodies,Scena scena, String name){
       float sizeG = width + height;
        body = new FBody[scena.getObjectArr (name).size ()];
        countBoody = scena.getObjectArr (name).size ();
       for(int i = 0; i < countBoody; i++){
        xb = Float.parseFloat (String.valueOf (scena.getObjectArr (name).getJSONObject (i).get ("x")));
        yb = Float.parseFloat (String.valueOf (scena.getObjectArr (name).getJSONObject (i).get ("y")));
        wb = Float.parseFloat (String.valueOf (scena.getObjectArr (name).getJSONObject (i).get ("width")));
        hb = Float.parseFloat (String.valueOf (scena.getObjectArr (name).getJSONObject (i).get ("height")));

        xb = procent (sizeG,procentInv (scena.scenaWidth / scena.sizeScena ,xb));
        yb = procent (sizeG,procentInv (scena.scenaHeight / scena.sizeScena,yb));
        wb = procent (sizeG,procentInv (scena.scenaWidth / scena.sizeScena,wb));
        hb = procent (sizeG,procentInv (scena.scenaHeight / scena.sizeScena,hb));

           if(bodies == 0){
               body[i] = new FBox (wb ,hb);
           }else {
               body[i] = new FCircle (wb);
           }

           body[i].setPosition (  xb + wb / 2 ,yb + hb / 2);
           body[i].setName(name);
           body[i].setNoStroke ();

           world.add (body[i]);
       }
       return  body;
   }
     public void isStatic(boolean s){
       for(int i = 0; i < body.length; i++){
           body[i].setStatic (s);
       }
   }

    public void isSensor(boolean s){
        for(int i = 0; i < body.length; i++){
            body[i].setSensor (s);
        }
    }
    public void isRotate(boolean s){
        for(int i = 0; i < body.length; i++){
            body[i].setRotatable(s);
        }
    }

   public void isFill(float s){
       for(int i = 0; i < body.length; i++){
           if(s >= 0){
               body[i].setFill (s);
           }else {
               body[i].setNoFill ();

           }

       }
   }

    public void isImage(PImage img){
        for(int i = 0; i < body.length; i++){
            body[i].attachImage(img);
        }
   }




    

   public boolean getContact(FContact c, String name1, String name2){
       if(c.getBody1 ().getName () == name1 && c.getBody2 ().getName () == name2){
           return true;
       }else if(c.getBody2 ().getName () == name1 && c.getBody1 ().getName () == name2){
           return true;
       }else {
           return false;
       }

   }
    public void getContactFinih(FContact c, String name1, String name2){
        if(c.getBody1 ().getName () == name1 && c.getBody2 ().getName () == name2){
          
        }else if(c.getBody2 ().getName () == name1 && c.getBody1 ().getName () == name2){
           
        }else {

        }

    }

    public void getContactStart(FContact c, String name1, String name2){
        if(c.getBody1 ().getName () == name1 && c.getBody2 ().getName () == name2){
           
        }else if(c.getBody2 ().getName () == name1 && c.getBody1 ().getName () == name2){
            
        }else {

        }

    }

    public void timer(int cn){
     float   sp = cn / 20;
        c += sp;
        if(c > cn){
            c = 0;
            c += sp;
            if(startTime){
                cv +=1;
            }else {
                if(restartTime){
                    cv = 0;
                }else {
                    cv = cv;
                }


            }

        }
        if(cv >= cn){
            cv = 0;
        }
        timer = Math.round (cv);
    }

    public void vectorAnimateX(FBody[] body,Animate amimateL, Animate amimateR,  int ws, int hs){
        int w = (int)procent(width + height, ws);
        int h = (int)procent(width + height,hs);
        for (int i = 0; i < body.length; i++) {
            if(body[i].getVelocityX () >= 0){
            body[i].attachImage (amimateR.sprite (w));
        }else {
            body[i].attachImage (amimateL.sprite (w));
        }
        }
        

    }




}
