//Function creates the different windows

void displayScreen(){
  fill(0);
  
  //(idk this is a placeholder for now cuz gui not drawn)
  //Start screen
  if (windowName.equals("Start")){
    //surface.setVisible(false);
    tutButton.setVisible(true);
    title.setVisible(true);
    
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

  //Basic tutorial on how to use the program
  //    Create second window(popup)
  if (tutorialShow == true){
    //first tutorial page
    if (tutPage == 1){
      tutorialLabel.setText("Welcome to Modello, the ULTIMATE pattern maker for YOU!*Note: If you are new, keeping the tutorial open as you work on your pattern will be helpful");
    }
    //second tutorial page
    else if (tutPage == 2){
      tutorialLabel.setText("Click on the START button to begin your pattern adventure");
    }
    //continued
    else if (tutPage == 3){
      tutorialLabel.setText("Welcome to the create screen, this is where you will create your pattern tile for your pattern");
    }
    else if (tutPage == 4){
      tutorialLabel.setText("The GUI contains many tools to aid you along this journey. Start by clicking on the add shape button");
    }
    else if (tutPage == 5){
      tutorialLabel.setText("Congrats on adding your first shape. Try selecting the shape by clicking it with your left mouse button");
    }
    else if (tutPage == 6){
      tutorialLabel.setText("Now you can modify your shape however you like with the tools in your GUI");
    }
    else if (tutPage == 7){
      tutorialLabel.setText("When you complete your shape, press visualize pattern, this allows you to view your creation in full");
    }
    else if (tutPage == 8){
      tutorialLabel.setText("Try playing around with different arrangement types, spacing, and size to find the best way to display your pattern");
    }
    else if (tutPage == 9){
      tutorialLabel.setText("To save your image, click the Save to Library button.");
    }
    else if (tutPage == 10){
      tutorialLabel.setText("To view your saved image, click the library button");
    }
    else if (tutPage == 11){
      tutorialLabel.setText("Here, you can choose your desired saved image and return to working on them any time");
    }
    else if (tutPage == 12){
      tutorialLabel.setText("When you wish to use your pattern, click on the export button. This saves your pattern as a .png which can be easily accessed in the savedPhotos folder");
    }
    //last tutorial page
    else{
      tutorialLabel.setText("");
    }
  }
  
}
