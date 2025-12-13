//Arrangement Class
class Arrangement{
  
  //Fields
  float xSpacing;
  float ySpacing;
  
  PImage ATile;
  
  PVector pos;

  float hsize;
  float wsize;
  
  String type;
 
  //Constructor
  Arrangement(){
    this.ATile = loadImage("SavedTile.png");  //Loads the frame that was just saved
    
    //Sets initial values or the values that the user has been adjusting
    this.xSpacing = 50;
    this.ySpacing = 50;
    this.pos = new PVector(0,0);
    this.hsize = 50;
    this.wsize = 50;
    
    this.type = "Grid";    
  }
  
  //Methods
  void drawPattern(){
    //Calls the drawing function based on which arrangement type the user has selected
    
    if(this.type.equals("Grid"))
      this.drawGrid();
    
    else if(this.type.equals("Half-Drop"))
      this.drawHalfDrop();
    
    else if(this.type.equals("Brick"))
      this.drawBrick();
  }
  
  
  //Method to draw a standard grid from the tiles
  void drawGrid(){
    //Calculates how many tiles will fit on the screen
    int xnum = ceil(width/xSpacing);
    int ynum = ceil(height/ySpacing);
    
    //Utilises a nested for loop to draw the images in a grid formation
    for (int i = 0; i < xnum; i++){
      for(int j = 0; j < ynum; j++){
        float xPos = i*this.xSpacing + this.wsize/2.0;
        float yPos = j*this.ySpacing + this.hsize/2.0;
       
        //Draws the image using the calculated positions
        image(ATile, xPos, yPos, wsize, hsize);
        }
      }
    }
    
   //Method to draw a half-drop spacing of tiles
   void drawHalfDrop(){
    int xnum = ceil(width/xSpacing);
    int ynum = ceil(height/ySpacing) + 1; //Accounts for an extra tile height wise
    
    for (int i = 0; i < xnum; i++){
      for(int j = 0; j < ynum; j++){
        
        float xPos = i*this.xSpacing + this.wsize/2.0; 
        float yPos = j*this.ySpacing ; 
        
        if (i % 2 == 1){
          yPos += this.hsize/2; //Adds an offset value (half-drop) for every other column
        }
        
        image(ATile, xPos, yPos, wsize, hsize);
        }
      }
   }
   
   //Method to draw a brick spacing of tiles
   void drawBrick(){
    int xnum = ceil(width/xSpacing) + 1; //Accounts for an extra tile horizontally
    int ynum = ceil(height/ySpacing);
    
    
    for (int i = 0; i < xnum; i++){ //nested for loops to draw grid-style
      for(int j = 0; j < ynum; j++){
        
        float xPos = i*this.xSpacing;
        float yPos = j*this.ySpacing + this.hsize/2.0;
        
        if (j % 2 == 1){
          xPos += this.wsize/2.0; //Adds an offset value for every other row to create brick illusion
        }
        
        image(ATile, xPos, yPos, wsize, hsize);
        }
      }
   }
  
  
  void drawWave(){
    int xnum = ceil(width/xSpacing);
    int ynum = ceil(height/ySpacing);
    
    
    for (int i = 0; i < xnum; i++){ //nested for loops to draw tiles
      for(int j = 0; j < ynum+1; j++){
        
        float xPos = i*this.xSpacing + this.wsize/2.0;
        float yPos = j*this.ySpacing + this.hsize/2.0 + this.hsize/2.0*sin(xPos);
        
        
        image(ATile, xPos, yPos, wsize, hsize);
        }
      }
  }
 
}
