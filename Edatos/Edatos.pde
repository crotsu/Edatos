Starfield starfield;
Ship ship;
ArrayList<Enemy> enemies;
ArrayList<Bullet> bullets;

void setup() {
  size(400, 600);
  imageMode(CENTER);

  starfield = new Starfield(100);
  ship = new Ship();
  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList<Bullet>();
}

void draw() {
  background(0);
  starfield.draw();

  if (random(150) < 2 && enemies.size()<3) {
    enemies.add(new Enemy());
  }
  
  // 敵
  for (int i=0; i<enemies.size(); i++) {
    Enemy enemy = enemies.get(i);
    enemy.display();
    if (random(50) < 1) {
      bullets.add(new Bullet(enemy.x, enemy.y));
    }
    if (enemy.isFinished()) {
      enemies.remove(i);
    }
  }
  
  for (int i=0; i<bullets.size(); i++) {
    Bullet bullet = bullets.get(i);
    bullet.display();
    if (bullet.isFinished()) {
      bullets.remove(i);
    }
  }
  
  ship.display(mouseX, mouseY);
}
