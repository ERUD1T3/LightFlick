//Design to run on Arduino Mega 2560
#include <SoftwareSerial.h>
#include <Servo.h>

#define TxD 3
#define RxD 2
#define LED_PIN 27
#define HOME_POS 0
#define ON 90
#define OFF 180
#define SERVO 4

SoftwareSerial bluetoothSerial(TxD, RxD); //seetting bluetooth transmission protocol on Serial
Servo flick; //actuator for light

char bt_data;

void setup() {
  bluetoothSerial.begin(9600);
  Serial.begin(9600);
  pinMode(LED_PIN, OUTPUT);
  flick.attach(SERVO);
  //flick.write(HOME_POS);
  }

void loop() {
  if(bluetoothSerial.available()){
    bt_data = bluetoothSerial.read();
    Serial.println(bt_data);
    if(bt_data=='1'){
      digitalWrite(LED_PIN, HIGH); 
      flick.write(ON);         
    }
    if(bt_data=='0'){
      digitalWrite(LED_PIN, LOW);
      flick.write(OFF);
    }
  }
}