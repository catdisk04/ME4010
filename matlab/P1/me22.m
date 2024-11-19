
syms s
syms w

close all
%clear all

num =  [8]
denom=[1, 1, 8]
range_=log10([0.01, 100]);
G = poly2sym(num, s)/poly2sym(denom, s)
res=[];
phases=[];
xax=logspace(range_(1), range_(2), 100);
for omega = xax;
    res=[res, 20*log10(abs(subs(G, s, complex(0, omega))))];
    phases = [phases, (180/pi)*angle(subs(G, s, complex(0, omega)))];
end 

pw=0;
phase_pw = 0;
ppws=[]
for r = roots(denom).'
    pw = pw + piecewise(w<abs(r), -20*log10(abs(r)), w>=abs(r), -20*log10(w));
    phase_pw = phase_pw + piecewise(w<0.1*abs(r), 0, w > 10*abs(r), -90, -45*log10(w) - (90-45*log10(10*r))   )
    ppws= [ppws, piecewise(w<0.1*abs(r), 0, w > 10*abs(r), -90, -45*log10(w) - (90-45*log10(10*r)))]
end

if size(num, 2) == 1
    pw = pw + 20*log10(num(1));
else
    for r = roots(num).'
        pw = pw + piecewise(w<abs(r), 20*log10(abs(r)), w>=abs(r), 20*log10(w));
        phase_pw = phase_pw + piecewise(w<0.1*abs(r), 0, w > 10*abs(r), 90, 45*log10(w) + (90-45*log10(10*r)) )
    end
end

figure(1)
hold on
subplot(2, 1, 1)
semilogx(xax, subs(pw, w, xax))
hold on
semilogx(xax, res, 'b')
title("magnitude")
subplot(2, 1, 2)
semilogx(xax, subs(phase_pw, w, xax))
hold on
semilogx(xax,  phases, 'b')
title("phase")


% 
% figure(2)
% bode(tf(num, denom), {0.1, 10})

% figure(2)
% semilogx(xax,  phases, 'b')

