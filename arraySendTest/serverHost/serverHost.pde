import processing.net.*;

Server s;
Client c;
int input;

int[][] plate = new int [3][9];
int col = 0;
int row = 0;


void setup() {
  size(200, 200);
  background(0);
  frameRate(10);  
  s = new Server(this, 12345);
}

void draw() {
  c = s.available();

  if (c != null) {
    if (col < 9) {
      input = c.read();
      plate[row][col] = input;
      row++;
      if (row == 2) {
        row = 0;
        col++;
      }
    }
    print(input + " ");
    if (col == 8) {
      s.write("MODTAGET");
    }
  }
}
