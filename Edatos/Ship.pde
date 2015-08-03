class Ship {
  PImage img;
  int hp;
  int x, y;
  int speedX, speedY;
  boolean alive;
  
  Ship() {
    img = loadImage("ship.png");
    alive = true;
    hp = 300;
    x = width/2;
    y = 4*height/5;
    speedX = 2; // 戦闘機のx方向の移動速度
    speedY = 2; // 戦闘機のy方向の移動速度
  }
  
  void display(int mx, int my) {
    move(mx, my);
    image(img, x, y);
  }
  
  void move(int sx, int sy) {
    if (x > sx) {
      x -= speedX;
    }
    if (x < sx) {
      x += speedX;
    }
    if (y > sy) {
      y -= speedY;
    }
    if (y < sy) {
      y += speedY;
    }    
  }
}
