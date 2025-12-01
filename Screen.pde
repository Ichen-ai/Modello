//Function creates the different windows
void displayScreen(){
  fill(0);
  
  //(idk this is a placeholder for now cuz gui not drawn)
  //Start screen
  if (windowName == "Start"){
    tutButton.setVisible(true);
  }
  
  //"Create" screen is the screen which the user will create the pattern
  else if (windowName == "Create"){
    
  }
  
  //Credits the creators of this program
  else if (windowName == "Credits"){
    
  }
  
  //Basic tutorial on how to use the program
  //    Create second window(popup)
  if (tutorialShow == true){
    tutorial.setVisible(true);
    
  }
  else{
    tutorial.setVisible(false);
  }
  
}
