syms x1 x2 x3 x4 m g l M F;
D=M+m*(sin(x3))^2;
x1_=[x2];
x2_=[(.5*m*g*sin(2*x3))/D+F/D-(m*l*sin(x3)*(x4)^2)/D];
x3_=[x4]
x4_=[(M+m)*g*sin(x3)/D+F*cos(x3)/(D*l)-(.5*m*sin(2*x3)*(x4)^2)/D]
X=[x1_;x2_;x3_;x4_]
v=[x1 ;x2; x3;x4 ]

J_v=jacobian(X,v)

