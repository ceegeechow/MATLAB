function Hd = getFilterFIR(a)

Fpass = 1/a;  % Passband Frequency
Fstop = 1.2/a;  % Stopband Frequency
Apass = 0.04;  % Passband Ripple (dB)
Astop = 81;    % Stopband Attenuation (dB)

h = fdesign.lowpass('fp,fst,ap,ast', Fpass, Fstop, Apass, Astop);

Hd = design(h, 'equiripple', 'MinOrder', 'any', 'StopbandShape', 'flat');


