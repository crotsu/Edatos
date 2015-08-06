//------------------------------------------------
// 本格シューティングゲーム完成版（コメント付き）
//------------------------------------------------

// 主要なデータ宣言
Starfield starfield;       // 背景の星
Ship ship;                 // 戦闘機
ArrayList<Enemy> enemies;  // 敵
ArrayList<Laser> lasers;   // 戦闘機のレーザー
ArrayList<Bullet> bullets; // 敵の砲弾
int score = 0;             // スコア

//-------------------------------
// ゲーム起動時に１度だけ実行する
//-------------------------------
void setup() {
  size(400, 600);   // 画面サイズを400 x 600の長方形にする
  imageMode(CENTER);// 画像座標の指定方法を中心に設定

  // 各種インスタンスを生成
  starfield = new Starfield(100); // 背景の星の数を100にする
  ship = new Ship();
  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList<Bullet>();
  lasers  = new ArrayList<Laser>();
}

//-------------------------------------------
// ゲーム実行時に１秒間に60回画面が更新される
//-------------------------------------------
void draw() {
  background(0); // 画面クリアー（画面を黒を塗りつぶす）
  starfield.draw(); // 背景の星を描画する

  // 敵の出現
  // 敵が1/60秒で2%の確率で，かつ敵の数が3未満のとき生成．つまり同時に3体しか出現しない
  if (random(1.0) < 0.02 && enemies.size()<3) {
    enemies.add(new Enemy());
  }
  
  
  // 敵の動作
  for (int i=0; i<enemies.size(); i++) {
    Enemy enemy = enemies.get(i); // ArrayListから既に生成した敵を取得する
    enemy.display(); // 敵画像を表示
    // 敵が画面の外に出たら，その敵をArrayListから削除
    if (enemy.isAlive()==false) {
      enemies.remove(i);
    }
    // 敵が弾を発射．1/60秒で3%の確率
    if (random(1) < 0.03) {
      bullets.add(new Bullet(enemy.x, enemy.y));
    } 
  }
  
  
  // 敵の弾の動作
  for (int i=0; i<bullets.size(); i++) {
    Bullet bullet = bullets.get(i); // ArrayListから既に生成した弾を取得する
    bullet.display(); // 弾画像を表示
    if (bullet.isAlive()==false) { // 弾が画面の外に出たら，その弾をArrayListから削除
      bullets.remove(i);
    }
  }
  
  
  // 戦闘機のレーザー発射
  if(mousePressed) { // マウスの左ボタンがクリックされたら
    if (ship.canPress == true) { // 発射できる状態なら    
      shoot(); // レーザー発射
    }
    ship.canPress = false; // 発射できないようする
  }
  ship.timeCount++; // 1/60秒で1回カウントされる
  if (ship.timeCount >= ship.rappid) { // ship.rappidになったら発射できるようにする
    ship.canPress = true;
    ship.timeCount = 0; // 0にリセット
  }
  
  
  // 戦闘機のレーザーの動作
  for (int i=0; i<lasers.size(); i++) {
    Laser laser = lasers.get(i); // ArrayListから既に生成したレーザーを取得する
    laser.display(); // レーザー画像を表示
    if (laser.isAlive()==false) { // レーザーが画面の外に出たら，そのレーザーをArrayListから削除
      lasers.remove(i);
    }
  }
   
    
  // 戦闘機の動作
  selectShottype(); // スコアによって攻撃タイプを選択
  ship.isAlive(); // 戦闘機のHPが0より大きければ生存
  if (ship.alive) {
    ship.display(mouseX, mouseY); // ウィンドウ内のマウスカーソルの座標を取得して，戦闘機を動かす
  }
    
  // スコア表示
  displayScore(score);
  
  // 戦闘機のHP表示
  displayHP();
  
}

// スコアによって攻撃タイプを選択
void selectShottype()
{
  if (score>=500) {
    ship.shotType = 1;
  }
  if (score>=1000) {
    ship.shotType = 2;
  }
  if (score>=3000) {
    ship.shotType = 3;
  }
}

// 攻撃タイプによって，レーザーを発射
void shoot()
{
  if (ship.shotType == 0) {
    lasers.add(new Laser(ship.x, ship.y, 0, -5));
  }
  else if (ship.shotType == 1) {
    lasers.add(new Laser(ship.x-10, ship.y, 0, -25));
    lasers.add(new Laser(ship.x+10, ship.y, 0, -25));
  }
  else if (ship.shotType == 2) {
    lasers.add(new Laser(ship.x, ship.y,  1, -10));
    lasers.add(new Laser(ship.x, ship.y,  0, -10));
    lasers.add(new Laser(ship.x, ship.y, -1, -10));
  }
  else if (ship.shotType == 3) {
    lasers.add(new Laser(ship.x, ship.y,  4, -10));
    lasers.add(new Laser(ship.x, ship.y,  2, -10));
    lasers.add(new Laser(ship.x, ship.y,  0, -10));
    lasers.add(new Laser(ship.x, ship.y, -2, -10));
    lasers.add(new Laser(ship.x, ship.y, -4, -10));
  }
}

// スコア表示
void displayScore(int score)
{
  textAlign(CENTER);
  textSize(30);
  fill(#FAE753);
  text(score,50,100);
}

// 戦闘機のHP表示
void displayHP()
{
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
