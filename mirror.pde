// this needs a lot of work
// -- simplify code
// -- make sure it draws on grid that works with 1024 and 800 res
// -- add comments
// -- figure out buttons (and overall mapping [like if statements linked to case in keypressed])

int colorm = 0;
float timer;
int cursorX = 0;
int cursorY = 0;
int timerCursor = 1;
int timerVal = 1;
int cursorDirection;
float dotSize = 16;
float speed = 16;
boolean cycle = true;
int sat = 255;
int fade = 10;
boolean fadeOut = true;
int bright = 255;

void drawMirror() {  
  b.noStroke();
  b.colorMode(HSB,255,255,255);

  if (fadeOut) {
    fadeOut();
  }  
  moveDraw();
  moveCursor();
  colorCycle();
  timer++;
  b.colorMode(RGB,255,255,255);
}

void colorCycle() {
  if (cycle) {
    colorm+=1;
    if (colorm > 255) {
      colorm = 0;
    }
  }
}

void fadeOut() {
  b.fill(0, fade);
  b.rect(0, 0, b.width, b.height);
}

void moveDraw() {
  b.fill(colorm, sat, bright);  
  b.rect(b.width-cursorX, cursorY, dotSize, dotSize); // h mirror
  b.rect(cursorX, b.height-cursorY, dotSize, dotSize); // v mirror
  b.rect(b.width-cursorX, b.height-cursorY, dotSize, dotSize); // h v mirror
  b.rect(cursorX, cursorY, dotSize, dotSize); // "normal"
}

//void keyPressed() {
//  if (key == ' ') {
//    background(255);
//  }
//  if (key == 'q') {
//    cycle = !cycle;
//    sat = 255;
//    bright = 255;
//  }
//  if (key == 'w') {
//    cycle = false;
//    colorm = 0;
//    sat = 0;
//    bright = 255;
//  }
//  if (key == 'e') {
//    cycle = false;
//    colorm = 255;
//    sat = 255;
//    bright = 255;
//  }
//  if (key == 'r') {
//    cycle = false;
//    colorm = 0;
//    sat = 0;
//    bright = 0;
//  }  
//  if (key == 'a') {
//    dotSize = 16;
//    speed = 20;
//    fade = 8;
//  }
//  if (key == 's') {
//    dotSize = 32;
//    speed = 40;
//    fade = 12;
//  }
//  if (key == 'd') {
//    dotSize = 64;
//    speed = 80;
//    fade = 16;
//  }
//}

void moveCursor() {
  cursorDirection = int(random(0, 3));
  //if (cursorDirection == cursorDirection) {
  //  cursorDirection = int(random(0, 3));
  //}
  if (cursorDirection == 0) {
    cursorX+=speed;
    if (cursorX > b.width) {
      cursorX = 0;
    }
  }
  if (cursorDirection == 1) {
    cursorX-=speed;
    if (cursorX < 0) {
      cursorX = b.width;
    }
  }
  if (cursorDirection == 2) {
    cursorY+=speed;
    if (cursorY > b.height) {
      cursorY = 0;
    }
  }
  if (cursorDirection == 3) {
    cursorY-=speed;
    if (cursorY < 0) {
      cursorY = b.height;
    }
  }
}