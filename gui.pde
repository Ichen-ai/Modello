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
  Shape newShape = new Shape(0, new PVector(250, 250), 50, 100, 200, 0, 0);
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
  //title.
} //_CODE_:redSlider:415599:

public void tilescreenshot(GButton source, GEvent event) { //_CODE_:savetilebutton:575000:
  TileStatus = "preparing";
  VisualisePattern(currentTile);
} //_CODE_:savetilebutton:575000:

public void widthSliderChange(GCustomSlider source, GEvent event) { //_CODE_:widthSlider:844943:
  changeShapeValues();
} //_CODE_:widthSlider:844943:

public void heightSliderChange(GCustomSlider source, GEvent event) { //_CODE_:heightSlider:256807:
  changeShapeValues();
} //_CODE_:heightSlider:256807:

public void gridClicked(GCheckbox source, GEvent event) { //_CODE_:gridButton:487609:
  if (gridButton.isSelected()) {
    currentTile.seeGrid = true;
  } else currentTile.seeGrid = false;
} //_CODE_:gridButton:487609:

public void clearButtonClick(GButton source, GEvent event) { //_CODE_:clearButton:526941:
  currentTile.ArrangedShapes.clear();
} //_CODE_:clearButton:526941:

public void autoAlignClicked(GCheckbox source, GEvent event) { //_CODE_:autoAlign:584859:
  if (autoAlign.isSelected()) {
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
      break;
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
  gui.setVisible(false);
  ArrGUI.setVisible(false);
  colPick.setVisible(false);
  
  startWin.setVisible(true);
  
  colPickCheckbox.setSelected(false);
  
  windowName = "Start";
  hideWindow();
} //_CODE_:toStart:677194:

public void gridSliderChange(GCustomSlider source, GEvent event) { //_CODE_:gridSlider:954807:
  currentTile.gridSize = gridSlider.getValueI();;
} //_CODE_:gridSlider:954807:

public void colPickCheckboxClicked(GCheckbox source, GEvent event) { //_CODE_:colPickCheckbox:369430:
  if (colPickCheckbox.isSelected()) {
    seeColPick = true;
    colPick.setVisible(true);
  } else {
    seeColPick = false;
    colPick.setVisible(false);
  }
} //_CODE_:colPickCheckbox:369430:

synchronized public void tutDraw(PApplet appc, GWinData data) { //_CODE_:tutorial:852036:
  appc.background(230);
} //_CODE_:tutorial:852036:

public void nextClicked(GButton source, GEvent event) { //_CODE_:next:783622:
  tutPage += 1;
  
  updateTutorialButtons();
} //_CODE_:next:783622:

public void backClicked(GButton source, GEvent event) { //_CODE_:back:491218:
  tutPage -= 1;
  
  updateTutorialButtons();
} //_CODE_:back:491218:

public void finishClicked(GButton source, GEvent event) { //_CODE_:finish:597876:
  tutorialShow = false;
  tutorial.setVisible(false);
} //_CODE_:finish:597876:

synchronized public void startWinDraw(PApplet appc, GWinData data) { //_CODE_:startWin:587259:
  appc.background(230);
} //_CODE_:startWin:587259:

public void startClicked(GButton source, GEvent event) { //_CODE_:start:897298:
  startWin.setVisible(false);
  gui.setVisible(true);
  
  windowName = "Create";
  showWindow();
} //_CODE_:start:897298:

public void tutButtonClicked(GButton source, GEvent event) { //_CODE_:tutButton:584753:
  tutPage = 1;
  tutorialShow = true;
  
  tutorial.setVisible(true);
  
  updateTutorialButtons();
  
  next.setVisible(true);
  back.setVisible(false);
  finish.setVisible(false);
} //_CODE_:tutButton:584753:

public void libraryClicked(GButton source, GEvent event) { //_CODE_:libraryButton:312218:
  libraryShow = true;
  library.setVisible(true);
} //_CODE_:libraryButton:312218:

public void exitClicked(GButton source, GEvent event) { //_CODE_:exit:855732:
  exit();
} //_CODE_:exit:855732:

synchronized public void libraryDraw(PApplet appc, GWinData data) { //_CODE_:library:358380:
  appc.background(230);
} //_CODE_:library:358380:

public void closeLibClicked(GButton source, GEvent event) { //_CODE_:closeLib:641587:
  libraryShow = false;
  library.setVisible(false);
  
  if (backToDraw) {
    showWindow();
    ArrGUI.setVisible(true);
    backToDraw = false;
  }
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
// Changes text on the button to "Added!" and records current time
if (!LibrConfirmed){
    addLibraryButton.setText("Added!");
    LibrTime = millis();
    LibrConfirmed = true;
  }
  
  //Request to save a screenshot of the entire pattern to the Library
  requestLibSave = true;
  
} //_CODE_:addLibraryButton:544916:

public void patternSaveClicked(GButton source, GEvent event) { //_CODE_:patternSave:520565:
//Shows confirmation of "saved!" for user
  if (!SaveConfirmed){
    patternSave.setText("Saved!");
    SaveTime = millis(); //Records the current millisecond count so that this text change can show for 2 seconds
    SaveConfirmed = true;
  }
  
  saveFrame("savedPhotos/photo " + screenshotNum + ".png"); //saves a screenshot of the pattern into the savedPhotos folder!
  screenshotNum++;
} //_CODE_:patternSave:520565:

public void libraryClicked2(GButton source, GEvent event) { //_CODE_:libraryButton2:502722:
  libraryShow = true;
  library.setVisible(true);
  hideWindow();
  gui.setVisible(false);
  ArrGUI.setVisible(false);
  backToDraw = true;
} //_CODE_:libraryButton2:502722:

public void colPickRedChange(GCustomSlider source, GEvent event) { //_CODE_:colPickRedSlider:367583:
 
} //_CODE_:colPickRedSlider:367583:

public void colPickGreenSliderClick(GCustomSlider source, GEvent event) { //_CODE_:colPickGreenSlider:962107:

} //_CODE_:colPickGreenSlider:962107:

public void cloPickBlueSliderChange(GCustomSlider source, GEvent event) { //_CODE_:colPickBlueSlider:696466:

} //_CODE_:colPickBlueSlider:696466:

public void setShapeColClick(GButton source, GEvent event) { //_CODE_:setShapeCol:444619:
  redSlider.setValue(colPickRedSlider.getValueI());
  greenSlider.setValue(colPickGreenSlider.getValueI());
  blueSlider.setValue(colPickBlueSlider.getValueI());
  changeShapeValues();
} //_CODE_:setShapeCol:444619:

public void setBgColClick(GButton source, GEvent event) { //_CODE_:setBgCol:655976:
  bgRedSlider.setValue(colPickRedSlider.getValueI());
  bgGreenSlider.setValue(colPickGreenSlider.getValueI());
  bgBlueSlider.setValue(colPickBlueSlider.getValueI());
  changeBgColour();
} //_CODE_:setBgCol:655976:

public void PickColourCheckboxClicked(GCheckbox source, GEvent event) { //_CODE_:PickColourCheckbox:663486:
  if (PickColourCheckbox.isSelected() == true) {
    findingColour = true;
  }
  else {
    findingColour = false;
  }
} //_CODE_:PickColourCheckbox:663486:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Modello");
  gui = GWindow.getWindow(this, "GUI", 100, 200, 420, 250, JAVA2D);
  gui.noLoop();
  gui.setActionOnClose(G4P.KEEP_OPEN);
  gui.addDrawHandler(this, "guiDraw");
  shapeTypeList = new GDropList(gui, 11, 8, 90, 80, 3, 10);
  shapeTypeList.setItems(loadStrings("list_593435"), 0);
  shapeTypeList.addEventHandler(this, "shapeTypeListClick");
  addShapeButton = new GButton(gui, 13, 43, 80, 30);
  addShapeButton.setText("Add Shape");
  addShapeButton.addEventHandler(this, "addShapeButtonClick");
  removeShapeButton = new GButton(gui, 13, 81, 80, 30);
  removeShapeButton.setText("Remove Shape");
  removeShapeButton.addEventHandler(this, "removeShapeButtonClick");
  label1 = new GLabel(gui, 120, 8, 80, 20);
  label1.setText("Colour Sliders");
  label1.setOpaque(false);
  greenSlider = new GCustomSlider(gui, 129, 52, 100, 40, "grey_blue");
  greenSlider.setShowValue(true);
  greenSlider.setLimits(0, 0, 255);
  greenSlider.setNumberFormat(G4P.INTEGER, 0);
  greenSlider.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  greenSlider.setOpaque(false);
  greenSlider.addEventHandler(this, "greenSliderClick");
  blueSlider = new GCustomSlider(gui, 129, 75, 100, 40, "grey_blue");
  blueSlider.setShowValue(true);
  blueSlider.setLimits(0, 0, 255);
  blueSlider.setNumberFormat(G4P.INTEGER, 0);
  blueSlider.setOpaque(false);
  blueSlider.addEventHandler(this, "blueSliderChange");
  redSlider = new GCustomSlider(gui, 129, 29, 100, 40, "grey_blue");
  redSlider.setShowValue(true);
  redSlider.setLimits(255, 0, 255);
  redSlider.setNumberFormat(G4P.INTEGER, 0);
  redSlider.setLocalColorScheme(GCScheme.RED_SCHEME);
  redSlider.setOpaque(false);
  redSlider.addEventHandler(this, "redSliderChange");
  savetilebutton = new GButton(gui, 13, 173, 80, 30);
  savetilebutton.setText("Visualise Pattern!");
  savetilebutton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  savetilebutton.addEventHandler(this, "tilescreenshot");
  widthSlider = new GCustomSlider(gui, 281, 19, 100, 40, "grey_blue");
  widthSlider.setShowValue(true);
  widthSlider.setLimits(100.0, 5.0, 500.0);
  widthSlider.setNumberFormat(G4P.DECIMAL, 2);
  widthSlider.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  widthSlider.setOpaque(false);
  widthSlider.addEventHandler(this, "widthSliderChange");
  heightSlider = new GCustomSlider(gui, 281, 41, 100, 40, "grey_blue");
  heightSlider.setShowValue(true);
  heightSlider.setLimits(100.0, 5.0, 500.0);
  heightSlider.setNumberFormat(G4P.DECIMAL, 2);
  heightSlider.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  heightSlider.setOpaque(false);
  heightSlider.addEventHandler(this, "heightSliderChange");
  label2 = new GLabel(gui, 243, 8, 80, 20);
  label2.setText("Size Sliders");
  label2.setOpaque(false);
  gridButton = new GCheckbox(gui, 242, 176, 120, 21);
  gridButton.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  gridButton.setText("See grid");
  gridButton.setOpaque(false);
  gridButton.addEventHandler(this, "gridClicked");
  clearButton = new GButton(gui, 13, 117, 80, 30);
  clearButton.setText("Clear Tile");
  clearButton.addEventHandler(this, "clearButtonClick");
  autoAlign = new GCheckbox(gui, 242, 156, 120, 20);
  autoAlign.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  autoAlign.setText("Allow auto align");
  autoAlign.setOpaque(false);
  autoAlign.addEventHandler(this, "autoAlignClicked");
  label3 = new GLabel(gui, 113, 137, 112, 29);
  label3.setText("Background Colour");
  label3.setOpaque(false);
  bgRedSlider = new GCustomSlider(gui, 130, 164, 100, 40, "grey_blue");
  bgRedSlider.setShowValue(true);
  bgRedSlider.setLimits(255, 0, 255);
  bgRedSlider.setNumberFormat(G4P.INTEGER, 0);
  bgRedSlider.setLocalColorScheme(GCScheme.RED_SCHEME);
  bgRedSlider.setOpaque(false);
  bgRedSlider.addEventHandler(this, "bgRedSliderChange");
  bgGreenSlider = new GCustomSlider(gui, 130, 188, 100, 40, "grey_blue");
  bgGreenSlider.setShowValue(true);
  bgGreenSlider.setLimits(255, 0, 255);
  bgGreenSlider.setNumberFormat(G4P.INTEGER, 0);
  bgGreenSlider.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  bgGreenSlider.setOpaque(false);
  bgGreenSlider.addEventHandler(this, "bgGreenSliderChange");
  bgBlueSlider = new GCustomSlider(gui, 130, 211, 100, 40, "grey_blue");
  bgBlueSlider.setShowValue(true);
  bgBlueSlider.setLimits(255, 0, 255);
  bgBlueSlider.setNumberFormat(G4P.INTEGER, 0);
  bgBlueSlider.setOpaque(false);
  bgBlueSlider.addEventHandler(this, "bgBlueSliderChange");
  fwdShapeButton = new GButton(gui, 246, 86, 143, 30);
  fwdShapeButton.setTextAlign(GAlign.CENTER, GAlign.RIGHT);
  fwdShapeButton.setText("Move Shape Forwards");
  fwdShapeButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  fwdShapeButton.addEventHandler(this, "fwdShapeButtonClick");
  bwkShapeButton = new GButton(gui, 248, 122, 143, 30);
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
  label6 = new GLabel(gui, 110, 86, 20, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("B");
  label6.setOpaque(false);
  toStart = new GButton(gui, 13, 213, 80, 30);
  toStart.setText("Return");
  toStart.setLocalColorScheme(GCScheme.RED_SCHEME);
  toStart.addEventHandler(this, "toStartClicked");
  label7 = new GLabel(gui, 243, 28, 80, 20);
  label7.setText("Width");
  label7.setOpaque(false);
  label8 = new GLabel(gui, 241, 52, 80, 20);
  label8.setText("Height");
  label8.setOpaque(false);
  label9 = new GLabel(gui, 108, 169, 19, 20);
  label9.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label9.setText("R");
  label9.setOpaque(false);
  label10 = new GLabel(gui, 107, 194, 22, 19);
  label10.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label10.setText("G");
  label10.setOpaque(false);
  label11 = new GLabel(gui, 108, 219, 20, 20);
  label11.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label11.setText("B");
  label11.setOpaque(false);
  gridSlider = new GCustomSlider(gui, 283, 208, 99, 40, "grey_blue");
  gridSlider.setShowValue(true);
  gridSlider.setLimits(25.0, 10.0, 50.0);
  gridSlider.setNumberFormat(G4P.DECIMAL, 2);
  gridSlider.setOpaque(false);
  gridSlider.addEventHandler(this, "gridSliderChange");
  label12 = new GLabel(gui, 235, 208, 52, 28);
  label12.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label12.setText("Grid Size");
  label12.setOpaque(false);
  colPickCheckbox = new GCheckbox(gui, 112, 115, 120, 20);
  colPickCheckbox.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  colPickCheckbox.setText("See Colour Picker");
  colPickCheckbox.setOpaque(false);
  colPickCheckbox.addEventHandler(this, "colPickCheckboxClicked");
  tutorial = GWindow.getWindow(this, "Tutorial", 510, 170, 480, 360, JAVA2D);
  tutorial.noLoop();
  tutorial.setActionOnClose(G4P.KEEP_OPEN);
  tutorial.addDrawHandler(this, "tutDraw");
  next = new GButton(tutorial, 400, 290, 60, 30);
  next.setText("next");
  next.addEventHandler(this, "nextClicked");
  back = new GButton(tutorial, 30, 290, 60, 30);
  back.setText("back");
  back.addEventHandler(this, "backClicked");
  finish = new GButton(tutorial, 200, 290, 90, 30);
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
  exit = new GButton(startWin, 210, 350, 80, 30);
  exit.setText("EXIT");
  exit.setLocalColorScheme(GCScheme.RED_SCHEME);
  exit.addEventHandler(this, "exitClicked");
  library = GWindow.getWindow(this, "Library", 500, 150, 500, 400, JAVA2D);
  library.noLoop();
  library.setActionOnClose(G4P.KEEP_OPEN);
  library.addDrawHandler(this, "libraryDraw");
  closeLib = new GButton(library, 210, 310, 80, 30);
  closeLib.setText("CLOSE");
  closeLib.setLocalColorScheme(GCScheme.RED_SCHEME);
  closeLib.addEventHandler(this, "closeLibClicked");
  ArrGUI = GWindow.getWindow(this, "Window title", 160, 200, 280, 230, JAVA2D);
  ArrGUI.noLoop();
  ArrGUI.setActionOnClose(G4P.KEEP_OPEN);
  ArrGUI.addDrawHandler(this, "win_draw1");
  aguiback = new GButton(ArrGUI, 90, 190, 95, 30);
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
  X_Spacing = new GCustomSlider(ArrGUI, 168, 22, 100, 40, "grey_blue");
  X_Spacing.setShowValue(true);
  X_Spacing.setLimits(50.0, 0.0, 500.0);
  X_Spacing.setNumberFormat(G4P.GREEN_SCHEME, 2);
  X_Spacing.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  X_Spacing.setOpaque(false);
  X_Spacing.addEventHandler(this, "arrxSpacing_slider");
  Y_Spacing = new GCustomSlider(ArrGUI, 169, 45, 100, 40, "grey_blue");
  Y_Spacing.setShowValue(true);
  Y_Spacing.setLimits(50.0, 0.0, 500.0);
  Y_Spacing.setNumberFormat(G4P.DECIMAL, 2);
  Y_Spacing.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  Y_Spacing.setOpaque(false);
  Y_Spacing.addEventHandler(this, "arrYSpacing_change1");
  Spacing_Labels = new GLabel(ArrGUI, 130, 3, 80, 20);
  Spacing_Labels.setText("Tile Spacing");
  Spacing_Labels.setOpaque(false);
  SizeSliders = new GLabel(ArrGUI, 131, 94, 123, 20);
  SizeSliders.setText("Tile Size");
  SizeSliders.setOpaque(false);
  arrwidthslider = new GCustomSlider(ArrGUI, 168, 114, 100, 40, "grey_blue");
  arrwidthslider.setShowValue(true);
  arrwidthslider.setLimits(50.0, 20.0, 400.0);
  arrwidthslider.setNumberFormat(G4P.DECIMAL, 2);
  arrwidthslider.setOpaque(false);
  arrwidthslider.addEventHandler(this, "arrwidthslider_change1");
  arrheightslider = new GCustomSlider(ArrGUI, 167, 144, 100, 40, "grey_blue");
  arrheightslider.setShowValue(true);
  arrheightslider.setLimits(50.0, 20.0, 400.0);
  arrheightslider.setNumberFormat(G4P.DECIMAL, 2);
  arrheightslider.setOpaque(false);
  arrheightslider.addEventHandler(this, "arrheislider_change1");
  addLibraryButton = new GButton(ArrGUI, 10, 110, 97, 30);
  addLibraryButton.setText("Add to Library");
  addLibraryButton.addEventHandler(this, "addLibraryButtonClicked");
  patternSave = new GButton(ArrGUI, 10, 70, 97, 30);
  patternSave.setText("Export Pattern");
  patternSave.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  patternSave.addEventHandler(this, "patternSaveClicked");
  libraryButton2 = new GButton(ArrGUI, 10, 150, 97, 30);
  libraryButton2.setText("Library");
  libraryButton2.addEventHandler(this, "libraryClicked2");
  label13 = new GLabel(ArrGUI, 109, 33, 80, 20);
  label13.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label13.setText("X");
  label13.setOpaque(false);
  label14 = new GLabel(ArrGUI, 110, 55, 80, 20);
  label14.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label14.setText("Y");
  label14.setOpaque(false);
  label15 = new GLabel(ArrGUI, 108, 125, 80, 20);
  label15.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label15.setText("Width");
  label15.setOpaque(false);
  label16 = new GLabel(ArrGUI, 105, 155, 80, 20);
  label16.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label16.setText("Height");
  label16.setOpaque(false);
  colPick = GWindow.getWindow(this, "Colour Picker", 150, 400, 240, 120, JAVA2D);
  colPick.noLoop();
  colPick.setActionOnClose(G4P.KEEP_OPEN);
  colPick.addDrawHandler(this, "win_draw1");
  colPickRedSlider = new GCustomSlider(colPick, 31, 25, 100, 40, "grey_blue");
  colPickRedSlider.setShowValue(true);
  colPickRedSlider.setLimits(0, 0, 255);
  colPickRedSlider.setNumberFormat(G4P.INTEGER, 0);
  colPickRedSlider.setLocalColorScheme(GCScheme.RED_SCHEME);
  colPickRedSlider.setOpaque(false);
  colPickRedSlider.addEventHandler(this, "colPickRedChange");
  colPickGreenSlider = new GCustomSlider(colPick, 31, 49, 100, 40, "grey_blue");
  colPickGreenSlider.setShowValue(true);
  colPickGreenSlider.setLimits(0, 0, 255);
  colPickGreenSlider.setNumberFormat(G4P.INTEGER, 0);
  colPickGreenSlider.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  colPickGreenSlider.setOpaque(false);
  colPickGreenSlider.addEventHandler(this, "colPickGreenSliderClick");
  colPickBlueSlider = new GCustomSlider(colPick, 32, 72, 100, 40, "grey_blue");
  colPickBlueSlider.setShowValue(true);
  colPickBlueSlider.setLimits(0, 0, 255);
  colPickBlueSlider.setNumberFormat(G4P.INTEGER, 0);
  colPickBlueSlider.setOpaque(false);
  colPickBlueSlider.addEventHandler(this, "cloPickBlueSliderChange");
  setShapeCol = new GButton(colPick, 146, 21, 80, 30);
  setShapeCol.setText("Set Shape Colour");
  setShapeCol.addEventHandler(this, "setShapeColClick");
  Colour = new GLabel(colPick, 21, 3, 99, 24);
  Colour.setText("Picked Colour");
  Colour.setOpaque(false);
  label17 = new GLabel(colPick, 7, 31, 26, 20);
  label17.setText("R");
  label17.setOpaque(false);
  label18 = new GLabel(colPick, 7, 54, 23, 20);
  label18.setText("G");
  label18.setOpaque(false);
  label19 = new GLabel(colPick, 7, 80, 24, 20);
  label19.setText("B");
  label19.setOpaque(false);
  setBgCol = new GButton(colPick, 146, 63, 80, 44);
  setBgCol.setText("Set Background Colour");
  setBgCol.addEventHandler(this, "setBgColClick");
  PickColourCheckbox = new GCheckbox(colPick, 115, 3, 120, 20);
  PickColourCheckbox.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  PickColourCheckbox.setText("Picking Colour");
  PickColourCheckbox.setOpaque(false);
  PickColourCheckbox.addEventHandler(this, "PickColourCheckboxClicked");
  PickColourCheckbox.setSelected(true);
  gui.loop();
  tutorial.loop();
  startWin.loop();
  library.loop();
  ArrGUI.loop();
  colPick.loop();
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
GLabel label7; 
GLabel label8; 
GLabel label9; 
GLabel label10; 
GLabel label11; 
GCustomSlider gridSlider; 
GLabel label12; 
GCheckbox colPickCheckbox; 
GWindow tutorial;
GButton next; 
GButton back; 
GButton finish; 
GWindow startWin;
GButton start; 
GButton tutButton; 
GButton libraryButton; 
GButton exit; 
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
GButton patternSave; 
GButton libraryButton2; 
GLabel label13; 
GLabel label14; 
GLabel label15; 
GLabel label16; 
GWindow colPick;
GCustomSlider colPickRedSlider; 
GCustomSlider colPickGreenSlider; 
GCustomSlider colPickBlueSlider; 
GButton setShapeCol; 
GLabel Colour; 
GLabel label17; 
GLabel label18; 
GLabel label19; 
GButton setBgCol; 
GCheckbox PickColourCheckbox; 
