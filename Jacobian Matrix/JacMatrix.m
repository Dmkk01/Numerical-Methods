syms x y z

f1=x^2*y*z+y^2*z-3*z^4;
f2=x-1/y+z^3*x;
f3=y*x+y*z+x*z;

Jac(1,1)=diff(f1,x);
Jac(1,2)=diff(f1,y);
Jac(1,3)=diff(f1,z);
Jac(2,1)=diff(f2,x);
Jac(2,2)=diff(f2,y);
Jac(2,3)=diff(f2,z);
Jac(3,1)=diff(f3,x);
Jac(3,2)=diff(f3,y);
Jac(3,3)=diff(f3,z);
Jac


