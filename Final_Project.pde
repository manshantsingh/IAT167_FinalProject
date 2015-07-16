final PVector GRAVITY=new PVector(0, 1);
final float JUMP_FORCE=-25;
final float PLAYER_SPEED=1;
final int PLAYER_SIZE=100;
final int PLAYER_MAX_HEALTH=3;
final float PLAYER_MASS=5;
final float PLAYER_ROTATION_SPEED=0.02;
final float FRICTION=0.95;

Player p;
Lifeless d;

ArrayList<Lifeless> dead=new ArrayList<Lifeless>();

void setup() {
  size(800, 600);
  p=new Player(width/2, 50);
  dead.add(new Lifeless(width/2, height-50, width, 100));
}

void draw() {
  background(255);
  for (int i=0; i<dead.size (); i++) {
    Lifeless d=dead.get(i);
    d.draw();
  }
  p.update();
  p.draw();
}

