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
  tutorial.setVisible(false);
  surface.setVisible(false);
  
}


void draw(){
  //REMOVE LATER, JUST FOR TEST
  displayScreen();
  
  
}
