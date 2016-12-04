  
  import processing.pdf.*;
  
  float k = -0.000001;
  float c = -30;
  //float k = random(-.1, .5);
  //float c = random(-50, 50);
  int MIN = -500;
  int MAX = 1200;
  int STROKE_MIN=10;
  int STROKE_MAX=STROKE_MIN*10;
  int count = 0;
  int step = (-1*MIN + MAX)/1000;
  int SCALE_STEP = STROKE_MAX/5; 
  float scaler = 1;
color []colsArray = {
  color(35, 59, 151), 
  color(28, 114, 105), 
  color(75, 202, 125), 
  color(168, 225, 119),
  color(233, 226, 118),
  color(251, 179, 48),
  color(252, 125, 58),
  color(233, 45, 40),
  color(190, 27, 50),
  color(143, 26, 71),
  color(53, 39, 94)};
void setup() {

  size(1400,900);
  background(255);
  stroke(255);
  smooth(8);
  //noLoop();
        // set up the coordinate axes:
   beginRecord(PDF, "test.pdf"); 
}

void draw()
{

}

float curve(float x) {
  return  k*x*x*x - k*x*x*c +  + c;
}


void drawCurve() {
    translate(width/2-scaler,height/1.1-scaler);
   stroke(colsArray[count++%colsArray.length]);
    float prevX = MIN;
    float prevY = curve(prevX);
    //strokeWeight(1);
    for(float x = MIN; x < MAX; x += step)
    {
      float y = curve(x);
      line(prevX,prevY,x,y);
     
      strokeWeight(map(x, MIN,MAX, STROKE_MIN,STROKE_MAX));
      prevX = x;
      prevY = y;
    }
}

void mouseClicked() {
   count ++;
   //float scaler = 1/count;

   //k = random(-.1, .1);
   //c = random(-50, 50);
   scaler += SCALE_STEP;
  println("(k,c) = " + k + "," + c);
  drawCurve();

}

void keyPressed() {
  if (key == 's') {
    endRecord();
  }
}