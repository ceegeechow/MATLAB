function y = srconvert(in)
%[x,Fs] = audioread(in);

%upsample input
w1 = upsample(in,320);

%pass through filter
Hd = getFilter;
%impulse response of filter
%impulse = [1 zeros(1,10000)];
%h = filter(Hd,impulse);
w2 = filter(Hd,w1);

%downsample
y = downsample(w2,147);