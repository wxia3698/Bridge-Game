class Cat{
float X,Y,VX,VY;
float direction;
PImage cat1;
PImage cat2;
PImage cat3;
Cat(float x,float y,float vx, float vy){
  X = x; Y = y;VX = vx; VY=vy; 
  cat1=loadImage("man2.png");
  cat2=loadImage("man1.png");
  cat3=loadImage("man3.png");
  direction=1;
}
void display(){
  if(VY>3){
    image(cat3,X,Y-20,50,50);
  }else{
  if((frameCount/10)%2==0){
 //adjustment 
    image(cat1,X,Y-20,50,50);
  }
  if((frameCount/10)%2!=0){
  image(cat2,X,Y-20,50,50);
}
}
}
void update(obs O){
  X+=(VX*direction); 
  Y+=VY;
  VY+=0.2;
  if(X>0 && X<640 && Y>10 &&Y<480){
    loadPixels();
  if( depthImg.pixels[int(X)+int(Y-30)*640] == color(105,105,105)){
    //dead= ture;.
    VY=-1;
    //Y=Y+0.5;
     if( depthImg.pixels[int(X)+int(Y-1)*640] == color(105,105,105)){
       VX=-VX;
     }
  if( depthImg.pixels[int(X-2)+int(Y-1)*640] == color(105,105,105)){
VX=random(1);
  }
  }
 updatePixels();
  }
  
  // adjustment (brandon 10.24)
   
    if( ((X>O.x)&&(X<O.x+O.w-50)&&(Y>O.y+125))||((X>O.x+150)&&(X<O.x+250+O.w)&&(Y>O.y+205)) ){
      VY=-1;
      //Y=Y-10; 
}
//if( ((X<O.x+O.w-20)&&(X>O.x)&&(Y>O.y+60)) ){
// direction=-1;
//}else{
//  direction=1;
//}

}

void update(obs2 O){
  X+=(VX*direction); 
  Y+=VY;
  VY+=0.2;
  if(X>0 && X<640 && Y>10 &&Y<480){
    loadPixels();
  if( depthImg.pixels[int(X)+int(Y-30)*640] == color(105,105,105)){
    //dead= ture;.
    VY=-1;
     if( depthImg.pixels[int(X)+int(Y-1)*640] == color(105,105,105)){
       VX=-VX;
     }
  if( depthImg.pixels[int(X-2)+int(Y-1)*640] == color(105,105,105)){
VX=-VX;
  }
  }
 updatePixels();
  }
  
  // adjustment (brandon 10.24)
    //VY+=1.5;
    if( ((X>O.x)&&(X<O.x+O.w-20)&&(Y>O.y+50))||((X>O.x+300)&&(X<O.x+O.w+330)&&(Y>O.y+150)) ){
      VY=-1;
      //Y=Y-10; 
}
//if( ((X<O.x+O.w-20)&&(X>O.x)&&(Y>O.y+60)) ){
// direction=-1;
//}else{
//  direction=1;
//}

}


void update(obs3 O){
  X+=(VX*direction); 
  Y+=VY;
  VY+=0.2;
  if(X>0 && X<640 && Y>10 &&Y<480){
    loadPixels();
    
    // adjustment (y-30) don't change it(brandon 10.24)
  if( depthImg.pixels[int(X)+int(Y-30)*640] == color(105,105,105)){
    //dead= ture;.
    VY=-1;
    //Y=Y-10;
     if( depthImg.pixels[int(X)+int(Y-1)*640] == color(105,105,105)){
       VX=-VX;
     }
  if( depthImg.pixels[int(X-2)+int(Y-1)*640] == color(105,105,105)){
VX=random(1);
  }
  }
 updatePixels();
  }
  // adjustment (brandon 10.24)
  if( ((X>O.x-40)&&(X<O.x+40)&&(Y>O.y+50))||((X>O.x+160)&&(X<O.x+190)&&(Y>O.y+70))||((X>O.x+300)&&(X<O.x+450)&&(Y>O.y-80))){
      VY=-1;
      //Y=Y-10; 
}
}

void update(obs4 O){
  X+=(VX*direction); 
  Y+=VY;
  VY+=0.2;
  if(X>0 && X<640 && Y>10 &&Y<480){
    loadPixels();
  if( depthImg.pixels[int(X)+int(Y-30)*640] == color(105,105,105)){
    //dead= ture;.
    VY=-1;
    //Y=Y-10;
     if( depthImg.pixels[int(X)+int(Y-1)*640] == color(105,105,105)){
       VX=-VX;
     }
  if( depthImg.pixels[int(X-2)+int(Y-1)*640] == color(105,105,105)){
VX=random(1);
  }
  }
 updatePixels();
  }
// adjustment (brandon 10.24)
if( ((X>O.x)&&(X<O.x+O.w-20)&&(Y>O.y+10))||((X>O.x+150)&&(X<O.x+120+O.w)&&(Y>O.y+60)) ||((X>O.x+350)&&(X<O.x+300+O.w)&&(Y>O.y+10))){
      VY=-1;
      //Y=Y-10; 
}
}
}
