
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
    arrTypedroplist.setSelected(0);
    
    TileStatus = "creating";
  }
}

//math the icon locations
void iconLocation(){
  iconX++;
  if (iconX >= 4){
    iconX = 0;
    iconY++;
  }
}

//event handler. This sets what happens when the user clicks on the buttons in library
public void handleButtonEvents(GImageButton source, GEvent event) {
  if (event == GEvent.CLICKED) {
    for (int i = 0; i <= numAddLib; i++){
      if (source == libraryImgs.get(i)){
        currentTile = SavedTiles.get(i);
        currentPattern = SavedPatterns.get(i);
        currentPattern.ATile = SavedTileImgs.get(i);
        
        windowName = "Create";
        arrguiShow = true;
        library.setVisible(false);
      }
    }
  }
}

// Function to help copy over the values the user wants to save
void setLibraryArrangementValues(Arrangement ar){
    ar.xSpacing = currentPattern.xSpacing;
    ar.ySpacing = currentPattern.ySpacing;
    ar.pos = new PVector(currentPattern.pos.x,currentPattern.pos.y);
    ar.hsize = currentPattern.hsize;
    ar.wsize = currentPattern.wsize;
    ar.type = currentPattern.type;   
}


void setLibraryTileValues(PatternTile ti){
    ti.ArrangedShapes = new ArrayList();
    for (Shape ts: currentTile.ArrangedShapes){
      ti.ArrangedShapes.add(new Shape(ts.type, ts.pos, ts.hei, ts.wid, int(red(ts.colour)), int(green(ts.colour)), int(blue(ts.colour))));
    }
}
