class TextBox {
  
  float X, Y, W, H;
  ArrayList Letters;
  String View = "", Lable = "";
  float TextWidth;
  float R = 150, G = 150, B = 150, Alpha = 50;
  float TR = 255, TB = 255, TG = 255;
  int StartPoint;
  boolean focus;
  
  TextBox (float _X, float _Y, float _W, float _H) {
    X = _X;
    Y = _Y;
    W = _W;
    H = _H;
    Letters = new ArrayList();
    noStroke();
    textSize(H/2);
  }

  void Run () {
    Focus();
    Graphics();
    DisplayBox();
    DisplayText();
    ShiftText();
  }

  void DisplayBox () {
    fill(R, G, B, Alpha);
    rect(X, Y, W, H);
    textSize(15);
    fill(R, G, B, 150);
    text(Lable, X, Y - H/10);
    textSize(H/2);
  }

  void DisplayText () {
    fill(255);
    text(View, X + W/50, Y + H - H/4);
  }

  void EditText (char Key, int KeyCode) {
    if (focus) {
      if (Key >= 'A' && Key <= 'Z' || Key >= 'a' && Key <= 'z' || Key >= '0' && Key <= '9') {
        Letters.add(Key);
        View = "";
        TextWidth = 0;
        for (int i = StartPoint; i < Letters.size(); i ++) {
          View += Letters.get(i);
        }
        TextWidth = textWidth(View);
      } else if (KeyCode == 8 && Letters.size() > 0) {
        if (StartPoint > 0) {
          StartPoint --;
        }
        Letters.remove(Letters.size() - 1);
        View = "";
        TextWidth = 0;
        for (int i = StartPoint; i < Letters.size(); i ++) {
          View += Letters.get(i);
        }
        TextWidth = textWidth(View);
      } else if (KeyCode == 32) {
        Letters.add(' '); 
        View = "";
        TextWidth = 0;
        for (int i = StartPoint; i < Letters.size(); i ++) {
          View += Letters.get(i);
        }
        TextWidth = textWidth(View);
      }
    }
  }

  String GetText () {
    String Text = "";
    if (focus) {
      for (int i = 0; i < Letters.size(); i ++) {
        Text += Letters.get(i);
      }
      Letters.clear();
      View = "";
      StartPoint = 0;
    }
    return Text;
  }

  void ShiftText () {
    if (TextWidth > W - H/4 - 10) {
      StartPoint ++;
      View = "";
      for (int i = StartPoint; i < Letters.size(); i ++) {
        View += Letters.get(i);
      }
      TextWidth = textWidth(View);
    }
  }

  void Focus () {
    if (mousePressed) {
      if (mouseX > X && mouseX < X + W && mouseY > Y && mouseY < Y + H) {
        focus = true;
      } else {
        focus = false;
      }
    }
  }

  void Graphics () {
    if (focus) {
      if (Alpha < 150) {
        Alpha += 10;
      }
    } else {
      if (Alpha > 50) {
        Alpha -= 10;
      }
    }
  }
  
  void SetColor (int _R, int _G, int _B) {
    R = _R;
    G = _G;
    B = _B;
  }
  
  void SetTextColor (int _TR, int _TG, int _TB) {
    TR = _TR;
    TG = _TG;
    TB = _TB;
  }
  
  void SetFocus (boolean Focus) {
    if (Focus) {
      focus = true; 
    } else {
      focus = false; 
    }
  }
  
  void SetLable (String Text) {
     Lable = Text;
  }
}