function y = srconvert_bad(in)
%[x,Fs] = audioread(in);

%upsample input
w1 = upsample(in,320);

%pass through filter
Hd = getFilter(320);
%impulse response of filter
%impulse = [1 zeros(1,10000)];
%h = filter(Hd,impulse);
tic;
w2 = filter(Hd,w1);

%downsample
y = 1000*downsample(w2,147);

toc