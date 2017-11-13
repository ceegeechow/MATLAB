%DSP Project 2
%Camille Chow
%11/13/17

close all
%load('projIB.mat')

%specs
fs = 44100;
Wp = 2500/(fs/2);
Ws = 4000/(fs/2);
Rp = 3;
Rs = 95;

impulse = [1 zeros(1,99)];

%% get butterworth order/coefficients
[n,Wn] = buttord(Wp,Ws,Rp,Rs); % order = 23
[z,p,k] = butter(n,Wn);
[s,g] = zp2sos(z,p,100*k);
%butterworth filters
B3 = dfilt.df2sos(s,g);
c = cost(B3);
c.nmult; %multiplications = 35
B1 = convert(B3,'df1'); % unstable!
B2 = convert(B3,'df2'); % unstable!
B4 = convert(B3,'df2tsos');

%% get elliptic order/coefficients
[n,~] = ellipord(Wp,Ws,Rp,Rs); %order = 8
[z,p,k] = ellip(n,Rp,Rs,Wp);
[s,g] = zp2sos(z,p,100*k);
%elliptic filters (all stable)
E3 = dfilt.df2sos(s,g);
c = cost(E3);
c.nmult; %multiplications = 17
E1 = convert(E3,'df1');
E2 = convert(E3,'df2');
E4 = convert(E3,'df2tsos');

%% frequency responses
[hb1,wb1] = freqz(B1);
[hb2,wb2] = freqz(B2);
[hb3,wb3] = freqz(B3);
[hb4,wb4] = freqz(B4);

[he1,we1] = freqz(E1);
[he2,we2] = freqz(E2);
[he3,we3] = freqz(E3);
[he4,we4] = freqz(E4);

figure
subplot(2,1,1)
plot(wb1,mag2db(abs(hb1)),wb2,mag2db(abs(hb2)),wb3,mag2db(abs(hb3)),wb4,mag2db(abs(hb4)),...
    we1,mag2db(abs(he1)),we2,mag2db(abs(he2)),we3,mag2db(abs(he3)),we4,mag2db(abs(he4)));
title('Magnitude Responses, Butterworth and Elliptic')
xlabel('w')
ylabel('Magnitude (dB)')
xlim([0 pi])
ylim([-150 50])
legend('Butterworth df1','Butterworth df2','Butterworth df2sos','Butterworth df2tsos',...
    'Elliptic df1','Elliptic df2','Elliptic df2sos','Elliptic df2tsos')

%% group delays
[gdb1,wb1] = grpdelay(B1);
[gdb2,wb2] = grpdelay(B2);
[gdb3,wb3] = grpdelay(B3);
[gdb4,wb4] = grpdelay(B4);

[gde1,we1] = grpdelay(E1);
[gde2,we2] = grpdelay(E2);
[gde3,we3] = grpdelay(E3);
[gde4,we4] = grpdelay(E4);

subplot(2,1,2)
plot(wb1,gdb1,wb2,gdb2,wb3,gdb3,wb4,gdb4,...
    we1,gde1,we2,gde2,we3,gde3,we4,gde4);
title('Group Delays, Butterworth and Elliptic')
xlabel('w')
ylabel('Group Delay (samples)')
xlim([0 pi])
legend('Butterworth df1','Butterworth df2','Butterworth df2sos','Butterworth df2tsos',...
    'Elliptic df1','Elliptic df2','Elliptic df2sos','Elliptic df2tsos')

%% zero pole plots: butter
[zLoc1,pLoc1,~] = zplane(B1);
[zLoc2,pLoc2,~] = zplane(B2);
[zLoc3,pLoc3,~] = zplane(B3);
[zLoc4,pLoc4,~] = zplane(B4);

figure
subplot(2,2,1)
zplane(zLoc1,pLoc1)
title('Butterworth fd1')
subplot(2,2,2)
zplane(zLoc2,pLoc2)
title('Butterworth fd2')
subplot(2,2,3)
zplane(zLoc3,pLoc3)
title('Butterworth fd2sos')
subplot(2,2,4)
zplane(zLoc4,pLoc4)
title('Butterworth fd2tsos')

%% zero pole plots: elliptic
[zLoc1,pLoc1,~] = zplane(E1);
[zLoc2,pLoc2,~] = zplane(E2);
[zLoc3,pLoc3,~] = zplane(E3);
[zLoc4,pLoc4,~] = zplane(E4);

figure
subplot(2,2,1)
zplane(zLoc1,pLoc1)
title('Elliptic fd1')
subplot(2,2,2)
zplane(zLoc2,pLoc2)
title('Elliptic fd2')
subplot(2,2,3)
zplane(zLoc3,pLoc3)
title('Elliptic fd2sos')
subplot(2,2,4)
zplane(zLoc4,pLoc4)
title('Elliptic fd2tsos')

%% impulse response: butterworth
IR = B3.filter(impulse);
figure
stem(IR)
title('Butterworth Impulse Response')

%% impulse response: elliptic
IR = E3.filter(impulse);
figure
stem(IR)
title('Elliptic Impulse Response')

%% get cheb1 order/coefficients
[n,~] = cheb1ord(Wp,Ws,Rp,Rs); %order = 11
[z,p,k] = cheby1(n,Rp,Wp);
[s,g] = zp2sos(z,p,100*k);
%cheb1 filter
C1 = dfilt.df2sos(s,g);
c = cost(C1);
c.nmult; %multiplications = 17

%magnitude/group delay
figure
[h,w1] = freqz(C1);
[gd,w2] = grpdelay(C1);
subplot(3,1,1)
plot(w1,mag2db(abs(h)))
title('Chebyshev 1 Magnitude Response')
xlabel('w')
ylabel('Magnitude (dB)')
xlim([0 pi])
subplot(3,1,2)
plot(w1,mag2db(abs(h)))
title('Chebyshev 1 Magnitude Response')
xlabel('w')
ylabel('Magnitude (dB)')
xlim([0 Wp*pi])
subplot(3,1,3)
plot(w2,gd)
title('Chebyshev 1 Group Delay')
xlabel('w')
ylabel('Group Delay (samples)')
xlim([0 pi])

%pole-zero plot
[zLoc,pLoc,~] = zplane(C1);
figure
subplot(2,1,1)
zplane(zLoc,pLoc)
title('Chebyshev 1')

% impulse response
IR = C1.filter(impulse);
subplot(2,1,2)
stem(IR)
title('Chebyshev 1 Impulse Response')

%% get cheb2 order/coefficients
[n,~] = cheb2ord(Wp,Ws,Rp,Rs); %order = 11
[z,p,k] = cheby2(n,Rs,Ws);
[s,g] = zp2sos(z,p,100*k);
%cheb2 filter
C2 = dfilt.df2sos(s,g);
c = cost(C2);
c.nmult; %multiplications = 23

%magnitude/group delay
figure
[h,w1] = freqz(C2);
[gd,w2] = grpdelay(C2);
subplot(3,1,1)
plot(w1,mag2db(abs(h)))
title('Chebyshev 2 Magnitude Response')
xlabel('w')
ylabel('Magnitude (dB)')
xlim([0 pi])
subplot(3,1,2)
plot(w1,mag2db(abs(h)))
title('Chebyshev 2 Magnitude Response')
xlabel('w')
ylabel('Magnitude (dB)')
xlim([0 Wp*pi])
subplot(3,1,3)
plot(w2,gd)
title('Chebyshev 2 Group Delay')
xlabel('w')
ylabel('Group Delay (samples)')
xlim([0 pi])

%pole-zero plot
[zLoc,pLoc,~] = zplane(C2);
figure
subplot(2,1,1)
zplane(zLoc,pLoc)
title('Chebyshev 2')

% impulse response
IR = C2.filter(impulse);
subplot(2,1,2)
stem(IR)
title('Chebyshev 2 Impulse Response')

%% get Parks-McClellan order/coefficients
f = [2500 4000]; %cutoff frequencies
a = [100 0]; %Passband/Stopband amplitude
dev = [(10^(Rp/20)-1)/(10^(Rp/20)+1)  10^(-Rs/20)]; %ripple amplitudes

[n,fo,ao,w] = firpmord(f,a,dev,fs); %order = 124, multiplications = 125
b = firpm(n,fo,ao,w);
PM = dfilt.dffir(b);

%magnitude/group delay
figure
[h,w1] = freqz(PM);
[gd,w2] = grpdelay(PM);
subplot(3,1,1)
plot(w1,mag2db(abs(h)))
title('Parks-McClellan Magnitude Response')
xlabel('w')
ylabel('Magnitude (dB)')
xlim([0 pi])
subplot(3,1,2)
plot(w1,mag2db(abs(h)))
title('Parks-McClellan Magnitude Response')
xlabel('w')
ylabel('Magnitude (dB)')
xlim([0 Wp*pi])
subplot(3,1,3)
plot(w2,gd)
title('Parks-McClellan Group Delay')
xlabel('w')
ylabel('Group Delay (samples)')
xlim([0 pi])

%pole-zero plot
[zLoc,pLoc,~] = zplane(PM);
figure
subplot(2,1,1)
zplane(zLoc,pLoc)
title('Parks-McClellan')

% impulse response
subplot(2,1,2)
stem(b)
title('Parks-McClellan Impulse Response')

%% get Kaiser order/coefficients
[n,Wn,beta,ftype] = kaiserord(f,a,dev,fs); %order = 124, multiplications = 125
b = 100*fir1(n,Wn,ftype,kaiser(n+1,beta));
K = dfilt.dffir(b);

%magnitude/group delay
figure
[h,w1] = freqz(K);
[gd,w2] = grpdelay(K);
subplot(3,1,1)
plot(w1,mag2db(abs(h)))
title('Kaiser Magnitude Response')
xlabel('w')
ylabel('Magnitude (dB)')
xlim([0 pi])
subplot(3,1,2)
plot(w1,mag2db(abs(h)))
title('Kaiser Magnitude Response')
xlabel('w')
ylabel('Magnitude (dB)')
xlim([0 Wp*pi])
subplot(3,1,3)
plot(w2,gd)
title('Kaiser Group Delay')
xlabel('w')
ylabel('Group Delay (samples)')
xlim([0 pi])

%pole-zero plot
[zLoc,pLoc,~] = zplane(K);
figure
subplot(2,1,1)
zplane(zLoc,pLoc)
title('Kaiser')

% impulse response
subplot(2,1,2)
stem(b)
title('Kaiser Impulse Response')

%% sound
sound(K.filter(noisy),44100) % test different filters (not B1 or B2!!)