// https://learn.sparkfun.com/tutorials/mma8452q-accelerometer-breakout-hookup-guide

#include <Wire.h>
#include <SFE_MMA8452Q.h>

MMA8452Q accel;
void setup() {
  Serial.begin(9600);
  accel.init();
}

void loop() {
  if (accel.available())
  {
    accel.read();
    int x = map(accel.x,-1023,1023,-255,255);
    Serial.print(x);
    Serial.print(";");
    int y = map(accel.y,-1023,1023,-255,255);
    Serial.print(y);
    int z = map(accel.z,-1023,1023,-255,255);
    Serial.print(";");
    Serial.println(z);
  }
  delay(33);
}
