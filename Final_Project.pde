//all state constants
final int PLAYING=0;
final int REPLAYING=1;
final int MAIN_MENU=2;
final int SELECT_WHAT_LEVEL=3;

//all other constants
final PVector GRAVITY=new PVector(0, 0.4);
final float PLAYER_JUMP_FORCE=-10;
final float PLAYER_SPEED=0.3;
final int DEATH=100;
final int ENEMY_INVINCIBILITY_TIME=15;
final int NINJA_JUMP_INTERVAL=120;
final int VANISH_SLATE_TIME=100;
final int SCREEN_OUT_TIME=30;
final int TRANSITION_RATE=15;
final float PLAYER_ROTATION_SPEED=2.0/60;
final float FRICTION=0.98;
final float CAMERA_SPEED=0.5;
final float ZOOM_INCREMENT=1.1;
final int BEAT_ALL_LEVELS=7;
final float ANGEL_RISE_SPEED=2;

//all lists
ArrayList<Lifeless> bases;
ArrayList<Enemy> enemies;
ArrayList<Checkpoint> checkpoints;
ArrayList<Text> texts;
ArrayList<RePlayer> replays;

//all other variables
Player player;
PVector camera, camTarget;
int currentLevel, state, latestAccessableLevel;
Level level;
ReplayLevel replayLevel;
Finishpoint finishpoint;
ColliderText menuTextStart, menuTextSelectLevel;

void setup() {
  size(1000, 700);
  initialize();
}

void draw() {
  //  println(frameRate);
  switch(state) {
  case PLAYING:
    level.run();
    break;
  case REPLAYING:
    replayLevel.run();
    break;
  case MAIN_MENU:
    showMainMenu();
    break;
  case SELECT_WHAT_LEVEL:
    showLevelSelection();
    break;
  default: //main-menu
    state=MAIN_MENU;
  }
}

void initialize() {
  dataInitialize();
  textAlign(CENTER, CENTER);
  currentLevel=1;
  latestAccessableLevel=0;
  level=new Level();
  state=MAIN_MENU;
  menuTextStart=new ColliderText("START", width/2, 450, 50, color(255, 0, 0), color(0, 255, 0));
  menuTextSelectLevel=new ColliderText("Level Select", width/2, 550, 50, color(255, 0, 0), color(0, 255, 0));
}

