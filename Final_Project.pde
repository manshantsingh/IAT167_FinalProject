//all state constants
final int PLAYING=0;
final int REPLAYING=1;

//all other constants
final PVector GRAVITY=new PVector(0, 0.4);
final float PLAYER_JUMP_FORCE=-10;
final float PLAYER_SPEED=0.3;
final int PLAYER_SIZE=60;
final int DEATH=100;
final int ENEMY_INVINCIBILITY_TIME=15;
final int NINJA_JUMP_INTERVAL=120;
final int VANISH_SLATE_TIME=100;
final int SCREEN_OUT_TIME=30;
final int TRANSITION_RATE=15;
final float PLAYER_ROTATION_SPEED=2.0/PLAYER_SIZE;
final float FRICTION=0.98;
final float CAMERA_SPEED=0.5;
final float ZOOM_INCREMENT=1.1;

//all lists
ArrayList<Lifeless> bases;
ArrayList<Enemy> enemies;
ArrayList<Checkpoint> checkpoints;
ArrayList<Text> texts;
ArrayList<RePlayer> replays;

//all other variables
Player player;
PVector camera, camTarget;
int currentLevel, state;
Level level;
ReplayLevel replayLevel;
Finishpoint finishpoint;

void setup() {
  size(1000, 700);
  textAlign(CENTER, CENTER);
  currentLevel=1;
  level=new Level();
  state=PLAYING;
}

void draw() {
  println(frameRate);
  switch(state) {
  case PLAYING:
    level.run();
    break;
  case REPLAYING:
    replayLevel.run();
    break;
  }
}

