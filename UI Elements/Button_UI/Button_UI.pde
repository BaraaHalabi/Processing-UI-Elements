Button BT;

void setup () {
  size(600, 600);
  BT = new Button (200, 275, 200, 50);
  BT.SetLabel("Press Here", 30);
  BT.SetColor(181, 19, 95);
} 

void draw () {
  background(38, 11, 43);
  BT.Run();
  if (BT.Pressed()) {
    println("You Pressed");
  }
}