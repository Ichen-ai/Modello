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
    
    titleFont = createFont("ArianaVioleta-dz2K.ttf", 128);
    text("Modello", 250, 50);
    
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
