import controlP5.*;
import java.util.*;


ControlP5 cp5;
ColorPicker cp;

Textlabel myTextlabel;
Textlabel myTextLabel2;

int sliderValue = 0; //pen width
int num;
//int increase;

boolean toggleValue = false;
boolean clearToggle = false;
boolean randomPenToggle = false;



void setup() {
  background(255);
  size(1000, 800);
  noStroke();
  
  cp5 = new ControlP5(this);

  //pen width slider
  cp5.addSlider("sliderValue")
    .setRange(0, 50)
    .setValue(10)
    .setPosition(255, 0)
    .setSize(755, 59)
    ;
  cp5.addToggle("toggleValue")
    .setPosition(0, 0)
    .setSize(255, 59)
    .setValue(true)
    .setMode(ControlP5.SWITCH)
    ;
  //color picker code
  cp = cp5.addColorPicker("picker")
    .setPosition(0, 59)
    .setColorValue(color(255, 128, 0, 128))
    ;
  myTextlabel = cp5.addTextlabel("label")
    .setText("Eraser")
    .setPosition(155, 20)
    .setColorValue(0xffffff00)
    .setFont(createFont("Georgia", 20))
    ;
  myTextLabel2 = cp5.addTextlabel("label2")
    .setText("Pen")
    .setPosition(40, 20)
    .setColorValue(0xffffff00)
    .setFont(createFont("Georgia", 20))
    ;

  cp5.addButton("Save")
    .setPosition(255, 59)
    .setSize(248, 59)
    ;

  cp5.addButton("Clear")
    .setPosition(503, 59)
    .setSize(248, 59)
    ;

  cp5.addButton("Random Pen")
    .setPosition(751, 59)
    .setSize(249, 59)
    ;
}

void draw() {

  if (randomPenToggle == true) {
    if (mousePressed) {
      //increase += 1;
      stroke(random(255), random(255), random(255));
      strokeWeight(sliderValue + random(80));
      //strokeWeight(sliderValue + increase);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
    
  } else
  {
    if (toggleValue == false) {
      if (mousePressed) {
        cursor(CROSS);
        stroke(255);
        strokeWeight(sliderValue);
        line(mouseX, mouseY, pmouseX, pmouseY);
      } else {
        cursor(HAND);
      }
    } else {
      //color picker code
      if (mousePressed) {
        cursor(CROSS);
        stroke(cp.getColorValue());
        strokeWeight(sliderValue);
        line(mouseX, mouseY, pmouseX, pmouseY);
      } else {
        cursor(HAND);
      }
    }
  }
  if (clearToggle == true) {
    noStroke();
    fill(255);
    rect(0, 118, 1000, 682);
    clearToggle = false;
  }


}

void mousePressed() {
  if (mousePressed && mouseX>255 && mouseX<455&&mouseY>59&&mouseY<118) {
    randomPenToggle = false;
    selectFolder("Selected a folder to process: ", "folderSelected");
  }
  if (mousePressed && mouseX>503 && mouseX<751 &&mouseY>59&&mouseY<118) {
    randomPenToggle = false;
    clearToggle = true;
  }
  if (mousePressed && mouseX>751 && mouseX<1000 &&mouseY>59&&mouseY<118) {
    if (randomPenToggle == false) {
      randomPenToggle = true;
    }else{
      randomPenToggle = false;
    }
    
  }
}

void folderSelected(File selection)
{
  if (selection == null) 
  {
    return;
  } else 
  { 
    String dir2 = selection.getPath() + "/";
    save(dir2 + "Painting("+num+")");
    num++;
    println(dir2);
  }
}
//color picker code
public void controlEvent(ControlEvent c) {
  // when a value change from a ColorPicker is received, extract the ARGB values
  // from the controller's array value
  if (c.isFrom(cp)) {
    int r = int(c.getArrayValue(0));
    int g = int(c.getArrayValue(1));
    int b = int(c.getArrayValue(2));
    int a = int(c.getArrayValue(3));
    color col = color(r, g, b, a);
    println("event\talpha:"+a+"\tred:"+r+"\tgreen:"+g+"\tblue:"+b+"\tcol"+col);
  }
}
void picker(int col) {
  println("picker\talpha:"+alpha(col)+"\tred:"+red(col)+"\tgreen:"+green(col)+"\tblue:"+blue(col)+"\tcol"+col);
}





//reset button 

//flex
//save function 
//drip art function 
//spray art function 
//rainbow pen 
//background color changer? maybe
