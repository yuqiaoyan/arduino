class Star{
  //determines the initial placement of the canvas coordinates
  int canvas_x = width/2, canvas_y = height/2;
  
  
  //determines the coordinates of the star
  float x1 = 20, y1 = 30;
  float y2 = y1+20;
  float half = (y2-y1)/2;
  float y3 = y2+half;
  float y4 = y1+half;
  float x_right = x1 + 20;
  float x_left = x1 - 20;
  
  int speedX = 2;
  float speedY = 2;
  float gravity_value;
  
  float angle = 0;
  int rotations = 0;
  
  //constructor
  Star(float size){
  //create star in relation to a specific point
    x_right = x1 + size;
    y2 = y1+20;
    half = (y2 - y1) / 2;
    x_left = x1 - size;
    y3 = y2 + half;
    y4 = y1+ half;
    gravity_value = 0.01*map(size,0,40,40,0);
  }
  
  //default constructor
  Star(){
  }
  
  /*
  void new_size(float a_size){
    x_right = x1 + a_size;
    y2 = y1+20;
    half = (y2 - y1) / 2;
    x_left = x1 - size;
    y3 = y2 + half;
    y4 = y1+ half;
  }*/
  
  void rotation(int degrees){
    angle = random(degrees);
    //angle = 45;
    float c = radians(angle);
    
    //y_center = (y2-y1)/2+y1;
 
    //move the coordinate system to the center of the display
    
    translate(canvas_x, canvas_y);
    for(int i = 0; i < 9; i++){
      //rect(0,0,30,30);
      rotate(c);
      rotations += 1;
      //background(0);
      //triangle(x1,y1+20,x_left,y2,x_right,y2);
      rect(0,0,30,30);
      delay(500);
    }
    
  }
  
  void run(){
    display();
    move();
    bounce();
    gravity();
  }
  
  void gravity(){
  //force pointing downward that constantly impacts the
    speedY += gravity_value;
  }
  
  void bounce(){
    if(x_right > width){
      speedX = speedX * -1;
    }
    
    if(x_left < 0){
      speedX = speedX * -1;
    }
    
    if(y2 > height || y3 > height){
      speedY = speedY * -1;
    }
    
    if(y1 < 0){
      speedY = speedY * -1;
    }
    
  }
  
  void move(){
  //updates the star's coordinates to move it around the canvas
  
    x1 += speedX;
    x_right += speedX;
    x_left += speedX;
    y1 += speedY;
    y2 += speedY;  
    y3 += speedY;
    y4 += speedY;
  }
  
  void display(){
    
    //redraw our black canvas each cycle
    //background(0);
    
    triangle(x1,y1,x_right,y2,x_left,y2);
    triangle(x1,y3,x_right,y4,x_left,y4);
    //ellipse(200,200,20,20);
  }
  
  
  
}

