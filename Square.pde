class Square {


  float squareX;
  float squareY;
  boolean occupied;
  Player player;

  Square(float x, float y) {
    this.squareX = x;
    this.squareY = y;
    this.occupied = false;
    this.player = null;
  }

  void drawSquare() {
    stroke(255);
    strokeWeight(5);
    noFill();
    rect(this.squareX, this.squareY, 150, 150);
  }

  boolean checkSquare() {
    // TRUE - OCUPAT 
    // FALSE - LIBER
    float posX = mouseX;
    float posY = mouseY;

    float squareX = 0;
    float squareY = 0;

    for (int i=1; i<4; i++) {

      if (  ( posX >= (i-1)*spacing) && (posX <= (i * spacing))) {
        squareX = (i-1)*spacing;
      }

      if ( ( posY >= (i-1)*spacing) && (posY <= (i * spacing))) {
        squareY = (i-1)*spacing;
      }
    }

    if (squareX == this.squareX && squareY == this.squareY) {
      if (!this.occupied) {
        return false;
      } else {
        return true;
      }
    }
    else {
      return false;
    }
  }
}
