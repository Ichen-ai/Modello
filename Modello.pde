import g4p_controls. *;

String windowName = "Start";
Boolean tutorialShow = false;
int tutPage = 1;
PFont titleFont;

//Shape currentShape;
PatternTile currentTile = new PatternTile();
Arrangement currentPattern;

ArrayList<Arrangement> Patterns; //complete patterns saved, might not be needed we will see

Boolean arrguiShow = false;

int savedPTilenum = 1;

color bgColour = color(255);




void setup() {
  size(500, 500);
  createGUI();
}


void draw() {
  displayScreen();
  background(bgColour);

  imageMode(CENTER);

  if (!arrguiShow) {
    currentTile.drawTile();
  }

  if (arrguiShow) {
    currentPattern.drawPattern();
  }
}
