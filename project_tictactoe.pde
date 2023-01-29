int[][] board = new int[3][3];
int currentPlayer = 1;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);

  drawBoard();

  checkWin();
}

void mousePressed() {
  int col = mouseX / (width / 3);
  int row = mouseY / (height / 3);

  if (board[row][col] == 0) {
    board[row][col] = currentPlayer;
    currentPlayer = (currentPlayer == 1) ? 2 : 1;
  }
}

void drawBoard() {
  strokeWeight(4);

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      int x = i * (width / 3) + 20;
      int y = j * (height / 3) + 20;
      int w = width / 3 - 40;
      int h = height / 3 - 40;

      if (board[i][j] == 1) {
        line(x, y, x + w, y + h);
        line(x + w, y, x, y + h);
      } else if (board[i][j] == 2) {
        ellipse(x + w / 2, y + h / 2, w, h);
      }
    }
  }
}

void checkWin() {
  // Check rows
  for (int i = 0; i < 3; i++) {
    if (board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != 0) {
      displayWin(board[i][0]);
      return;
    }
  }

  // Check columns
  for (int i = 0; i < 3; i++) {
    if (board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != 0) {
      displayWin(board[0][i]);
      return;
    }
  }

  // Check diagonals
  if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != 0) {
    displayWin(board[0][0]);
    return;
  }
  if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != 0) {
    displayWin(board[0][2]);
    return;
  }
}

void displayWin(int player) {
  fill(0);
  textSize(32);

  if (player == 1) {
    text("Player 1 wins!", 50, 50);
  } else {
    text("Player 2 wins!", 50, 50);
  }
}
