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

// Creating placeholder Tile and Arrangement
PatternTile currentTile = new PatternTile();
Arrangement currentPattern;

//Arraylists to store saved values
ArrayList<Arrangement> SavedPatterns = new ArrayList(); //complete patterns saved (with arrangement settings and values)
ArrayList<PatternTile> SavedTiles = new ArrayList(); // complete tiles saved (with shape settings and values)
ArrayList<GImageButton> libraryImgs = new ArrayList(); //an arraylist that stores the saved images as icons

//More initialising and creating of global variables
Boolean arrguiShow = false;
int savedPTilenum = 1;

color bgColour = color(100);
String TileStatus = "creating";

Boolean SaveConfirmed = false;
float SaveTime;

GImageButton title, loadPattern;

void setup() {
  size(500, 500);
  createGUI(); //Creating GUI controls
  frameRate(120);
  
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
  
  if (SaveConfirmed && millis() - SaveTime > 2000){
    patternSave.setText("Export Pattern");
    SaveConfirmed = false;
  }
}


void exit(){
  for (int i = 0; i <= numAddLib; i++){    
    File f = dataFile("libraryIcon"+numAddLib+".png");
    if (f.exists()){
      if (f.delete()){
        println("deleted");
      }
      else{
        println("not deleted");
      }
    }
    
    else{
      println(f, "doesn't exist");
    }
  }
  
  super.exit();
}
