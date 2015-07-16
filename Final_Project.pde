final PVector GRAVITY=new PVector(0, 1);
final float JUMP_FORCE=-25;
final float PLAYER_SPEED=1;
final int PLAYER_SIZE=100;
final int PLAYER_MAX_HEALTH=3;
final float PLAYER_MASS=5;
final float PLAYER_ROTATION_SPEED=2.0/PLAYER_SIZE;
final float FRICTION=0.99;
final float DEFLECT=-0.8;

Player p;

ArrayList<Collider> colliders=new ArrayList<Collider>();

void setup() {
  size(1200, 700);
  p=new Player(width/2, 50);
  colliders.add(new Horizontal(0, height-10, width, true));
}

void draw() {
  background(255);
  
  p.update();
  p.draw();
  checkCollisions();
}

void checkCollisions(){
  for (int i=0; i<colliders.size (); i++) {
    Collider c=colliders.get(i);
    c.draw();
    c.collision(p);
  }
}

