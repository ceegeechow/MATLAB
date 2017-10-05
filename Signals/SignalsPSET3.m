%Camille Chow
%Signals PSET 3 Question 4
%3/3/17

n = 0:49;
num = [5 3 -1];
den = [10 1 6];
%a)
[H,T] = impz(num,den,50);
figure;
stem(T,H)
xlabel('n');
ylabel('h[n]');
title('Impulse Response');
%b
[Z,P,K] = tf2zp(num,den);
figure;
zplane(Z,P);
%c
[H,W] = freqz(num,den,1000);
W = W*5e6/pi;

figure;
subplot(2,1,1);
plot(W,20*log10(abs(H)));
title('Magnitude Response');
ylabel('dB');
xlabel('Frequency (Hz)');

subplot(2,1,2);
plot(W,unwrap(angle(H))*180/pi);
title('Phase Response');
ylabel('Degrees');
xlabel('Frequency (Hz)');
%d
t = 1e-7*n;
x = exp(-t/2e-7).*cos(2*pi*2e6.*t);
y = filter(num,den,x);

figure;
subplot(2,1,1);
stem(0:49,x);
title('x[n]');

subplot(2,1,2);
stem(0:49,y);
title('y[n]');