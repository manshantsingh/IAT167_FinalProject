//all constants
final PVector GRAVITY=new PVector(0, 1);
final float JUMP_FORCE=-25;
final float PLAYER_SPEED=1;
final int PLAYER_SIZE=80;
final int PLAYER_MAX_HEALTH=3;
final float PLAYER_ROTATION_SPEED=2.0/PLAYER_SIZE;
final float FRICTION=0.95;
final float BOUNCE_BACK=-0.5;
final float CAMERA_SPEED=0.5;
final float ZOOM_INCREMENT=1.1;

//all lists
ArrayList<Lifeless> dead=new ArrayList<Lifeless>();
ArrayList<Enemy> enemies=new ArrayList<Enemy>();

//all other variables
Player player;
Lifeless d;
PVector camera, camTarget;
int score;
float zoomValue=1.0;


void setup() {
  size(1000, 700);
  player=new Player(width/2, 50);
  dead.add(new Lifeless(width/2, height-50, 5000, 100));
  dead.add(new Lifeless(width, height-2*PLAYER_SIZE, PLAYER_SIZE, PLAYER_SIZE));
  new Enemy(width, 50, PLAYER_SIZE, PLAYER_SIZE, PLAYER_MAX_HEALTH, 3, 10, width+PLAYER_SIZE+10, 2500+width/2-PLAYER_SIZE);
}

void draw() {
  //  println(frameRate);
  background(255);
  camera();
  for (int i=0; i<dead.size (); i++) {
    Lifeless d=dead.get(i);
    d.draw();
  }
  for (int i=0; i<enemies.size (); i++) {
    Enemy e=enemies.get(i);
    e.update();
    e.draw();
  }
  player.update();
  player.draw();
  textSize((int)(22/zoomValue));
  text("current zoomValue: "+zoomValue,camera.x,camera.y);
}
void camera() {
  camera.set(lerp(camera.x, camTarget.x, CAMERA_SPEED), lerp(camera.y, camTarget.y, CAMERA_SPEED));
  translate(width/2, height/2);
  scale(zoomValue);
  translate(-camera.x, -camera.y);
}

void respawn() {
  player=new Player(width/2, 50);
}

void zoomIn(){
  if(zoomValue<2.0) zoomValue*=ZOOM_INCREMENT;
}
void zoomOut(){
  if(zoomValue>0.15) zoomValue/=ZOOM_INCREMENT;
}

