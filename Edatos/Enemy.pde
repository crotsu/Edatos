class Enemy {
  PImage img;
  int hp;
  int x, y;
  int speedX, speedY;
  boolean alive;

  Enemy() {
    img = loadImage("enemy_red.png");
    alive = true;
    hp = 300;
    x = (int)random(width);
    y = -50;
    speedX = 0;
    speedY = (int)random(4)+1;
  }
  
  void move() {
    x = x + speedX;
    y = y + speedY;
  }
  
  void display() {
    move();
    image(img, x, y);
  }
  
  boolean isFinished() {
    boolean alive = false;
    if (x<0-50 || x>width+50 || y<0-50 || y>height+50) { // 画面外に出るまで待つため範囲を50広げる
      alive = true;
    }
    if (hp<0) {
      point = point + 100;
      alive = true;
    }
    return alive;
  }
}
