class obs4{
  float x;
  float y;
  float w;
  float h;
 PImage img1;
 PImage img2;
 PImage img3;
 
  obs4(float x_, float y_, float w_, float h_){
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    img1=loadImage("bd2.png");
    img2=loadImage("bd1.png");
    img3=loadImage("bd3.png");
   
  }
  void display(){
    image(img1,x,y,w,h);
   image(img2,x+220,y+80,w-50,h-80);
   image(img3,x+350,y-50,w,h+80);
    //image(img3,x+150,y+150,w+100,h-200);
  }
 
}
