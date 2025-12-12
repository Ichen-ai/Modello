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
    gui.setVisible(true);
    surface.setVisible(true);
    startWin.setVisible(false);
    
    //we set the window to none because when we set the visibility multiple times, it causes the screen to flash
    windowName = "none";
    
  }
  
  //Users can see all their saved patterns together
  if (libraryShow == true){
    library.setVisible(true);
    
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
  else{
    library.setVisible(false);
  }
  
  //Basic tutorial on how to use the program
  //    Create second window(popup)
  if (tutorialShow == true){
    tutorial.setVisible(true);
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
    }
  }
  
  else{
    //tutorial closed
    tutorial.setVisible(false);
  }
  
}
