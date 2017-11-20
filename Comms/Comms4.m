%Camille Chow
%ECE300 PSET3
%11/21/17

%% Question 1 part c
gamma1 = (qfuncinv(1e-5))^2;
gamma2 = (qfuncinv(1e-5))^2/(1 - .2);

%% Question 2 part d
a = [2.5 1.5 1 1 .5 .5];
b = [1 2 4 5 9 10];
Pe = @(gamma) sum(a.*qfunc(sqrt(b.*gamma)));
Pe_est = @(gamma) sum(a(1)*qfunc(sqrt(b(1)*gamma)));
gamma = linspace(5,25);
%% part e
P1 = arrayfun(Pe,gamma);
P2 = arrayfun(Pe_est,gamma);
figure
semilogy(gamma, P1, gamma, P2)
legend('Detailed','Simplified')
title('P_e detailed vs simplified')
xlabel('\gamma_b (SNR/bit)')
ylabel('P_e (dB)')
%% part f
N = 1e6;
symbols = [1+j 1-j -1+j -1-j 3+j 3-j -3+j -3-j]; %let epsilon0 = 1
s = datasample(symbols,N);
gam1 = 11; %yields Pe approximately equal to 1e-3
gam2 = 20; %yields Pe approximately equal to 1e-5
stddev1 = sqrt(1/gam1);
stddev2 = sqrt(1/gam2);
%add AWGN
rec1 = s + stddev1*randn(1,N) + stddev1*randn(1,N)*j;
rec2 = s + stddev2*randn(1,N) + stddev2*randn(1,N)*j;
%make decision
A = repmat(symbols,N,1);
B1 = repmat(rec1.',1,size(symbols,2));
B2 = repmat(rec2.',1,size(symbols,2));
C1 = B1 - A;
C1 = abs(C1).^2;
C2 = B2 - A;
C2 = abs(C2).^2;
[~,i1] = min(C1,[],2);
[~,i2] = min(C2,[],2);
%probability of error
p1 = s - symbols(i1);
p2 = s - symbols(i2);
Perror1 = length(find(p1))/N;
Perror2 = length(find(p2))/N;
