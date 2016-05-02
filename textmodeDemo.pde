PFont font; // textMode font
PGraphics b; // screen buffer
PImage img;

int segSize = 4; // segment size that screen is divided by, which is set to 4 

float tick = 0; // simple counter

boolean textMode = true; // display text or buffer, toggle with spacebar
boolean fps = false; // display FPS, toggle with 1  
boolean doDraw = true; 
boolean logo = false;

boolean bgOn = true;
int bg = 1; // background (bg) layer defaults to plasma

boolean fgOn = true;
int fg = 1; // foreground layer defaults to...

boolean maskOn = true; // is the mask on? lets see...
int mask = 1; // keep track of mask

boolean blockMode = false; // sets ANSI block or ASCII text mode, see renderTextMode tab

Ball[] balls = new Ball[15];

void setup() {
  size(1024, 768, P2D);
  loadFont(); // load font for textmode output

  setupMystify(); // init variables based on buffer (set above in loadFont)
  setupMetaBalls();
  noSmooth();
  noCursor();
  //frameRate(60);

  // mask variables
  shapeSize = width/segSize; // for mask

  img = loadImage("8static2.png");
  initPlasma();
  for (int i=0; i<balls.length; i++) {
    balls[i] = new Ball(random(15, 25));
  }
}

void draw() {
  if (doDraw) {
    tick = tick + 0.01; // increment counter

    // background layer
    if (bgOn) { // if BG is enabled, then draw one :)
      b.beginDraw();    
      switch(bg) {
      case 1: 
        drawPlasma();
        break;
      case 2: 
        drawMystify();
        break;
      case 3:
        drawMirror();
        break;
        //case 4:
        //  drawMetaBalls();
        //  break;
      } 
      b.endDraw();
    } else { // if bgOn == false, then black screen
      b.beginDraw();
      b.background(0);
      b.endDraw();
    }

    // mask layer
    if (maskOn) { // if BG is enabled, then draw one :)
      b.beginDraw();    
      switch(mask) {
      case 1: 
        drawCircleMask();
        break;
      case 2: 
        drawDiamondMask();
        break;
      case 3:
        // insert mask here
        break;
      } 
      b.endDraw();
    }

    // foreground layer
    if (fgOn) { // if BG is enabled, then draw one :)
      b.beginDraw();    
      switch(fg) {
      case 1: 
        drawImage();
        break;
      case 2: 
        drawBalls();
        break;
      case 3:
        // do something here...
        break;
      }
      b.endDraw();
    }

    // render options 
    if (textMode) { // choose how to render
      background(0);
      renderTextMode(); // display textmode...
    } else {
      background(0);
      image(b, 0, 0, width, height);   // ...or display buffer (stretched to fit screen)
      //renderTextMode(); // (uncomment to display text on top of buffer for debugging purposes)
    }

    if (fps) { // display FPS if toggled
      fill(0); // draw a box to make FPS easier to read ;)
      rect(0, 0, 32, 16);
      fill(255); // display FPS in upper left corner
      text(int(frameRate), 0, 0);
    }
  } // end doDraw
  //saveFrame("frame/frame-######.png");
} // end draw

void drawImage() {
  b.imageMode(CENTER);
  b.pushMatrix();
  b.translate(b.width/2, b.height/2);
  b.rotate(tick * 2);
  b.scale( abs( sin(tick) * 1.50 ) );
  //b.scale(.75);
  b.image(img, 0, 0);
  b.popMatrix();
}

void drawBalls() {
  //b.background(0);
  for (int i=0; i<balls.length; i++) {
    balls[i].move();
    balls[i].display();
  }
}

void loadFont() {
  segSize = 4;
  //  800x600 / segSize of 4 = 200x150 buffer --- 1024x768 / segSize of 4 = 256x192 buffer
  b = createGraphics(width/segSize, height/segSize, P3D);
  font = loadFont("Px437_IBM_BIOS-16.vlw");
  textFont(font, 16); // size of font
  textAlign(LEFT, TOP);
}