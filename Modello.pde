// Importing necessary tools
import g4p_controls. *;
import java.io.File;

// Initialising values
String windowName = "Start";
Boolean tutorialShow = false;
Boolean libraryShow = false;
int tutPage = 1;
PFont titleFont;
int screenshotNum;
int numAddLib = -1; //starts at negative one because first value is 0 in a list (after it has been added)
String imageFileNum;
int iconX = 0;
int iconY = 0;
int drawn = 0;
boolean shouldExit = false;
boolean backToDraw = false;
boolean findingColour = false;

// Creating placeholder Tile and Arrangement variables to be filled as they are created
PatternTile currentTile = new PatternTile();
Arrangement currentPattern;

//Arraylists to store saved values
ArrayList<Arrangement> SavedPatterns = new ArrayList(); //complete patterns saved (with arrangement settings and values)
ArrayList<PatternTile> SavedTiles = new ArrayList(); // complete tiles saved (with shape settings and values)
ArrayList<GImageButton> libraryImgs = new ArrayList(); //an arraylist that stores the saved images as icons
ArrayList<PImage> SavedTileImgs = new ArrayList(); //an arraylist that stores the saved tile images
ArrayList<int[]> savedBGColors = new ArrayList<int[]>(); //an arraylist that stores the background colours for the saved patterns

//More initialising and creating of global variables
Boolean arrguiShow = false;
int savedPTilenum = 1;

color bgColour = color(100);
String TileStatus = "creating";
boolean editingPastTile = false;

 //Variables to track when the saving buttons are clicked
Boolean SaveConfirmed = false;
float SaveTime;

Boolean LibrConfirmed = false;
float LibrTime;

Boolean requestLibSave = false;


//Global GImageButton Variables
GImageButton title, loadPattern, startImg, startClickImg, createScreenImg, guiAddShapeImg, selectShapeImg, GUIImg, colPickImg, VPCImg, VPImg, addToLibImg, libraryClickedImg, libraryImg, arrGUIImg, tutorialEnd;
GLabel tutorialLabel;

void setup() {
  cleanupTempFiles(); //Clean out icons from previous usage
  size(500, 500);
  createGUI(); //Creating GUI controls
  
  // Initialize G4P classes
  title = new GImageButton(startWin, 80, 34, 333, 156, new String[] { "Assets/MODELLO.png" } );
  startImg = new GImageButton(tutorial, 120, 50, 250, 220, new String[] { "Assets/start.png"} );
  startClickImg = new GImageButton(tutorial, 100, 50, 300, 220, new String[] { "Assets/startClick.png"} );
  createScreenImg = new GImageButton(tutorial, 100, 20, 300, 270, new String[] { "Assets/createScreen2.png"} );
  guiAddShapeImg = new GImageButton(tutorial, 120, 50, 250, 220, new String[] { "Assets/guiAddShape.png"} );
  selectShapeImg = new GImageButton(tutorial, 100, 50, 300, 220, new String[] { "Assets/selectShape.png"} );
  GUIImg = new GImageButton(tutorial, 120, 50, 250, 220, new String[] { "Assets/gui2.png"} );
  colPickImg = new GImageButton(tutorial, 120, 50, 250, 220, new String[] { "Assets/colPick.png"} );
  VPCImg = new GImageButton(tutorial, 120, 50, 250, 220, new String[] { "Assets/visualizePatternClicked.png"} );
  VPImg = new GImageButton(tutorial, 120, 50, 250, 220, new String[] { "Assets/visualizePattern.png"} );
  addToLibImg = new GImageButton(tutorial, 120, 50, 250, 220, new String[] { "Assets/addToLibrary.png"} );
  libraryClickedImg = new GImageButton(tutorial, 120, 50, 250, 220, new String[] { "Assets/libraryClicked.png"} );
  libraryImg = new GImageButton(tutorial, 120, 50, 250, 220, new String[] { "Assets/libraryNew.png"} );
  arrGUIImg = new GImageButton(tutorial, 120, 70, 250, 220, new String[] { "Assets/ArrGUINew.png"} );
  tutorialEnd = new GImageButton(tutorial, 120, 50, 250, 220, new String[] { "Assets/MODELLOTUT.png"} );
  tutorialLabel = new GLabel(tutorial, 50, 8, 380, 50);
    
  //sets these windows/gimagebuttons as false (not showing) at the start of the program
  startWin.setVisible(true);
  library.setVisible(false);
  tutorial.setVisible(false);
  gui.setVisible(false);
  ArrGUI.setVisible(false);
  startImg.setVisible(false);
  startClickImg.setVisible(false);
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
  colPick.setVisible(false);
  
  //hide main window at the start of the program as that's where the tool is drawn
  hideWindow();
}


void draw() {
  displayScreen(); // Displays the current screen
  background(bgColour); 

  imageMode(CENTER); //Positions images by their central coordinates

  if (!arrguiShow) {
    currentTile.drawTile(); // Draws the tiles if arrangement screen is not open
  }

  if (arrguiShow) {
    background(bgColour);
    currentPattern.drawPattern(); //Draws pattern with arrangements if on that screen
  }
  
  if (TileStatus.equals("visualising")){ //Calls helper function to take screenshot after the grid/selection border is removed
    VisualisePattern(currentTile);
  }
  
  //Changes the text of the export pattern back after 2 seconds if the user has clicked on it
  if (SaveConfirmed && millis() - SaveTime > 2000){
    patternSave.setText("Export Pattern");
    SaveConfirmed = false;
  }
  
  //Resets the text of the save to library pattern back after 3 seconds if the user has clicked on it
  if (LibrConfirmed && millis() - LibrTime > 3000){
    addLibraryButton.setText("Add to Library");
    LibrConfirmed = false;
  }
  
  //execute the request to save, put at the end of the program to ensure entire frame loaded
  if (requestLibSave) {
    executeAddToLibrary();
    requestLibSave = false;
  }
}

//Function to close the program
void exit(){
  System.exit(0);
}

//cleanup icons at the start of the program
void cleanupTempFiles() {
  File dir = new File(sketchPath(""));
  File[] files = dir.listFiles();
  if (files != null) {
    for (File f : files) {
      // Only delete specific icon files
      if (f.getName().startsWith("libraryIcon") && f.getName().endsWith(".png")) {
        try { f.delete(); } catch (Exception e) { }
      }
    }
  }
}

//function to hide windows
void hideWindow() {
  noLoop();
  surface.setVisible(false);
}

//function to show windows
void showWindow() {
  surface.setVisible(true);
  loop();
}
