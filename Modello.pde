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
int numAddLib = 0;
String imageFileNum;
int iconX = 0;
int iconY = 0;
int drawn = 0;
boolean shouldExit = false;

// Creating placeholder Tile and Arrangement
PatternTile currentTile = new PatternTile();
Arrangement currentPattern;

//Arraylists to store saved values
ArrayList<Arrangement> SavedPatterns = new ArrayList(); //complete patterns saved (with arrangement settings and values)
ArrayList<PatternTile> SavedTiles = new ArrayList(); // complete tiles saved (with shape settings and values)
ArrayList<GImageButton> libraryImgs = new ArrayList(); //an arraylist that stores the saved images as icons
ArrayList<PImage> SavedTileImgs = new ArrayList(); //an arraylist that stores the saved tile images

//More initialising and creating of global variables
Boolean arrguiShow = false;
int savedPTilenum = 1;

color bgColour = color(100);
String TileStatus = "creating";

Boolean SaveConfirmed = false;
float SaveTime;

Boolean LibrConfirmed = false;
float LibrTime;

GImageButton title, loadPattern;

void setup() {
  size(500, 500);
  createGUI(); //Creating GUI controls
  
  //sets these windows as false (not showing) at the start of the program
  library.setVisible(false);
  tutorial.setVisible(false);
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
  
  if (shouldExit == true){
    exit();
    return;
  }
}


void exit(){
  for (int i = 0; i < numAddLib; i++){    
    File f = dataFile("libraryIcon"+i+".png");
    if (f.exists()) f.delete();
  }
    
  if (gui != null) gui.forceClose();
  if (tutorial != null) tutorial.forceClose();
  if (startWin != null) startWin.forceClose();
  if (library != null) library.forceClose();
  if (ArrGUI != null) ArrGUI.forceClose();
  
  super.exit();
}
