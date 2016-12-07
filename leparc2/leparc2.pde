  
  import processing.pdf.*;
  
  float k = -0.00001;
  float c = -30;
  //float k = random(-.1, .5);
  //float c = random(-50, 50);
  int MIN = -500;
  int MAX = 1200;
  int STROKE_MIN=10;
  int STROKE_MAX=STROKE_MIN*2;
  int count = 0;
  int step = (-1*MIN + MAX)/1000;
  int SCALE_STEP = STROKE_MAX/5; 
  float scaler = 1;
  Boolean reverse = false;
  Boolean rotate = false;
  float xDirection = 0.0;
  float yDirection = 0.0;
  
  float rotationX = 0;
  float rotationY = 0;
  float rotationZ = 0;

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
  frameRate(60);
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
    translate(currentX, currentY);
    
   
     if (rotateX) {
      rotateX(rotationX );
      rotationX += radians(0.5) % TWO_PI;
     } if (rotateY) {
        rotationY += radians(1) % TWO_PI;
       rotateY(rotationY);
     }
     if (rotateZ) {
        rotationZ += radians(0.5) % TWO_PI;
       rotateZ(rotationZ);
     }


  rainbowLine();


}


int currentX = 0;
int currentY = 0;

void drawPoint(int number) {
    
    
    strokeWeight(STROKE_MAX);
    stroke(colsArray[number]);
    point(0,STROKE_MAX*number);
    //point(currentX,  currentY+(STROKE_MAX*number));
    //fill(colsArray[number]);
    //rect(currentX, currentY+(STROKE_MAX*number), 1,STROKE_MAX);
}


void rainbowLine() {


      currentX += xDirection;
      currentY += yDirection;
      for (int i = 0; i < colsArray.length; i++) {
        drawPoint(i);
      }


}




Boolean rotateX = false;
Boolean rotateY = false;
Boolean rotateZ = false;

void mouseClicked() {
  currentX = mouseX;
  currentY = mouseY;
}

void keyPressed() {
  
  switch (key) {
    
    case 'p': {
       endRaw();
        break;
    }
    
    case 'x': {
        rotationX = 0;
       rotateX = !rotateX;
        break;
    }
    
    case 'y' : {
      rotationY = 0;
       rotateY = !rotateY;
        break;
    }
    
    case 'z' : {
      rotationZ = 0;
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