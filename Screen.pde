//Function creates the different windows

void displayScreen(){
  fill(0);
  
  //(idk this is a placeholder for now cuz gui not drawn)
  //Start screen
  if (windowName.equals("Start")){
    //surface.setVisible(false);
    tutButton.setVisible(true);
    title.setVisible(true);
    
    //prevent resetting visibiliity
    windowName = "none";
  }
  
  //"Create" screen is the screen which the user will create the pattern
  else if (windowName.equals("Create")){
    if (editingPastTile) {
      editingPastTile = false;
    }
    
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
}
