%Signals PSET 8
%Camille Chow
%5/10/17

%1)
%a) ARMA
%b) Innovations
%c) v(n) = x(n) + 0.2x(n-1) + 0.8x(n-2) - 0.5v(n-1) - 0.4v(n-2)
%d) Sx(w) = 4*|1+0.5exp(-jw)+0.4exp(-2jw)|^2/|1+0.2exp(-jw)+0.8exp(-2jw)|^2

%% 2)
num = [1 .5 .4];
den = [1 .2 .8];
figure
zplane(num,den)
%% 3)
N = 10000;
v = 2*randn(1,N);
x = filter(num,den,v);
%% 4)
m0 = 4;
r = [1,4];
for m = 0:m0
    r(m+1) = sum(x(m+1:end).*x(1:end - m))/N;
end
%% 5)
M = 5;
R = toeplitz(r);
%% 6)
eigenvalues = eig(R)
%% 7)
[s_est,w] = pwelch(x,hamming(512),256,512);
%% 8)
s_est = s_est/max(s_est);
[h,w] = freqz(num,den,w);
S = abs(h).^2;
S = S/max(S);
figure
plot(w,s_est,w,S);
xlim([0 pi])
legend('estimate','exact')
title('S vs S_e_s_t');
xlabel('w')
ylabel('Power')
%% 9)
[z,p, k] = tf2zp(num,den);
angle(max(p))
w(S==max(S))
%% 10)
A = toeplitz([x(5) x(4) x(3) x(2),x(1)],x(5:N));
[U, S, V] = svd(A);
(diag(S).^2)/(N-m0+1)
R*U./U