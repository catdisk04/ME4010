P1=[1 7 2 9 10 12 15];%Denominator of TF G2
r = roots(P1);%roots of P1, i.e poles of G2

%part (1)
subplot(3, 1, 1);
plot(r, 'ro') %point plot of roots
xlabel("Real")
ylabel("Imaginary")
title("s-domain plot of P1")

%part (2)
%TF is unstable if any of the poles are on the RHP (i.e, >0)
if any(r>0)
    fprintf("unstable\n")
end

%part(3)    
%step response of G2
subplot(3, 1, 2);
step(tf(1, P1))
syms s t;                     

%part(4)
%stabilising G2 to get G1 and plotting step response
subplot(3, 1, 3);
G2=tf(sym2poly(prod(s-r(r>0))),P1) %multiplying the positive poles of G2 to the numerator to get a stable response
G2=G2/dcgain(G2)
step(G2)

%part(5)
%inverse laplace of TF2 using inbuilt function
fprintf("Inverse laplace of G2: \n")
ilaplace(1/poly2sym([1 7 2 9 10 12 15])) %ilaplace takes sym format input
fprintf("Inverse laplace of G1: \n")
ilaplace(prod(s-r(r>0))/poly2sym([1 7 2 9 10 12 15]))
