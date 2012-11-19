class Layer{
  int numSides;
  int startVertex;
  Tree tree;
  int layerWidth, layerHeight;
  int ringWeight = 6;
  PGraphics pg;
  float distance;
  
  Layer(int numSidesIn, int w, int h){
    numSides = numSidesIn;
    layerWidth = w;
    layerHeight = h;
    distance = 1;
    pg = createGraphics(layerWidth, layerHeight);

    startVertex = int(random(0, numSides));
    println(startVertex);
    
    
    float aX = (layerWidth/2) + (layerWidth/2 - ringWeight/2) * cos((TWO_PI/numSides)*startVertex);
    float aY = (layerHeight/2) + (layerHeight/2 - ringWeight/2) * sin((TWO_PI/numSides)*startVertex);
    float bX = (layerWidth/2) + (layerWidth/2 - ringWeight/2) * cos((TWO_PI/numSides)*(startVertex-1));
    float bY = (layerHeight/2) + (layerHeight/2 - ringWeight/2) * sin((TWO_PI/numSides)*(startVertex-1));
    
    pg.beginDraw();
    
    tree = new Tree(11, new Branch(
                new PVector(aX, aY),
                new PVector(bX, bY),
                new PVector(lerp(aX,layerWidth/2,0.7), lerp(aY,layerHeight/2,0.7)),
                color(random(50,100))),
                this.pg);
    drawPolygon(layerWidth/2, layerHeight/2, layerWidth/2 - ringWeight/2, 16, ringWeight,pg);
    pg.endDraw();
    
  }
  
  public void render(){
    fill(255,100);
    rect(width/2,height/2, layerWidth*distance, layerHeight*distance);
    image(pg, width/2, height/2, layerWidth*distance, layerHeight*distance);
  }

}