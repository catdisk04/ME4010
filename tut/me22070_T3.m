close all;

G_air= tf([2, 0.1], [1, 0.1, 4]);
G_ser= tf([1], [1, 0]);
a=0.2461;
G_comp= tf([a, 1], [1]);

T=G_air*G_ser*G_comp*160

%compensated open loop frequency response
figure(1);
bode(T)
hold on;
bode(G_comp)
legend()

%compensated closed loop step response
figure(2);
step(feedback(T, 1))

%compensated closed loop ramp response
figure(3)
step(feedback(T*tf([1],  [1, 0]), 1))
