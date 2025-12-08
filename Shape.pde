
class Shape {
  //fields
  String type;
  PVector pos;
  int hei, wid;
  color colour, strokeColor;
  boolean isSelected;
  float x1, y1, x2, y2, x3, y3;

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
      rect(this.pos.x, this.pos.y, this.wid, this.hei);
      
    } else if (this.type.equals("triangle")) {
      x1 = this.pos.x - this.wid/2;
      y1 = this.pos.y + this.hei/2;
      x2 = this.pos.x;
      y2 = this.pos.y - this.hei/2;
      x3 = this.pos.x + this.wid/2;
      y3 = this.pos.y + this.hei/2;
      triangle(x1, y1, x2, y2, x3, y3);
    }
  }

  boolean inShape(PVector p) {
    if (this.type.equals("ellipse")) {
      return (pow((p.x - this.pos.x), 2)/pow(this.wid/2, 2)) + (pow((p.y - this.pos.y), 2)/pow(this.hei/2, 2)) <= 1;
      
    } else if (this.type.equals("rectangle")) {
      return p.x < this.pos.x + this.wid/2
        && p.x > this.pos.x - this.wid/2
        && p.y < this.pos.y + this.hei/2
        && p.y > this.pos.y - this.hei/2;
        
    } else if (this.type.equals("triangle")) {
      PVector[] poly = new PVector[3];
      PVector[] sides = new PVector[3];
      PVector[] perpSides = new PVector[3];

      poly[0] = new PVector(x1, y1);
      poly[1] = new PVector(x2, y2);
      poly[2] = new PVector(x3, y3);

      for (int i = 0; i < 3; i++) {
        sides[i] = PVector.sub(poly[(i+1)%3], poly[i]);
        perpSides[i] = new PVector(-sides[i].y, sides[i].x);
      }

      boolean in = true;

      for (int i = 0; i < 3; i++) {
        PVector v1 = PVector.sub(p, poly[i]);
        float dotProd = v1.dot(perpSides[i]);
        if ( dotProd < 0 ) in = false;
      }      
      return in;
    } else return false;
  }
}
