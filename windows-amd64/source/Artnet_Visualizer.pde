import controlP5.*;
import ch.bildspur.artnet.*;

ArtNetClient artnet;
ControlP5 cp5;

void setup()
{
  //window setup
  size(1280, 720);
  textAlign(LEFT, TOP);
  textSize(20); 
  
  //CP5 stuff
  PFont font = createFont("arial",30);
  cp5 = new ControlP5(this);
  cp5.addTextfield("")
    .setPosition(10,10)
    .setSize(35,35)
    .setFont(font);
  cp5.addButton("set universe")
    .setPosition(46,10)
    .setSize(75,35);
  
  // create artnet client
  artnet = new ArtNetClient();
  artnet.start();
}

int universe = 0;
int warningCountDown = 0;

void draw()
{
  // read rgb color from the first 3 bytes
  byte[] data = artnet.readDmxData(0, universe);
  
  int c = color(data[0] & 0xFF, data[1] & 0xFF, data[2] & 0xFF);

  // set background
  background(color(200,200,200));
  
  
  for (int i = 0; i<512; i+=4)
  {
    //println(data[i] & 0xFF);
    fill(data[i] & 0xFF, data[i+1] & 0xFF, data[i+2] & 0xFF);
    stroke(data[i] & 0xFF, data[i+1] & 0xFF, data[i+2] & 0xFF);
    square(50+50*(int(i/4)-int(i/64)*16),50+50*int(i/64),50);
  }
  
  //show warning message for unvierse setting:
  if (warningCountDown>0)
  {
    text("Please make sure you have a valid number in the textbox!",130,20);
    warningCountDown--;
  }

  // show values
//  text("R: " + (int)red(c) + " Green: " + (int)green(c) + " Blue: " + (int)blue(c), width / 2, height / 2);
}



//universe changing logic
int boxUniverse = 0;
void controlEvent(ControlEvent e) {
  if(e.isAssignableFrom(Button.class)) {
    String text = cp5.get(Textfield.class, "").getText();
    println(text);
    try 
    {
      universe = Integer.parseInt(text);
      warningCountDown = 0;
    } 
    catch(Exception ex)
    {
      warningCountDown = 180;
    }
  }
}
