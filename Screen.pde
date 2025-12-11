//Function creates the different windows

void displayScreen(){
  fill(0);
  
  //(idk this is a placeholder for now cuz gui not drawn)
  //Start screen
  if (windowName.equals("Start")){
    tutorial.setVisible(false);
    surface.setVisible(false);
    library.setVisible(false);
    tutButton.setVisible(true);
    gui.setVisible(false);
    ArrGUI.setVisible(false);
    startWin.setVisible(true);
    
    title = new GImageButton(startWin, 80, 34, 333, 156, new String[] { "MODELLO.png"} );
    
    windowName = "none";
  }
  
  //"Create" screen is the screen which the user will create the pattern
  else if (windowName.equals("Create")){
    gui.setVisible(true);
    surface.setVisible(true);
    startWin.setVisible(false);
    
    windowName = "none";
    
  }
  
  //Users can see all their saved patterns together
  else if (windowName.equals("Library")){
    library.setVisible(true);
    
    //for loop to add all the images
    int rows = numAddLib/4;
    int columns = 4;
    
    for(int i = 0; i <= rows; i++){
      println("I:", i);
      for (int j = 0; j < columns;  j++){
        GImageButton icon = libraryImgs.get(4*i+j);
        println("J:", j);
        
        //loadPattern.addEventHandler(ArrGUI, "loadPatternClicked");
      }
    }
    
    windowName = "none";
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
    }
    //second tutorial page
    else if (tutPage == 2){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
    }
    //last tutorial page
    else{
      next.setVisible(false);
      back.setVisible(true);
      finish.setVisible(true);
    }
    
    
  }
  else{
    tutorial.setVisible(false);
  }
  
}
