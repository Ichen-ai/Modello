
class PatternTile {
  //fields
  ArrayList <Shape> ArrangedShapes; //holds all the shapes within the tile
  boolean seeGrid, autoAlign; //booleans for additional features (seeing a grid + auto align)
  float gridSize; //grid size for the grid

  //constructor
  PatternTile() {
    this.ArrangedShapes = new ArrayList(); 
    this.seeGrid = false; //see grid is false in the beginning
    this.autoAlign = false; //auto align is false in the beginning
    this.gridSize = 25; //standard grid size begins at 25
  }

  //methods
  void drawTile() {
    if (seeGrid) drawGrid(); //draws grid only if seeGrid is true
    for (int i = 0; i < this.ArrangedShapes.size(); i++) {
      if (autoAlign) autoAlign(); //autoaligns shapes if autoAlign is true
      this.ArrangedShapes.get(i).drawShape(); //draws the shapes withing the arraylist
    }
  }

  void drawGrid() { //draws grid
    stroke(180);
    for (int x = 0; x <= width; x += this.gridSize) {
      line(x, 0, x, height);
    }
    for (int y = 0; y <= height; y += this.gridSize) {
      line(0, y, width, y);
    }
  }

  void autoAlign() {  //autoaligns the shape to the nearest gridline/grid corner
    for (Shape s : currentTile.ArrangedShapes) {

      float nearestX = round(s.pos.x / this.gridSize) * this.gridSize; //finds the nearest gridline for the X value
      float nearestY = round(s.pos.y / this.gridSize) * this.gridSize; //finds the nearest gridline for the Y value

      float dx = abs(nearestX - s.pos.x); //finds the distance to the nearest X gridline
      float dy = abs(nearestY - s.pos.y); //finds the distance to the nearest Y gridline

      if (abs(dx - dy) < 1.5) { //if the difference between the distances is less than 1.5, move it to the intersection of grid
        s.pos.x = nearestX;
        s.pos.y = nearestY;
      } else if (dx < dy) { //if the distance to the X gridline is closer than Y gridline, move to X gridline
        s.pos.x = nearestX;
      } else { //if the distance to the Y gridline is closer than X gridline, move to Y gridline
        s.pos.y = nearestY;
      }
    }
  }
}
