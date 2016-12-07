  
  import processing.pdf.*;
  
  float k = -0.00001;
  float c = -30;
  //float k = random(-.1, .5);
  //float c = random(-50, 50);
  int MIN = -500;
  int MAX = 1200;
  int STROKE_MIN=10;
  int STROKE_MAX=STROKE_MIN*4;
  int count = 0;
  int step = (-1*MIN + MAX)/1000;
  int SCALE_STEP = STROKE_MAX/5; 
  float scaler = 1;
  Boolean reverse = false;
  Boolean rotate = false;
  int xDirection = 0;
  int yDirection = 0;

color []colsArray = {
  color(35, 59, 151,124), 
  color(28, 114, 105,124), 
  color(75, 202, 125,124), 
  color(168, 225, 119,124),
  color(233, 226, 118,124),
  color(251, 179, 48,124),
  color(252, 125, 58,124),
  color(233, 45, 40,124),
  color(190, 27, 50,124),
  color(143, 26, 71,124),
  color(53, 39, 94,124)};
  
void setup() {

  size(1400,900,P3D);
  background(255);
  stroke(255);
  smooth(8);
  //noLoop();
        // set up the coordinate axes:
   beginRaw(PDF, "test.pdf"); 
   
}


float rotation = 0;
void draw()
{


   
     if (rotateX) {
      rotateX(rotation );
     } if (rotateY) {
       rotateY(rotation);
     }
     if (rotateZ) {
       rotateZ(rotation);
     }


  if (rotate) {
    rotation = ((rotation));
    println (rotation);
  }
  rainbowLine();


}


int currentX = 0;
int currentY = 0;

void drawPoint(int number) {
    stroke(colsArray[number]);
    currentX += xDirection;
    currentY += yDirection;
    point(currentX,(STROKE_MAX*number) + currentY);
}


void rainbowLine() {

    beginShape();
      strokeWeight(STROKE_MAX);
      for (int i = 0; i < colsArray.length; i++) {
        drawPoint(i);
      }
   endShape();

}








Boolean rotateX = false;
Boolean rotateY = false;
Boolean rotateZ = false;

void keyPressed() {
  
  switch (key) {
    
    case 'p': {
       endRaw();
        break;
    }
    
    case 'x': {
       rotateX = !rotateX;
        break;
    }
    
    case 'y' : {
       rotateY = !rotateY;
        break;
    }
    
    case 'z' : {
        rotateZ = !rotateZ;
        break;
    }
    
    case '-' : {
       reverse = true;
       break;
    }
    
    case '+' : {
      reverse = false;
      break;
    }
    
    case 'w' : {
      yDirection = -1;
      break;
    }
    case 'a' : {
      xDirection = -1;
      break;
    }
    case 's' : {
      yDirection = 1;
      break;
    }
    case 'd' : {
      xDirection = 1;
      break;
    }
    default :  {
      break;
    }   
  }
}

void keyReleased() {
  switch (key) {
    case 'w' : {
      yDirection = 0;
      break;
    }
    case 'a' : {
      xDirection = 0;
      break;
    }
    case 's' : {
      yDirection = 0;
      break;
    }
    case 'd' : {
      xDirection = 0;
      break;
    }
    default: {
      break;
    }
  }
  
}