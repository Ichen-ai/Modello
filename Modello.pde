import g4p_controls. *;

String windowName = "Start";
Boolean tutorialShow = false;
int tutPage = 1;

//Shape currentShape;
PatternTile currentTile = new PatternTile();
Arrangement currentPattern;

ArrayList<Arrangement> Patterns; //complete patterns saved, might not be needed we will see

int savedPTilenum = 1;




void setup() {
  size(500, 500);
  createGUI();
}


void draw() {
  displayScreen();
  background(200);

  imageMode(CENTER);

  currentTile.drawTile();

  //// DELETE LATER for testing for arrangements:
  //Shape test = new Shape("triangle", new PVector(46,46), 30, 30, 255, 60, 30);
  //Arrangement testA = new Arrangement(test);
  //testA.drawBrick();
}
