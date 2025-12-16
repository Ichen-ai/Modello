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
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) { //tests through all shapes
    Shape testShape = currentTile.ArrangedShapes.get(i);
    if (testShape.isSelected) { //if the shape is selected
      getShapeValues(testShape); //update the shape values
    }
  }
}


//Updates the sliders on the GUI windows with the values of the shape that is selected
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
  bgColour = color(r, g, b); //updates background colour
}


//Used to determine what colour is underneath the users mouse for the colour picker
void getColour(PVector p) {
  color c = bgColour; //default colour is the background colour
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) {
    Shape testShape = currentTile.ArrangedShapes.get(i);
    if (testShape.inShape(p)) { //if the users mouse clicked a shape, get shape colour
      c = testShape.colour;
    }
  }
  colPickRedSlider.setValue(red(c)); //set the values of the colour in the colour picker
  colPickGreenSlider.setValue(green(c));
  colPickBlueSlider.setValue(blue(c));
}


// Applies the changes the user has made to the arrangement GUI
void changeArrangementValues(Arrangement a) {
  a.type = arrTypedroplist.getSelectedIndex();
  a.hsize = arrheightslider.getValueI();
  a.wsize = arrwidthslider.getValueI(); 
  float xspacingval = X_Spacing.getValueF(); // Extracts the value of x-spacing from the slider
  float yspacingval = Y_Spacing.getValueF(); // Extracts the value of y-spacing from the slider
  
  
  if (xspacingval < a.wsize) { //Checks if the spacing is smaller than the width of a tile)
    a.xSpacing = a.wsize; //ensures that the image cannot overlap horizontally(ensures spacing is always greater than or equal tothe width)
    X_Spacing.setValue(a.wsize); //updates the slider if the smaller value would cause it to overlap
  } else {
    a.xSpacing = X_Spacing.getValueF();
  }

  if (yspacingval < a.hsize) { //Checks if the spacing is greater than the height of a tile
    a.ySpacing = a.hsize; //ensures that the image cannot overlap vertically
    Y_Spacing.setValue(a.hsize); //updating the slider to match the condition above  
  } else {
    a.ySpacing = Y_Spacing.getValueF();
  }
}


//sets the GUI sliders to the current patterns values
void currentArrangementValues() {
  arrTypedroplist.setSelected(currentPattern.type);
  arrheightslider.setValue(currentPattern.hsize);
  arrwidthslider.setValue(currentPattern.wsize);
  X_Spacing.setValue(currentPattern.xSpacing);
  Y_Spacing.setValue(currentPattern.ySpacing);
}


//Helper function to prepare the current  screen for screenshotting
void VisualisePattern(PatternTile p) {
  //Called when the user first presses the "Visualise Button" pattern
  if (TileStatus.equals("preparing")) {
    p.seeGrid = false; //Turns off the grid
    gridButton.setSelected(false); //Updates the gui to unselect the grid button
    for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) {
      currentTile.ArrangedShapes.get(i).isSelected = false;
    }
    TileStatus = "visualising";
    redraw();
  }
  //Called in the next frame when the tile is prepared
  else if (TileStatus.equals("visualising")) {
    saveFrame("SavedTile.png"); //Saves a screenshot of the current pattern tile   
    currentPattern.saveImage(); //updates ATile in pattern with the image
    
    //Updates the GUI screens
    ArrGUI.setVisible(true); //Shows arrangement GUI screen
    arrguiShow = true;
    gui.setVisible(false); //Hides the tile's GUI screen
    arrTypedroplist.setSelected(0); //Ensures the drop list value is set to grid initially

    TileStatus = "creating"; //Updates status
  }
}


//math the icon locations
void iconLocation() {
  iconX++;
  if (iconX >= 4) {
    iconX = 0;
    iconY++;
    if (iconY >= 3) {
      iconY = 0;
    }
  }
}


//event handler. This sets what happens when the user clicks on the buttons in library
public void handleButtonEvents(GImageButton source, GEvent event) {
  if (event == GEvent.CLICKED) {
    for (int i = 0; i <= numAddLib; i++) {
      if (source == libraryImgs.get(i)) {

        //Extracts the pattern saved in the library based on which pattern the user wishes to access
        PatternTile newTile = SavedTiles.get(i);
        Arrangement newPattern = SavedPatterns.get(i);
        PImage newATile = SavedTileImgs.get(i);
        int[] newColour = savedBGColors.get(i);

        // Calls helper functions so that the current pattern displayed is the one saved
        tilefromLibrary(newTile);
        currentPattern = new Arrangement(newPattern.xSpacing, newPattern.ySpacing, newPattern.hsize, newPattern.wsize, newPattern.type);
        currentPattern.ATile = newATile;

        int r = newColour[0]; //Extracts the rgb values from the array
        int g = newColour[1];
        int b = newColour[2];
        bgColour = color(r, g, b); // Sets the background colour to be the saved colour

        arrguiShow = true;

        //Shows and hides relevant windows
        library.setVisible(false);
        startWin.setVisible(false);
        ArrGUI.setVisible(true);
        gui.setVisible(false);
        showWindow();
     }
    }
  }
}

//used to update the saved patterns shown on screen depending on what page of library is shown
void updateLibraryButtons() {
  for (int i = 0; i < libraryImgs.size(); i ++) { //for all saved patterns
    if (i/12 + 1 == libPage) { //if the current pattern should appear on the current page
      libraryImgs.get(i).setVisible(true); //set it visible
    } else libraryImgs.get(i).setVisible(false); //otherwise set it false
  }
}


//Function that creates a copy of the saved pattern tile and assigns it to be the current tile
void tilefromLibrary(PatternTile pt) {
  currentTile.ArrangedShapes = new ArrayList();
  for (Shape ts : pt.ArrangedShapes) { //adds a copy of every shape from the saved tile to the current tile's arraylist
    currentTile.ArrangedShapes.add(new Shape(ts.type, new PVector(ts.pos.x, ts.pos.y), ts.hei, ts.wid, int(red(ts.colour)), int(green(ts.colour)), int(blue(ts.colour))));
  }
}


// Function to help create a copy of the current pattern tile the user wants to save
void setLibraryTileValues(PatternTile ti) { //(with ti being the current pattern tile)
  ti.ArrangedShapes = new ArrayList();
  for (Shape ts : currentTile.ArrangedShapes) { //adds a copy of every shape involved in the current tile to the copy's arraylist
    ti.ArrangedShapes.add(new Shape(ts.type, new PVector(ts.pos.x, ts.pos.y), ts.hei, ts.wid, int(red(ts.colour)), int(green(ts.colour)), int(blue(ts.colour))));
  }
}


//Function that saves the pattern to the library
void executeAddToLibrary() {
  PImage icon = get();

  //Saves a screenshot of the pattern to be used as a library icon
  icon.save("libraryIcon" + numAddLib + ".png");
  imageFileNum = "libraryIcon" + numAddLib + ".png";

  libraryImgs.add(new GImageButton(library, 56 + 100 * iconX, 30 + 100 * iconY, 75, 75, new String[] { imageFileNum })); //Adds the library icon
  iconLocation();
  numAddLib++;
  updateLibraryButtons();
  
  //Saves a copy of the arrangement settings that the user would like to save
  SavedPatterns.add(new Arrangement(currentPattern.xSpacing, currentPattern.ySpacing, currentPattern.hsize, currentPattern.wsize, currentPattern.type));

  //Saves a copy og the pattern tile settings that the user would like to save to library
  PatternTile TileAddLibrary = new PatternTile(); // Creates new placeholder tile
  setLibraryTileValues(TileAddLibrary);  //Calls the other helper function that fills the placeholder with the shapes in the tile
  SavedTiles.add(TileAddLibrary); //Adds it to the library arraylist

  //Saves the pattern tile to the library arraylist
  PImage TileImgAddLibrary = loadImage("SavedTile.png");
  SavedTileImgs.add(TileImgAddLibrary);

  //Saves the background colour of the pattern to the library
  savedBGColors.add(new int[]{int(red(bgColour)), int(green(bgColour)), int(blue(bgColour))});
}
