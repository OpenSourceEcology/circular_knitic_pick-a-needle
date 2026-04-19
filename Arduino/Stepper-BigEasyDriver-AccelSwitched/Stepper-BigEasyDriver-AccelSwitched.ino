#include <AccelStepper.h>

AccelStepper stepper(2,12,13);

const int pwmA = 3;
const int pwmB = 11;
const int brakeA = 8;
const int brakeB = 9;

int switchStateForward = digitalRead(7);  

void setup()
{ 

 
  pinMode(pwmA, OUTPUT);
  pinMode(pwmB, OUTPUT);
  pinMode(brakeA, OUTPUT);
  pinMode(brakeB, OUTPUT);
 
  digitalWrite(pwmA, HIGH);
  digitalWrite(pwmB, HIGH);
  digitalWrite(brakeA, LOW);
  digitalWrite(brakeB, LOW);
 
  stepper.setMaxSpeed(120);
  stepper.setSpeed(110);
 
  stepper.setAcceleration(80);
  stepper.moveTo(999999999);
 
 
}

void loop(){ 

  if (stepper.distanceToGo() == 0) {
    stepper.run();                   // let the AccelStepper to disable motor current after stop
    delay(2000);                     // wait 2 sec in final position
    stepper.moveTo(-stepper.currentPosition());
  }
  stepper.run();

  if(switchStateForward == HIGH){
  stepper.stop();
  }
    
  }




//Declare pin functions on Arduino
#define stp 13
#define dir 3
#define MS1 4
#define MS2 5
#define MS3 6
#define EN  7

//Declare variables for functions
char user_input;
int x;
int y;
int state;
int stpdly = 5;
const int FWD_PIN = 0;
const int BAK_PIN = 1;
int FWD;
int BAK;

void setup() {
  pinMode(stp, OUTPUT);
  pinMode(dir, OUTPUT);
  pinMode(MS1, OUTPUT);
  pinMode(MS2, OUTPUT);
  pinMode(MS3, OUTPUT);
  pinMode(EN, OUTPUT);

 pinMode( FWD_PIN, INPUT_PULLUP );
 pinMode( BAK_PIN, INPUT_PULLUP );
  
  digitalWrite(stp, LOW);
  digitalWrite(dir, LOW);
  digitalWrite(MS1, LOW);
  digitalWrite(MS2, LOW);
  digitalWrite(MS3, LOW);
  digitalWrite(EN, HIGH);

  digitalWrite(dir, HIGH); //Pull direction pin low to move "forward"
  digitalWrite(MS1, HIGH); //Pull MS1,MS2, and MS3 high to set logic to 1/16th microstep resolution
  digitalWrite(MS2, HIGH);
  digitalWrite(MS3, LOW);
  digitalWrite(EN, LOW);
  
  }

//Main loop
void loop() {

    FWD = digitalRead( FWD_PIN );
    BAK = digitalRead( BAK_PIN );

  if( FWD = HIGH )
    digitalWrite(dir, HIGH);
    digitalWrite(stp,HIGH); //Trigger one step forward
    delay(stpdly);
    digitalWrite(stp,LOW); //Pull step pin low so it can be triggered again
    delay(stpdly);
  if(  BAK = HIGH )
    digitalWrite(dir, LOW);
    digitalWrite(stp,HIGH); //Trigger one step forward
    delay(stpdly);
    digitalWrite(stp,LOW); //Pull step pin low so it can be triggered again
    delay(stpdly);
}
