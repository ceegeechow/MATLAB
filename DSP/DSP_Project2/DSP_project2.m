%DSP Project 2
%Camille Chow
%11/13/17

%specs
fs = 44100;
Wp = 2500/fs;
Ws = 4000/fs;
Rp = 3;
Rs = 55;
%get butterworth order/coefficients
[nb,Wnb] = buttord(Wp,Ws,Rp,Rs);
[b1,a1] = butter(nb,Wnb);
%butterworth filters
Butter1 = dfilt.df1(b1,a1);
Butter2 = dfilt.df2(b1,a1);
Butter3 = convert(Butter1,'df2sos');
Butter4 = convert(Butter1,'df2tsos');
%get elliptic order/coefficients
[ne,Wne] = ellipord(Wp,Ws,Rp,Rs);
[b2,a2] = ellip(ne,Rp,Rs,Wp);
%elliptic filters
Ellip1 = dfilt.df1(b1,a1);
Ellip2 = dfilt.df2(b1,a1);
Ellip3 = convert(Ellip1,'df2sos');
Ellip4 = convert(Ellip1,'df2tsos');

%frequency response/group delay plots
[hb,wb1] = freqz(Butter1);
[gdb,wb2] = grpdelay(Butter1);
figure
subplot(2,1,1)
plot(wb1,abs(hb))
subplot(2,1,2)
plot(wb2,gdb)

[zLoc,pLoc,tLoc] = zplane(Butter1);
figure
zplane(zLoc,pLoc)



cleared = filter(Ellip1,noisy);
sound(100*cleared,44100)