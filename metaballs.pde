int numBlobs = 2;

int[] blogPx = {0, 30, 70, 90};
int[] blogPy = {0, 70, 70, 45};

// Movement vector for each blob
int[] blogDx = { 
  2, 3, -1, 2
};
int[] blogDy = { 
  1, -2, 2, 3
};

//PGraphics pg;
int[][] vy, vx; 

void setupMetaBalls() {  
  vy = new int[numBlobs][b.height];
  vx = new int[numBlobs][b.width];
}

void drawMetaBalls() {
  for (int i=0; i<numBlobs; ++i) {
    blogPx[i]+=blogDx[i];
    blogPy[i]+=blogDy[i];

    // bounce across screen
    if (blogPx[i] < 0) {
      blogDx[i] = abs(blogDx[i]);
    }
    if (blogPx[i] > b.width) {
      blogDx[i] = -blogDx[i];
    }
    if (blogPy[i] < 0) {
      blogDy[i] = abs(blogDy[i]);
    }
    if (blogPy[i] > b.height) {
      blogDy[i]=-blogDy[i];
    }

    for (int x = 0; x < b.width; x++) {
      vx[i][x] = int(sq(blogPx[i]-x));
    }

    for (int y = 0; y < b.height; y++) {
      vy[i][y] = int(sq(blogPy[i]-y));
    }
  }

  b.loadPixels();
  for (int y = 0; y < b.height; y++) {
    for (int x = 0; x < b.width; x++) {
      long m = 1;
      for (int i = 0; i < numBlobs; i++) {
        // Increase this number to make your blobs bigger
        m += 350000/(vy[i][y] + vx[i][x]+1);
      }
      b.pixels[x+y*b.width] = color(0, (char)m, (char)m);
    }
  }
  b.updatePixels();
}