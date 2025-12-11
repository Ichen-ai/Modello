import g4p_controls. *;

String windowName = "Start";
Boolean tutorialShow = false;
int tutPage = 1;
PFont titleFont;
int screenshotNum;
int numAddLib = 0;
String imageFileNum;
int iconX = 0;
int iconY = 0;

//Shape currentShape;
PatternTile currentTile = new PatternTile();
Arrangement currentPattern;

ArrayList<Arrangement> Patterns; //complete patterns saved, might not be needed we will see
ArrayList<GImageButton> libraryImgs = new ArrayList(); //an arraylist that stores the saved images as icons

Boolean arrguiShow = false;

int savedPTilenum = 1;

color bgColour = color(100);

String TileStatus = "creating";

GImageButton title, loadPattern;

void setup() {
  size(500, 500);
  createGUI();
  
  //sets these as false at the start of the program
  library.setVisible(false);
  tutorial.setVisible(false);
}


void draw() {
  displayScreen();
  background(bgColour);

  imageMode(CENTER);

  if (!arrguiShow) {
    currentTile.drawTile();
  }

  if (arrguiShow) {
    background(bgColour);
    currentPattern.drawPattern();
  }
  
  if (TileStatus.equals("visualising")){
    VisualisePattern(currentTile);
  }
}
