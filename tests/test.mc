/* The GCD algorithm in MicroC */
string pass;
string fail;
pass=" \t\t[PASS]\n";
fail=" \t\t[FAIL]\n";

print_s("=========================\n");
print_s("--Comparisons--\n");

print_s("Greater Than:");
if(5 > 4) print_s(pass); else print_s(fail);
print_s("Less Than:");
if(5 < 4) print_s(fail); else print_s(pass);
print_s("Greater/Equal:");
if(5 >= 4) print_s(pass); else print_s(fail);
print_s("Less/Equal:");
if ((5 <= 6) && (5<=5)) print_s(pass); else print_s(fail);
print_s("Equal/Inequal:");
if((5 == 5) && (5 != 4)) print_s(pass); else print_s(fail);

print_s("=========================\n");
print_s("--Integer/Float Operations--\n");

print_s("Int   +:");
if((4+4)==8) print_s(pass); else print_s(fail);
print_s("Float +:");
if((5.0+5.0) == 10.0) print_s(pass); else print_s(fail);
print_s("Int   -:");
if((4-4)==0) print_s(pass); else print_s(fail);
print_s("Float -:");
if((9.0-5.0) == 4.0) print_s(pass); else print_s(fail);

print_s("Int   *:");
if((4*4)==16) print_s(pass); else print_s(fail);
print_s("Float *:");
if((5.0*5.0) == 25.0) print_s(pass); else print_s(fail);

print_s("Int   div:");
if((4/4)==1) print_s(pass); else print_s(fail);
print_s("Float div:");
if((10.0/5.0) == 2.0) print_s(pass); else print_s(fail);

print_s("=========================\n");
print_s("--Integer/Float Operations--\n");

print_s("Int Var:");
int a;
a=55;
if(a==55) print_s(pass); else print_s(fail);
print_s("Float Var:");
float b;
b=5.0;
if(b==5.0) print_s(pass); else print_s(fail);
print_s("Dist Var:\n"); /*Add to this*/
dist d;
d={"A":0.5,"BCD":0.5};
print_s(sample(d));










