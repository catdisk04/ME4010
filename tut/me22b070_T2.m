close all;
clear all;
syms s;

disp("Question 1")

%identifying pole required
Ts=1.2
OS=0.15
dom_pole=get_dom_pole(Ts, OS)

%original system
p=[-5, -5, -5];
orig_sys=zpk([], p, 1);
%rlocus(orig_sys);
hold on;

%plotting reqd pole
plot(dom_pole(1), dom_pole(2), 'rx')
legend("desired pole");

%calculation correction pole
z=-1;
angle_contrib = get_angle_contrib(dom_pole, p, [z])
ang_contrib_reqd = 180 - mod(angle_contrib, 360);
pole_loc=dom_pole(1) - dom_pole(2)*cot(-deg2rad(ang_contrib_reqd)) 

%plotting corrected system
corrected_sys=zpk([z], [p, pole_loc], 1);
rlocus(corrected_sys);
legend

%calculating gain where required dynamics is reached
k=round(1/abs(vpa(subs(prod(s-z)/prod(s-[p, pole_loc]), s, complex(dom_pole(1), dom_pole(2))))), 4)

%Printing roots at found gain to check scond order assumption validity
disp("Roots of corrected system: ")
r=rlocus(corrected_sys, k);r
hold off;

%------------------------------------------------------------------------------
%Same functional code blocks as for question1, therefore comments not repeated

disp("Question 2")
Ts2=3;
OS2=0.205;
dom_pole_2=get_dom_pole(Ts2,OS2)
p2=[0, 0, -5, -15]

figure(2)
hold on;
plot(dom_pole_2(1), dom_pole_2(2), 'rx')
orig_sys_2=zpk([], p2, 1);

%added zeroes
%z2=[-14, 0, 0] 
z2=[-14, 0]
%##############IMPORTANT COMMENTS############################
%Zeroe(s) at origin for stability, -14 as part of lead compensator
%2 zeroes at originresults in definitely second order assumable system, unclear for only one zero added at origin - a pole is left at origin 

angle_contrib_2=get_angle_contrib(dom_pole_2, p2, z2)
ang_contrib_reqd2 = 180 - mod(angle_contrib_2, 360)
pole_loc_2=dom_pole_2(1) - dom_pole_2(2)*cot(-deg2rad(ang_contrib_reqd2))
%rlocus(zpk(z2, p2, 1))

corrected_sys2=zpk(z2, [p2, pole_loc_2], 1)
rlocus(corrected_sys2)
legend
hold off

%k2=79.9 %for z2=[-14, 0]
%k2=22.4 %for z2=[-14, 0, 0]
k2=round(1/abs(vpa(subs(prod(s-z2)/prod(s-[p2, pole_loc_2]), s, complex(dom_pole_2(1), dom_pole_2(2))))), 4)

disp("Roots of corrected system2: ")
r=rlocus(corrected_sys2, k2);r
hold off;


%To get position of required dominant pole from Settling time and 
function pole=get_dom_pole(Ts, OS)
	dr=-log(OS)/(3.1415926^2+log(OS)^2)^0.5;
	wn=4/(dr*Ts);
	pole=[-dr*wn, wn*(1-dr^2)^0.5];
end

%To get angle contribution of ploes and zeroes wrt a given pole
function ang=get_angle_contrib(dom_pole, poles, zeroes)
	ang=0;
	for pole=poles;
		ang = ang - rad2deg(acos(dot((dom_pole-[pole, 0])/norm(dom_pole-[pole, 0]), [1, 0])));
	end
	for zero=zeroes;
		ang = ang + rad2deg(acos(dot((dom_pole-[zero, 0])/norm(dom_pole-[zero, 0]), [1, 0])));	
	end
end
