// https://www.arduino.cc/en/tutorial/potentiometer
 
int potPin = A4;
int pot = 0;
void setup() {
  Serial.begin(9600);
}
void loop() {
  int potReading = analogRead(potPin);
  //Serial.println(potReading);
  potReading = map(potReading, 0, 1023, 0, 255);
  if (potReading != pot) {
    pot = potReading;
    Serial.println(pot);
  }
  delay(33);
}
