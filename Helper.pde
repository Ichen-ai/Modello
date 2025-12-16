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
    
    currentPattern.saveImage();
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
        currentPattern = new Arrangement(newPattern.xSpacing, newPattern.ySpacing, newPattern.hsize, newPattern.wsize, newPattern.type);
        currentPattern.ATile = newATile;

        int r = newColour[0];
        int g = newColour[1];
        int b = newColour[2];

        bgColour = color(r, g, b);

        arrguiShow = true;
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

//Basic tutorial on how to use the program
void updateTutorialButtons() {
  //Reset all images to hidden first
  startImg.setVisible(false);
  startClickImg.setVisible(false);
  createScreenImg.setVisible(false);
  guiAddShapeImg.setVisible(false);
  selectShapeImg.setVisible(false);
  GUIImg.setVisible(false);
  colPickImg.setVisible(false);
  VPCImg.setVisible(false);
  VPImg.setVisible(false);
  addToLibImg.setVisible(false);
  libraryClickedImg.setVisible(false);
  libraryImg.setVisible(false);
  arrGUIImg.setVisible(false);
  tutorialEnd.setVisible(false);

  //Manage Buttons and Text based on the page
  if (tutPage == 1) {
    next.setVisible(true);
    back.setVisible(false);
    finish.setVisible(false);
    startImg.setVisible(true);
    tutorialLabel.setText("Welcome to Modello, the ULTIMATE pattern maker for YOU!*Note: If you are new, keeping the tutorial open as you work on your pattern will be helpful");
  } 
  else if (tutPage == 2) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    startClickImg.setVisible(true);
    tutorialLabel.setText("Click on the START button to begin your pattern adventure");
  } 
  else if (tutPage == 3) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    createScreenImg.setVisible(true);
    tutorialLabel.setText("Welcome to the create screen, this is where you will create your pattern tile for your pattern");
  } 
  else if (tutPage == 4) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    guiAddShapeImg.setVisible(true);
    tutorialLabel.setText("The GUI contains many tools to aid you along this journey. Start by clicking on the add shape button");
  } 
  else if (tutPage == 5) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    selectShapeImg.setVisible(true);
    tutorialLabel.setText("Congrats on adding your first shape. Try selecting the shape by clicking it with your left mouse button");
  } 
  else if (tutPage == 6) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    GUIImg.setVisible(true);
    tutorialLabel.setText("Now you can modify your shape however you like with the tools in your GUI");
  } 
  else if (tutPage == 7) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    colPickImg.setVisible(true);
    tutorialLabel.setText("The colour picker window is an advanced version of the colour picker seen on the main GUI. It allows you to preview your colour before making the final and permanent decision");
  } 
  else if (tutPage == 8) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    VPCImg.setVisible(true);
    tutorialLabel.setText("When you complete your shape, press visualize pattern, this allows you to view your creation in full");
  } 
  else if (tutPage == 9) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    VPImg.setVisible(true);
    tutorialLabel.setText("Try playing around with different arrangement types, spacing, and size to find the best way to display your pattern");
  } 
  else if (tutPage == 10) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    addToLibImg.setVisible(true);
    tutorialLabel.setText("To save your image, click the Save to Library button.");
  } 
  else if (tutPage == 11) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    libraryClickedImg.setVisible(true);
    tutorialLabel.setText("To view your saved image, click the library button");
  } 
  else if (tutPage == 12) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    libraryImg.setVisible(true);
    tutorialLabel.setText("Here, you can choose your desired saved image and return to working on them any time");
  } 
  else if (tutPage == 13) {
    next.setVisible(true);
    back.setVisible(true);
    finish.setVisible(false);
    arrGUIImg.setVisible(true);
    tutorialLabel.setText("When you wish to use your pattern, click on the export button. This saves your pattern as a .png which can be easily accessed in the savedPhotos folder");
  } 
  else {
    // End page
    next.setVisible(false);
    back.setVisible(true);
    finish.setVisible(true);
    tutorialEnd.setVisible(true);
    tutorialLabel.setText("");
  }
}
