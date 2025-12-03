class Arrangement{
  
  float xSpacing;
  float ySpacing;
  
  String type;
  
  Shape ArrangedShape;
  
  ArrayList <Shape> ArrangedShapes = new ArrayList<Shape>();
  
  PVector pos;
 
  
  //*ignore* for personal reference, probably smth like shapelayer1 = new arrangement(shape s)
  // and then buttons change it like shapelayer1.drawGrid() when the button clicked;
  
  Arrangement(Shape s){
    this.ArrangedShape = s;
    this.xSpacing = 50;
    this.ySpacing = 50;
    this.pos = new PVector(0,0);
    
    //note: default arrangement is singular of the shape in middle of screen?
    //this.defaultArrange();
    
  }
  
  void defaultArrange(){
    
    println("default");
    this.ArrangedShape.pos.x = width/2;
    this.ArrangedShape.pos.y = height/2; //maybe a 2d slider for this default one
    
    
    this.ArrangedShape.drawShape();
    //assume there are sliders to change the shapes size, pos, colour, etc. in this scenario
  }
  
  
  void drawGrid(){
    int xnum = ceil(width/xSpacing);
    
    int ynum = ceil(height/ySpacing);
    
    int n = 0;
    
    for (int i = 0; i < xnum; i++){
      for(int j = 0; j < ynum; j++){
        this.ArrangedShapes.add(new Shape(this.ArrangedShape.type, new PVector (this.pos.x + i*this.xSpacing +this.ArrangedShape.wid, this.pos.y + j*this.ySpacing + this.ArrangedShape.hei), this.ArrangedShape.hei, this.ArrangedShape.wid, int(red(this.ArrangedShape.colour)), int(green(this.ArrangedShape.colour)), int(blue(this.ArrangedShape.colour))));
        this.ArrangedShapes.get(n).drawShape();
        n ++;
      }
    }
    
  }
  
 
}
