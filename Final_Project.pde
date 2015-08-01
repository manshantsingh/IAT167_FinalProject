//all constants
final PVector GRAVITY=new PVector(0, 0.4);
final float PLAYER_JUMP_FORCE=-10;
final float PLAYER_SPEED=0.3;
final int PLAYER_SIZE=60;
final int PLAYER_MAX_HEALTH=3;
final int DEATH=100;
final int NINJA_JUMP_INTERVAL=120;
final int VANISH_SLATE_TIME=200;
final float PLAYER_ROTATION_SPEED=2.0/PLAYER_SIZE;
final float FRICTION=0.98;
final float CAMERA_SPEED=0.5;
final float ZOOM_INCREMENT=1.1;

//all lists
ArrayList<Lifeless> bases;
ArrayList<Enemy> enemies;
ArrayList<Checkpoint> checkpoints;
ArrayList<Text> texts;

//all other variables
Player player;
PVector camera, camTarget;
int score, currentLevel;
Level level;
Finishpoint finishpoint;

void setup() {
  size(1000, 700);
  textAlign(CENTER, CENTER);
  currentLevel=1;
  level=new Level(currentLevel);
}

void draw() {
  println(frameRate);
  level.run();
}

