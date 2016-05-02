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