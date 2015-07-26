//all constants
final PVector GRAVITY=new PVector(0, 1);
final float JUMP_FORCE=-25;
final float PLAYER_SPEED=0.3;
final int PLAYER_SIZE=80;
final int PLAYER_MAX_HEALTH=3;
final float PLAYER_ROTATION_SPEED=2.0/PLAYER_SIZE;
final float FRICTION=0.98;
final float CAMERA_SPEED=0.5;
final float ZOOM_INCREMENT=1.1;

//all lists
ArrayList<Lifeless> bases;
ArrayList<Lifeless> dangers;
ArrayList<Enemy> enemies;
ArrayList<Checkpoint> checkpoints;

//all other variables
Player player;
PVector camera, camTarget;
int score, currentLevel;
Level level;
Finishpoint finishpoint;

void setup() {
  size(1000, 700);
  currentLevel=-1;
  level=new Level(currentLevel);
}

void draw() {
  println(frameRate);
  level.run();
}


