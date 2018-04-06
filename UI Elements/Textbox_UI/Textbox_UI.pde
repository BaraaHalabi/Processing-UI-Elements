TextBox TB;
String Text;
void setup () {
  size(1000, 600);
  TB = new TextBox(400, 275, 200, 50);
  TB.SetColor(209, 8, 155);
  TB.SetFocus(false);
  TB.SetLable("Label");
}

void draw () {
  background(38, 11, 43);
  TB.Run();
}

void keyPressed () {
  TB.EditText(key, keyCode);
  if (key == ENTER) {
    Text = TB.GetText();
    println(Text);
  }
}