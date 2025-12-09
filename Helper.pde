
void getShapeValues(Shape s) {
  s.type = shapeTypeList.getSelectedText();
  int r = redSlider.getValueI();
  int g = greenSlider.getValueI();
  int b = blueSlider.getValueI();
  s.colour = color(r, g, b);

  s.hei = heightSlider.getValueI();
  s.wid = widthSlider.getValueI();
}

void changeShapeValues() {
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) {
    Shape testShape = currentTile.ArrangedShapes.get(i);
    if (testShape.isSelected) {
      getShapeValues(testShape);
    }
  }
}

void changeBgColour() {
  int r = bgRedSlider.getValueI();
  int g = bgGreenSlider.getValueI();
  int b = bgBlueSlider.getValueI();
  
  bgColour = color(r, g, b);

}

void changeArrangementValues(Arrangement a) {
  a.type = arrTypedroplist.getSelectedText();
  
  float xspacingval = X_Spacing.getValueF();
  if (xspacingval > a.wsize){
    a.xSpacing = xspacingval;
  }
  else{
    a.xSpacing = a.wsize;
    X_Spacing.setValue(a.wsize);
  }
  float yspacingval = Y_Spacing.getValueF();
  if (yspacingval > a.hsize){
    a.ySpacing = yspacingval;
  }
  else{
    a.ySpacing = a.hsize;
    Y_Spacing.setValue(a.hsize);
  }

  a.hsize = arrheightslider.getValueI();
  a.wsize = arrwidthslider.getValueI();
}

void VisualisePattern(PatternTile p){  
  if (TileStatus.equals("preparing")){
    p.seeGrid = false;
    gridButton.setSelected(false);
    
    TileStatus = "visualising";
  }
  
  else if(TileStatus.equals("visualising")){
    saveFrame("SavedTile.png");
    currentPattern = new Arrangement();
    
    ArrGUI.setVisible(true);
    arrguiShow = true;
    
    gui.setVisible(false);
    arrTypedroplist.setSelected(1);
    
    TileStatus = "creating";
  }
}

public void loadPatternClicked(GImageButton source, GEvent event) {
  
}
