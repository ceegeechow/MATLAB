%Camille Chow
%MATLAB Section A
%Assignment 9

%% AWGN BPSK SNR BER
%a)
bpsk = rand(1,100000);
X = bpsk < .268;
bpsk(X) = -1;
Y = bpsk ~= -1;
bpsk(Y) = 1;
%b)
mag1 = 1/(10^(7/20));
awgn1 = mag1*randn(1,100000);
mag2 = 1/(10^(-3/20));
awgn2 = mag2*randn(1,100000);

noisy1 = bpsk + awgn1;
noisy2 = bpsk + awgn2;
%c)
figure
histogram(bpsk, 'Normalization','probability')
title('BPSK')
ylabel('probability')
figure
histogram(noisy1,50,'Normalization','probability')
title('AWGN 7dB')
ylabel('probability')
figure
histogram(noisy2,50,'Normalization','probability')
title('AWGN -3dB')
ylabel('probability')
%d)
X = noisy1 > 0;
noisy1(X) = 1;
Y = noisy1 ~= 1;
noisy1(Y) = -1;

X = noisy2 > 0;
noisy2(X) = 1;
Y = noisy2 ~= 1;
noisy2(Y) = -1;

BER1 = sum(abs(noisy1 - bpsk))./2./100000
BER2 = sum(abs(noisy2 - bpsk))./2./100000

%% A random walk in the park
%a)
rWalk1 = [1,51];
rWalk1(1) = 0;
for i = 2:50
    x = rand;
    if (x < .5)
        rWalk1(i) = rWalk1(i-1) + 1;
    else
        rWalk1(i) = rWalk1(i-1) - 1;
    end
end
%b)
figure
stem(rWalk1)
title('Random Walk 50%')
%c)
rWalk2 = [1,51];
rWalk2(1) = 0;
for i = 2:50
    x = rand;
    if (x < .75)
        rWalk2(i) = rWalk2(i-1) + 1;
    else
        rWalk2(i) = rWalk2(i-1) - 1;
    end
end
figure
stem(rWalk2)
title('Random Walk 75%') %values generally increase moreso than before
%d)
prob = [.5,0,.5];
x = prob;
for i = 1:50
    x = conv(x,prob);
end
figure
stem(-51:51,x)
title('Z domain representation')