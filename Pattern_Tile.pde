
class PatternTile {
  //fields
  ArrayList <Shape> ArrangedShapes;

  //constructor
  PatternTile() {
    ArrangedShapes = new ArrayList();
  }

  //methods
  void drawTile() {
    for (int i = 0; i < this.ArrangedShapes.size(); i++) {
      this.ArrangedShapes.get(i).drawShape();
    }
  }
}
