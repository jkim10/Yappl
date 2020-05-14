/* The GCD algorithm in MicroC */

int a;
int b;
int c;
int d;
int e;

a=0;
b=1;
c=3;
d=4;
e=5;
print_s("=========================\n");
print_s("--Simple Operations--\n");
print_s("Should print 0 (a):\n");
print(a);
print_s("Should print 7 (c+d):\n");
print(c+d);
print_s("Should print 10 (e*2):\n");
print(e*2);
print_s("Should print 2 (d/2):\n");
print(d/2);

print_s("=========================\n");
print_s("--Comparisons--\n");
print_s("Should print True:\n");
if(5 > 4) print_s("True\n"); else print_s("False\n");
print_s("Should print False:\n");
if(5 == 4) print_s("True\n"); else print_s("False\n");
print_s("Should print True:\n");
if(5 == 5) print_s("True\n"); else print_s("False\n");
print_s("Should print True:\n");
if(5.0 > 4.0) print_s("True\n"); else print_s("False\n");
print_s("Should print False:\n");
if(5.0 == 4.0) print_s("True\n"); else print_s("False\n");
print_s("Should print True:\n");
if(5.0 == 5.0) print_s("True\n"); else print_s("False\n");










