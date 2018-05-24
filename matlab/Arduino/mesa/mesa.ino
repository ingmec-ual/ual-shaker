#include <MPU9250_RegisterMap.h>
#include <SparkFunMPU9250-DMP.h>

#include <LiquidCrystal.h>

/* Firmware para mesa de vibración de dos ejes
 * 2018 (C) Universidad de Almería
 *          Ángel Artero Real
 * GNU GPLv3
 */

// ========== Declaración de pines  ===========
// Motores:
int PIN_MOTORX_PWM = 2; //PWM
int PIN_MOTORY_PWM = 3; //PWM
int MOTORX_DIR = 50; // Señal digital para sentido de giro motor X
int MOTORY_DIR = 52; // Señal digital para sentido de giro motor Y

// Encoders:

// Pulsadores:
int PULSADOR1=39;
int PULSADOR2=41;
int PULSADOR3=43;
int PULSADOR4=45;

// LCD:
// initialize the library with the numbers of the interface pins
// LiquidCrystal(rs, rw, enable, d0, d1, d2, d3, d4, d5, d6, d7)
// LiquidCrystal(rs, rw, enable, d4, d5, d6, d7)
//LiquidCrystal lcd(24, 26,   28, 38, 40, 42, 44);
LiquidCrystal lcd(24, 26, 28,    30, 32, 34, 36, 38, 40, 42, 44);

// Sensores IMU:
MPU9250_DMP imu;


// ========== Variables estado programa ===========
// menu en que nos encontramos
enum menu_t
{
  mnuCONTROL_MANUAL = 0
};

menu_t MENU_PANTALLA  = mnuCONTROL_MANUAL;

uint8_t MOTORX_VALOR_PWM = 0;
uint8_t MOTORY_VALOR_PWM = 0;


// ==== setup ======
void setup() 
{
  // PWM motores:
  pinMode(PIN_MOTORX_PWM, OUTPUT);
  pinMode(PIN_MOTORY_PWM, OUTPUT);
  pinMode(MOTORX_DIR, OUTPUT);
  pinMode(MOTORY_DIR, OUTPUT);
  digitalWrite(MOTORX_DIR, HIGH);
  digitalWrite(MOTORY_DIR, HIGH);

  // Botones:
  pinMode(PULSADOR1, INPUT_PULLUP);
  pinMode(PULSADOR2, INPUT_PULLUP);
  pinMode(PULSADOR3, INPUT_PULLUP);
  pinMode(PULSADOR4, INPUT_PULLUP); 
  
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);

  // Setup serial link:  
  Serial.begin(115200);

  if (imu.begin() != INV_SUCCESS)
  {
  
  }


  // Use setSensors to turn on or off MPU-9250 sensors.
  // Any of the following defines can be combined:
  // INV_XYZ_GYRO, INV_XYZ_ACCEL, INV_XYZ_COMPASS,
  // INV_X_GYRO, INV_Y_GYRO, or INV_Z_GYRO
  // Enable all sensors:
  imu.setSensors(INV_XYZ_GYRO | INV_XYZ_ACCEL | INV_XYZ_COMPASS);
  // Use setGyroFSR() and setAccelFSR() to configure the
  // gyroscope and accelerometer full scale ranges.
  // Gyro options are +/- 250, 500, 1000, or 2000 dps
  imu.setGyroFSR(2000); // Set gyro to 2000 dps
  // Accel options are +/- 2, 4, 8, or 16 g
  imu.setAccelFSR(8); // Set accel to +/-2g
  // Note: the MPU-9250's magnetometer FSR is set at 
  // +/- 4912 uT (micro-tesla's)

  // setLPF() can be used to set the digital low-pass filter
  // of the accelerometer and gyroscope.
  // Can be any of the following: 188, 98, 42, 20, 10, 5
  // (values are in Hz).
  imu.setLPF(98); // Set LPF corner frequency to 5Hz

  // The sample rate of the accel/gyro can be set using
  // setSampleRate. Acceptable values range from 4Hz to 1kHz
  imu.setSampleRate(10); // Set sample rate to 10Hz

  
}

// MENU: Modo de control manual. Con los botones 
// movemos el PWM directamente de cada motor.
void menu_control_manual()
{
 // Actualiza LCD:
  lcd.clear();
  char s[20];
  lcd.setCursor(0, 0);
  lcd.print("X+ Y+ | X=");
  lcd.print(dtostrf(100*MOTORX_VALOR_PWM/255.0f, 3, 1, s));
  lcd.print("%");

  lcd.setCursor(0,1);
  lcd.print("X- Y- | Y=");
  lcd.print(dtostrf(100*MOTORY_VALOR_PWM/255.0f, 3, 1, s));
  lcd.print("%");

  // Procesa botones:
  if (!digitalRead(PULSADOR1) && MOTORX_VALOR_PWM<255) MOTORX_VALOR_PWM++;
  if (!digitalRead(PULSADOR3) && MOTORX_VALOR_PWM>0)   MOTORX_VALOR_PWM--;
  if (!digitalRead(PULSADOR2) && MOTORY_VALOR_PWM<255) MOTORY_VALOR_PWM++;
  if (!digitalRead(PULSADOR4) && MOTORY_VALOR_PWM>0)   MOTORY_VALOR_PWM--;

  // Actua PWM:
  analogWrite(PIN_MOTORX_PWM, MOTORX_VALOR_PWM);
  analogWrite(PIN_MOTORY_PWM, MOTORY_VALOR_PWM);  

  // Lee IMU:
  if ( imu.dataReady() )
  {
    // Call update() to update the imu objects sensor data.
    // You can specify which sensors to update by combining
    // UPDATE_ACCEL, UPDATE_GYRO, UPDATE_COMPASS, and/or
    // UPDATE_TEMPERATURE.
    // (The update function defaults to accel, gyro, compass,
    //  so you don't have to specify these values.)
    imu.update(UPDATE_ACCEL | UPDATE_GYRO | UPDATE_COMPASS);

    float accelX = imu.calcAccel(imu.ax);
    float accelY = imu.calcAccel(imu.ay);
    float accelZ = imu.calcAccel(imu.az);
    
    Serial.print("Acc: X=");
    Serial.print(dtostrf(accelX, 3, 3, s));
    Serial.print(" Y=");
    Serial.print(dtostrf(accelY, 3, 3, s));
    Serial.print(" Z=");
    Serial.println(dtostrf(accelZ, 3, 3, s));
  }
  
  delay(20);
}


// ==== main loop ======
void loop() 
{
  switch(MENU_PANTALLA)
  {
    case  mnuCONTROL_MANUAL:
      menu_control_manual();
      break;
    default:
      break;    
  };
  
}


