%Camille Chow
%MATLAB Section A
%Assignment 6

%1 - Zzz
%a
num = [3/7 2/3 1/2];
den = [1/2 0 1/3 2];
[N,D] = eqtflength(num,den);
[Z,P,K] = tf2zp(N,D);
%b
figure;
zplane(Z,P)
%c
[H,T] = impz(N,D,50);
figure;
stem(H)
title('Impulse Response');
%d
n = (0:1:49);
x = (-1/2).^n;
Y = filter(N,D,x);
%e
Z = conv(H,x);
figure;
subplot(2,1,1)
stem(0:49,Y)
title('Using Filter');
subplot(2,1,2)
stem(0:49,Z(1:50))
title('Using Convolution');

%2 - you gotta be fibbin me!
%a
x = (1:1:100);
f = zeros(1,100);
f(1) = 1;
f(2) = 1;
for i = 3:100
    f(i) = f(i-1) + f(i-2);
end
figure;
semilogy(x,f,'.')
title('Fibonacci Numbers');
%b
num = [1];
den = [1 -1 -1];
[N,D] = eqtflength(num,den);
[Z,P,K] = tf2zp(N,D);
figure;
zplane(Z,P)
%Assuming the system is realizable, the system would be causal
%but not stable.
%On the pole zero plot, we take the ROC in which abs(z) > (1+sqrt(5))/2
%This region is analytic at infinity, so it is causal
%But this region does not include the unit circle, so it is NOT stable
%Looking at the difference equation, this makes sense because it
%does not include any "future terms", but it is unbounded from above