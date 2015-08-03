class Laser {
  PImage img;
  int x, y;
  int speedX, speedY;
  boolean alive;
  int damage;
  
  Laser(int sx, int sy, int spX, int spY) {
    img = loadImage("laser.png");
    alive = true;
    x = sx;
    y = sy-5;
    speedX = spX;
    speedY = spY;
    damage = 100;
  }
  
  void move() {    
    x = x + speedX;
    y = y + speedY;      
  }
  
  void display() {
    for (int i=0; i<enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      if (dist(enemy.x, enemy.y, x, y)<30) {
        enemy.hp -= damage;
        x = -999;
        y = -999;
        alive = false;
      }  
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

