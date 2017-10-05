%Camille Chow
%Signals PSET 2
%2/21/17

%3d - convolve
x = [0 -1 2 3 5];
h = [2 -1 3 1 4];
y = conv(x,h);

figure;
stem(y)
xticklabels({'-4','-3','-2','-1','0', '1','2','3','4'})
ylabel('y')
xlabel('n')

%5 - Noble Identities for Multirate Processing
%b
g = [2 1 3 4];
h = ups(g,4);
x = randi([-2,2],1,10);

figure;
subplot(3,1,1)
stem(g)
ylabel('g')
xlabel('n')
xticks(1:1:4)
xticklabels({'0','1','2','3'})

subplot(3,1,2)
stem(h)
ylabel('h')
xlabel('n')
xticklabels({'0','2','4','6','8','10','12','14','16'})

subplot(3,1,3)
stem(x)
ylabel('x')
xlabel('n')
xticklabels({'0','1','2','3','4','5','6','7','8','9'})

%c
a = dec(ups(x,4),4);
b = ups(dec(x,4),4);

figure;
subplot(2,1,1)
stem(a)
title('Dec(Ups(x))');
xticklabels({'0','1','2','3','4','5','6','7','8','9'})

subplot(2,1,2)
stem(b)
title('Ups(Dec(x))');
xticklabels({'0','1','2','3','4','5','6','7','8','9'})

%d
d1 = dec(conv(h,x),4);
d2 = conv(g,dec(x,4));

figure;
subplot(2,1,1)
stem(d1)
title('d1');
xticklabels({'0','1','2','3','4','5','6','7','8','9'})

subplot(2,1,2)
stem(d2)
title('d2');
xticklabels({'0','1','2','3','4','5','6','7','8','9'})

%e
u1 = conv(h,ups(x,4));
u2 = ups(conv(g,x),4);

figure;
subplot(2,1,1)
stem(u1)
title('u1');
xticklabels({'0','1','2','3','4','5','6','7','8','9'})

subplot(2,1,2)
stem(u2)
title('u2');
xticklabels({'0','1','2','3','4','5','6','7','8','9'})