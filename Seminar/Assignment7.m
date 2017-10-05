%Camille Chow
%MATLAB Section A
%Assignment 7

%Part 1
x = zeros(1,2001);
t = (0:.001:2);
F = linspace(-50e3,50e3,2001);

for f = 1:50000
    x = x + sin(2.*pi.*f.*t);
end

%Part 2
Hd1 = getFilterButter;
butter = fft(filter(Hd1,x));
figure;
plot(F,20*log10(fftshift(abs(butter))));
title('Butterworth Lowpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

%Part 3
Hd2 = getFilterCheb1;
cheb1 = fft(filter(Hd2,x));
figure;
plot(F,20*log10(fftshift(abs(cheb1))));
title('Chebychev I Highpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

%Part 4
Hd3 = getFilterCheb2;
cheb2 = fft(filter(Hd3,x));
figure;
plot(F,20*log10(fftshift(abs(cheb2))));
title('Chebychev II Bandstop Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

%Part 5
Hd4 = getFilterElliptic;
elliptic = fft(filter(Hd4,x));
figure;
plot(F,20*log10(fftshift(abs(elliptic))));
title('Elliptic Bandpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
