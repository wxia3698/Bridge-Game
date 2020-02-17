class obs{
  float x;
  float y;
  float w;
  float h;
 PImage img1;
 PImage img2;
 PImage img3;
 
  obs(float x_, float y_, float w_, float h_){
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    img1=loadImage("library.png");
    img2=loadImage("light.png");
    img3=loadImage("sofa.png");
  }
  void display(){
    image(img1,x-50,y+82,w+80,h-100);
    image(img3,x+180,y+200,w+100,h-250);
    image(img2,x+430,y+127,w-80,h-180);
  }
 
}
