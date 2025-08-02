import controlP5.*;
import processing.serial.*;
import controlP5.*;
import java.util.ArrayList;
PImage img, imgLogo;
ControlP5 cp5;
Textfield nameInput, manuel_nameInput, manuel_tidsInput;
String currentName = "Tom";
String currentNameM = "tom";
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
boolean add_TimeM_Bool = false;
float stopped_Time = 0;
int lastClickTime = 0;
int clickDelay = 200; // 200ms delay


ArrayList<String> names = new ArrayList<String>();
ArrayList<Float> times = new ArrayList<Float>();
ArrayList<String> manuel_Names = new ArrayList<String>();
ArrayList<Float> manuel_Times = new ArrayList<Float>();
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
    .setAutoClear(true)
    .setText("Tom")
    .setColorBackground(color(255, 255, 255))      // Dark gray background
    .setColorForeground(color(0, 0, 0))   // Gray border when not focused
    .setColorActive(color(0, 150, 255))         // Blue border when focused
    .setColorValue(color(0, 0, 0))        // White text color
    .setColorLabel(color(255, 255, 255));
  img = loadImage("Images/Man 1.jpg");
  imgLogo = loadImage("Images/UCHLogo.png");

  manuel_nameInput = cp5.addTextfield("Manuelt navn")
    .setPosition(20, 850)
    .setSize(500, 60)
    .setFont(createFont("Arial", 26))
    .setAutoClear(true)
    .setText("Indsæt navn")
    .setColorBackground(color(255, 255, 255))      // Dark gray background
    .setColorForeground(color(0, 0, 0))   // Gray border when not focused
    .setColorActive(color(0, 150, 255))         // Blue border when focused
    .setColorValue(color(0, 0, 0))        // White text color
    .setColorLabel(color(255, 255, 255));
  img = loadImage("Images/Man 1.jpg");
  imgLogo = loadImage("Images/UCHLogo.png");

  manuel_tidsInput = cp5.addTextfield("Manuelt tid")
    .setPosition(20, 750)
    .setSize(200, 60)
    .setFont(createFont("Arial", 26))
    .setAutoClear(true)
    .setText("Indsæt tid")
    .setColorBackground(color(255, 255, 255))      // Dark gray background
    .setColorForeground(color(0, 0, 0))   // Gray border when not focused
    .setColorActive(color(0, 150, 255))         // Blue border when focused
    .setColorValue(color(0, 0, 0))        // White text color
    .setColorLabel(color(255, 255, 255));
  img = loadImage("Images/Man 1.jpg");
  imgLogo = loadImage("Images/UCHLogo.png");
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
  rect(850, 375, 200, 75, 20); // Background rect

  // Draw the timer text
  fill(27, 22, 79); // Text color
  textAlign(CENTER, CENTER);
  textSize(50);
  text(currentTime * 0.001, 850, 375);
  popStyle();
}
void display_S_Time() {
  if (stop_Time) {
    pushStyle();
    fill(255); // White background for the rect
    noStroke();
    rectMode(CENTER);
    rect(850, 375, 200, 75, 20); // Background rect

    // Draw the timer text
    fill(27, 22, 79); // Text color
    textAlign(CENTER, CENTER);
    textSize(50);
    text(stopped_Time * 0.001, 850, 375);
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
    text(names.get(0), 1650, 150+(0*60));
    text(names.get(1), 1650, 150+(1*60));
    text(names.get(2), 1650, 150+(2*60));
    text(names.get(3), 1650, 150+(3*60));
    text(names.get(4), 1650, 150+(4*60));
    text(names.get(5), 1650, 150+(5*60));
    text(names.get(6), 1650, 150+(6*60));
    text(names.get(7), 1650, 150+(7*60));
    text(names.get(8), 1650, 150+(8*60));
    text(names.get(9), 1650, 150+(9*60));
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

void display_manuelt() {
  fill(255);
  rect(20, 20, 400, 600, 20);
  fill(27, 22, 79); // Text color
  pushStyle();
  textSize(35);
  textAlign(LEFT);
  try {
    text(manuel_Names.get(0), 270, 150+(0*60));
    text(manuel_Names.get(1), 270, 150+(1*60));
    text(manuel_Names.get(2), 270, 150+(2*60));
    text(manuel_Names.get(3), 270, 150+(3*60));
    text(manuel_Names.get(4), 270, 150+(4*60));
    text(manuel_Names.get(5), 270, 150+(5*60));
    text(manuel_Names.get(6), 270, 150+(6*60));
    text(manuel_Names.get(7), 270, 150+(7*60));
    text(manuel_Names.get(8), 270, 150+(8*60));
    text(manuel_Names.get(9), 270, 150+(9*60));
  }
  catch(Exception e) {
    //  Block of code to handle errors
  }
  try {
    text((manuel_Times.get(0)), 20, 150+(0*60));
    text((manuel_Times.get(1)), 20, 150+(1*60));
    text((manuel_Times.get(2)), 20, 150+(2*60));
    text((manuel_Times.get(3)), 20, 150+(3*60));
    text((manuel_Times.get(4)), 20, 150+(4*60));
    text((manuel_Times.get(5)), 20, 150+(5*60));
    text((manuel_Times.get(6)), 20, 150+(6*60));
    text((manuel_Times.get(7)), 20, 150+(7*60));
    text((manuel_Times.get(8)), 20, 150+(8*60));
    text((manuel_Times.get(9)), 20, 150+(9*60));
  }
  catch(Exception e) {
    //  Block of code to handle errors
  }
  popStyle();
}
void insert_manueltB() {
  if (add_TimeM_Bool) {
    boolean insertedM = false;

    for (int i = 0; i < manuel_Times.size(); i++) {
      if (float(manuel_tidsInput.getText()) < manuel_Times.get(i)) {
        manuel_Times.add(i, float(manuel_tidsInput.getText()));
        manuel_Names.add(i, currentNameM);
        insertedM = true;
        break;
      }
    }

    if (!insertedM) {
      // If it's the largest time, add it to the end
      manuel_Times.add(float(manuel_tidsInput.getText()));
      manuel_Names.add(currentName);
    }

    add_TimeM_Bool = false;
  }
}
void insertButton() {
  textAlign(CENTER);
  fill(27, 22, 79);
  textSize(20);
  rect(275, 740, 200, 75, 20, 20, 20, 20);
  fill(255, 255, 255);
  rect(280, 745, 190, 65, 15, 15, 15, 15);

  if (mouseX > 280 && mouseX < 470 && mouseY > 745 && mouseY < 810) {
    fill(200, 200, 200);
    rect(280, 745, 190, 65, 15, 15, 15, 15);
    fill(27, 22, 79);
    textSize(20);
    text("Indsæt", 373, 782);

    if (leftMousePressed && (millis() - lastClickTime) > clickDelay) {
      currentNameM = manuel_nameInput.getText();
      add_TimeM_Bool = true;
      lastClickTime = millis(); // Update last click time
    }
  } else {
    fill(27, 22, 79);
    textSize(20);
    text("Indsæt", 373, 782);
  }
}
void draw() {

  background(0, 0, 160);


  image(img, 50, 0);

  fill(255); // Clear timer area
  rect(700, 300, 300, 150, 20);
  fill(0, 0, 160);
  rect(850, 0, 220, 150, 0, 0, 12, 12);

  tint(255);
  image(imgLogo, 550, -60, 650, 350);
  noTint();


  start_button();
  stop_button();
  insertButton();

  if (pressed_Start) {
    stop_Time = false;           // reset stop state if running
    take_time();                 // live updating
  } else if (stop_Time) {
    display_S_Time();
    start_Time = 0;// show final stopped time
  }
  insert_manueltB();
  add_Time();
  display_Times();
  display_manuelt();
  //gold text
  fill(204, 204, 0);
  textSize(90);
  text("1", 1416, 162);
  fill(192, 192, 192);
  textSize(70);
  text("2", 1416, 222);
   fill(255, 128, 0);
  textSize(60);
  text("3", 1416, 272);
}
