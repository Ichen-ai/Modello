
boolean onObject = false;
PVector mousePos;

void mouseClicked() {
  mousePos = new PVector(mouseX, mouseY);
  for (int i = currentTile.ArrangedShapes.size() - 1; i >=0 ; i--) { 
    Shape testShape = currentTile.ArrangedShapes.get(i);
    if (mousePos.dist(testShape.pos) < testShape.wid && mousePos.dist(testShape.pos) < testShape.hei) {
      onObject = true;
      testShape.isSelected = true;
      break;
    }
  }
}

void mouseDragged() {
  mousePos = new PVector(mouseX, mouseY);
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) {
    Shape testShape = currentTile.ArrangedShapes.get(i);
    if (testShape.isSelected && onObject) {
      testShape.pos = mousePos;
    }
  }
}

void mouseReleased() {
  mousePos = new PVector(mouseX, mouseY);
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) {
    Shape testShape = currentTile.ArrangedShapes.get(i);
    if (testShape.isSelected) {
      onObject = false;
      testShape.isSelected = false;
    }
  }
}
