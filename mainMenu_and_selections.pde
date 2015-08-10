//main menu and level selector
Text staticTxtSelectLevel;
ColliderText menuTextStart, menuTextSelectLevel, menuTextPracticeMode, txtBackToMenu, txtResetStats;
LevelSelectorText[] txtLevels=new LevelSelectorText[6];
PFont font;

//pause menu
Text staticTxtPaused;
ColliderText txtResume, txtMainMenu;

void showMainMenu() {
  background(BACKGROUND_COLOR);
  image(imgCoverPage, 0, 0);
  menuTextStart.update();
  menuTextSelectLevel.update();
  menuTextPracticeMode.update();
}

void showLevelSelection() {
  background(BACKGROUND_COLOR);
  image(imgLevelSelector, 0, 0);
  staticTxtSelectLevel.update();
  for (int i=0; i<txtLevels.length; i++) {
    txtLevels[i].update();
  }
  txtBackToMenu.update();
  txtResetStats.update();
}

//Initializing all the texts in the game
void textInitialize() {
  //font initialize and use
  font=loadFont("font.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);

  //main menu
  menuTextStart=new ColliderText("START", width/2, 400, 50);
  menuTextSelectLevel=new ColliderText("Level Select", width/2, 500, 50);
  menuTextPracticeMode=new ColliderText("Practice Mode: "+(practiceMode?"ON":"OFF"), width/2, 670, 25);

  //level selection
  staticTxtSelectLevel=new Text("Choose a Level", 500, 150, 72);
  for (int i=0; i<txtLevels.length; i++) {
    txtLevels[i]=new LevelSelectorText(""+(i+1), 300+(i%3)*200, 300+(i/3)*200);
  }
  txtBackToMenu=new ColliderText("Back", 100, 650, 50);
  txtResetStats=new ColliderText("Reset Stats", 500, 650, 50);

  //pause menu
  staticTxtPaused=new Text("Game Paused", 500, 200, 60);
  txtResume=new ColliderText("Resume", 500, 350, 50);
  txtMainMenu=new ColliderText("Main Menu", 500, 450, 50);
}

