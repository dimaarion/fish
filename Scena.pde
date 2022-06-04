public class Scena extends Action{
    JSONObject scena;
    Object p;
    int scenaWidth;
    int scenaHeight;
    private  int getX;
    private  int getY;
    private  int getWidth;
    private  int getHeight;
    private JSONArray objS;
    PImage imgRez;
    PImage pI;
    PImage imageView;
    PImage bgImg;
    String bgImageUrl = "bg.png";
    float y;
    float x;
    float size = 800;
    float sizeScena = 2;
    PImage imageTile;
    String filename = "kp.png";
    int countBoody = 0;
    float xb = 0;
    float yb = 0;
    float wb = 0;
    float hb = 0; 
    public void setup(String name, String tiles,float w,float h) {
        imageTile = loadImage(filename);
        scena = loadJSONObject(name);
        bgImg = loadImage(bgImageUrl);
        scenaWidth = scena.getInt("tilewidth") * scena.getInt("width");
        scenaHeight = scena.getInt("tileheight") * scena.getInt("height");
        imageView =   createTileMap(tiles, w, h, 0, 0, imageTile);
    }
    
    
    
    public  JSONArray  getObjectArr(String name) {
        
        for (int i = 0; i < scena.getJSONArray("layers").size(); i++) {
            
            if (scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects") != null) {
                for (int j = 0; j < scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").size(); j++) {
                    if (scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").getJSONObject(j).getString("name").indexOf(name) != -1) {
                        objS = scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects");
                    }
                    
                }
            }
            
        }
        
        return objS;
    }
    
    public  int  getObjectX(String name) {
        
        for (int i = 0; i < scena.getJSONArray("layers").size(); i++) {
            
            if (scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects") != null) {
                for (int j = 0; j < scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").size(); j++) {
                    if (scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").getJSONObject(j).getString("name").indexOf(name) != -1) {
                        getX = scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").getJSONObject(j).getInt("x");
                    }
                    
                }
            }
            
        }
        
        return getX;
    }
    
    public int getParams(String name, String params) {
        int p = 0;
        for (int i = 0; i < getObjectArr ("player").getJSONObject (0).getJSONArray ("properties").size (); i++) {
            if (getObjectArr ("player").getJSONObject (0).getJSONArray ("properties").getJSONObject (i).getString ("name").indexOf (params) != -1) {
                p = getObjectArr ("player").getJSONObject (0).getJSONArray ("properties").getJSONObject (i).getInt ("value");
            }

        }

return p;
    }

    public  int  getObjectY(String name){

        for(int i = 0; i < scena.getJSONArray("layers").size(); i++){

            if(scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects") != null){
                for(int j = 0; j < scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").size(); j++){
                    if(scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").getJSONObject(j).getString("name").indexOf(name) != -1){
                        getY = scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").getJSONObject(j).getInt("y");
                    }

                }
            }

        }

        return getY;
    }

    public  int  getObjectWidth(String name){

        for(int i = 0; i < scena.getJSONArray("layers").size(); i++){

            if(scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects") != null){
                for(int j = 0; j < scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").size(); j++){
                    if(scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").getJSONObject(j).getString("name").indexOf(name) != -1){
                        getWidth = scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").getJSONObject(j).getInt("width");
                    }

                }
            }

        }

        return getWidth;
    }

    public  int  getObjectHeight(String name){

        for(int i = 0; i < scena.getJSONArray("layers").size(); i++){

            if(scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects") != null){
                for(int j = 0; j < scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").size(); j++){
                    if(scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").getJSONObject(j).getString("name").indexOf(name) != -1){
                        getHeight = scena.getJSONArray("layers").getJSONObject(i).getJSONArray("objects").getJSONObject(j).getInt("height");
                    }

                }
            }

        }

        return getHeight;
    }

    public PImage createTileMap(String name, float w,float h, float curentX, float curentY, PImage c){
        float sizeDisplay = w + h;
        float width = w * size;
        float tileDop = (float) 1;
        
        float index;
        int col;
        int row;
       pI = createImage ((int) (sizeDisplay), (int) (sizeDisplay),ARGB);
        for (int i = 0; i < scena.getJSONArray("layers").size(); i++) {
            col = 0;
            row = 0;
            if(scena.getJSONArray("layers").getJSONObject(i).getString("name").indexOf(name) != -1){
                for (int j = 0; j < scena.getJSONArray("layers").getJSONObject(i).getJSONArray("data").size(); j++) {

                    x = col * scena.getInt("tilewidth") + curentX;
                    y =  row * scena.getInt("tileheight") + curentY;
                   // y = convertY((int) y,sketch);

                   if(scena.getJSONArray("layers").getJSONObject(i).getJSONArray("data").getInt(j)  > 0){
                        index = Float.valueOf(scena.getJSONArray("layers").getJSONObject(i).getJSONArray("data").getInt(j));
                       imgRez =  c.get(
                               ((int) (--index * scena.getInt("tilewidth")) % c.width),
                               ((int) ((--index * scena.getInt("tileheight")) / c.width ) * scena.getInt("tilewidth")),
                               scena.getInt("tilewidth"),scena.getInt("tileheight")
                       );
                       imgRez.resize ( (int)procent (sizeDisplay, procentInv (scenaWidth, (float) (scena.getInt("tilewidth") + tileDop))),(int)procent (sizeDisplay, procentInv (scenaHeight, (float) (scena.getInt("tileheight") + tileDop))));
                       pI.set ( (int)procent (sizeDisplay, procentInv (scenaWidth,x))  ,(int)procent (sizeDisplay, procentInv (scenaHeight,y)),imgRez);
                   }
                    col++;
                    if(col > scena.getInt("width") - 1){
                        col = 0;
                        row++;
                    }
                }
            }
        }
        return  pI;
    }

    public void viewMap(float wd, float hd,float x, float y){
      
        float sizeG = wd + hd;
        float w;
        float h;
        w = procent (sizeG,procentInv (scenaWidth / sizeScena,scenaWidth));
        h = procent (sizeG,procentInv (scenaHeight / sizeScena,scenaHeight));
        image(imageView,x ,y, w, h);
    }

     public void backGround(float width, float height){
        float sizeG = width + height;
        float x = -width / 2;
        float y = -height / 2;
        float w;
        float h;
       // x = procent (sizeG,procentInv (scena.scenaWidth / sizeScena,x));
       // y = procent (sizeG,procentInv (scena.scenaHeight / sizeScena,y));
        w = procent (sizeG,procentInv (scenaWidth / sizeScena,scenaWidth));
        h = procent (sizeG,procentInv (scenaHeight / sizeScena,scenaHeight));
        h = h + width;
        w = w + width;
        image (bgImg,x,y,w,h);
    }

    
}
