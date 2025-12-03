
void getShapeValues(Shape s) {
  s.type = shapeTypeList.getSelectedText();
  int r = redSlider.getValueI();
  int g = greenSlider.getValueI();
  int b = blueSlider.getValueI();
  s.colour = color(r, g, b);
  
  //s.hei = heightSlider.getValueI();
  //s.wid = widthSlider.getValueI();
}
