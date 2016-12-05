  
  import processing.pdf.*;
  
  float k = -0.00001;
  float c = -30;
  //float k = random(-.1, .5);
  //float c = random(-50, 50);
  int MIN = -500;
  int MAX = 1200;
  int STROKE_MIN=10;
  int STROKE_MAX=STROKE_MIN*5;
  int count = 0;
  int step = (-1*MIN + MAX)/1000;
  int SCALE_STEP = STROKE_MAX/5; 
  float scaler = 1;
  float multiplier = 1;
color []colsArray = {
  color(35, 59, 151, 125), 
  color(28, 114, 105, 125), 
  color(75, 202, 125,125), 
  color(168, 225, 119,125),
  color(233, 226, 118,125),
  color(251, 179, 48,125),
  color(252, 125, 58,125),
  color(233, 45, 40,125),
  color(190, 27, 50,125),
  color(143, 26, 71,125),
  color(53, 39, 94,125)};
void setup() {

  size(1400,900,P3D);
  background(255);
  stroke(255);
  smooth(8);
  //noLoop();
        // set up the coordinate axes:
   beginRaw(PDF, "test.pdf"); 

}

int counter = 0;
float rotation = 0.0;
void draw()
{
     translate(0,height/4);

    rotateZ(rotation*10);
  rotateY(rotation*100);
  
  pushMatrix();
  //rotateX(-rotation*50);

  if (rotate) {
    rotation = (rotation + (0.0001 * multiplier)) % PI;
    println (rotation);
  }
  rainbowLine(counter);
  counter++;
  popMatrix();
}


void drawPoint(int x, int number) {
    stroke(colsArray[number]);
    point(x+STROKE_MAX,STROKE_MAX*number, random(-100,100));
    //println("x,y = " + x + "," + STROKE_MAX*number );
}
void rainbowLine(int x) {
  //pushMatrix();
    //beginShape();
      strokeWeight(STROKE_MAX);
      for (int i = 0; i < colsArray.length; i++) {
        drawPoint(x, i);
      }
   // endShape();
  //popMatrix();
}
float curve(float x) {
  //return  k*x*x*x - k*x*x*c +  + c;
  return 0.5*k*pow((x - c), 3) - 600*k*pow((x + c),2);
}


void drawCurve() {
   
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

Boolean rotate = false;

void mousePressed() {
  print("Mouse Pressed");
  if (mouseButton == LEFT) {
    multiplier = 1;
     println("LEFT!");
  } else if (mouseButton == RIGHT) {
    println("RIGHT!");
    multiplier = -1;
  } 
  rotate = true;
}

void mouseReleased() {
   print("Mouse released");
  rotate = false;
}



void mouseClicked() {

   count ++;
   //float scaler = 1/count;

   //k = random(-.1, .1);
   //c = random(-50, 50);  
  // scaler += SCALE_STEP;
 // println("(k,c) = " + k + "," + c);
//  drawCurve();

}

void keyPressed() {
  if (key == 's') {
    endRaw();
  }
}