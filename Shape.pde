
class Shape {
  //fields
  String type;
  PVector pos;
  int hei, wid;
  color colour, strokeColor;
  boolean isSelected;
  
  //constructor
  Shape(String t, PVector p, int h, int w, int r, int g, int b) {
    this.type = t;
    this.pos = p;
    this.hei = h;
    this.wid = w;
    this.colour = color(r, g, b);
    this.strokeColor = this.colour;
    this.isSelected = false;
  }
  
  //methods
  void drawShape() {
    if (isSelected) {
      this.strokeColor = color(255, 255, 0);
    } else {
      this.strokeColor = this.colour;
    }
    stroke(this.strokeColor);
    fill(this.colour);
    rectMode(CENTER); 
    
    if (this.type.equals("ellipse")) {
      ellipse(this.pos.x, this.pos.y, this.wid, this.hei);
      
    } else if (this.type.equals("rectangle")) {
      rect(this.pos.x, this.pos.y, this.hei, this.wid);
      
    } else if (this.type.equals("triangle")) {  
      triangle(this.pos.x - this.wid/2, this.pos.y + this.hei/2, this.pos.x, this.pos.y - this.hei/2, this.pos.x + this.wid/2, this.pos.y + this.hei/2);
    }
  }
}
