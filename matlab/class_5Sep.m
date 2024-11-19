syms s
t1 = tf(1, sym2poly((s+1)*(s+2)*(s+8)))

clear;
close;

z1=[];
p1=[-1, -3, -8];
k1=1;

figure;
hold on;

%zeroes, poles, gain of openloop tf.
sys = zpk(z1, p1, k1)
step(sys) 
%feedback(G, H)
sysc = feedback(zpk(z1, p1, 101), 1)
step(sysc)

%Adding a zero at origin:
%rlocus(zpk([z1, 0], p1, 101));
step(feedback(zpk([z1, 0], p1, 101), 1));

%Adding a pole at origin:
%gain 50 as 101 is unstabel for the new system after adding pole
%equivalent to using Integral control
step(feedback(zpk(z1, [p1, 0], 50), 1));


%Pole at origin, Zero very close to origin
%gets 0 sse without largely changing transient charecteristics
step(feedback(zpk([z1, -0.01], [p1, 0], 50), 1));

%lag compensator: pole not exactly at zero either, but closer then the zero.
%SSE not zero, but improved. 


%META exersices: interactive plots to add poles interactively
%fn to plot step response and rl for given z, p, k

legend;
