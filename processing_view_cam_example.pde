import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

float eyeX=70.0, eyeY=35.0, 
eyeZ=120.0, centerX=50.0, centerY=50.0, centerZ=0, upX=0, upY=1, upZ=0;

void setup() {
  noCursor();
    size(displayWidth, displayHeight,P3D);
  //size(640, 360, P3D);
  fill(204);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
}

void draw() {
    opencv.loadImage(video);
  lights();
  background(0);
  
 Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    eyeX=map(faces[0].x,10,230,0,width);
    eyeY=map(faces[0].y,0,180,0,height);

   
 //   println(faces[0].x + "," + faces[0].y);
    text(eyeX,100,100);
    //rect(faces[0].x, faces[0].y, faces[0].width, faces[0].height);
  }
  
  
  
  
  
  // Change height of the camera with mouseY
 // camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
  camera(-eyeX+width/2, eyeY-height/2, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  
  noStroke();
  box(45);
  stroke(255);
  line(-100, 0, 0, 100, 0, 0);
  line(0, -100, 0, 0, 100, 0);
  line(0, 0, -100, 0, 0, 100);
  changecam();
}

void changecam(){
  

if (keyPressed){
  if (key=='w'){
    centerZ=centerZ+1;
  }
  
  if (key=='s'){
    centerZ=centerZ-1;
  }
  
  if (key=='a'){
    centerX=centerX+1;
  }
  
  if (key=='d'){
    centerX=centerX-1;
  }
  
  
    if (key=='i'){
    eyeX=eyeX+1;
  }
  
  if (key=='k'){
    eyeY=eyeY-1;
  }
  
  if (key=='j'){
    eyeX=eyeX+1;
  }
  
  if (key=='l'){
    eyeX=eyeX-1;
  }
  
  if (key=='g'){
    upX=upX+0.01;
  }
  
  if (key=='h'){
    upX=upX-0.01;
  }
  
}
  
}
