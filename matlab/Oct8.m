syms s
z=[];
p=[-0, -1.75, -6];
close all;
%design a pid controller for zero sse to ramp ip, 20%OS and 1.8 Tpfor step ip.

G=zpk(z, p, 1) 
GPI=zpk([z, -0.002], [p, 0], 1)%Tf after adding pole
GPID=zpk([z, -4.5, -0.2], [p, 0], 1)%tf after adding pole at origin for 0sse to ramp ip and 2 more zeroes 
%rlocus(G)
hold on;
rlocus(GPID)
legend()
hold on
plot(-0.893, 1.744, 'gx')

S=tf('s')

%figure;
%step(G/S) %Ramp response
