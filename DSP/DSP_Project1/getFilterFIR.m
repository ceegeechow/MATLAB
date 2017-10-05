function Hd = getFilterFIR(a)
%GETFILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.1 and the DSP System Toolbox 9.3.
% Generated on: 02-Oct-2017 17:14:44

Fpass = 1/a;  % Passband Frequency
Fstop = 1.2/a;  % Stopband Frequency
Apass = 0.01;  % Passband Ripple (dB)
Astop = 82;    % Stopband Attenuation (dB)

h = fdesign.lowpass('fp,fst,ap,ast', Fpass, Fstop, Apass, Astop);

Hd = design(h, 'equiripple', ...
    'MinOrder', 'any', ...
    'StopbandShape', 'flat');

