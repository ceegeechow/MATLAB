[x,Fs] = audioread('Wagner.wav');
y = srconvert3(x);
sound(y,24000)

impulse = [1 zeros(1,3000)];
h = srconvert3(impulse);
verify(h)