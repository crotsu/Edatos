Starfield starfield;
Ship ship;

void setup() {
  size(400, 600);
  imageMode(CENTER);

  starfield = new Starfield(100);
  ship = new Ship();
}

void draw() {
  background(0);
  starfield.draw();
 
  ship.display(mouseX, mouseY); 
}
