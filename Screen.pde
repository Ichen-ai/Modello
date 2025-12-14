//Function creates the different windows

void displayScreen(){
  fill(0);
  
  //(idk this is a placeholder for now cuz gui not drawn)
  //Start screen
  if (windowName.equals("Start")){
    surface.setVisible(false);
    tutButton.setVisible(true);
    gui.setVisible(false);
    ArrGUI.setVisible(false);
    startWin.setVisible(true);
    title.setVisible(true);
    
    windowName = "none";
  }
  
  //"Create" screen is the screen which the user will create the pattern
  else if (windowName.equals("Create")){
    if (editingPastTile) {
      ArrGUI.setVisible(true);
      gui.setVisible(false);
      editingPastTile = false;
    } else gui.setVisible(true);
    surface.setVisible(true);
    startWin.setVisible(false);
    
    //we set the window to none because when we set the visibility multiple times, it causes the screen to flash
    windowName = "none";
    
  }
  
  //Users can see all their saved patterns together
  if (libraryShow == true){ 
    //for loop to add all the images
    imageFileNum = "libraryIcon"+numAddLib+".png";
    for(int i = 0; i <= iconY+1; i++){
      for (int j = 0; j <= iconX+1;  j++){
        if (drawn < numAddLib){
          libraryImgs.get(4*i+j);
          drawn++;
        }
        else{
          return;
        }
      }
    }
    
  }

  //Basic tutorial on how to use the program
  //    Create second window(popup)
  if (tutorialShow == true){
    //first tutorial page
    if (tutPage == 1){
      next.setVisible(true);
      back.setVisible(false);
      finish.setVisible(false);
      
      startImg.setVisible(true);
      startClickImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(false);
      VPCImg.setVisible(false);
      VPImg.setVisible(false);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("Welcome to Modello, the ULTIMATE pattern maker for YOU!*Note: If you are new, keeping the tutorial open as you work on your pattern will be helpful");
    }
    //second tutorial page
    else if (tutPage == 2){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(true);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(false);
      VPCImg.setVisible(false);
      VPImg.setVisible(false);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("Click on the START button to begin your pattern adventure");
    }
    //continued
    else if (tutPage == 3){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(true);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(false);
      VPCImg.setVisible(false);
      VPImg.setVisible(false);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("Welcome to the create screen, this is where you will create your pattern tile for your pattern");
    }
    else if (tutPage == 4){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(true);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(false);
      VPCImg.setVisible(false);
      VPImg.setVisible(false);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("The GUI contains many tools to aid you along this journey. Start by clicking on the add shape button");
    }
    else if (tutPage == 5){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(true);
      GUIImg.setVisible(false);
      VPCImg.setVisible(false);
      VPImg.setVisible(false);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("Congrats on adding your first shape. Try selecting the shape by clicking it with your left mouse button");
    }
    else if (tutPage == 6){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(true);
      VPCImg.setVisible(false);
      VPImg.setVisible(false);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("Now you can modify your shape however you like with the tools in your GUI");
    }
    else if (tutPage == 7){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(false);
      VPCImg.setVisible(true);
      VPImg.setVisible(false);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("When you complete your shape, press visualize pattern, this allows you to view your creation in full");
    }
    else if (tutPage == 8){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(false);
      VPCImg.setVisible(false);
      VPImg.setVisible(true);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("Try playing around with different arrangement types, spacing, and size to find the best way to display your pattern");
    }
    else if (tutPage == 9){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(false);
      VPCImg.setVisible(false);
      VPImg.setVisible(false);
      addToLibImg.setVisible(true);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("To save your image, click the Save to Library button.");
    }
    else if (tutPage == 10){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(false);
      VPCImg.setVisible(false);
      VPImg.setVisible(false);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(true);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("To view your saved image, click the library button");
    }
    else if (tutPage == 11){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(false);
      VPCImg.setVisible(false);
      VPImg.setVisible(false);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(true);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("Here, you can choose your desired saved image and return to working on them any time");
    }
    else if (tutPage == 12){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(false);
      VPCImg.setVisible(false);
      VPImg.setVisible(false);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(true);
      tutorialEnd.setVisible(false);
      
      tutorialLabel.setText("When you wish to use your pattern, click on the export button. This saves your pattern as a .png which can be easily accessed in the savedPhotos folder");
    }
    //last tutorial page
    else{
      next.setVisible(false);
      back.setVisible(true);
      finish.setVisible(true);
      
      startImg.setVisible(false);
      startClickImg.setVisible(false);
      startClickImg.setVisible(false);
      createScreenImg.setVisible(false);
      guiAddShapeImg.setVisible(false);
      selectShapeImg.setVisible(false);
      GUIImg.setVisible(false);
      VPCImg.setVisible(false);
      VPImg.setVisible(false);
      addToLibImg.setVisible(false);
      libraryClickedImg.setVisible(false);
      libraryImg.setVisible(false);
      arrGUIImg.setVisible(false);
      tutorialEnd.setVisible(true);
      
      tutorialLabel.setText("");
    }
  }
  
}
