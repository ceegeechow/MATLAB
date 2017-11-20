%Camille Chow
%ECE300 PSET3
%11/2/17

%% Question 1 part c
gamma1 = (qfuncinv(1e-5))^2;
gamma2 = (qfuncinv(1e-5))^2/(1 - .2);

%% Question 2 part d
a = [2.5 1.5 1 1 .5 .5];
b = [1 2 4 5 9 10];
Pe = @(gamma) sum(a.*qfunc(sqrt(b.*gamma)));
Pe_est = @(gamma) sum(a(1)*qfunc(sqrt(b(1)*gamma)));
gamma = linspace(7,25);
%% part e
P1 = arrayfun(Pe,gamma);
P2 = arrayfun(Pe_est,gamma);
figure
plot(gamma, P1, gamma, P2)
set(gca,'Yscale', 'log')
title('P_e detailed vs simplified')
xlabel('\gamma_b (SNR/bit)')
ylabel('P_e (dB)')
%% part f
N = 1e6;
gam1 = find((P1 > (1e-3 - .00005)) & (P1 < (1e-3 + .00005))); %gamma of approx. 24 gives Pe = 1e-3
gam2 = find((P1 > (1e-5 - .0000005)) & (P1 < (1e-5 + .0000005))); %gamma of approx. 72 gives Pe = 1e-5
data = [1+j 1-j -1+j -1-j 3+j 3-j -3+j -3-j]; %let epsilon0 = 1
sym = datasample(data,N);
stddev1 = sqrt(1/(2*gam1));
stddev2 = sqrt(1/(2*gam2));
sym1 = sym + stddev1*randn(N,3) + stddev1*randn(N,3)*j;
sym2 = sym + stddev2*randn(N,3) + stddev2*randn(N,3)*j;