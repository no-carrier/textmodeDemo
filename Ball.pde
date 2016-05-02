class Ball {
  float xpos, ypos;
  float rad;
  float xspeed, yspeed;
  int col;

  Ball(float rad_) {
    rad = rad_;
    xpos = random(b.width);
    ypos = random(b.height);    
    xspeed = random(1, 3);
    yspeed = random(1, 2);
    col = color(random(255),random(255),random(255));
  }

  void move() {
    xpos += xspeed;
    ypos += yspeed;
    // Check horizontal edges
    if (xpos > b.width || xpos < 0) {
      xspeed *= -1;
    }
    //Check vertical edges
    if (ypos > b.height || ypos < 0) {
      yspeed *= -1;
    }
  }

  void display() {
    //b.strokeWeight(4);
    b.noStroke();
    b.fill(col);
    b.ellipse(xpos, ypos, rad*2, rad*2);
  }
}