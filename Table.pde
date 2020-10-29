class Table {

  Square mat[][]= new Square[3][3];
  Table() {
  }

void reset() {
  for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        mat[i][j] = null;
        mat[i][j] = new Square(i*150, j*150);
        mat[i][j].drawSquare();
      }
    }
}
  
  void display() {
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        mat[i][j] = new Square(i*150, j*150);
        mat[i][j].drawSquare();
      }
    }
  }

  void returnPosition() {
    float posX = mouseX;
    float posY = mouseY;

    for (int i=1; i<4; i++) {
      for (int j=1; j<4; j++) {
        if (( posX >= (i-1)*spacing) && (posX <= (i * spacing))
          && ( posY >= (j-1)*spacing) && (posY <= (j * spacing))) {
          ii = i-1;
          jj = j-1;
        }
      }
    }
  }

  boolean checkPosition() {
    if (mat[ii][jj].occupied)
      return true; // TRUE - OCUPATA
    else 
    return false; // FALSE - LIBERA
  }

  boolean usePosition(Player p) {

    if (checkPosition()) {
      return false;
    } else {
      println("Player ocupa " + ii + " " + jj);
      mat[ii][jj].occupied = true;
      mat[ii][jj].player = p;
      mat[ii][jj].player.checkEdges(p);
      return true;
    }
  }

  void drawO(float squareX, float squareY) {
    stroke(#D81118);
    strokeWeight(10);
    noFill();
    squareX += spacing/2;
    squareY += spacing/2;
    println("deseneaza X");

    circle(squareX, squareY, 100);
  }

  boolean bot() {

    while (t.checkPosition()) {
      ii = floor(random(0, 3));
      jj = floor(random(0, 3));
    }

    if (mat[ii][jj].occupied) {
      return false;
    } else {
      println("Bot ocupa " + ii + " " + jj);
      mat[ii][jj].occupied = true;
      mat[ii][jj].player = o;
      drawO(mat[ii][jj].squareX, mat[ii][jj].squareY);
      return true;
    }
  }

  boolean checkWin(Player p) {

    for (int i=0; i<3; i++)
    {
      if ( mat[i][0].player != null && mat[i][1].player != null && mat[i][2].player != null) {
        if (mat[i][0].player.sign == mat[i][1].player.sign && mat[i][1].player.sign == mat[i][2].player.sign && mat[i][0].player.sign == p.sign ) {
          return true;
        }
      }

      if ( mat[0][i].player != null && mat[1][i].player != null && mat[2][i].player != null) {
        if (mat[0][i].player.sign == mat[1][i].player.sign && mat[1][i].player.sign == mat[2][i].player.sign && mat[0][i].player.sign == p.sign) {
          return true;
        }
      }

      if ( mat[0][0].player != null && mat[1][1].player != null && mat[2][2].player != null) {
        if (mat[0][0].player.sign == mat[1][1].player.sign && mat[1][1].player.sign == mat[2][2].player.sign && mat[2][2].player.sign == p.sign) {
          return true;
        }
      }

      if ( mat[0][2].player != null && mat[1][1].player != null && mat[2][0].player != null) {
        if (mat[0][2].player.sign == mat[1][1].player.sign && mat[1][1].player.sign == mat[2][0].player.sign && mat[2][0].player.sign == p.sign) {
          return true;
        }
      }
    }

    return false;
  }

  boolean checkFull() {

int contor = 0;
    
    
    for (int i=0; i<3; i++) {
      for (int j = 0; j < 3; j ++) {
        
        if (mat[i][j].occupied == true) 
            contor++;
        
      }
    }
    if (contor > 8) return true;
    else return false;
  }
}
