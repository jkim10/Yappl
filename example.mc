/* The GCD algorithm in MicroC */
int a;
int b;

int gcd(int a, int b) {
  while (a != b) {
    if (b < a) a = a - b;
    else b = b - a;
  }
  return a;
}

int main() {
  float x;
  int y;
  dist z;
  a = 18;
  b = 9;
  x = 14.0;
  y = 3;
  print(gcd(99,121));
  print(gcd(a,b));
  return 0;
}
