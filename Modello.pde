import g4p_controls. *;

String windowName = "Start";
Boolean tutorialShow = false;
int tutPage = 1;
PFont titleFont;
int screenshotNum;

//Shape currentShape;
PatternTile currentTile = new PatternTile();
Arrangement currentPattern;

ArrayList<Arrangement> Patterns; //complete patterns saved, might not be needed we will see

Boolean arrguiShow = false;

int savedPTilenum = 1;

color bgColour = color(255);

GImageButton title;




void setup() {
  size(500, 500);
  createGUI();
  
  title = new GImageButton(startWin, 140, 34, 222, 104, new String[] { "MODELLO.png", "MODELLO.png", "MODELLO.png" } );

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
}
