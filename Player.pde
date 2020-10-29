class Player {

  String sign; 
  Player(String sign) {
    this.sign = sign;
  }


  void drawX(float squareX, float squareY) {

    stroke(#16DE5D);
    strokeWeight(5);
    noFill();

    float m = 35;
    float x1 = squareX - spacing/2 +m;
    float y1 = squareY - spacing/2 + m;
    float x2 = squareX + spacing/2 - m;
    float y2 = squareY + spacing/2 - m ;

    line(x1, y1, x2, y2);
    line(x2, y1, x1, y2);
  }

  void checkEdges(Player p) {

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


    squareX += spacing/2;
    squareY += spacing/2;

    println("squareX: " + squareX);
    println("squareY: " + squareY);

    drawX(squareX, squareY);
  }
}
