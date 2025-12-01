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
    ArrangedShape = s;
    xSpacing = 10;
    ySpacing = 10;
    
    //note: default arrangement is singular of the shape in middle of screen?
    this.pos.x = width/2;
    this.pos.y = height/2;
    this.defaultArrange();
  }
  
  void defaultArrange(){
    this.ArrangedShape.drawShape();
    //assume there are sliders to change the shapes size, pos, colour, etc. in this scenario
  }
  
  
  void drawGrid(){
    this.ArrangedShapes.add(ArrangedShape);
  }
  
 
}
