class Button {
  float X, Y, W, H;
  float R = 150, G = 150, B = 150, Alpha = 100;
  float TR = 255, TG = 255, TB = 255;
  boolean State = false, Holded = false;
  String Label = "";

  Button (float _X, float _Y, float _W, float _H) {
    noStroke();
    X = _X;
    Y = _Y;
    W = _W;
    H = _H;
  }

  void Show () {
    fill(R, G, B, Alpha);
    rect(X, Y, W, H, H/10);
    fill(TR, TG, TB);
    text(Label, (W/2 - textWidth(Label)/2) + X, (H/2 - (textDescent() - textAscent())/2) + Y);
  }

  void Graphics () {
    if (Holded) {
      Alpha = 255;
    } else {
      if (mouseX > X && mouseX < X + W && mouseY > Y && mouseY < Y + H) {
        if (Alpha < 200) {
          Alpha += 10;
        } else if (Alpha > 200) {
          Alpha = 200; 
        }
      } else {
        if (Alpha > 100) {
          Alpha -= 10;
        }
      }
    }
  }

  void Action () {
    State = false;
    if (mouseX > X && mouseX < X + W && mouseY > Y && mouseY < Y + H) {
      if (mousePressed) {
        Holded = true;
      }
    }
    if (!mousePressed && Holded) {
      Holded = false;
      State = true;
    }
  }

  void Run () {
    Show();
    Graphics();
    Action();
  }
  
  void SetLabel (String _Label, int TextSize) {
    Label = _Label;
    textSize(TextSize);
  }
  
  void SetLabelColor (float _TR, float _TG, float _TB) {
    TR = _TR;
    TG = _TG;
    TB = _TB;
  }
  
  void SetColor (float _R, float _G, float _B) {
    R = _R;
    G = _G;
    B = _B;
  }

  boolean Pressed () {
    return State;
  }
}