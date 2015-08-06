//------------------
// 戦闘機のレーザー
//------------------

class Laser {
  PImage img;         // レーザーの画像
  int x, y;           // レーザーのxy座標
  int speedX, speedY; // レーザーのx,y軸方向の移動速度
  boolean alive;      // レーザーがウィンドウ内にあるかどうか. Trueならウィンドウないにある，Falseならない．
  int damage;         // レーザーが敵に与えるダメージ
  
  // コンストラクタ(データ作成時に1度だけ行う) 
  Laser(int sx, int sy, int spX, int spY) {
    img = loadImage("laser.png");
    alive = true;
    x = sx;
    y = sy - 5; // レーザーの初期位置を上に5だけずらす．これをやらないと戦闘機の上からレーザーが発射されるように見えない．
    speedX = spX;
    speedY = spY;
    damage = 100;
  }
  
  // レーザーの移動
  void move() {    
    x = x + speedX;
    y = y + speedY;      
  }
  
  // レーザーの表示
  void display() {
    // レーザーと全ての敵との当たり判定
    for (int i=0; i<enemies.size(); i++) {
      Enemy enemy = enemies.get(i); // ArrayListから既に生成した敵を取得する
      if (dist(enemy.x, enemy.y, x, y)<30) { // 敵とレーザーの中心座標間の距離が30未満なら
        enemy.hp = enemy.hp - damage;
        x = -999; // レーザーが同じ座標に留まると，また敵に当たってしまうので，ウィンドウ外部に飛ばす.
        y = -999;
        alive = false;
      }  
    }
    move();
    image(img, x, y);
  }

  // レーザーがウィンドウの外に出たかどうかチェック
  boolean isAlive() {
    boolean alive = true;
    if (x<0-50 || x>width+50 || y<0-50 || y>height+50) { // 画面外に完全に出るのを待つため範囲を50広げる
      alive = false;
    }
    return alive;
  }

}

