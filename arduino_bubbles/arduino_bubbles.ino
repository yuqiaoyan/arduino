// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
 
Servo myservo;  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 
 
int pos = 0;    // variable to store the servo position 

//rangefinder code
int sensorPin = 6;
int speed = 9600;
int val = 0;
int triggorPin = 7;
int inches = 5;
 
void setup() 
{ 
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object 
  Serial.begin(9600);
} 
 
 
void loop() 
{ 
  pinMode(sensorPin,INPUT);
  pinMode(triggorPin,OUTPUT);
  //start the ultrasonic pulse by a HIGH pulse
  //We give a short LOW pulse beforehand to ensure a clean HIGH pulse
  digitalWrite(triggorPin, LOW);
  delayMicroseconds(2);
  digitalWrite(triggorPin, HIGH);
  delayMicroseconds(5);
  digitalWrite(triggorPin, LOW);
 
  //read the analog echo value back
  
  val = pulseIn(sensorPin,HIGH);
  inches = microsecToInches(val);
  Serial.println(inches);
  
  if(inches > 0 && inches < 30){
  
     //code for servomotor 
     for(pos = 90; pos < 180; pos += 1)  // goes from 0 degrees to 180 degrees 
    {                                  // in steps of 1 degree 
      myservo.write(pos);              // tell servo to go to position in variable 'pos' 
      delay(10);                       // waits 15ms for the servo to reach the position 
    }
   
    //at the top
    delay(5000); 
  
    for(pos = 180; pos>=88; pos-=1)     // goes from 180 degrees to 0 degrees 
    {           
      myservo.write(pos);              // tell servo to go to position in variable 'pos' 
      delay(25);                       // waits 15ms for the servo to reach the position 
    } 
    
    delay(300);
    
  }
  
} 

long microsecToInches(long microseconds){
//73.75 microseconds per inch
  long total_inches = microseconds / 73.75;
  
  //need to divide by 2 to get the distance info
  long distance_in_inches = total_inches / 2;
  return distance_in_inches;
  
}

