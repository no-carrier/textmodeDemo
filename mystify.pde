// pretty sure i stole this code from
// someone on openProcessing and then edited
// it a bit -- sorry, it was years ago :(

float xa=1;
float ya=1;
float xb;
float yb;
int xav=1;
int yav=2;
int xbv=-2;
int ybv=-1;
float step=1;
int col = 0;

void setupMystify() {
  xb = b.width-4;
  yb = b.height-4;
}

void drawMystify() {
  b.noStroke();
  b.fill(0, 10); // controls amount of fade
  b.rect(0, 0, b.width, b.height);

  b.colorMode(HSB, 255, 255, 255);
  col++;
  if (col > 255) {
    col = 0;
  }
  b.strokeWeight(8); // change this to something you like
  b.stroke(col, 255, 255);

  if (xa > b.width-4 || xa<1) xav*=-1;
  if (xb > b.width-4 || xb<1) xbv*=-1;
  if (ya > b.height-4 || ya<1) yav*=-1;
  if (yb > b.height-4 || yb<1) ybv*=-1;
  xa+=(xav*step);
  xb+=(xbv*step);
  ya+=(yav*step);
  yb+=(ybv*step);
  b.line(xa, ya, xb, yb);
  b.line(xa, b.height-ya, xb, b.height-yb);  
  b.line(b.width-xa, ya, b.width-xb, yb);  
  b.line(b.width-xa, b.height-ya, b.width-xb, b.height-yb);
  // ##### IS THIS THE RIGHT PLACE FOR THE NEXT LINE????
  b.colorMode(RGB,255,255,255);
}