close all
clear all

num=[8]
denom=[1, 1, 8]
G=tf(num, denom)

%Q1(a)
mybode(num, denom)

%Q1(b)
figure(2)
bode(tf(num, denom), {0.01, 100})

%Q1(c)
figure(3);
w_d = [0.25 2.5 25 250];
t_1 = 0:0.01:1000;
lsim(G,sin(w_d(1)*t_1),t_1);
title("Linear Simulation Result for w=0.25 rad/s");

figure(4)
lsim(G,sin(w_d(2)*t_1),t_1);
title("Linear Simulation Result for w=2.5 rad/s");

figure(5)
lsim(G,sin(w_d(3)*t_1),t_1);
title("Linear Simulation Result for w=25 rad/s");

figure(6)
lsim(G,sin(w_d(4)*t_1),t_1);
title("Linear Simulation Result for w=250 rad/s");


%Q2
figure(7)

C = tf([1 0.5],[1 0.1]);
G2 = C*G;
sysf = feedback(G2,1);
subplot(3,1,1);
title("G(s) Bode Plot")
bode(G);
title("C(s)G(s) open loop Bode plot")
subplot(3,1,2);
bode(G2);
subplot(3,1,3);
title("C(s)G(s) closed loop Bode plot")
bode(sysf);