PFont font; // textMode font
PGraphics b; // screen buffer
PImage img; // FG image

int segSize = 4; // segment size that screen is divided by, which is set to 4 
float tick = 0; // simple counter

float shapeScale = 1;
int shapeSize = 1;  // set in setup to "= width/segSize"

void setup() {
  size(1024, 768, P2D);    

  noSmooth();
  noCursor();

  initTextmode(); // set up buffer, load font for textmode output
  initPlasma();   // set up plasma lookup tables to make it fast
  img = loadImage("8static2.png");
}

void draw() {
  if (doDraw) {
    tick = tick + 0.01; // increment counter

    // background layer
    if (bgOn) { // if BG is enabled, then draw one :)
      b.beginDraw();    
      drawPlasma();
      b.endDraw();
    } else { // if bgOn == false, then black screen
      b.beginDraw();
      b.background(0);
      b.endDraw();
    }

    // mask layer
    if (maskOn) { // if BG is enabled, then draw one :)
      b.beginDraw();    
      drawCircleMask();
      b.endDraw();
    }

    // foreground layer
    if (fgOn) { // if BG is enabled, then draw one :)
      b.beginDraw();    
      drawImage();
      b.endDraw();
    }

    // render options 
    if (textMode) { // choose how to render
      background(0);
      renderTextMode(); // display textmode...
    } else {
      background(0);
      image(b, 0, 0, width, height);   // ...or display buffer (stretched to fit screen)
    }

    if (fps) { // display FPS if toggled
      fill(0); // draw a box to make FPS easier to read ;)
      rect(0, 0, 32, 16);
      fill(255); // display FPS in upper left corner
      text(int(frameRate), 0, 0);
    }
  } // end doDraw
} // end draw

void initTextmode() {
  segSize = 4;
  //  800x600 / segSize of 4 = 200x150 buffer --- 1024x768 / segSize of 4 = 256x192 buffer
  b = createGraphics(width/segSize, height/segSize, P2D);
  font = loadFont("Px437_IBM_BIOS-16.vlw");
  textFont(font, 16); // size of font
  textAlign(LEFT, TOP);
}

void drawImage() { // draw the rotating and resizing 8static logo
  b.imageMode(CENTER);
  b.pushMatrix();
  b.translate(b.width/2, b.height/2);
  b.rotate(tick * 2);
  b.scale( abs( sin(tick) * 1.50 ) );
  b.image(img, 0, 0);
  b.popMatrix();
}

void drawCircleMask() { // circular mask, moves in and out to cover BG
  shapeSize -= shapeScale;
  if (shapeSize < 0 || shapeSize > b.width) {
    shapeScale *= -1;
  }
  b.fill(0);
  b.ellipse(b.width/2, b.height/2, shapeSize, shapeSize );
}