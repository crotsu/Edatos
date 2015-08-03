Starfield starfield;
Ship ship;
ArrayList<Enemy> enemies;

void setup() {
  size(400, 600);
  imageMode(CENTER);

  starfield = new Starfield(100);
  ship = new Ship();
  enemies = new ArrayList<Enemy>();
}

void draw() {
  background(0);
  starfield.draw();

  if (random(150) < 2 && enemies.size()<3) {
    enemies.add(new Enemy());
  }
  
  for (int i=0; i<enemies.size(); i++) {
    Enemy enemy = enemies.get(i);
    enemy.display();
    if (enemy.isFinished()) {
      enemies.remove(i);
    }
  }
  
  ship.display(mouseX, mouseY);
}
