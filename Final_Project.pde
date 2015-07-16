//all constants
final PVector GRAVITY=new PVector(0, 1);
final float JUMP_FORCE=-25;
final float PLAYER_SPEED=1;
final int PLAYER_SIZE=80;
final int PLAYER_MAX_HEALTH=3;
final float PLAYER_MASS=5;
final float PLAYER_ROTATION_SPEED=2.0/PLAYER_SIZE;
final float FRICTION=0.95;

//all lists
ArrayList<Lifeless> dead=new ArrayList<Lifeless>();

//all other variables
Player p;
Lifeless d;
PVector camera;


void setup() {
  size(1000, 700);
  p=new Player(width/2, 50);
  dead.add(new Lifeless(width/2, height-50, 5*width, 100));
}

void draw() {
  background(255);
  camera();
  for (int i=0; i<dead.size (); i++) {
    Lifeless d=dead.get(i);
    d.draw();
  }
  p.update();
  p.draw();
}
void camera(){
  translate(-camera.x,-camera.y);
  translate(width/2,height/2);
}

void respawn(){
  p=new Player(width/2, 50);
}

