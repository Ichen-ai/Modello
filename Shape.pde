class Shape {
  //fields
  String type;
  PVector pos;
  int hei, wid;
  color colour;
  
  //constructor
  Shape(String t, PVector p, int h, int w, int r, int g, int b) {
    this.type = t;
    this.pos = p;
    this.hei = h;
    this.wid = w;
    this.colour = color(r, g, b);
  }
  
  //methods
  void drawShape() {
    noStroke();
    fill(this.colour);
    
    if (this.type == "circle") {
      circle(this.pos.x, this.pos.y, this.wid);
      
    } else if (this.type == "square") {
      rect(this.pos.x, this.pos.y, this.hei, this.wid);
      
    } else if (this.type == "triangle") {  
      triangle(this.pos.x - this.wid/2, this.pos.y + this.hei/2, this.pos.x, this.pos.y - this.hei/2, this.pos.x + this.wid/2, this.pos.y + this.hei/2);
    }
  }
  
  void moveShape() {}
}
