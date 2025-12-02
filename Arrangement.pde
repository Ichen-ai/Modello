class Arrangement{
  
  float xSpacing;
  float ySpacing;
  
  String type;
  
  Shape ArrangedShape;
  ArrayList ArrangedShapes = new ArrayList();
  
  PVector pos;
 
  
  //*ignore* for personal reference, probably smth like shapelayer1 = new arrangement(shape s)
  // and then buttons change it like shapelayer1.drawGrid() when the button clicked;
  
  Arrangement(Shape s){
    this.ArrangedShape = s;
    this.xSpacing = 10;
    this.ySpacing = 10;
    this.pos = new PVector(0,0);
    
    //note: default arrangement is singular of the shape in middle of screen?
    this.defaultArrange();
  }
  
  void defaultArrange(){
    this.ArrangedShape.pos.x = width/2;
    this.ArrangedShape.pos.y = height/2; //maybe a 2d slider for this default one
    //this.ArrangedShape.hei = 30;
    //this.ArrangedShape.wid = 30;
    this.ArrangedShape.drawShape();
    //assume there are sliders to change the shapes size, pos, colour, etc. in this scenario
  }
  
  
  void drawGrid(){
    float xspace = this.ArrangedShape.wid + this.xSpacing;
    int xnum = ceil(width/xspace);
    
    float yspace = this.ArrangedShape.hei + this.ySpacing;
    int ynum = ceil(height/yspace);
    
    for (int i = 0; i < xnum*ynum; i++){
      this.ArrangedShapes.add(ArrangedShape); //not sure if need this part???
    }
    int n = 0;
    
    for (int i = 0; i < xnum; i++){
      for(int j = 0; j < ynum; i++){
        this.ArrangedShapes.get(n).pos = new PVector (this.pos.x + i*this.xSpacing, this.pos.y + i+this.ySpacing);
        this.ArrangedShapes.get(n).drawShape();
        n ++;
      }
    }
  
 
}
