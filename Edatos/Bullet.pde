class Bullet {
  PImage img;
  int x, y;
  int speedX, speedY;
  boolean alive;
  int damage;
  
  Bullet(int ex, int ey) {
    img = loadImage("bullet.png");
    alive = true;
    x = ex;
    y = ey;
    speedX = (int)random(2);
    speedY = 5;
    damage = 50;
  }
  
  void move() {
    x += speedX;
    y += speedY;
  }
  
  void display() {
    if (dist(ship.x, ship.y, x, y)<30) {
      ship.hp -= damage;
      x = -999;
      y = -999;
      alive = false;
    }
    move();
    image(img, x, y);
  }

  boolean isFinished() {
    boolean alive = false;
    if (x<0-50 || x>width+50 || y<0-50 || y>height+50) { // 画面外に出るまで待つため範囲を50広げる
      alive = true;
    }
    return alive;
  }
}
