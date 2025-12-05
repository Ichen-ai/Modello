class Arrangement{
  
  float xSpacing;
  float ySpacing;
  
  PImage ATile;
  
  //ArrayList <PImage> ArrangedTiles = new ArrayList();
  
  PVector pos;

  float hsize;
  float wsize;
  
  String type;
 
  
  //*ignore* for personal reference, probably smth like shapelayer1 = new arrangement(shape s)
  // and then buttons change it like shapelayer1.drawGrid() when the button clicked;
  // also note for img syntax its image(variable, posx, posy, hei, wid)
  
  Arrangement(){
    this.ATile = loadImage("SavedTile.png");
    this.xSpacing = 100;
    this.ySpacing = 100;
    this.pos = new PVector(0,0);
    this.hsize = 50;
    this.wsize = 50;
    
    //note: default arrangement is singular of the shape in middle of screen?
    this.type = "default";
    
  }
  
  void drawPattern(){
    if (this.type.equals("default") || this.type.equals("Select"))
      this.defaultArrange();
    
    else if(this.type.equals("Grid"))
      this.drawGrid();
    
    else if(this.type.equals("Half-Drop"))
      this.drawHalfDrop();
    
    else if(this.type.equals("Brick"))
      this.drawBrick();
  }
  
  
  void defaultArrange(){
    this.pos = new PVector( width/2, height/2) ; //maybe a 2d slider for this default one
    
    image(ATile, this.pos.x, this.pos.y, wsize, hsize);
    //assume there are sliders to change the shapes size, pos, colour, etc. in this scenario
  }
  
  
  void drawGrid(){
    int xnum = ceil(width/xSpacing);
    int ynum = ceil(height/ySpacing);
    
    //int n = 0;
    
    for (int i = 0; i < xnum; i++){
      for(int j = 0; j < ynum; j++){
        float xPos = i*this.xSpacing + this.wsize/2.0;
        float yPos = j*this.ySpacing + this.hsize/2.0;
        //this.ArrangedShapes.add(new Shape(this.ArrangedShape.type, new PVector (xPos, yPos), this.ArrangedShape.hei, this.ArrangedShape.wid, int(red(this.ArrangedShape.colour)), int(green(this.ArrangedShape.colour)), int(blue(this.ArrangedShape.colour))));
        //this.ArrangedShapes.get(n).drawShape();
        //n ++;
        
        image(ATile, xPos, yPos, wsize, hsize);
        }
      }
    }
    
   void drawHalfDrop(){
    int xnum = ceil(width/xSpacing);
    int ynum = ceil(height/ySpacing) + 1;
    
    //int n = 0;
    
    for (int i = 0; i < xnum; i++){
      for(int j = 0; j < ynum; j++){
        
        float xPos = i*this.xSpacing + this.wsize/2.0;
        float yPos = j*this.ySpacing ; //+ this.hsize/2.0
        
        if (i % 2 == 1){
          yPos += this.hsize/2;
        }
        
        //this.ArrangedShapes.add(new Shape(this.ArrangedShape.type, new PVector (xPos, yPos), this.ArrangedShape.hei, this.ArrangedShape.wid, int(red(this.ArrangedShape.colour)), int(green(this.ArrangedShape.colour)), int(blue(this.ArrangedShape.colour))));
        //this.ArrangedShapes.get(n).drawShape();
        //n ++;
        image(ATile, xPos, yPos, wsize, hsize);
        }
      }
   }
   
   void drawBrick(){
    int xnum = ceil(width/xSpacing) + 1;
    int ynum = ceil(height/ySpacing);
    
    //int n = 0;
    
    for (int i = 0; i < xnum; i++){
      for(int j = 0; j < ynum; j++){
        
        float xPos = i*this.xSpacing;
        float yPos = j*this.ySpacing + this.hsize/2.0;
        
        if (j % 2 == 1){
          xPos += this.wsize/2.0;
        }
        
        //this.ArrangedShapes.add(new Shape(this.ArrangedShape.type, new PVector (xPos, yPos), this.ArrangedShape.hei, this.ArrangedShape.wid, int(red(this.ArrangedShape.colour)), int(green(this.ArrangedShape.colour)), int(blue(this.ArrangedShape.colour))));
        //this.ArrangedShapes.get(n).drawShape();
        //n ++;
        
        image(ATile, xPos, yPos, wsize, hsize);
        }
      }
   }
  
 
}
