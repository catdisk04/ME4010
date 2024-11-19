syms s X1 X2 F
A=[s*s+s+1, -1-s;
    -s - 1, 2*s+2];
B=[X1;
    X2];
C=[F;0];
    
pretty(inv(A)*C)