class main_character extends character_base {
  boolean is_player;
  int standing_state;
  int jumping_state;
  int walking_state;
  int xcore;
  int ycore;
  boolean left;
  boolean right;
  boolean jump;
  boolean crouch;
  boolean lrLock;
  float charSpeed;
  //float X;
  //float Y;
  float VX;
  float VY;
  float G;
  ArrayList<PImage>marioList = new ArrayList<PImage>();
  //ArrayList<Integer>coreList = new ArrayList<Integer>();
  main_character(float condamagedeal, String conname, float conhealth, int conlives, float conjump_height, boolean concan_jump, boolean concan_spawn, boolean concan_attack, boolean concan_move, float conarmor, float conresistance) {
    super(condamagedeal, conname, conhealth, conlives, conjump_height, concan_jump, concan_spawn, concan_attack, concan_move, conarmor, conresistance);
    is_player=true;
    conlives=3;
    conhealth=5;
    conjump_height=5;
    concan_move=true;
    concan_jump=true;
    concan_attack=true;
    conarmor=10;
    concan_spawn=true;
    conresistance=7;
    conname="PlayerOne";
    can_spawn=concan_spawn;
    PImage spritesheet;
    spritesheet=loadImage("Images/mariospritesheet.png");
    image(spritesheet, 0, 0);
    PImage mario = get(14, 10, 14, 20);
    PImage mario1 = get(31, 10, 15, 19);
    PImage mario2 = get(115, 7, 16, 22);
    marioList.add(mario);
    marioList.add(mario1);
    marioList.add(mario2);
    xcore = 175;
    ycore = 175;
  }

  void display() {
    // IF STANDING STATE AND WALKING STATE = 0 THEN MARIO INVISIBLE
    // THIS IS THE START OF THE LOGIC LOOP FOR COORDINATE UPDATING
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == RIGHT || keyCode == LEFT) {
          if (walking_state==0) { // IF RIGHT ARROW KEY PRESSED
            walking_state=1; // SET THE WALKING STATE TO POSITIVE
            standing_state=0; // MAKE SURE THE GAME RECOGNISES THAT WE AREN'T STANDINMG
            /*prevxcore=xcore; //The previous coordinate is set to the coordinate we are in now
             newxcore=xcore+10;//THe future coordinate is set to the coordinate we are in now plus 10 more since we are going right
             delay(1);//add a supersmall delay to prevent overloading of code
             xcore=newxcore;*/            // current coordinate is set to the future one
          } else if (walking_state==2) {
            //walking_state=1;
            //tanding_state=0;
          } // closes walking state 2
          if (keyCode == RIGHT) { //start of deef for right
            right = true;
          } else if (keyCode != RIGHT) {
            right = false;
          }//closes not right
          if (keyCode == LEFT) { //start of def for left
            left = true;
          } else if (keyCode != LEFT) {
            left = false;
          }//closes not left
        }//closes right or left
      }//closes key coded
    }//closes key pressed
    if (!keyPressed) {
      standing_state=1;
      walking_state=0;
    } //closes not key pressed
    /*if (keyPressed) { // read above comments and basically the same thing but
     walking_state=1;//set walking state positive
     standing_state=0;//make sure game recognises that we are moving
                                                                                                                                                                        /*prevxcore=xcore;
     newxscore=xcore-10; // however it is -10 here so we move backwards
     delay(1);
     xcore=newxcore;
     }*/
    if (standing_state==1) {
      if (right) {
        image(marioList.get(0), xcore, ycore);
      }
      if (left) {
        //pushMatrix();
        //scale(-1.0, 1.0);
        image(marioList.get(0), xcore, ycore);
        //popMatrix();
      }
    }
    if (walking_state==1) {
      if (right) {
        xcore=xcore+8;
        walking_state=2;
        //      image(marioList.get(0), xcore, ycore);
        //      delay(10);
        delay(40);
        image(marioList.get(1), xcore, ycore);
      }
      if (left) {
        xcore=xcore-8;
        walking_state=2;
        delay(40);
        //pushMatrix();
        //scale(-1.0, 1.0);
        image(marioList.get(1), xcore, ycore);
        //popMatrix();
      }
    } else if (walking_state==2) {
      if (right) {
        xcore=xcore+8;
        walking_state=0;
        standing_state=1;
        delay(40);
        image(marioList.get(0), xcore, ycore);
      }
      if (left) {
        xcore=xcore-8;
        walking_state=0;
        standing_state=1;
        delay(40);
        //pushMatrix();
        //scale(-1.0, 1.0); //DONT FORGET THIS CODE FUCKS UP EVERYTHING
        image(marioList.get(0), xcore, ycore);
        //popMatrix();
      }
      /*if(leftkeyheld) {
       Walking_state=1;
       Standing_state=0;
       //marioList.get(0);
       //marioList.get(1);
       //marioList.get(2);
       if(Standing_state==1) {
       xcor+1
       image(marioList.get(1), xcor, ycor);
       }
       //image(mario, imgx, imgy, imgw, imgh);
       */
    }
  }
}

