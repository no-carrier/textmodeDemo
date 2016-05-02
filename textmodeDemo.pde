PFont font; // textMode font
PGraphics b; // screen buffer
PImage img; // FG image

int segSize = 4; // segment size that screen is divided by, which is set to 4 
float tick = 0; // simple counter

void setup() {
  size(1024, 768, P2D);
  loadFont(); // load font for textmode output
  noSmooth();
  noCursor();

  // mask variables
  shapeSize = width/segSize; // for mask

  img = loadImage("8static2.png");
  initPlasma();
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
      //renderTextMode(); // (uncomment to display text on top of buffer for debugging purposes)
    }

    if (fps) { // display FPS if toggled
      fill(0); // draw a box to make FPS easier to read ;)
      rect(0, 0, 32, 16);
      fill(255); // display FPS in upper left corner
      text(int(frameRate), 0, 0);
    }
  } // end doDraw
} // end draw

void drawImage() {
  b.imageMode(CENTER);
  b.pushMatrix();
  b.translate(b.width/2, b.height/2);
  b.rotate(tick * 2);
  b.scale( abs( sin(tick) * 1.50 ) );
  b.image(img, 0, 0);
  b.popMatrix();
}

void loadFont() {
  segSize = 4;
  //  800x600 / segSize of 4 = 200x150 buffer --- 1024x768 / segSize of 4 = 256x192 buffer
  b = createGraphics(width/segSize, height/segSize, P2D);
  font = loadFont("Px437_IBM_BIOS-16.vlw");
  textFont(font, 16); // size of font
  textAlign(LEFT, TOP);
}