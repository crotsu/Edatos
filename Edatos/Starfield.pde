//----------
// 背景の星
//----------

public class Starfield {
  private Star stars[];
  private int count;

  // コンストラクタ(データ作成時に1度だけ行う) 
  public Starfield( int count ) {
    this.count = count;
    stars = new Star[count];
    // 星を作る
    for ( int i =0; i < count; i++) {
      stars[i] = new Star( random( width ), random( height ), random( 10 )); // 星の座標(x,y,z)をランダムに与える
      // 3次元方向の深さ表現は星の明るさと移動速度で表現する
    }
  }
  
  public void draw() {
    strokeWeight( 2 );
    // 生成した星を一つ一つ処理する
    for ( int i = 0; i < count; i++) {
      stroke( stars[i].z * 25 ); // 星の明るさ．浅い星は明るい．
      point( stars[i].x, stars[i].y ); // (x, y)座標を与える
    
      stars[i].y += stars[i].z; // 星の移動．浅い星は速い．
      if (height < stars[i].y) { // 星が流れ終わったら，新規に星を生成 
        stars[i] = new Star( random(width), 0, random( 10 ));
      }
    }
  }
}

// Starfieldで使うStarクラス
class Star {
  float x, y, z;
  Star( float x, float y, float z ) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}
