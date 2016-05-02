// square

float shapeScale = 1;
int shapeSize;  // set in setup to "= width/segSize"

void drawCircleMask() { // circular mask, moves in and out
  shapeSize -= shapeScale;
  b.fill(0);
  if (shapeSize < 0 || shapeSize > b.width) {
    shapeScale *= -1;
  }
  b.strokeWeight(6);
  b.stroke(255);
  b.ellipse(b.width/2, b.height/2, shapeSize, shapeSize );
}

void drawDiamondMask() {
  shapeSize += shapeScale * 5;
  if (shapeSize > width/segSize * 1.25) {
    shapeSize = 0;
  }
  b.rectMode(CENTER);
  b.fill(0);
  b.noStroke();
  b.pushMatrix();
  b.translate(b.width/2, b.height/2);
  b.rotate(PI/4);
  b.rect(0, 0, shapeSize, shapeSize );
  b.popMatrix();
}