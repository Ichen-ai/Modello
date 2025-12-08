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
  
  gui.setVisible(false);
  arrTypedroplist.setSelected(1);
} //_CODE_:savetilebutton:575000:

public void widthSliderChange(GCustomSlider source, GEvent event) { //_CODE_:widthSlider:844943:
  changeShapeValues();
} //_CODE_:widthSlider:844943:

public void heightSliderChange(GCustomSlider source, GEvent event) { //_CODE_:heightSlider:256807:
  changeShapeValues();
} //_CODE_:heightSlider:256807:

public void gridClicked(GCheckbox source, GEvent event) { //_CODE_:gridButton:487609:
  if (! currentTile.seeGrid) {
    currentTile.seeGrid = true;
  } else currentTile.seeGrid = false;
} //_CODE_:gridButton:487609:

public void clearButtonClick(GButton source, GEvent event) { //_CODE_:clearButton:526941:
  currentTile.ArrangedShapes.clear();
} //_CODE_:clearButton:526941:

public void autoAlignClicked(GCheckbox source, GEvent event) { //_CODE_:autoAlign:584859:
  if (! currentTile.autoAlign) {
    currentTile.autoAlign = true;
  } else currentTile.autoAlign = false;
} //_CODE_:autoAlign:584859:

public void bgRedSliderChange(GCustomSlider source, GEvent event) { //_CODE_:bgRedSlider:713595:
  changeBgColour();
} //_CODE_:bgRedSlider:713595:

public void bgGreenSliderChange(GCustomSlider source, GEvent event) { //_CODE_:bgGreenSlider:262593:
  changeBgColour();
} //_CODE_:bgGreenSlider:262593:

public void bgBlueSliderChange(GCustomSlider source, GEvent event) { //_CODE_:bgBlueSlider:417099:
  changeBgColour();
} //_CODE_:bgBlueSlider:417099:

public void fwdShapeButtonClick(GButton source, GEvent event) { //_CODE_:fwdShapeButton:317310:
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) {
    Shape fwdShape = currentTile.ArrangedShapes.get(i);
    
    if (fwdShape.isSelected && i < currentTile.ArrangedShapes.size() - 1) {
      Shape bckShape = currentTile.ArrangedShapes.get(i+1);
      currentTile.ArrangedShapes.set(i, bckShape);
      currentTile.ArrangedShapes.set(i+1, fwdShape);
    }
  }
} //_CODE_:fwdShapeButton:317310:

public void bwkShapeButtonClicked(GButton source, GEvent event) { //_CODE_:bwkShapeButton:867870:
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) {
    Shape bckShape = currentTile.ArrangedShapes.get(i);
    
    if (bckShape.isSelected && i > 0) {
      Shape fwdShape = currentTile.ArrangedShapes.get(i-1);
      currentTile.ArrangedShapes.set(i, fwdShape);
      currentTile.ArrangedShapes.set(i-1, bckShape);
    }
  }
} //_CODE_:bwkShapeButton:867870:

public void toStartClicked(GButton source, GEvent event) { //_CODE_:toStart:677194:
  windowName = "Start";
} //_CODE_:toStart:677194:

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

public void titleClicked(GImageButton source, GEvent event) { //_CODE_:title:537473:
} //_CODE_:title:537473:

synchronized public void libraryDraw(PApplet appc, GWinData data) { //_CODE_:library:358380:
  appc.background(230);
} //_CODE_:library:358380:

public void closeLibClicked(GButton source, GEvent event) { //_CODE_:closeLib:641587:
  library.setVisible(false);
} //_CODE_:closeLib:641587:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:ArrGUI:776699:
  appc.background(230);
} //_CODE_:ArrGUI:776699:

public void guibackbutton_clicked(GButton source, GEvent event) { //_CODE_:aguiback:763192:
  //println("aguiback - GButton >> GEvent." + event + " @ " + millis());
  ArrGUI.setVisible(false);
  arrguiShow = false;
  
  gui.setVisible(true);
} //_CODE_:aguiback:763192:

public void arrdroplist_clicked(GDropList source, GEvent event) { //_CODE_:arrTypedroplist:757056:
  //println("arrTypedroplist - GDropList >> GEvent." + event + " @ " + millis());
  changeArrangementValues(currentPattern);
} //_CODE_:arrTypedroplist:757056:

public void arrxSpacing_slider(GCustomSlider source, GEvent event) { //_CODE_:X_Spacing:703950:

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

public void addLibraryButtonClicked(GButton source, GEvent event) { //_CODE_:addLibraryButton:544916:
  println("addLibraryButton - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:addLibraryButton:544916:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Modello");
  gui = GWindow.getWindow(this, "GUI", 100, 200, 380, 250, JAVA2D);
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
  greenSlider = new GCustomSlider(gui, 131, 49, 100, 40, "grey_blue");
  greenSlider.setLimits(0.0, 0.0, 255.0);
  greenSlider.setNumberFormat(G4P.DECIMAL, 2);
  greenSlider.setOpaque(false);
  greenSlider.addEventHandler(this, "greenSliderClick");
  blueSlider = new GCustomSlider(gui, 131, 72, 100, 40, "grey_blue");
  blueSlider.setLimits(0.0, 0.0, 255.0);
  blueSlider.setNumberFormat(G4P.DECIMAL, 2);
  blueSlider.setOpaque(false);
  blueSlider.addEventHandler(this, "blueSliderChange");
  redSlider = new GCustomSlider(gui, 131, 26, 100, 40, "grey_blue");
  redSlider.setLimits(255.0, 0.0, 255.0);
  redSlider.setNumberFormat(G4P.DECIMAL, 2);
  redSlider.setOpaque(false);
  redSlider.addEventHandler(this, "redSliderChange");
  savetilebutton = new GButton(gui, 14, 174, 80, 30);
  savetilebutton.setText("Visualise Pattern!");
  savetilebutton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  savetilebutton.addEventHandler(this, "tilescreenshot");
  widthSlider = new GCustomSlider(gui, 265, 24, 100, 40, "grey_blue");
  widthSlider.setLimits(100.0, 0.0, 500.0);
  widthSlider.setNumberFormat(G4P.DECIMAL, 2);
  widthSlider.setOpaque(false);
  widthSlider.addEventHandler(this, "widthSliderChange");
  heightSlider = new GCustomSlider(gui, 265, 49, 100, 40, "grey_blue");
  heightSlider.setLimits(100.0, 0.0, 500.0);
  heightSlider.setNumberFormat(G4P.DECIMAL, 2);
  heightSlider.setOpaque(false);
  heightSlider.addEventHandler(this, "heightSliderChange");
  label2 = new GLabel(gui, 265, 4, 80, 20);
  label2.setText("Size Sliders");
  label2.setOpaque(false);
  gridButton = new GCheckbox(gui, 218, 171, 120, 21);
  gridButton.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  gridButton.setText("See grid");
  gridButton.setOpaque(false);
  gridButton.addEventHandler(this, "gridClicked");
  clearButton = new GButton(gui, 13, 131, 80, 30);
  clearButton.setText("Clear");
  clearButton.addEventHandler(this, "clearButtonClick");
  autoAlign = new GCheckbox(gui, 217, 192, 120, 20);
  autoAlign.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  autoAlign.setText("Allow auto align");
  autoAlign.setOpaque(false);
  autoAlign.addEventHandler(this, "autoAlignClicked");
  label3 = new GLabel(gui, 110, 123, 80, 29);
  label3.setText("Background Colour");
  label3.setOpaque(false);
  bgRedSlider = new GCustomSlider(gui, 110, 155, 100, 40, "grey_blue");
  bgRedSlider.setLimits(255, 0, 255);
  bgRedSlider.setNumberFormat(G4P.INTEGER, 0);
  bgRedSlider.setOpaque(false);
  bgRedSlider.addEventHandler(this, "bgRedSliderChange");
  bgGreenSlider = new GCustomSlider(gui, 110, 180, 100, 40, "grey_blue");
  bgGreenSlider.setLimits(255, 0, 255);
  bgGreenSlider.setNumberFormat(G4P.INTEGER, 0);
  bgGreenSlider.setOpaque(false);
  bgGreenSlider.addEventHandler(this, "bgGreenSliderChange");
  bgBlueSlider = new GCustomSlider(gui, 110, 205, 100, 40, "grey_blue");
  bgBlueSlider.setLimits(255, 0, 255);
  bgBlueSlider.setNumberFormat(G4P.INTEGER, 0);
  bgBlueSlider.setOpaque(false);
  bgBlueSlider.addEventHandler(this, "bgBlueSliderChange");
  fwdShapeButton = new GButton(gui, 262, 93, 106, 30);
  fwdShapeButton.setTextAlign(GAlign.CENTER, GAlign.RIGHT);
  fwdShapeButton.setText("Move Shape Forwards");
  fwdShapeButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  fwdShapeButton.addEventHandler(this, "fwdShapeButtonClick");
  bwkShapeButton = new GButton(gui, 262, 128, 107, 30);
  bwkShapeButton.setText("Move Shape Backwards");
  bwkShapeButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  bwkShapeButton.addEventHandler(this, "bwkShapeButtonClicked");
  label4 = new GLabel(gui, 109, 38, 20, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("R");
  label4.setOpaque(false);
  label5 = new GLabel(gui, 109, 61, 20, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("G");
  label5.setOpaque(false);
  label6 = new GLabel(gui, 110, 84, 20, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("B");
  label6.setOpaque(false);
  toStart = new GButton(gui, 13, 213, 80, 30);
  toStart.setText("Return");
  toStart.setLocalColorScheme(GCScheme.RED_SCHEME);
  toStart.addEventHandler(this, "toStartClicked");
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
  title = new GImageButton(startWin, 140, 34, 222, 104, new String[] { "MODELLO.png", "MODELLO.png", "MODELLO.png" } );
  title.addEventHandler(this, "titleClicked");
  library = GWindow.getWindow(this, "Library", 1000, 400, 500, 400, JAVA2D);
  library.noLoop();
  library.setActionOnClose(G4P.KEEP_OPEN);
  library.addDrawHandler(this, "libraryDraw");
  closeLib = new GButton(library, 210, 290, 80, 30);
  closeLib.setText("CLOSE");
  closeLib.setLocalColorScheme(GCScheme.RED_SCHEME);
  closeLib.addEventHandler(this, "closeLibClicked");
  ArrGUI = GWindow.getWindow(this, "Window title", 100, 450, 280, 200, JAVA2D);
  ArrGUI.noLoop();
  ArrGUI.setActionOnClose(G4P.KEEP_OPEN);
  ArrGUI.addDrawHandler(this, "win_draw1");
  aguiback = new GButton(ArrGUI, 8, 152, 95, 30);
  aguiback.setText("Back to Canvas");
  aguiback.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  aguiback.addEventHandler(this, "guibackbutton_clicked");
  ArrangementType = new GLabel(ArrGUI, -2, 3, 125, 20);
  ArrangementType.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  ArrangementType.setText("Arrangement Type");
  ArrangementType.setOpaque(false);
  arrTypedroplist = new GDropList(ArrGUI, 10, 28, 90, 120, 5, 10);
  arrTypedroplist.setItems(loadStrings("list_757056"), 0);
  arrTypedroplist.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  arrTypedroplist.addEventHandler(this, "arrdroplist_clicked");
  X_Spacing = new GCustomSlider(ArrGUI, 135, 24, 100, 40, "grey_blue");
  X_Spacing.setLimits(50.0, 0.0, 500.0);
  X_Spacing.setNumberFormat(G4P.GREEN_SCHEME, 2);
  X_Spacing.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  X_Spacing.setOpaque(false);
  X_Spacing.addEventHandler(this, "arrxSpacing_slider");
  Y_Spacing = new GCustomSlider(ArrGUI, 135, 48, 100, 40, "grey_blue");
  Y_Spacing.setLimits(50.0, 0.0, 500.0);
  Y_Spacing.setNumberFormat(G4P.DECIMAL, 2);
  Y_Spacing.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  Y_Spacing.setOpaque(false);
  Y_Spacing.addEventHandler(this, "arrYSpacing_change1");
  Spacing_Labels = new GLabel(ArrGUI, 134, 5, 80, 20);
  Spacing_Labels.setText("Spacing");
  Spacing_Labels.setOpaque(false);
  SizeSliders = new GLabel(ArrGUI, 135, 89, 123, 20);
  SizeSliders.setText("Size ");
  SizeSliders.setOpaque(false);
  arrwidthslider = new GCustomSlider(ArrGUI, 134, 109, 100, 40, "grey_blue");
  arrwidthslider.setLimits(50.0, 20.0, 400.0);
  arrwidthslider.setNumberFormat(G4P.DECIMAL, 2);
  arrwidthslider.setOpaque(false);
  arrwidthslider.addEventHandler(this, "arrwidthslider_change1");
  arrheightslider = new GCustomSlider(ArrGUI, 134, 132, 100, 40, "grey_blue");
  arrheightslider.setLimits(50.0, 20.0, 400.0);
  arrheightslider.setNumberFormat(G4P.DECIMAL, 2);
  arrheightslider.setOpaque(false);
  arrheightslider.addEventHandler(this, "arrheislider_change1");
  addLibraryButton = new GButton(ArrGUI, 7, 114, 97, 30);
  addLibraryButton.setText("Add to Library");
  addLibraryButton.addEventHandler(this, "addLibraryButtonClicked");
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
GLabel label3; 
GCustomSlider bgRedSlider; 
GCustomSlider bgGreenSlider; 
GCustomSlider bgBlueSlider; 
GButton fwdShapeButton; 
GButton bwkShapeButton; 
GLabel label4; 
GLabel label5; 
GLabel label6; 
GButton toStart; 
GWindow tutorial;
GButton next; 
GButton back; 
GButton finish; 
GWindow startWin;
GButton start; 
GButton tutButton; 
GButton libraryButton; 
GImageButton title; 
GWindow library;
GButton closeLib; 
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
GButton addLibraryButton; 
