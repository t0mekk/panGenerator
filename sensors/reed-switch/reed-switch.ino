// http://www.instructables.com/id/Arduino-Reed-Switch/

int reedSwitchPin = 6;
int state = 0;
void setup() {
  pinMode(reedSwitchPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  int reedReading = digitalRead(reedSwitchPin);

  if (reedReading == HIGH && state == 0) {
    Serial.println("ON");
    state = 1;
  } else if (reedReading == LOW && state == 1){
    Serial.println("OFF");
    state = 0;
  }
  delay(250);
}
