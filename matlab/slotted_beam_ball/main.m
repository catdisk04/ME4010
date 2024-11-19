syms x1 x2 x3 x4 J Jb m b g  u

f=[x2;
    b*(x1*x4*x4-g*sin(x3));
    x4;
    (u-m*g*x1*cos(x3)-2*m*x1*x2*x4)/(m*x1*x1+J+Jb)]
x=[x1;x2;x3;x4]

x0=[1;0;0;0]

A_func=jacobian(f, x)
A=subs(A_func, x, x0)

%{
f=[x2;
    b*(x1*x4*x4-g*sin(x3));
    x4;
    (-m*g*x1*cos(x3)-2*m*x1*x2*x4)/(m*x1*x1+J+Jb)];

x=[x1;x2;x3;x4];

x0=[1;0;0;0];



A_func=jacobian(f, x);
A=subs(A_func, x, x0)
%}