// https://learn.sparkfun.com/tutorials/ir-control-kit-hookup-guide

#include <IRremote.h>

int irSensorPin = 5;
IRrecv irrecv(irSensorPin);
decode_results results;

uint16_t code1 = 0x4FE0;
uint16_t code2 = 0x4FD0;
uint16_t code3 = 0x4FF0;

int val1 = 0;
int val2 = 0;
int val3 = 0;

void setup() {
  Serial.begin(9600);
  pinMode(irSensorPin, INPUT);
  irrecv.enableIRIn();
}

void loop() {
  
  if (irrecv.decode(&results)){
    
    uint16_t resultCode = (results.value & 0xFFFF);
    //Serial.println(resultCode, HEX);

    if( resultCode == code1 ){
    
      val1 = ( val1 == 0 ) ? 255 : 0;
      
    }

    if( resultCode == code2 ){

      val2= ( val2 == 0 ) ? 255 : 0;
     
    }

    if( resultCode == code3 ){
    
      val3 = ( val3 == 0 ) ? 255 : 0;
      
    }

    Serial.print( val1 );
    Serial.print( ";" );
    Serial.print( val2 );
    Serial.print( ";" );
    Serial.println( val3 );

    irrecv.resume();
  }
  
  delay(100);
  
}

