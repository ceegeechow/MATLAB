%Camille Chow
%ECE-310-B
%Sampling Rate Conversion Project
%10/9/17

[x,Fs] = audioread('Wagner.wav');
y = srconvert(x);
sound(y,24000)

impulse = [1 zeros(1,3000)];
h = srconvert(impulse);
verify(h)