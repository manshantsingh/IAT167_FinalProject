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
ArrayList<Enemy> enemies=new ArrayList<Enemy>();

//all other variables
Player player;
Lifeless d;
PVector camera;
int score;
//PImage box;


void setup() {
  size(1000, 700);
//  box=loadImage("box.png");
//  box.resize(100,100);
  player=new Player(width/2, 50);
  dead.add(new Lifeless(width/2, height-50, 5000, 100));
  new Enemy(width,50,PLAYER_SIZE, PLAYER_SIZE, PLAYER_MAX_HEALTH, PLAYER_MASS,3,10,-2500+PLAYER_SIZE+width/2,2500+width/2-PLAYER_SIZE);
}

void draw() {
//  println(frameRate);
  background(255);
  camera();
  for (int i=0; i<dead.size (); i++) {
    Lifeless d=dead.get(i);
    d.draw();
  }
  for(int i=0;i<enemies.size();i++){
    Enemy e=enemies.get(i);
    e.update();
    e.draw();
  }
  player.update();
  player.draw();
}
void camera(){
  translate(-camera.x,-camera.y);
  translate(width/2,height/2);
}

void respawn(){
  player=new Player(width/2, 50);
}

