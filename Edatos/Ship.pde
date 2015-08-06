class Ship {
  PImage img;
  int hp;
  int maxHp;
  int x, y;
  int speedX, speedY;
  boolean alive;
  int rappid;
  int shotType;

  Ship() {
    img = loadImage("ship.png");
    alive = true;
    hp = 300;
    maxHp = 300;
    x = width/2;
    y = 4*height/5;
    speedX = 8; // 戦闘機のx方向の移動速度
    speedY = 8; // 戦闘機のy方向の移動速度
    rappid = 15; // 発射間隔．値が小さいほど連写できる
    shotType = 0; // 0:通常，1:3way
  }
    
  void move(int sx, int sy) {
    if (x > sx) {
      x = x - speedX;
    }
    if (x < sx) {
      x = x + speedX;
    }
    if (y > sy) {
      y = y - speedY;
    }
    if (y < sy) {
      y = y + speedY;
    }    
  }
  
  void display(int mx, int my) {
    move(mx, my);
    image(img, x, y);
  }
}
