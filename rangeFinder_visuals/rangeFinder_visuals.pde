//receives a byte of data = 8 bits

import processing.serial.*;

Serial myPort;
Star test;
Star a_star;
Star [] collect = new Star[20];
int i = 0;

void setup(){
  size(600,400);
  background(0);
  float value;
  
  for(int i = 0; i < 3; i++){
    value = random(20);
    collect[i] = new Star(value);  
  }
  
  
 // test = new Star(value);
  //find and use the first port on the computer's list
  
  /*println(Serial.list()); */
  myPort = new Serial(this, Serial.list()[5],9600);
  
}

void draw(){
  background(0);
  
  
  
  //test.run(); //in draw loop so it keeps getting rendered
  
  
  //translate(width/2, height/2);
  if(myPort.available() > 0){
    float receivedData = myPort.read();
    if(receivedData > 0 && receivedData < 40 && i < 20){
      collect[i] = new Star(receivedData);
      i=i+1;
      println("this is i: ");
      println(i);
      println(receivedData);
    }
  }
  
  for(int j = 0; j < i; j++){
    collect[j].run();  
  }
}

