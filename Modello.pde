import g4p_controls. *;

String windowName = "Start";
Boolean tutorialShow = false;
int tutPage = 1;
Shape currentShape;
//ArrayList<Shape> PatternShapes;
ArrayList<Arrangement> PatternLayers;

void setup(){
  size(500, 400);
  
  createGUI();
  
}


void draw(){
  displayScreen();
  
  //// DELETE LATER for testing for arrangements:
  //Shape test = new Shape("circle", new PVector(46,46), 30, 30, 255, 255, 30);
  //Arrangement testA = new Arrangement(test);
  //testA.drawHalfDrop();
  
}
