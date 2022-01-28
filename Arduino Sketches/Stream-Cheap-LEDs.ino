/*
 *  Project     'Stream Cheap' Mini Macro Keyboard
 *  @author     David Madison
 *  @link       https://partsnotincluded.com/electronics/diy-stream-deck-mini-macro-keyboard
 *  @license    MIT - Copyright (c) 2018 David Madison
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 * 
 * Soko-Edit - Uploaded to GitHub 1/28/22
 * 
 * I used a pin for each LED power since I didn't want to pull a lot of current.
 * They're all soldered with a 100 ohm resistor at the LED's positive. 
 * I used Tinkercad to get a rough estimate of the mA it would draw.
 * A pro micro can apparently output 40mA per pin. I gave them all their own pin just for good measure.
 * The following is a demo showing how I setup the LED's. The mA isn't all that accurate since LED's differ.
 * https://www.tinkercad.com/things/7Gma9WXI62d
 * I tested my LED circuit in a breadboard before I soldered anything. You might want to do the same.
 * 
 * Thank you David for your help with the USB suspend when I commented on your site & for the awesome project!
 * 
 */

// ---------------------------------
// Key definitions
#define BUTTON_KEY1 KEY_F13
#define BUTTON_KEY2 KEY_F14
#define BUTTON_KEY3 KEY_F15
#define BUTTON_KEY4 KEY_F16
#define BUTTON_KEY5 KEY_F17
#define BUTTON_KEY6 KEY_F18
#define BUTTON_KEY7 KEY_F19
#define BUTTON_KEY8 KEY_F20

// Pin definitions
#define BUTTON_PIN1 2
#define BUTTON_PIN2 3
#define BUTTON_PIN3 4
#define BUTTON_PIN4 5
#define BUTTON_PIN5 6
#define BUTTON_PIN6 7
#define BUTTON_PIN7 8
#define BUTTON_PIN8 9
// ---------------------------------

#include "Keyboard.h"

// Button helper class for handling press/release and debouncing
class button {
  public:
  const char key;
  const uint8_t pin;

  button(uint8_t k, uint8_t p) : key(k), pin(p){}

  void press(boolean state){
    if(state == pressed || (millis() - lastPressed  <= debounceTime)){
      return; // Nothing to see here, folks
    }

    lastPressed = millis();

    state ? Keyboard.press(key) : Keyboard.release(key);    
    pressed = state;
  }

  void update(){
    press(!digitalRead(pin));
  }

  private:
  const unsigned long debounceTime = 30;
  unsigned long lastPressed = 0;
  boolean pressed = 0;
} ;

// Button objects, organized in array
button buttons[] = {
  {BUTTON_KEY1, BUTTON_PIN1},
  {BUTTON_KEY2, BUTTON_PIN2},
  {BUTTON_KEY3, BUTTON_PIN3},
  {BUTTON_KEY4, BUTTON_PIN4},
  {BUTTON_KEY5, BUTTON_PIN5},
  {BUTTON_KEY6, BUTTON_PIN6},
  {BUTTON_KEY7, BUTTON_PIN7},
  {BUTTON_KEY8, BUTTON_PIN8},
};

const uint8_t NumButtons = sizeof(buttons) / sizeof(button);
const uint8_t ledPin = 17;

void setup() { 
  // Safety check. Ground pin #1 (RX) to cancel keyboard inputs.
  pinMode(1, INPUT_PULLUP);
  if(!digitalRead(1)){
    failsafe();
  }

  // Set LEDs Off. Active low.
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, HIGH);
  TXLED0;

  for(int i = 0; i < NumButtons; i++){
    pinMode(buttons[i].pin, INPUT_PULLUP);
  }
  
  // Set LED pins as output.
  pinMode(21,OUTPUT);
  pinMode(20,OUTPUT);
  pinMode(19,OUTPUT);
  pinMode(18,OUTPUT);
  pinMode(15,OUTPUT);
  pinMode(14,OUTPUT);
  pinMode(16,OUTPUT);
  pinMode(10,OUTPUT);
  
}

void loop() {
  for(int i = 0; i < NumButtons; i++){
    buttons[i].update();
  }

  // Turn off LED's if the attached computer is in sleep mode.
  // Note, LED's will turn on if a button is pressed on the macro pad.
  if(USBDevice.isSuspended())
  {
  digitalWrite(21,LOW);
  digitalWrite(20,LOW);
  digitalWrite(19,LOW);
  digitalWrite(18,LOW);
  digitalWrite(15,LOW);
  digitalWrite(14,LOW);
  digitalWrite(16,LOW);
  digitalWrite(10,LOW);
  }
  
  else{
  digitalWrite(21,HIGH);
  digitalWrite(20,HIGH);
  digitalWrite(19,HIGH);
  digitalWrite(18,HIGH);
  digitalWrite(15,HIGH);
  digitalWrite(14,HIGH);
  digitalWrite(16,HIGH);
  digitalWrite(10,HIGH);
  }
  
}

void failsafe(){
  for(;;){} // Just going to hang out here for awhile :D
}
