%Signals PSET 7
%Camille Chow
%4/21/17

%Question 2
figure
bode(tf([1 50], [1 1 36]))
grid on

%Question 4b

alpha = 2;
k = (0:.01:10);
zeta = (k + alpha)./(2*sqrt(alpha.*k+1));

figure
plot(k,zeta)
title('zeta as a function of K')
xlabel('K')
ylabel('zeta')
%minimum value of zeta
[minZeta, i] = min(zeta);
minZeta
minK = k(i)
%critically damped
critVals = k(abs(zeta-1) < .0005)
%underdamped
under = k(zeta<1);
%overdamped
over = k(zeta>1);
