Starfield starfield;
Ship ship;                 // 戦闘機
ArrayList<Enemy> enemies;  // 敵
ArrayList<Laser> lasers;   // 戦闘機のレーザー
ArrayList<Bullet> bullets; // 敵の砲弾
boolean canPress = true;
int timeCount = 0;
int point = 0;

void setup() {
  size(400, 600);
  imageMode(CENTER);

  starfield = new Starfield(100); // 背景の星の数を100にする
  ship = new Ship();
  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList<Bullet>();
  lasers = new ArrayList<Laser>();
  point = 0;
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
  
  // 弾
  for (int i=0; i<bullets.size(); i++) {
    Bullet bullet = bullets.get(i);
    bullet.display();
    if (bullet.isFinished()) {
      bullets.remove(i);
    }
  }
  
  // レーザー
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
  if (ship.hp<=0) {
    ship.alive = false;
    ship.x = -999;
    ship.y = -999;
  }
  
  if (point>=500) {
    ship.shotType = 1;
  }
  
  if (ship.alive) {
    ship.display(mouseX, mouseY);
  }
    
  // スコア表示
  score(point);
  
  // 戦闘機のHP表示
  displayHP();
  
}

// スコア表示
void score(int point) {
  textAlign(CENTER);
  textSize(30);
  fill(#FAE753);
  text(point,50,100);
}

void displayHP() {
  stroke(255);
  fill(0);
  rect(9,19,width-19,31);
  noStroke();
  fill(0,255,0);
  if (ship.hp>0) {
    rect(10,20,float(width-20)*float(ship.hp)/float(ship.maxHp),30);
  }
  else {
    text("Game Over",width/2,height/2);
  }
}
