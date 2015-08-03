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
  
  void display() {
    move();
    image(img, x, y);
  }
  
  void move() {
    x += speedX;
    y += speedY;
  }
}
