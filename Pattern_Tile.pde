
class PatternTile {
  //fields
  ArrayList <Shape> ArrangedShapes;
  boolean seeGrid, autoAlign;

  //constructor
  PatternTile() {
    ArrangedShapes = new ArrayList();
    seeGrid = false;
    autoAlign = false;
  }

  //methods
  void drawTile() {
    if (seeGrid) drawGrid();
    for (int i = 0; i < this.ArrangedShapes.size(); i++) {
      if (autoAlign) autoAlign();

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

  void autoAlign() {    
    for (Shape s : currentTile.ArrangedShapes) {

      float nearestX = round(s.pos.x / 25) * 25;
      float nearestY = round(s.pos.y / 25) * 25;

      float dx = abs(nearestX - s.pos.x);
      float dy = abs(nearestY - s.pos.y);

      if (abs(dx - dy) < 1.5) {
        s.pos.x = nearestX;
        s.pos.y = nearestY;
      } else if (dx < dy) {
        s.pos.x = nearestX;
      } else {
        s.pos.y = nearestY;
      }
    }
  }
}
