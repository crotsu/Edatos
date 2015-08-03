Starfield starfield;
Ship ship;
ArrayList<Enemy> enemies;
ArrayList<Bullet> bullets;
ArrayList<Laser> lasers;
boolean canPress = true;
int timeCount = 0;

void setup() {
  size(400, 600);
  imageMode(CENTER);

  starfield = new Starfield(100);
  ship = new Ship();
  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList<Bullet>();
  lasers = new ArrayList<Laser>();
}

void draw() {
  background(0);
  starfield.draw();
  println(ship.hp);
  
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
  
  if(mousePressed) {
    if (canPress == true) {
      if (ship.shotType == 0) {
        lasers.add(new Laser(ship.x, ship.y, 0, -5));
      }
      else if (ship.shotType == 1) {
        lasers.add(new Laser(ship.x, ship.y, 1, -10));
        lasers.add(new Laser(ship.x, ship.y, 0, -10));
        lasers.add(new Laser(ship.x, ship.y, -1, -10));
      }        
    }
    canPress = false;
  }
  timeCount++;
  if (timeCount >= ship.rappid) {
    canPress = true;
    timeCount = 0;
  }
  
  for (int i=0; i<lasers.size(); i++) {
    Laser laser = lasers.get(i);
    laser.display();
    if (laser.isFinished()) {
      lasers.remove(i);
    }
  }
  ship.display(mouseX, mouseY);
}
