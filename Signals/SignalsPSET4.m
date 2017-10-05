%Camille Chow
%Signals PSET 4
%3/24/17

%4 - bandpass analog elliptic filter
fp = [12e3, 15e3];
fs = [10e3, 16e3];
rp = 1.5;
rs = 30;
[n, wn] = ellipord(2*pi*fp, 2*pi*fs,rp,rs, 's');
[z,p,k] = ellip(n,rp,rs,wn, 's');
[b,a] = zp2tf(z,p,k);
%a
figure;
zplane(z,p);
%b
n %returns 4
%from the pole zero plot, we can see 8 poles
%therefore the order of the filter is 2n = 8

%c
fa = linspace(5e3,25e3,1000);
ha = freqs(b,a,2*pi*fa);

figure;
subplot(2,1,1);
plot(fa,20*log10(abs(ha)));

stopline = refline(0,-30);
passHigh = refline(0,0);
passLow = refline(0,-1.5);
set(stopline,'Color','g','LineStyle','--');
set(passHigh,'Color','r','LineStyle','--');
set(passLow,'Color','r','LineStyle','--');

title('Magnitude');
ylabel('dB');
ylim([-60,1]);
xlabel('Frequency (Hz)');

subplot(2,1,2);
plot(fa,unwrap(angle(ha))*180/pi);
title('Phase');
ylabel('Degrees');
xlabel('Frequency (Hz)');

%6 - digital filter
fsamp = 80e3;
wp = fp/(fsamp/2);
ws = fs/(fsamp/2);
[nd,wd] = ellipord(wp,ws,rp,rs);
[zd,pd,kd] = ellip(nd,rp,rs,wd);
[bd,ad] = zp2tf(zd,pd,kd);
%a
nd %returns 4
%b
figure;
zplane(zd,pd); %8 zeros and 8 poles
%all zeros located on unit circle
%all poles located just inside unit circle
%similar to analog case with the jw axis

%c
fd = linspace(0,fsamp/2,10000);
hd = freqz(bd,ad,10000);

%d
figure;
subplot(2,1,1);
plot(fd,20*log10(abs(hd)));

stopline = refline(0,-30);
passHigh = refline(0,0);
passLow = refline(0,-1.5);
set(stopline,'Color','g','LineStyle','--');
set(passHigh,'Color','r','LineStyle','--');
set(passLow,'Color','r','LineStyle','--');

title('Magnitude');
ylabel('dB');
ylim([-60,1]);
xlabel('Frequency (Hz)');

subplot(2,1,2);
plot(fd,unwrap(angle(hd))*180/pi);
title('Phase');
ylabel('Degrees');
xlabel('Frequency (Hz)');
