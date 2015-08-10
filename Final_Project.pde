/********************THINGS YOU NEED TO KNOW BEFORE MARKING********************\
 *
 * + I just recently added the replay mechanism because that was something 
 *   I really really wanted to add but was always thinking how to.
 * + Since the replay mechanism has just been added, there were a few
 *   requirements I might have not been able to fulfill.
 *      - There are no random movements in my game because if I have random
 *        movements, then my replays will not be in sync.
 *
 * + Since my replays were added at the end, the ReplayLevel class might
 *   have some redundant code from the Level class, but I do not want to change
 *   it now because there isn't much time left. Even if I took the replays away,
 *   I was still exceeding the requirements, therefore are just there to make
 *   the player be happy about his/her accomplishments, and laugh on their fails.
 *
 * + There is no Game Over screen in this game, because I feel that it does not
 *   require it. It kind of seemed to contradict with the "keep trying until you
 *   win" theme of the game. There are many other features/aspects of the game
 *   that are present instead of that.
 *
 * + Also, all the variable, field and method names are self descriptive. They
 *   describe what they are and what they do. Therefore, commenting using
 *   synonyms will just be redundant.
 */

import ddf.minim.*;

//all state constants
final int PLAYING=0;
final int REPLAYING=1;
final int MAIN_MENU=2;
final int SELECT_WHAT_LEVEL=3;

//all other constants
final PVector GRAVITY=new PVector(0, 0.4);
final float PLAYER_JUMP_FORCE=-10;
final float PLAYER_SPEED=0.3;
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
final color BACKGROUND_COLOR=color(116, 224, 255);

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
boolean practiceMode;
float goalTime;
Level level;
ReplayLevel replayLevel;
Finishpoint finishpoint;

void setup() {
  size(1000, 700);
  initialize();
}

void draw() {
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
  default:
    state=MAIN_MENU;
  }
}

//game load initialize manager
void initialize() {
  currentLevel=1;
  latestAccessableLevel=1;
  state=MAIN_MENU;
  practiceMode=false;

  dataInitialize();
  textInitialize();
}

