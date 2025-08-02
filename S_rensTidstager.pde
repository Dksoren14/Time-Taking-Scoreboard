import controlP5.*;
import processing.serial.*;
import controlP5.*;
import java.util.ArrayList;
ControlP5 cp5;
Textfield nameInput;
String currentName = "Tom";
boolean rightMousePressed = false; //Used to track which mouse button is the one being pressed.
boolean leftMousePressed = false;
float lastClick = 0;
float debounceDelay = 200;
float currentTime = 0;
float start_Time = 0;
boolean pressed_Start = false;
boolean start_Condition = false;
boolean stop_Time = false;
boolean add_Time_Bool = false;
float stopped_Time = 0;
//float liste[0,0,0,0,0,0]
ArrayList<String> names = new ArrayList<String>();
ArrayList<Float> times = new ArrayList<Float>();
boolean fill_Names = false;
void setup() {
  noStroke();
  //size(1200,750);
  fullScreen();
  cp5 = new ControlP5(this);
  
  nameInput = cp5.addTextfield("Navn")
    .setPosition(610, 700)
    .setSize(500, 60)
    .setFont(createFont("Arial", 26))
    .setAutoClear(false)
    .setText("Tom");
}


void mouseReleased() {                      //Runs once when mouse is released.
  if (mouseButton == RIGHT) { //Determine what mouse button is pressed.
    rightMousePressed = false;
  }
  if (mouseButton == LEFT) {
    leftMousePressed = false;
  }
}
void mousePressed() { //mousePressed is a built-in function that is called once every time a mouse button is pressed.

  if (mouseButton == RIGHT) { //Determine what mouse button is pressed.
    rightMousePressed = true;
  }
  if (mouseButton == LEFT) {
    leftMousePressed = true;
  }
}

void start_button() {
  textAlign(CENTER);
  fill(27, 22, 79);
  textSize(20);

  rect(500, 550, 200, 75, 20, 20, 20, 20);
  fill(255, 255, 255);
  rect(505, 555, 190, 65, 15, 15, 15, 15);
  if (mouseX>505 && mouseX<695 && mouseY>555 && mouseY<620) {

    fill(200, 200, 200);
    rect(505, 555, 190, 65, 15, 15, 15, 15);

    fill(27, 22, 79);
    textSize(20);
    text("Start", 600, 592);
    if (leftMousePressed) {
      pressed_Start = true;
      start_Condition = false;
    }
  } else {
    fill(27, 22, 79);
    textSize(20);
    text("Start", 600, 592);
  }
}
void stop_button() {
  textAlign(CENTER);
  fill(27, 22, 79);
  textSize(20);

  rect(1000, 550, 200, 75, 20, 20, 20, 20);
  fill(255, 255, 255);
  rect(1005, 555, 190, 65, 15, 15, 15, 15);
  if (mouseX>1005 && mouseX<1195 && mouseY>555 && mouseY<620) {

    fill(200, 200, 200);
    rect(1005, 555, 190, 65, 15, 15, 15, 15);

    fill(27, 22, 79);
    textSize(20);
    text("Stop", 1100, 592);
    if (leftMousePressed && pressed_Start) {
      currentName = nameInput.getText();
      stopped_Time = currentTime;
      println("Setting stopped_Time: " + stopped_Time);
      pressed_Start = false;
      stop_Time = true;
      add_Time_Bool = true;
    }
  } else {
    fill(27, 22, 79);
    textSize(20);
    text("Stop", 1100, 592);
  }
}


void take_time() {
  if (!start_Condition) {
    start_Time = millis();
    start_Condition = true;
  }
  currentTime = millis() - start_Time;
  pushStyle();
  fill(255); // White background for the rect
  noStroke();
  rectMode(CENTER);
  rect(700, 150, 200, 75, 20); // Background rect

  // Draw the timer text
  fill(27, 22, 79); // Text color
  textAlign(CENTER, CENTER);
  textSize(50);
  text(currentTime * 0.001, 700, 150);
  popStyle();
}
void display_S_Time() {
  if (stop_Time) {
    pushStyle();
    fill(255); // White background for the rect
    noStroke();
    rectMode(CENTER);
    rect(700, 150, 200, 75, 20); // Background rect

    // Draw the timer text
    fill(27, 22, 79); // Text color
    textAlign(CENTER, CENTER);
    textSize(50);
    text(stopped_Time * 0.001, 700, 150);
    popStyle();
  }
}
void add_Time() {
  if (add_Time_Bool) {
    boolean inserted = false;
    
    for (int i = 0; i < times.size(); i++) {
      if (stopped_Time < times.get(i)) {
        times.add(i, stopped_Time);
        names.add(i, currentName);
        println("i ran");
        inserted = true;
        break;
      }
    }
    
    if (!inserted) {
      // If it's the largest time, add it to the end
      times.add(stopped_Time);
      names.add(currentName);
    }

    add_Time_Bool = false;
  }
}
void display_Times() {
  fill(255);
  rect(1400, 20, 500, 800, 20);
  fill(27, 22, 79); // Text color
  pushStyle();
  textSize(50);
  textAlign(LEFT);
  try {
    text(names.get(0), 1600, 150+(0*60));
    text(names.get(1), 1600, 150+(1*60));
    text(names.get(2), 1600, 150+(2*60));
    text(names.get(3), 1600, 150+(3*60));
    text(names.get(4), 1600, 150+(4*60));
    text(names.get(5), 1600, 150+(5*60));
    text(names.get(6), 1600, 150+(6*60));
    text(names.get(7), 1600, 150+(7*60));
    text(names.get(8), 1600, 150+(8*60));
    text(names.get(9), 1600, 150+(9*60));
  }
  catch(Exception e) {
    //  Block of code to handle errors
  }
  try {
    text((times.get(0))*0.001, 1450, 150+(0*60));
    text((times.get(1))*0.001, 1450, 150+(1*60));
    text((times.get(2))*0.001, 1450, 150+(2*60));
    text((times.get(3))*0.001, 1450, 150+(3*60));
    text((times.get(4))*0.001, 1450, 150+(4*60));
    text((times.get(5))*0.001, 1450, 150+(5*60));
    text((times.get(6))*0.001, 1450, 150+(6*60));
    text((times.get(7))*0.001, 1450, 150+(7*60));
    text((times.get(8))*0.001, 1450, 150+(8*60));
    text((times.get(9))*0.001, 1450, 150+(9*60));
  }
  catch(Exception e) {
    //  Block of code to handle errors
  }
  popStyle();
}
void draw() {
  fill(255); // Clear timer area
  rect(550, 100, 300, 150, 20);



  start_button();
  stop_button();

  if (pressed_Start) {
    stop_Time = false;           // reset stop state if running
    take_time();                 // live updating
  } else if (stop_Time) {
    display_S_Time();
    start_Time = 0;// show final stopped time
  }

  add_Time();
  display_Times();
}
