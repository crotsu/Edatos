//----
// 敵
//----

class Enemy {
  PImage img;         // 敵の画像
  int hp;             // 敵のHP
  int x, y;           // 敵のxy座標
  int speedX, speedY; // 敵のx,y軸方向の移動速度
  boolean alive;      // 敵が生きているかどうか. Trueが生存，Falseが死亡．

  // コンストラクタ(データ作成時に1度だけ行う) 
  Enemy() {
    img = loadImage("enemy_red.png");
    alive = true;
    hp = 300;
    x = (int)random(width+1);  // 敵の出現のx座標をランダム．0からwidthまで．つまり画面の端から端まで．
    y = -50; // ウィンドウの上部よりさらに50だけ上にずらす．これにより，ウィンドウ上部から出現するように見える．
    speedX = 0; // 敵のx軸方向の移動速度
    speedY = (int)random(4)+1; // 敵のy軸方向の移動速度．1から4の整数乱数．
  }
  
  // 敵の移動
  void move() {
    x = x + speedX;
    y = y + speedY;
  }
  
  // 敵の表示
  void display() {
    move();
    image(img, x, y);
  }
  
  // 敵がウィンドウの外に出たかどうかチェック
  boolean isAlive() {
    boolean alive = true;
    if (x<0-50 || x>width+50 || y<0-50 || y>height+50) { // // 画面外に完全に出るのを待つため範囲を50広げる
      alive = false;
    }
    // 敵を倒したら，点数を与える
    if (hp<0) {
      score = score + 100;
      alive = false;
    }
    return alive;
  }
}
