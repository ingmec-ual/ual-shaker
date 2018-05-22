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
LiquidCrystal lcd(24, 26, 28,    30, 32, 34, 36, 38, 40, 42, 44);


// Sensores IMU:


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
  Serial.begin(9600);
}

// MENU: Modo de control manual. Con los botones 
// movemos el PWM directamente de cada motor.
void menu_control_manual()
{
  // Actualiza LCD:
  char str[20];
  sprintf(str,"X+ Y+ | X=%.01f%%", 100*MOTORX_VALOR_PWM/255.0f);
  lcd.setCursor(0, 0);
  lcd.print(str);
  sprintf(str,"X- Y- | Y=%.01f%%", 100*MOTORY_VALOR_PWM/255.0f);
  lcd.setCursor(0,1);
  lcd.print(str);

  // Procesa botones:
  if (!digitalRead(PULSADOR1) && MOTORX_VALOR_PWM<255) MOTORX_VALOR_PWM++;
  if (!digitalRead(PULSADOR3) && MOTORX_VALOR_PWM>0)   MOTORX_VALOR_PWM--;
  if (!digitalRead(PULSADOR2) && MOTORY_VALOR_PWM<255) MOTORY_VALOR_PWM++;
  if (!digitalRead(PULSADOR4) && MOTORY_VALOR_PWM>0)   MOTORY_VALOR_PWM--;

  // Actua PWM:
  analogWrite(PIN_MOTORX_PWM, MOTORX_VALOR_PWM);
  analogWrite(PIN_MOTORY_PWM, MOTORY_VALOR_PWM);  
  
  delay(100);
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


