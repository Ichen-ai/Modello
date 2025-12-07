
class PatternTile {
  //fields
  ArrayList <Shape> ArrangedShapes;
  boolean seeGrid;

  //constructor
  PatternTile() {
    ArrangedShapes = new ArrayList();
    seeGrid = false;
  }

  //methods
  void drawTile() {
    if (seeGrid) drawGrid();
    
    for (int i = 0; i < this.ArrangedShapes.size(); i++) {
      this.ArrangedShapes.get(i).drawShape();
    }
  }

  void drawGrid() {
    stroke(180);

    for (int x = 0; x <= width; x += 25) {
      line(x, 0, x, height);
    }
    for (int y = 0; y <= height; y += 25) {
      line(0, y, width, y);
    }
  }
}
