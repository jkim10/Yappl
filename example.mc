/* The GCD algorithm in MicroC */
int x; 
x = 11;
print(x);
print(444);
int gcd(int a, int b) {
  while (a != b) {
    if (b < a) a = a - b;
    else b = b - a;
  }
  return a;
}
string s;
s="test";
print_s(s);
return 0;

