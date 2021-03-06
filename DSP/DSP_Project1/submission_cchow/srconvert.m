function y = srconvert(in)

%make sure input is row vector
s = size(in);
if s(2) == 1
    in = in.';
end

%upsampling filters
Hd2 = getFilterFIR(2);
Hd5 = getFilterFIR(5);

%impulse responses
impulse = [1 zeros(1,3000)];
h2 = filter(Hd2,impulse);
h5 = filter(Hd5,impulse);

%polyphase matrices
E2 = poly1(h2,2);
E5 = poly1(h5,5);

tic; %start timing

%filter signal through each row of E2, then upsample by 2, delay,
%and sum components
for i = 1:6
    s = size(upsample(in,2));
    w2 = zeros(2,s(2));
    for j = 1:2
        w2(j,:) = circshift(upsample(fftfilt(E2(j,:),in),2),j-1);
    end
    in = sum(w2);
end
%filter through E5, upsample, delay, and sum
s = size(upsample(in,5));
w5 = zeros(5,s(2));
for i = 1:5
    w5(i,:) = circshift(upsample(fftfilt(E5(i,:),in),5),i-1);
end
in = sum(w5);

%downsample
in = downsample(in,147);

toc %end timing

%magnify signal to account for attenuation
y = 1000*in;