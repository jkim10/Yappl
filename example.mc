/* The GCD algorithm in MicroC */
int gcd(int a, int b) {
  while (a != b) {
    if (b < a) a = a - b;
    else b = b - a;
  }
  return a;
}
string hello(string a){
	print_s(a);
	return "hello";
}
print(444);
print_s(hello("test"));
return 0;

