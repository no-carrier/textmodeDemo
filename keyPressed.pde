// toggle each layer
boolean bgOn = true;
boolean fgOn = true;
boolean maskOn = true; 

// sets ANSI block or ASCII text mode, see renderTextMode tab
boolean blockMode = false; 

boolean fps = false; // display FPS, toggle with 1  
boolean doDraw = true; 
boolean textMode = true; // display text or buffer, toggle with spacebar

void keyPressed() {

  // top row: toggle the foreground, background, and mask layers
  if (key == 'q') {
    bgOn = !bgOn;
  }
  if (key == 'w') {
    fgOn = !fgOn;
  }
  if (key == 'e') {
    maskOn = !maskOn;
  }

  // middle row: toggle between colored ASCII or ANSI rendering - see renderTextMode tab to see details
  if (key == 'a') {
    blockMode = !blockMode;
  }

  // bottom row: display framework, pause, and toggle between buffer / textmode 
  if (key == 'z') { 
    fps = !fps;
  }
  if (key == 'x') { 
    doDraw = !doDraw;
  }
  if (key == 'c') { 
    textMode = !textMode;
  }
}