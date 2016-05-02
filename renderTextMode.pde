// math for comments below refers to 1024x768 screen with segSize set to 4
// for a offscren buffer size of 256x192
// "segment" refers to part of screen as defined by segSize

void renderTextMode() {
  b.loadPixels(); // load pixel data from the offscreen buffer, which is set to 256x192
  for (int h=0; h<b.height/segSize; h++) // nested loop to go thru height of screen every 4 pixels
  {
    int startY = (h*segSize); // go by segment height, which again is 4
    for (int w=0; w<b.width/segSize; w++) // go by segment width, too
    {
      int startX = (w*segSize); 
      float allBri = 0;  
      float allR = 0;    // these variables will be used to add and average
      float allG = 0;    // the red, green, and blue of each pixel
      float allB = 0;    // in order to set a character and define hue for each segment

      for (int y=0; y<segSize; y++ ) // nested loop to catch 
      {                              // each pixel in segment
        for (int x=0; x<segSize; x++)
        {
          int cY = y + startY; // cY pixel Y value based on relative segment (set by startY)
          int cX = x + startX; // same as above, but for X value

          color c = b.pixels[cY*b.width+cX]; // get color of each pixel drawn to buffer (from pixels array)

          float currentR = red(c);   // copy current red value
          allR = (allR + currentR);  // and add it to total 
          float currentG = green(c); // green...
          allG = (allG + currentG);
          float currentB = blue(c);  // ...and blue
          allB = (allB + currentB);

          float currentBri = brightness(c); // ...and with brightness
          allBri = (allBri + currentBri);
        }
      }

      // after every segment is analyzed, we divide by total number of pixels in a segment to get averages
      float sr = (allR / (segSize * segSize) ); // sr = segment red
      float sg = (allG / (segSize * segSize) ); // green
      float sb = (allB / (segSize * segSize) ); // blue
      fill(sr, sg, sb); // RGB average for given segment

      float segb = (allBri / (segSize * segSize) ); // segb = segment brightness

      if (blockMode) {
        // we then assign an ASCII character to each segment, based on its segment's average brightness
        if (sb > 204) {
          text("█", startX * segSize, startY * segSize);
        } else if (segb > 152) {
          text("▓", startX * segSize, startY * segSize);
        } else if (segb > 100) {
          text("▒", startX * segSize, startY * segSize);
        } else if (segb > 48) {
          text("░", startX * segSize, startY * segSize);
        }
        //else { // it would be a waste to draw a space, so we skip the last part
        //text(" ", startX * segSize, startY * segSize);
        //}
      } else {
        // we then assign an ASCII character to each segment, based on its segment's average brightness
        if (sb > 230) {
          text("#", startX * segSize, startY * segSize);
        } else if (segb > 207) {
          text("&", startX * segSize, startY * segSize);
        } else if (segb > 184) {
          text("$", startX * segSize, startY * segSize);
        } else if (segb > 161) {
          text("X", startX * segSize, startY * segSize);
        } else if (segb > 138) {
          text("x", startX * segSize, startY * segSize);
        } else if (segb > 115) {
          text("=", startX * segSize, startY * segSize);
        } else if (segb > 92) {
          text("+", startX * segSize, startY * segSize);
        } else if (segb > 69) {
          text(";", startX * segSize, startY * segSize);
        } else if (segb > 46) {
          text(":", startX * segSize, startY * segSize);
        } else if (segb > 23) {
          text(".", startX * segSize, startY * segSize);
        }
        //else { // it would be a waste to draw a space, so we skip the last part
        // text(" ", startX, startY);
        //}
      }
    }
  }
}