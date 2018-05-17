int MOTORX = 2; //PWM
int MOTORY = 3; //PWM
int DIRX=50; // Señal digital para sentido de giro motor X
int DIRY=52; // Señal digital para sentido de giro motor Y
int P1=39; //Pulsadores para subir y bajar el voltaje.
int P2=41;
int P3=43;
int P4=45;

//¿Hay que poner alguna variable para VIN?

void setup() {
  pinMode(MOTORX, OUTPUT);
  pinMode(MOTORY, OUTPUT);
  pinMode(DIRX, OUTPUT);
  pinMode(DIRY, OUTPUT);
  digitalWrite(DIRX, HIGH);
  digitalWrite(DIRY, HIGH);
  Serial.begin(9600);
  analogWrite(MOTORX,150);
  analogWrite(MOTORY,150);

}


void loop() {
 /* for(int i=0; i<=255; i++){
    analogWrite(MOTOR,i);
    Serial.println(i);
    delay(25);
  }
  for(int i=255; i>=0; i--){
    analogWrite(MOTOR,i);
    Serial.println(i);
    delay(25);
  }
  */
}


