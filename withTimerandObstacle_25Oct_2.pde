import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;


// Depth imagehgggf
PImage depthImg;
PFont font;
obs4 ob4;
obs3 ob3;
obs2 ob2;
obs ob;
Cat cat[]=new Cat[2];
//float catX=70, catY=70, catVX=1, catVY=-6;

// Which pixels do we care about?
// These thresholds can also be found with a variaty of methods
float minDepth =  296;
float maxDepth = 930;
//float minDepth =  296;
//float maxDepth = 800;
// What is the kinect's angle
float angle;
float count;
int begin; 
int duration;
int time;
String start;
float recty=height/2+150;
void setup() {
  //size(640,480+80);
  //Therefore, we need to low down the y of cat[i]
  size(640, 435);

  begin = millis();
  time = duration = 30;
  
  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.enableMirror(true);
  angle = kinect.getTilt();
  
// Add back ground image/data
ob=new obs(50,height-350,150,400);
ob2=new obs2(50,height-350,100,100);
ob3=new obs3(100,height/2-20,170,170);
ob4=new obs4(100,height-200,150,200);
  // Blank image
  font=createFont("visitor1.ttf",32);
  depthImg = new PImage(kinect.width, kinect.height);
  for(int i=0;i<2;i++){
    cat[i]= new Cat(random(20,70),random(90,100),random(2),0);
}




}
void draw() {
  // Draw the raw image
  //image(kinect.getDepthImage(), 0, 0);

  // Calibration
 background(220);
 strokeWeight(3);
 noFill();
 rect(20,10,80,40);
  if (time > 0){
   
    time = duration - (millis() - begin)/1000;
    textSize(50);
  fill(0);
  textFont(font);
  text(time, 42, 40);
}


      
  // Threshold the depth image
  int[] rawDepth = kinect.getRawDepth();
  for (int i=0; i < rawDepth.length; i++) {
    if (rawDepth[i] >= minDepth && rawDepth[i] <= maxDepth) {
      depthImg.pixels[i] = color(105,105,105);
    } else {
      depthImg.pixels[i] = color(255);
    }
  }

  // Draw the thresholded image
  depthImg.updatePixels();
  //remove the depthImg down
  image(depthImg, 0, 60);
  
  //Comment for Calibration
  //fill(255);
  //text("TILT: " + angle, 10, 20);
  //text("THRESHOLD: [" + minDepth + ", " + maxDepth + "]", 10, 36);
  
  
  for(int i=0;i<2;i++){
    cat[i].display();
  }
 
  start="Start Game";
fill(0);
      rect(width/2-100,recty,200,60);
      strokeWeight(3);
 fill(255);
 rect(width/2-105,recty-10,200,60);
      textSize(32);
      fill(0);
      text(start, width/2-100, recty+30);
      
  


if(key=='j'){
  textSize(25);
  fill(0);
  textFont(font);
  text("Level 01", 470, 40);
    ob.display();
    for(int i=0;i<2;i++){
      cat[i].update(ob);
    }
  }
   if(key=='h'){
     textSize(25);
  fill(0);
  textFont(font);
  text("Level 04", 470, 40);
    ob2.display();
    for(int i=0;i<2;i++){
      cat[i].update(ob2);
  }
  
   }
if(key=='g'){
     textSize(25);
  fill(0);
  textFont(font);
  text("Level 03", 470, 40);
    ob3.display();
    for(int i=0;i<2;i++){
      cat[i].update(ob3);
  }
   }
   if(key=='f'){
  textSize(25);
  fill(0);
  textFont(font);
  text("Level 02", 470, 40);
    ob4.display();
    for(int i=0;i<2;i++){
      cat[i].update(ob4);
    }
  }
    

// signal for loosing
  for(int i=0;i<2;i++){
    if((cat[i].Y > 480 && cat[i].X<640)||(time<=0)){
      fill(0);
      rect(width/2-100,height/2-10,200,60);
      strokeWeight(3);
 fill(255);
 rect(width/2-105,height/2-20,200,60);
      textSize(32);
      fill(0);
      text("Game Over", width/2-90, height/2+20); 
      
      
      //textSize(10);
      //text("Click your mouse to play again", width/2-48, height/2+40); 
      
    
    time=0;
    }
    //modification by Brandon on 10.20
   else if((cat[1].Y < 480 && cat[1].X>640)&&(cat[0].Y < 480 && cat[0].X>640)){
        cat[0].X=700;
        cat[0].Y=100;
        cat[1].X=700;
        cat[1].Y=100;
       fill(0);
      rect(width/2-100,height/2-10,200,60);
      strokeWeight(3);
 fill(255);
 rect(width/2-105,height/2-20,200,60);
      textSize(32);
      fill(0);
      text("   WIN!!!", width/2-90, height/2+20);  
    
    }
  }

  }
//stroke(0,0,255);
//line(0,300,600,300);



// Adjust the angle and the depth threshold min and max
void keyPressed() {
   
  if (key == CODED) {
    if (keyCode == UP) {
      angle++;
    } else if (keyCode == DOWN) {
      angle--;
    }
    angle = constrain(angle, 0, 30);
    kinect.setTilt(angle);
  } else if (key == 'a') {
    minDepth = constrain(minDepth+10, 0, maxDepth);
  } else if (key == 's') {
    minDepth = constrain(minDepth-10, 0, maxDepth);
  } else if (key == 'z') {
    maxDepth = constrain(maxDepth+10, minDepth, 2047);
  } else if (key =='x') {
    maxDepth = constrain(maxDepth-10, minDepth, 2047);
  }
   
}
void mousePressed(){ 
  
recty=-200;
  begin = millis();
  time = duration;
 for(int i=0;i<2;i++){
    cat[i]= new Cat(random(20,30),random(90,100),random(1.5),0);
  cat[i].display();
  cat[i].update(ob);
}

}
