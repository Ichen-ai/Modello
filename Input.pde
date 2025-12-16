
PVector mousePos; //PVEctor used for the mouse position of the user

void mouseClicked() {
  mousePos = new PVector(mouseX, mouseY); //creates a PVector that stores where user clicked
  if (findingColour) { //if the user is currently picking a colour using colour picker
    getColour(mousePos); //get the colour of the place where the user clicked
    findingColour = false; //no longer finding colour
    pickColourCheckbox.setSelected(false);
  } else {
    for (int i = currentTile.ArrangedShapes.size() - 1; i >=0; i--) { //for all current shapes in the current tile
      Shape testShape = currentTile.ArrangedShapes.get(i);
      if (testShape.inShape(mousePos)) { //if the mouse is within the shape
        testShape.isSelected = true; //select the object
        currentShapeValues(testShape); //set the GUI window to display the selected shapes properties
        break; //exit the loop
      }
    }
  }
}

void mouseDragged() {
  mousePos = new PVector(mouseX, mouseY);
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) { //for all current shapes in the current tile
    Shape testShape = currentTile.ArrangedShapes.get(i);
    if (testShape.isSelected && testShape.inShape(mousePos)) { //if the shape is selected and the users mouse is on the shape
      testShape.pos = mousePos; //drag the shape around to where the mouse is
    }
  }
}

void mouseReleased() {
  mousePos = new PVector(mouseX, mouseY);
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) { //for all current shapes in the current tile
    Shape testShape = currentTile.ArrangedShapes.get(i);
    if (testShape.isSelected) { //if the shape is selected
      testShape.isSelected = false; //unselect the shape
    }
  }
}
