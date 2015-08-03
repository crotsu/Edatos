Starfield starfield;

void setup() {
  size(400, 600);
  
  starfield = new Starfield(100);
 
}

void draw() {
  background(0);
  starfield.draw();
}
