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
    
    title = new GImageButton(startWin, 80, 34, 333, 156, new String[] { "Assets/MODELLO.png" } );
    
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
    }
    //second tutorial page
    else if (tutPage == 2){
      next.setVisible(true);
      back.setVisible(true);
      finish.setVisible(false);
      
      startImg.setVisible(false);
      startClickImg.setVisible(true);
      
    }
    //last tutorial page
    else{
      next.setVisible(false);
      back.setVisible(true);
      finish.setVisible(true);
    }
    
    
  }
  else{
    //tutorial closed
    tutorial.setVisible(false);
  }
  
}
