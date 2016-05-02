// source code from luis @ luis.net/portfolio/processing/
// thank you, luis! <3

// variables for plasma (see tab)
int palPlasma []=new int [128];
int[] cls;

void initPlasma() {
  float s1, s2;
  for (int i=0; i<128; i++) {
    s1=sin(i*PI/25);
    s2=sin(i*PI/50+PI/4);
    palPlasma[i]=color(128+s1*128, 128+s2*128, s1*128);
  }

  cls = new int[b.width*b.height];
  for (int x = 0; x < b.width; x++)
  {
    for (int y = 0; y < b.height; y++)
    {
      cls[x+y*b.width] = (int)((127.5 + +(127.5 * sin(x / 32.0)))+ (127.5 + +(127.5 * cos(y / 32.0))) + (127.5 + +(127.5 * sin(sqrt((x * x + y * y)) / 32.0)))  ) / 4;
    }
  }
}

void drawPlasma() {
  b.loadPixels();
  for (int pixelCount = 0; pixelCount < cls.length; pixelCount++)
  {                   
    b.pixels[pixelCount] = palPlasma[ (cls[pixelCount] + frameCount) & 127];
  }
  b.updatePixels();
}