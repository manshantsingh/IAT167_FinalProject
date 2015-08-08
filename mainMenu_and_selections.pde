//main menu and level selector
ColliderText menuTextStart, menuTextSelectLevel, menuTextPracticeMode, txtBackToMenu;
ColliderText[] txtLevels=new ColliderText[6];

//pause menu
Text staticTxtPaused;
ColliderText txtResume, txtMainMenu;

void showMainMenu() {
  background(255);
  menuTextStart.update();
  menuTextSelectLevel.update();
  menuTextPracticeMode.update();
}

void showLevelSelection() {
  background(255);
  for (int i=0; i<txtLevels.length; i++) {
    txtLevels[i].update();
  }
  txtBackToMenu.update();
}


void textInitialize() {
  //main menu
  menuTextStart=new ColliderText("START", width/2, 400, 50, color(255, 0, 0), color(0, 255, 0));
  menuTextSelectLevel=new ColliderText("Level Select", width/2, 500, 50, color(255, 0, 0), color(0, 255, 0));
  menuTextPracticeMode=new ColliderText("Practice Mode: OFF", 850, 100, 25, color(255, 0, 0), color(0, 255, 0));

  //level selection
  for (int i=0; i<txtLevels.length; i++) {
    txtLevels[i]=new ColliderText(""+(i+1), 300+(i%3)*200, 250+(i/3)*200, 50, color(255, 0, 0), color(0, 255, 0));
  }
  txtBackToMenu=new ColliderText("Back", 100, 650, 50, color(255, 0, 0), color(0, 255, 0));

  //pause menu
  staticTxtPaused=new Text("Game Paused", 500, 200, 60, color(0));
  txtResume=new ColliderText("Resume", 500, 350, 50, color(255, 0, 0), color(0, 255, 0));
  txtMainMenu=new ColliderText("Main Menu", 500, 450, 50, color(255, 0, 0), color(0, 255, 0));
}

