void keyPressed() {
  // BACKGROUND \\
  if (key == '1') {
    bg = 1; // set bg layer to 1 (see draw switch statement)
  }
  if (key == '2') {
    bg = 2;
  }
  if (key == '3') {
    bg = 3;
  }
  // FOREGROUND \\
  if (key == '4') {
    fg = 1;
  }  
  if (key == '5') {
    fg = 2;
  }  
  if (key == '6') {
    fg = 3;
  }    
  // MASK \\
  if (key == '7') { // circle
    shapeSize = width/segSize;
    mask = 1;
  }   
  if (key == '8') { // diamond
    shapeSize = 0;
    shapeScale = 1;
    mask = 2;
  }
  if (key == '9') {
    mask = 3;
  }      

  // OTHER COMMANDS
  if (key == 'q') {
    bgOn = !bgOn;
  }
  if (key == 'w') {
    fgOn = !fgOn;
  }
  if (key == 'e') {
    maskOn = !maskOn;
  }


  if (key == 'z') {
    textMode = !textMode; // toggle text / buffer modes
  }
  if (key == 'x') { // toggle FPS display
    fps = !fps;
  }
  if (key == 'c') { // pause sketch (for debugging)
    doDraw = !doDraw;
  }
  if (key == 'v') { // sets ANSI block or ASCII text mode, see renderTextMode tab
    blockMode = !blockMode;
  }
}