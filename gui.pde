/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void guiDraw(PApplet appc, GWinData data) { //_CODE_:gui:894024:
  appc.background(230);
} //_CODE_:gui:894024:

public void shapeTypeListClick(GDropList source, GEvent event) { //_CODE_:shapeTypeList:593435:
  changeShapeValues();
} //_CODE_:shapeTypeList:593435:

public void addShapeButtonClick(GButton source, GEvent event) { //_CODE_:addShapeButton:557350:
  Shape newShape = new Shape("ellipse", new PVector(250, 250), 50, 100, 200, 0, 0);
  getShapeValues(newShape);
  this.currentTile.ArrangedShapes.add(newShape);
} //_CODE_:addShapeButton:557350:

public void removeShapeButtonClick(GButton source, GEvent event) { //_CODE_:removeShapeButton:980011:
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) {
    Shape testShape = currentTile.ArrangedShapes.get(i);
    if (testShape.isSelected) {
      currentTile.ArrangedShapes.remove(testShape);
    }
  }
} //_CODE_:removeShapeButton:980011:

public void greenSliderClick(GCustomSlider source, GEvent event) { //_CODE_:greenSlider:386541:
  changeShapeValues();
} //_CODE_:greenSlider:386541:

public void blueSliderChange(GCustomSlider source, GEvent event) { //_CODE_:blueSlider:699806:
  changeShapeValues();
} //_CODE_:blueSlider:699806:

public void redSliderChange(GCustomSlider source, GEvent event) { //_CODE_:redSlider:415599:
  changeShapeValues();
} //_CODE_:redSlider:415599:

public void tilescreenshot(GButton source, GEvent event) { //_CODE_:savetilebutton:575000:
  saveFrame("SavedTile.png");
  currentPattern = new Arrangement();
  
  ArrGUI.setVisible(true);
  arrguiShow = true;
} //_CODE_:savetilebutton:575000:

public void widthSliderChange(GCustomSlider source, GEvent event) { //_CODE_:widthSlider:844943:
  changeShapeValues();
} //_CODE_:widthSlider:844943:

public void heightSliderChange(GCustomSlider source, GEvent event) { //_CODE_:heightSlider:256807:
  changeShapeValues();
} //_CODE_:heightSlider:256807:

public void gridClicked(GCheckbox source, GEvent event) { //_CODE_:gridButton:487609:
  println("gridButton - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:gridButton:487609:

public void clearButtonClick(GButton source, GEvent event) { //_CODE_:clearButton:526941:
  currentTile.ArrangedShapes.clear();
} //_CODE_:clearButton:526941:

public void autoAlignClicked(GCheckbox source, GEvent event) { //_CODE_:autoAlign:584859:
  println("autoAlign - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:autoAlign:584859:

synchronized public void tutDraw(PApplet appc, GWinData data) { //_CODE_:tutorial:852036:
  appc.background(230);
} //_CODE_:tutorial:852036:

public void nextClicked(GButton source, GEvent event) { //_CODE_:next:783622:
  tutPage += 1;
} //_CODE_:next:783622:

public void backClicked(GButton source, GEvent event) { //_CODE_:back:491218:
  tutPage -= 1;
} //_CODE_:back:491218:

public void finishClicked(GButton source, GEvent event) { //_CODE_:finish:597876:
  tutorialShow = false;
} //_CODE_:finish:597876:

synchronized public void startWinDraw(PApplet appc, GWinData data) { //_CODE_:startWin:587259:
  appc.background(230);
} //_CODE_:startWin:587259:

public void startClicked(GButton source, GEvent event) { //_CODE_:start:897298:
  windowName = "Create";
} //_CODE_:start:897298:

public void tutButtonClicked(GButton source, GEvent event) { //_CODE_:tutButton:584753:
  tutPage = 1;
  tutorialShow = true;
} //_CODE_:tutButton:584753:

public void libraryClicked(GButton source, GEvent event) { //_CODE_:libraryButton:312218:
  windowName = "Library";
} //_CODE_:libraryButton:312218:

synchronized public void libraryDraw(PApplet appc, GWinData data) { //_CODE_:library:358380:
  appc.background(230);
} //_CODE_:library:358380:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:ArrGUI:776699:
  appc.background(230);
} //_CODE_:ArrGUI:776699:

public void guibackbutton_clicked(GButton source, GEvent event) { //_CODE_:aguiback:763192:
  //println("aguiback - GButton >> GEvent." + event + " @ " + millis());
  ArrGUI.setVisible(false);
  arrguiShow = false;
} //_CODE_:aguiback:763192:

public void arrdroplist_clicked(GDropList source, GEvent event) { //_CODE_:arrTypedroplist:757056:
  //println("arrTypedroplist - GDropList >> GEvent." + event + " @ " + millis());
  changeArrangementValues(currentPattern);
} //_CODE_:arrTypedroplist:757056:

public void arrxSpacing_slider(GCustomSlider source, GEvent event) { //_CODE_:X_Spacing:703950:
  println("X_Spacing - GCustomSlider >> GEvent." + event + " @ " + millis());
  changeArrangementValues(currentPattern);
} //_CODE_:X_Spacing:703950:

public void arrYSpacing_change1(GCustomSlider source, GEvent event) { //_CODE_:Y_Spacing:640983:
changeArrangementValues(currentPattern);
  
} //_CODE_:Y_Spacing:640983:

public void arrwidthslider_change1(GCustomSlider source, GEvent event) { //_CODE_:arrwidthslider:968973:
  changeArrangementValues(currentPattern);
} //_CODE_:arrwidthslider:968973:

public void arrheislider_change1(GCustomSlider source, GEvent event) { //_CODE_:arrheightslider:213641:
  changeArrangementValues(currentPattern);
} //_CODE_:arrheightslider:213641:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Modello");
  gui = GWindow.getWindow(this, "GUI", 100, 200, 340, 200, JAVA2D);
  gui.noLoop();
  gui.setActionOnClose(G4P.KEEP_OPEN);
  gui.addDrawHandler(this, "guiDraw");
  shapeTypeList = new GDropList(gui, 14, 9, 90, 80, 3, 10);
  shapeTypeList.setItems(loadStrings("list_593435"), 0);
  shapeTypeList.addEventHandler(this, "shapeTypeListClick");
  addShapeButton = new GButton(gui, 15, 44, 80, 30);
  addShapeButton.setText("Add Shape");
  addShapeButton.addEventHandler(this, "addShapeButtonClick");
  removeShapeButton = new GButton(gui, 14, 87, 80, 30);
  removeShapeButton.setText("Remove Shape");
  removeShapeButton.addEventHandler(this, "removeShapeButtonClick");
  label1 = new GLabel(gui, 112, 6, 80, 20);
  label1.setText("Colour Sliders");
  label1.setOpaque(false);
  greenSlider = new GCustomSlider(gui, 112, 48, 100, 40, "grey_blue");
  greenSlider.setLimits(0.0, 0.0, 255.0);
  greenSlider.setNumberFormat(G4P.DECIMAL, 2);
  greenSlider.setOpaque(false);
  greenSlider.addEventHandler(this, "greenSliderClick");
  blueSlider = new GCustomSlider(gui, 112, 72, 100, 40, "grey_blue");
  blueSlider.setLimits(0.0, 0.0, 255.0);
  blueSlider.setNumberFormat(G4P.DECIMAL, 2);
  blueSlider.setOpaque(false);
  blueSlider.addEventHandler(this, "blueSliderChange");
  redSlider = new GCustomSlider(gui, 112, 25, 100, 40, "grey_blue");
  redSlider.setLimits(255.0, 0.0, 255.0);
  redSlider.setNumberFormat(G4P.DECIMAL, 2);
  redSlider.setOpaque(false);
  redSlider.addEventHandler(this, "redSliderChange");
  savetilebutton = new GButton(gui, 247, 152, 80, 30);
  savetilebutton.setText("Visualise Pattern!");
  savetilebutton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  savetilebutton.addEventHandler(this, "tilescreenshot");
  widthSlider = new GCustomSlider(gui, 220, 24, 100, 40, "grey_blue");
  widthSlider.setLimits(100.0, 0.0, 500.0);
  widthSlider.setNumberFormat(G4P.DECIMAL, 2);
  widthSlider.setOpaque(false);
  widthSlider.addEventHandler(this, "widthSliderChange");
  heightSlider = new GCustomSlider(gui, 220, 48, 100, 40, "grey_blue");
  heightSlider.setLimits(100.0, 0.0, 500.0);
  heightSlider.setNumberFormat(G4P.DECIMAL, 2);
  heightSlider.setOpaque(false);
  heightSlider.addEventHandler(this, "heightSliderChange");
  label2 = new GLabel(gui, 220, 6, 80, 20);
  label2.setText("Size Sliders");
  label2.setOpaque(false);
  gridButton = new GCheckbox(gui, 111, 120, 120, 20);
  gridButton.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  gridButton.setText("See grid");
  gridButton.setOpaque(false);
  gridButton.addEventHandler(this, "gridClicked");
  clearButton = new GButton(gui, 13, 153, 80, 30);
  clearButton.setText("Clear");
  clearButton.addEventHandler(this, "clearButtonClick");
  autoAlign = new GCheckbox(gui, 110, 146, 120, 20);
  autoAlign.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  autoAlign.setText("Allow auto align");
  autoAlign.setOpaque(false);
  autoAlign.addEventHandler(this, "autoAlignClicked");
  tutorial = GWindow.getWindow(this, "Tutorial", 0, 400, 480, 240, JAVA2D);
  tutorial.noLoop();
  tutorial.setActionOnClose(G4P.KEEP_OPEN);
  tutorial.addDrawHandler(this, "tutDraw");
  next = new GButton(tutorial, 400, 190, 60, 30);
  next.setText("next");
  next.addEventHandler(this, "nextClicked");
  back = new GButton(tutorial, 30, 190, 60, 30);
  back.setText("back");
  back.addEventHandler(this, "backClicked");
  finish = new GButton(tutorial, 200, 190, 90, 30);
  finish.setText("finish");
  finish.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  finish.addEventHandler(this, "finishClicked");
  startWin = GWindow.getWindow(this, "Modello", 500, 150, 500, 400, JAVA2D);
  startWin.noLoop();
  startWin.setActionOnClose(G4P.KEEP_OPEN);
  startWin.addDrawHandler(this, "startWinDraw");
  start = new GButton(startWin, 210, 170, 80, 30);
  start.setText("START");
  start.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  start.addEventHandler(this, "startClicked");
  tutButton = new GButton(startWin, 210, 230, 80, 30);
  tutButton.setText("Tutorial");
  tutButton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  tutButton.addEventHandler(this, "tutButtonClicked");
  libraryButton = new GButton(startWin, 210, 290, 80, 30);
  libraryButton.setText("Library");
  libraryButton.addEventHandler(this, "libraryClicked");
  library = GWindow.getWindow(this, "Library", 1000, 400, 500, 400, JAVA2D);
  library.noLoop();
  library.setActionOnClose(G4P.KEEP_OPEN);
  library.addDrawHandler(this, "libraryDraw");
  ArrGUI = GWindow.getWindow(this, "Window title", 100, 450, 280, 200, JAVA2D);
  ArrGUI.noLoop();
  ArrGUI.setActionOnClose(G4P.KEEP_OPEN);
  ArrGUI.addDrawHandler(this, "win_draw1");
  aguiback = new GButton(ArrGUI, 8, 163, 95, 30);
  aguiback.setText("Back to Canvas");
  aguiback.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  aguiback.addEventHandler(this, "guibackbutton_clicked");
  ArrangementType = new GLabel(ArrGUI, -2, 3, 125, 20);
  ArrangementType.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  ArrangementType.setText("Arrangement Type");
  ArrangementType.setOpaque(false);
  arrTypedroplist = new GDropList(ArrGUI, 10, 28, 90, 80, 3, 10);
  arrTypedroplist.setItems(loadStrings("list_757056"), 1);
  arrTypedroplist.addEventHandler(this, "arrdroplist_clicked");
  X_Spacing = new GCustomSlider(ArrGUI, 135, 26, 100, 40, "purple18px");
  X_Spacing.setLimits(50.0, 0.0, 500.0);
  X_Spacing.setNumberFormat(G4P.GREEN_SCHEME, 2);
  X_Spacing.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  X_Spacing.setOpaque(false);
  X_Spacing.addEventHandler(this, "arrxSpacing_slider");
  Y_Spacing = new GCustomSlider(ArrGUI, 134, 68, 100, 40, "purple18px");
  Y_Spacing.setLimits(50.0, 0.0, 500.0);
  Y_Spacing.setNumberFormat(G4P.DECIMAL, 2);
  Y_Spacing.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  Y_Spacing.setOpaque(false);
  Y_Spacing.addEventHandler(this, "arrYSpacing_change1");
  Spacing_Labels = new GLabel(ArrGUI, 140, 5, 80, 20);
  Spacing_Labels.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  Spacing_Labels.setText("Spacing (x,y)");
  Spacing_Labels.setOpaque(false);
  SizeSliders = new GLabel(ArrGUI, 115, 114, 123, 20);
  SizeSliders.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  SizeSliders.setText("Size (width, height)");
  SizeSliders.setOpaque(false);
  arrwidthslider = new GCustomSlider(ArrGUI, 114, 138, 95, 40, "grey_blue");
  arrwidthslider.setLimits(50.0, 20.0, 400.0);
  arrwidthslider.setNumberFormat(G4P.DECIMAL, 2);
  arrwidthslider.setOpaque(false);
  arrwidthslider.addEventHandler(this, "arrwidthslider_change1");
  arrheightslider = new GCustomSlider(ArrGUI, 288, 140, 40, 100, "grey_blue");
  arrheightslider.setRotation(PI/2, GControlMode.CORNER);
  arrheightslider.setLimits(50.0, 20.0, 400.0);
  arrheightslider.setNumberFormat(G4P.DECIMAL, 2);
  arrheightslider.setOpaque(false);
  arrheightslider.addEventHandler(this, "arrheislider_change1");
  gui.loop();
  tutorial.loop();
  startWin.loop();
  library.loop();
  ArrGUI.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow gui;
GDropList shapeTypeList; 
GButton addShapeButton; 
GButton removeShapeButton; 
GLabel label1; 
GCustomSlider greenSlider; 
GCustomSlider blueSlider; 
GCustomSlider redSlider; 
GButton savetilebutton; 
GCustomSlider widthSlider; 
GCustomSlider heightSlider; 
GLabel label2; 
GCheckbox gridButton; 
GButton clearButton; 
GCheckbox autoAlign; 
GWindow tutorial;
GButton next; 
GButton back; 
GButton finish; 
GWindow startWin;
GButton start; 
GButton tutButton; 
GButton libraryButton; 
GWindow library;
GWindow ArrGUI;
GButton aguiback; 
GLabel ArrangementType; 
GDropList arrTypedroplist; 
GCustomSlider X_Spacing; 
GCustomSlider Y_Spacing; 
GLabel Spacing_Labels; 
GLabel SizeSliders; 
GCustomSlider arrwidthslider; 
GCustomSlider arrheightslider; 
