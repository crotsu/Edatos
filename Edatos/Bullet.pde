class Bullet {
  PImage img;
  int x, y;
  int speedX, speedY;
  boolean alive;

  Bullet(int ex, int ey) {
    img = loadImage("bullet.png");
    alive = true;
    x = ex;
    y = ey;
    speedX = (int)random(2);
    speedY = 5;
  }
  
  void display() {
    move();
    image(img, x, y);
  }
  
  void move() {
    x += speedX;
    y += speedY;
  }
  
  boolean isFinished() {
    boolean alive = false;
    if (x<0-50 || x>width+50 || y<0-50 || y>height+50) { // 画面外に出るまで待つため範囲を50広げる
      alive = true;
    }
    return alive;
  }
}
