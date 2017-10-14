%Camille Chow
%ECE300 PSET 2
%10/13/17

fc = 1000;
fs = 10*fc;
N = 10000;
N0 = 10*N;

dt = 1/fs;
n = 0:N-1;
t = n*dt;
f0 = 100;
x0 = cos(2*pi*f0*t);
T0 = max(t);
p = 2./(1+10*((t-T0/2)./T0).^2) - 1;

Pf = fftshift(fft(p,N0));
k = -N0/2:N0/2-1;
f = k*fs/N0;

%7a)
W = 20;
fidx = find(0<=f & f<=W);
fkeep = f(fidx);
Pfkeep = Pf(fidx);

figure
subplot(2,1,1)
plot(t,p)
title('p(t)')
xlabel('t (s)')
ylabel('Amplitude (V)')
subplot(2,1,2)
plot(fkeep,20*log10(abs(Pfkeep)))
title('|P(f)|')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')

% mag2db(abs(max(Pfkeep))) = 70.6283 dB
% After 20Hz, the spectrum magnitude is less than 36 dB,
% which is about 35 dB lower than the peak

%7b)
x1 = p.*x0;
Xf = fftshift(fft(x1,N0));

fidx = find((fc-(f0+W))<=f & f<=(fc-(f0-W)));
fkeep = f(fidx);
Xfkeep = Xf(fidx);

figure
subplot(2,1,1)
plot(t,x1)
title('x1(t)')
xlabel('t (s)')
ylabel('Amplitude (V)')
subplot(2,1,2)
plot(fkeep,20*log10(abs(Xfkeep)))
title('|X1(f)|')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')

%7c)
pAM = .5*modulate(p,fc,fs,'amdsb-tc',-2);
x1AM = .5*modulate(x1,fc,fs,'amdsb-tc',-2);

P_AM = fftshift(fft(pAM,N0));
x1_AM = fftshift(fft(x1AM,N0));

P_AMkeep = P_AM(fidx);
x1_AMkeep = x1_AM(fidx);

figure
subplot(2,2,1)
plot(t,pAM)
title('p(t) AM modulated signal')
xlabel('t (s)')
ylabel('Amplitude (V)')
subplot(2,2,2)
plot(t,x1AM)
title('x1(t) AM modulated signal')
xlabel('t (s)')
ylabel('Amplitude (V)')
subplot(2,2,3)
plot(fkeep,20*log10(abs(P_AMkeep)))
title('Magnitude Response')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')
subplot(2,2,4)
plot(fkeep,20*log10(abs(x1_AMkeep)))
title('Magnitude Response')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')

%7d)
phat = imag(hilbert(p));
x1hat = imag(hilbert(x1));

figure
subplot(2,1,1)
plot(t,phat)
title('Hilbert transform of p(t)')
xlabel('t (s)')
ylabel('Amplitude (V)')
subplot(2,1,2)
plot(t,x1hat)
title('Hilbert transform of x1(t)')
xlabel('t (s)')
ylabel('Amplitude (V)')

%7e)
DSBp = modulate(p,fc,fs,'am');
DSBpf = fftshift(fft(DSBp,N0));
DSBpfkeep = DSBpf(fidx);
[DSBp_upper,DSBp_lower] = envelope(DSBp,100,'peak');

DSBx1 = modulate(x1,fc,fs,'am');
DSBxf = fftshift(fft(DSBx1,N0));
DSBxfkeep = DSBxf(fidx);
[DSBx1_upper,DSBx1_lower] = envelope(DSBx1,100,'peak');

LSSBp = ssbmod(p,fc,fs,0);
LSSBpf = fftshift(fft(LSSBp,N0));
LSSBpfkeep = LSSBpf(fidx);
[LSSBp_upper,LSSBp_lower] = envelope(LSSBp,100,'peak');

LSSBx1 = ssbmod(x1,fc,fs,0);
LSSBxf = fftshift(fft(LSSBx1,N0));
LSSBxfkeep = LSSBxf(fidx);
[LSSBx1_upper,LSSBx1_lower] = envelope(LSSBx1,100,'peak');

USSBp = ssbmod(p,fc,fs,0,'upper');
USSBpf = fftshift(fft(USSBp,N0));
USSBpfkeep = USSBpf(fidx);
[USSBp_upper,USSBp_lower] = envelope(USSBp,100,'peak');

USSBx1 = ssbmod(x1,fc,fs,0,'upper');
USSBxf = fftshift(fft(USSBx1,N0));
USSBxfkeep = USSBxf(fidx);
[USSBx1_upper,USSBx1_lower] = envelope(USSBx1,100,'peak');

figure
subplot(2,3,1)
plot(t,DSBp)
title('p(t) DSB modulated signal')
xlabel('t (s)')
ylabel('Amplitude (V)')

subplot(2,3,2)
plot(fkeep,20*log10(abs(DSBpfkeep)))
title('p(t) DSB magnitude response')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')

subplot(2,3,3)
plot(t,DSBp_lower,t,DSBp_upper)
title('p(t) DSB envelopes')
xlabel('t (s)')
ylabel('Amplitude (V)')

subplot(2,3,4)
plot(t,DSBx1)
title('x1(t) DSB modulated signal')
xlabel('t (s)')
ylabel('Amplitude (V)')

subplot(2,3,5)
plot(fkeep,20*log10(abs(DSBxfkeep)))
title('x1(t) DSB magnitude response')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')

subplot(2,3,6)
plot(t,DSBx1_lower,t,DSBx1_upper)
title('x1(t) DSB envelopes')
xlabel('t (s)')
ylabel('Amplitude (V)')

figure
subplot(2,3,1)
plot(t,LSSBp)
title('p(t) LSSB modulated signal')
xlabel('t (s)')
ylabel('Amplitude (V)')

subplot(2,3,2)
plot(fkeep,20*log10(abs(LSSBpfkeep)))
title('p(t) LSSB magnitude response')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')

subplot(2,3,3)
plot(t,LSSBp_lower,t,LSSBp_upper)
title('p(t) LSSB envelopes')
xlabel('t (s)')

subplot(2,3,4)
plot(t,LSSBx1)
title('x1(t) LSSB modulated signal')
xlabel('t (s)')
ylabel('Amplitude (V)')

subplot(2,3,5)
plot(fkeep,20*log10(abs(LSSBxfkeep)))
title('x1(t) LSSB magnitude response')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')

subplot(2,3,6)
plot(t,LSSBx1_lower,t,LSSBx1_upper)
title('x1(t) LSSB envelopes')
xlabel('t (s)')
ylabel('Amplitude (V)')

figure
subplot(2,3,1)
plot(t,USSBp)
title('p(t) USSB modulated signal')
xlabel('t (s)')
ylabel('Amplitude (V)')

subplot(2,3,2)
plot(fkeep,20*log10(abs(USSBpfkeep)))
title('p(t) USSB magnitude response')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')

subplot(2,3,3)
plot(t,USSBp_lower,t,USSBp_upper)
title('p(t) USSB envelopes')
xlabel('t (s)')
ylabel('Amplitude (V)')

subplot(2,3,4)
plot(t,USSBx1)
title('x1(t) USSB modulated signal')
xlabel('t (s)')
ylabel('Amplitude (V)')

subplot(2,3,5)
plot(fkeep,20*log10(abs(USSBxfkeep)))
title('x1(t) USSB magnitude response')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')

subplot(2,3,6)
plot(t,USSBx1_lower,t,USSBx1_upper)
title('x1(t) USSB envelopes')
xlabel('t (s)')
ylabel('Amplitude (V)')

%8d)
pFM = fmmod(p,fc,fs,5);
xFM = fmmod(x1,fc,fs,1);

P_FM = fftshift(fft(pFM,N0));
x_FM = fftshift(fft(xFM,N0));

BTp = 320;
fidx_p = find((fc-2*BTp)<=f & f<=(fc+BTp));
fkeep_p = f(fidx_p);

BTx = 600;
fidx_x = find((fc-2*BTx)<=f & f<=(fc+BTx));
fkeep_x = f(fidx_x);

P_FMkeep = P_FM(fidx_p);
X_FMkeep = x_FM(fidx_x);

figure
subplot(2,2,1)
plot(t,pFM)
title('p(t) FM modulated signal')
xlabel('t (s)')
ylabel('Amplitude (V)')

subplot(2,2,2)
plot(fkeep_p,20*log10(abs(P_FMkeep)))
title('Magnitude Response')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')
xlim([min(fkeep_p) max(fkeep_p)])

subplot(2,2,3)
plot(t,xFM)
title('x1(t) FM modulated signal')
xlabel('t (s)')
ylabel('Amplitude (V)')

subplot(2,2,4)
plot(fkeep_x,20*log10(abs(X_FMkeep)))
title('Magnitude Response')
xlabel('f (Hz)')
ylabel('Magnitude (dB)')
xlim([min(fkeep_x) max(fkeep_x)])
