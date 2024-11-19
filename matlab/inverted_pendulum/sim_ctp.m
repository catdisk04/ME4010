clc;    close all; clear;

m = 1; % mass of pendulum
M = 5; % mass of cart
L = 2; % length of pendulum
g = -9.81; % m/s^2
d = 1; % Ns/m

t_sim = 0:.1:10;%time step

x0 = [0;0;pi+.01; 0.0]; %init cond

[t,x] =  ode45(@(t,x)CtP(x,M,m,L,g,d,0),t_sim, x0); %solver to integrate from derivatives of state vars supplied by CtP func.
%subst 0 with -k*(x-ref) as u

CtP_render(t,x,m,M,L);
%for j = 1:length(t)
%  CtP_render(t,x(j,:),m,M,L);
%end
