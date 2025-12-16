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
  a.type = arrTypedroplist.getSelectedText();

  float xspacingval = X_Spacing.getValueF(); // Extracts the value of x-spacing from the slider
  if (xspacingval > a.wsize) { //Checks if the spacing is greater than the width of a tile)
    a.xSpacing = xspacingval;
  } else {
    a.xSpacing = a.wsize; //ensures that the image cannot overlap horizontally(ensures spacing is always greater than or equal tothe width)
    X_Spacing.setValue(a.wsize); //updates the slider if the smaller value would cause it to overlap
  }

  float yspacingval = Y_Spacing.getValueF(); // Extracts the value of y-spacing from the slider
  if (yspacingval > a.hsize) { //Checks if the spacing is greater than the height of a tile
    a.ySpacing = yspacingval;
  } else {
    a.ySpacing = a.hsize; //ensures that the image cannot overlap vertically
    Y_Spacing.setValue(a.hsize); //updating the slider to match the condition above
  }

  //Sets width and height of tile to match the user's changes to the GUI
  a.hsize = arrheightslider.getValueI();
  a.wsize = arrwidthslider.getValueI();
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
void iconLocation() {
  iconX++;
  if (iconX >= 4) {
    iconX = 0;
    iconY++;
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
        patternfromLibrary(newPattern);

        currentPattern.ATile = newATile;

        int r = newColour[0];
        int g = newColour[1];
        int b = newColour[2];

        bgColour = color(r, g, b);

        arrguiShow = true;
        editingPastTile = true;
        libraryShow = false;
        windowName = "Create";

        library.setVisible(false);
        startWin.setVisible(false);
        ArrGUI.setVisible(true);
        gui.setVisible(false);
        showWindow();
      }
    }
  }
}

//Function that creates a copy of the saved pattern tile and assigns it to be the current tile
void tilefromLibrary(PatternTile pt) {
  currentTile.ArrangedShapes = new ArrayList();

  for (Shape ts : pt.ArrangedShapes) { //adds a copy of every shape from the saved tile to the current tile's arraylist
    currentTile.ArrangedShapes.add(new Shape(ts.type, new PVector(ts.pos.x, ts.pos.y), ts.hei, ts.wid, int(red(ts.colour)), int(green(ts.colour)), int(blue(ts.colour))));
  }
}

// Function to help create a copy of the arrangement the user wants to save
void patternfromLibrary(Arrangement a) { // (With ar being the copied arrangement)

  float newXspacing = a.xSpacing;
  float newYspacing = a.ySpacing;
  PVector newPos = new PVector(a.pos.x, a.pos.y);
  float newHeight = a.hsize;
  float newWidth = a.wsize;
  String newType = a.type;

  //Copies all respective values using the current pattern's
  currentPattern.xSpacing = newXspacing;
  currentPattern.ySpacing = newYspacing;
  currentPattern.pos = newPos;
  currentPattern.hsize = newHeight;
  currentPattern.wsize = newWidth;
  currentPattern.type = newType;

  //Displays the current arrangement values on the GUI
  arrwidthslider.setValue(newWidth);
  arrheightslider.setValue(newHeight);
  Y_Spacing.setValue(newYspacing);
  X_Spacing.setValue(newXspacing);
}


// Function to help create a copy of the arrangement the user wants to save
void setLibraryArrangementValues(Arrangement ar) { // (With ar being the copied arrangement)

  float newXspacing = currentPattern.xSpacing;
  float newYspacing = currentPattern.ySpacing;
  PVector newPos = new PVector(currentPattern.pos.x, currentPattern.pos.y);
  float newHeight = currentPattern.hsize;
  float newWidth = currentPattern.wsize;
  String newType = currentPattern.type;

  //Copies all respective values using the current pattern's
  ar.xSpacing = newXspacing;
  ar.ySpacing = newYspacing;
  ar.pos = newPos;
  ar.hsize = newHeight;
  ar.wsize = newWidth;
  ar.type = newType;
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

  numAddLib++;
  iconLocation();

  //Saves a copy of the arrangement settings that the user would like to save
  Arrangement ArrangementAddLibrary = new Arrangement(); //creates new placeholder
  setLibraryArrangementValues(ArrangementAddLibrary); //Calls the other helper function that fills the placeholder with a copy of the arrangement values
  SavedPatterns.add(ArrangementAddLibrary); //Adds it to the library arraylist

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
