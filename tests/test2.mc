/* The GCD algorithm in MicroC */
string pass;
string fail;
pass=" \t\t[PASS]\n";
fail=" \t\t[FAIL]\n";

int gcd(int a, int b) {
  while (a != b) {
    if (b < a) a = a - b;
    else b = b - a;
  }
  return a;
}

string print_hello(){
	string s;
	s=" \t\t[PASS]\n";
	return s;
}

print_s("=========================\n");
print_s("--Functions--\n");
print_s("Int func:");
if(gcd(10,5) == 5) print_s(pass); else print_s(fail);
print_s("String func:");
string a;
a=" \t\t[FAIL]\n";
a=print_hello();
print_s(a);

