//--------
// 敵の弾
//--------

class Bullet {
  PImage img;         // 弾の画像
  int x, y;           // 弾のxy座標
  int speedX, speedY; // 弾のx,y軸方向の移動速度
  boolean alive;      // 弾がウィンドウ内にあるかどうか. Trueならウィンドウないにある，Falseならない．
  int damage;         // 弾が戦闘機に与えるダメージ
  
  // コンストラクタ(データ作成時に1度だけ行う) 
  Bullet(int ex, int ey) {
    img = loadImage("bullet.png");
    alive = true;
    x = ex;
    y = ey;
    speedX = (int)random(7) - 3; // (int)random(7)で0から6の整数乱数．これに-3するから，-3から3の乱数になる．
    speedY = (int)random(7) + 4; // 4から10の整数乱数
    damage = 250;
  }
  
  // 弾の移動
  void move() {
    x = x + speedX;
    y = y + speedY;
  }
  
  // 弾の表示
  void display() {
    // レーザーと戦闘機との当たり判定
    if (dist(ship.x, ship.y, x, y)<30) {  // 戦闘機と弾の中心座標間の距離が30未満なら
      ship.hp -= damage;
      x = -999; // 弾が同じ座標に留まると，また弾に当たってしまうので，ウィンドウ外部に飛ばす.
      y = -999;
      alive = false;
    }
    move();
    image(img, x, y);
  }

  // 弾がウィンドウの外に出たかどうかチェック
  boolean isAlive() {
    boolean alive = true;
    if (x<0-50 || x>width+50 || y<0-50 || y>height+50) { // 画面外に完全に出るのを待つため範囲を50広げる
      alive = false;
    }
    return alive;
  }
}
