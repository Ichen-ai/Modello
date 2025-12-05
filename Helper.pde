
void getShapeValues(Shape s) {
  s.type = shapeTypeList.getSelectedText();
  int r = redSlider.getValueI();
  int g = greenSlider.getValueI();
  int b = blueSlider.getValueI();
  s.colour = color(r, g, b);

  s.hei = heightSlider.getValueI();
  s.wid = widthSlider.getValueI();
}

void changeShapeValues() {
  for (int i = 0; i < currentTile.ArrangedShapes.size(); i++) {
    Shape testShape = currentTile.ArrangedShapes.get(i);
    if (testShape.isSelected) {
      getShapeValues(testShape);
    }
  }
}

void changeBgColour() {
  int r = bgRedSlider.getValueI();
  int g = bgGreenSlider.getValueI();
  int b = bgBlueSlider.getValueI();
  
  bgColour = color(r, g, b);

}

void changeArrangementValues(Arrangement a) {
  a.type = arrTypedroplist.getSelectedText();
  
  float xspacingval = X_Spacing.getValueF();
  if (xspacingval > a.wsize){
    a.xSpacing = xspacingval;
  }
  else{
    a.xSpacing = a.wsize;
    X_Spacing.setValue(a.wsize);
  }
  float yspacingval = Y_Spacing.getValueF();
  if (yspacingval > a.hsize){
    a.ySpacing = yspacingval;
  }
  else{
    a.ySpacing = a.hsize;
    Y_Spacing.setValue(a.hsize);
  }

  a.hsize = arrheightslider.getValueI();
  a.wsize = arrwidthslider.getValueI();
}
