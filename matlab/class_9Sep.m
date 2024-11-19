a=1; for i=-2:-1:-4
subplot(3, 1, a); plot([0, -100], [0, 100], 'r'); hold on;
rlocus(zpk([i], [-8,-3, -1], 1)); 
a=a+1; xlim([-10, 0])
end