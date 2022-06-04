class Platform extends Body{

    public void setup(FWorld world, Scena scena) {
     createElement(world,0,scena,"platform");
     isFill(-1);
     isStatic(true);
    }

    public void draw() {
        
    }

}
