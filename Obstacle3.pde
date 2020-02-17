class obs3{
  float x;
  float y;
  float w;
  float h;
 PImage img1;
 PImage img2;
 PImage img3;
 
  obs3(float x_, float y_, float w_, float h_){
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    img1=loadImage("Planet1.png");
    img2=loadImage("Planet3@0,25x.png");
    img3=loadImage("Planet4@0,3x.png");
  }
  void display(){
    image(img3,x-80,y,w+20,h+20);
    image(img2,x+250,y+210,w-280,h-280);
    image(img1,x+180,y-150,w+220,h+220);
  }
 
}
