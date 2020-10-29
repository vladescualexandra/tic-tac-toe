public static float spacing = 150;
Table t;
Player x;
Player o;
boolean turn = true;
static int ii = 0;
static int jj = 0;

void setup() {
  size(450, 450);
    background(0);
  t = new Table();
  t.display();
  x = new Player("x");
  o = new Player("o");
}



void draw() {

}


void mousePressed() {
  if (turn) {
    if (!t.checkFull()) {

      t.returnPosition();
      t.usePosition(x);

      t.bot();
    }

    String s = "";

    if (t.checkWin(x)) { // 
      // if X wins
      s = "You won";
      fill(#1FFC36, 50);
      turn = false;
    } else {

      if (t.checkWin(o)) {
        // if O  wins

        s = "You lost";
        fill(#F56065, 50);
        turn = false;
      }

      // if x didn't win (at least yet)
      // check if the table is full
      // if yes, it means X lost
      if (t.checkFull()) {
        s = "Tie";      
        fill(#FCF61F, 50);
        turn = false;
      }
    }

    rect(0, 0, 450, 450);
    textAlign(CENTER, CENTER);
    textSize(100);
    text(s, 0, 0, 450, 450);
  } else {
    t = new Table();
    background(0);
    t.reset();
    t.display();
    turn = true; 
  }
}




void keyPressed() {
  t = new Table();
  background(0);
  t.reset();
  t.display();
}
