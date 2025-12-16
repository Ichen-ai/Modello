
class Shape {
  //fields
  int type; //the type of shape; 0 is ellipse, 1 is rectangle, 2 is triangle
  PVector pos; //the position of the center of the shape
  int hei, wid; //width and height of the shape
  color colour, strokeColor;
  boolean isSelected; //will check if user has selected the shape
  float x1, y1, x2, y2, x3, y3; //corners for triangle shape

  //constructor
  Shape(int t, PVector p, int h, int w, int r, int g, int b) {
    this.type = t;
    this.pos = p;
    this.hei = h;
    this.wid = w;
    this.colour = color(r, g, b);
    this.strokeColor = this.colour; //the inital stroke colour is the same as the shape colour
    this.isSelected = false; //the shape is not selected in the beginning
  }

  //methods
  void drawShape() {  
    stayInTile(); //ensures that the shape stays within the tile
    if (isSelected) {
      this.strokeColor = color(255, 255, 0); //will change stroke colour to allow user to visually see what shape was selected
    } else {
      this.strokeColor = this.colour; //otherwise, if unselected will be "invisible" by setting to same as normal shape colour
    }
    stroke(this.strokeColor);
    fill(this.colour);
    rectMode(CENTER);

    if (this.type == 0) {
      ellipse(this.pos.x, this.pos.y, this.wid, this.hei); //creates a shape
      
    } else if (this.type == 1) {
      rect(this.pos.x, this.pos.y, this.wid, this.hei); //creates a rectangle
      
    } else if (this.type == 2) {
      x1 = this.pos.x - this.wid/2;
      y1 = this.pos.y + this.hei/2;
      x2 = this.pos.x;
      y2 = this.pos.y - this.hei/2;
      x3 = this.pos.x + this.wid/2;
      y3 = this.pos.y + this.hei/2;
      triangle(x1, y1, x2, y2, x3, y3); //creates a triangle
    }
  }

  boolean inShape(PVector p) { //used to see if users click is within a shape
    if (this.type == 0) {
      return (pow((p.x - this.pos.x), 2)/pow(this.wid/2, 2)) + (pow((p.y - this.pos.y), 2)/pow(this.hei/2, 2)) <= 1; //formula to tell if the users click is within an ellipse
      
    } else if (this.type == 1) { //tells if users click is within a rectangle
      return p.x < this.pos.x + this.wid/2
        && p.x > this.pos.x - this.wid/2
        && p.y < this.pos.y + this.hei/2
        && p.y > this.pos.y - this.hei/2;

    } else if (this.type == 2) {
      PVector[] vert = new PVector[3]; //used to hold triangle corners
      PVector[] sides = new PVector[3];
      PVector[] perpSides = new PVector[3];

      vert[0] = new PVector(x1, y1); //fills in vertices with the x and y values
      vert[1] = new PVector(x2, y2);
      vert[2] = new PVector(x3, y3);

      for (int i = 0; i < 3; i++) {
        sides[i] = PVector.sub(vert[(i+1)%3], vert[i]); //creates a vector along each edge of the triangle (%3 wraps the triangle around)
        perpSides[i] = new PVector(-sides[i].y, sides[i].x); //creates a perpendicular vector to each edge
      }

      boolean in = true;

      for (int i = 0; i < 3; i++) {
        PVector v1 = PVector.sub(p, vert[i]); //creates a vector from the vertice to the mouse click
        float dotProd = v1.dot(perpSides[i]); //finds the dot product of vector from above to perpendicular side (how much the two vectors point in same direction)
        if ( dotProd < 0 ) in = false; //negative dot product means the point is outside the triangle
      }      
      return in;
      
    } else return false;
  }
  
  void stayInTile() { //makes sure shape is within the screen of canvas
    if (this.pos.x > width) this.pos.x = width;
    if (this.pos.x < 0) this.pos.x = 0;
    if (this.pos.y > height) this.pos.y = height;
    if (this.pos.y < 0) this.pos.y = 0;
  }
}
