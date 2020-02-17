

class obs2{
  float x;
  float y;
  float w;
  float h;
 PImage imgb;

 
  obs2(float x_, float y_, float w_, float h_){
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    imgb=loadImage("ball.png");
    
  }
  void display(){
    image(imgb,x-20,y+50,w+50,h+50);
    pushMatrix();
    translate(250,200);
    image(imgb,x,y-100,w+150,h+150);
     popMatrix();
    
    
    //image(img3,x+150,y+150,w+100,h-200);
  }
 
}
