//Helper Functions

//Gets the current values of the GUI and applies it to the current (selected) shape
void getShapeValues(Shape s) {
  s.type = shapeTypeList.getSelectedIndex();
  int r = redSlider.getValueI();
  int g = greenSlider.getValueI();
  int b = blueSlider.getValueI();
  s.colour = color(r, g, b);

  s.hei = heightSlider.getValueI();
  s.wid = widthSlider.getValueI();
}

// Calls the function above after determining which shape is selected (to apply shape values)
void changeShapeValues() {
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) {
    Shape testShape = currentTile.ArrangedShapes.get(i);
    if (testShape.isSelected) {
      getShapeValues(testShape);
    }
  }
}


void currentShapeValues(Shape s) {
  redSlider.setValue(red(s.colour));
  greenSlider.setValue(green(s.colour));
  blueSlider.setValue(blue(s.colour));
  heightSlider.setValue(s.hei);
  widthSlider.setValue(s.wid);
  shapeTypeList.setSelected(s.type);
}

// Changes the background colour based on current slider values
void changeBgColour() {
  int r = bgRedSlider.getValueI();
  int g = bgGreenSlider.getValueI();
  int b = bgBlueSlider.getValueI();
  
  bgColour = color(r, g, b);
}

// Applies the changes the user has made to the arrangement GUI 
void changeArrangementValues(Arrangement a) {
  a.type = arrTypedroplist.getSelectedText();
  
  float xspacingval = X_Spacing.getValueF(); // Extracts the value of x-spacing from the slider
  if (xspacingval > a.wsize){ //Checks if the spacing is greater than the width of a tile)
    a.xSpacing = xspacingval;
  }
  
  else{
    a.xSpacing = a.wsize; //ensures that the image cannot overlap horizontally(ensures spacing is always greater than or equal tothe width)
    X_Spacing.setValue(a.wsize); //updates the slider if the smaller value would cause it to overlap
  }
  
  float yspacingval = Y_Spacing.getValueF(); // Extracts the value of y-spacing from the slider
  if (yspacingval > a.hsize){ //Checks if the spacing is greater than the height of a tile
    a.ySpacing = yspacingval;
  }
  
  else{
    a.ySpacing = a.hsize; //ensures that the image cannot overlap vertically
    Y_Spacing.setValue(a.hsize); //updating the slider to match the condition above
  }

  //Sets width and height of tile to match the user's changes to the GUI
  a.hsize = arrheightslider.getValueI();
  a.wsize = arrwidthslider.getValueI();
}

//Helper function to prepare the current  screen for screenshotting
void VisualisePattern(PatternTile p){  
  
  //Called when the user first presses the "Visualise Button" pattern
  if (TileStatus.equals("preparing")){
    p.seeGrid = false; //Turns off the grid 
    gridButton.setSelected(false); //Updates the gui to unselect the grid button
    
    for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) {
      if (currentTile.ArrangedShapes.get(i).isSelected) currentTile.ArrangedShapes.get(i).isSelected = false;
    }
    
    redraw();
    TileStatus = "visualising";
  }
  
  //Called in the next frame when the tile is prepared
  else if(TileStatus.equals("visualising")){
    saveFrame("SavedTile.png"); //Saves a screenshot of the current pattern tile
    currentPattern = new Arrangement(); //Creates a new arrangement object that uses the image just saved
    
    //Updates the GUI screens 
    ArrGUI.setVisible(true); //Shows arrangement GUI screen
    arrguiShow = true;
    
    gui.setVisible(false); //Hides the tile's GUI screen
    arrTypedroplist.setSelected(0); //Ensures the drop list value is set to grid initially
    
    TileStatus = "creating"; //Updates status
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
        
        arrguiShow = true;
        editingPastTile = true;
        windowName = "Create";
      }
    }
  }
}

// Function to help create a copy of the arrangement the user wants to save
void setLibraryArrangementValues(Arrangement ar){ // (With ar being the copied arrangement)

    //Copies all respective values using the current pattern's
    ar.xSpacing = currentPattern.xSpacing;
    ar.ySpacing = currentPattern.ySpacing;
    ar.pos = new PVector(currentPattern.pos.x,currentPattern.pos.y);
    ar.hsize = currentPattern.hsize;
    ar.wsize = currentPattern.wsize;
    ar.type = currentPattern.type;   
}

// Function to help create a copy of the current pattern tile the user wants to save
void setLibraryTileValues(PatternTile ti){ //(with ti being the current pattern tile)
    ti.ArrangedShapes = new ArrayList();
    
    for (Shape ts: currentTile.ArrangedShapes){ //adds a copy of every shape involved in the current tile to the copy's arraylist
      ti.ArrangedShapes.add(new Shape(ts.type, ts.pos, ts.hei, ts.wid, int(red(ts.colour)), int(green(ts.colour)), int(blue(ts.colour))));
    }
  
}

//Saves a screenshot of the entire pattern to the Library
void executeAddToLibrary() {
  PImage icon = get();
  
  icon.save("libraryIcon" + numAddLib + ".png");
  imageFileNum = "libraryIcon" + numAddLib + ".png";

  libraryImgs.add(new GImageButton(library, 56 + 100 * iconX, 30 + 100 * iconY, 75, 75, new String[] { imageFileNum }));
  
  numAddLib++;
  iconLocation();

  Arrangement ArrangementAddLibrary = new Arrangement();
  setLibraryArrangementValues(ArrangementAddLibrary); 
  SavedPatterns.add(ArrangementAddLibrary);
  
  PatternTile TileAddLibrary = new PatternTile();
  setLibraryTileValues(TileAddLibrary); 
  SavedTiles.add(TileAddLibrary);
  
  PImage TileImgAddLibrary = loadImage("SavedTile.png");
  SavedTileImgs.add(TileImgAddLibrary);
}
