//Group Project MMA1033 
//Original retrieved from OpenProcessing.org : 

// variables
float a;
float y, mapY;
float noiseFactor;
PImage img;
PImage bg;
int index;
float[] posY;

// setup screen
void setup() {
  size(500, 300);
  noFill();
  strokeWeight(2);
  background(0);
 
  noiseFactor = 80;
 
  bg = loadImage("stargaze2.png"); // load background
  img = loadImage ("roket1.png"); // load image
  
  index = width*1/3;
  posY = new float[index];
  for (int n = 0; n < posY.length; n++) {
    posY[n] = 0;
  }
}

// draw image
void draw() {
  background(0); // background color
  translate(0, height/2);
  
  background(bg); //load image
 
  // Shift array values
  for (int n = 0; n < posY.length - 1; n++ ) {
    posY[n] = posY[n + 1];
  }
 
  // draw latest point at location >> width*1/3
  y = noiseFactor * noise(a);
  mapY = map(y, 0, noiseFactor, -noiseFactor/2, noiseFactor/2);
  posY[posY.length-1] = mapY;
  a = a + 0.03;
 
  //draw stuff
  for (int n = 0; n < posY.length; n++ ) {
 
    // makes the fade happen and also clears point when the array is still empty
    if (posY[n] == 0) {
      stroke(0);
    } else {
      stroke(255, n);
    }
 
    // draw-draw-draw
    point(n, posY[n]);
  } // end for
   
  //ellipse(index, mapY, 20, 20);
  image(img, index, mapY, 150, 150);//resize and display the image
  
  // Draw guideline at middle
  //stroke(255, 40);
  //line(0, 0, index, 0);
}

// stop or play animation
void keyPressed() {
  switch (key){
      case 's':
      case 'S':
      noLoop();
      break;
      case 'p':
      case 'P':
      loop();
      break; 
  }
}

// screen capture
void mouseClicked(){
  //save frame
  saveFrame();
}

//end

