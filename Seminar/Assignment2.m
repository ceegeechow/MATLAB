%Camille Chow
%MATLAB Section A
%Assignment 2

%Part 1 - Vectors
%a)
a1 = linspace(0,1);
a = exp(a1)
%b)
trap1 = .01*trapz(a)
rect1 = .01*sum(a)
%c)
trap = .01*cumtrapz(a);
trap2 = trap(100)
rect = .01*cumsum(a);
rect2 = rect(100)
%d)
firstderiv = diff(a)/.01
length1 = length(firstderiv)
secondderiv = diff(firstderiv)/.01
length2 = length(secondderiv)
%e)
b = [0 1 2 3 4 5];
shifted = circshift(b,3)

%Part2 - Array Forray
%a)
A1 = (1:1:100);
A = reshape(A1,10,10)
%b)
B = magic(10)
d = diag(B);
C = diag(d)
%c)
col2 = flipud(B(1:10,2));
B(1:10,2) = col2
%d)
A = fliplr(A)
%e)
cSum = sum(A*B, 1)
%f)
cMean = mean(A.*B, 2)
%g)
A = [A(1,1:9);A(2,1:9);A(3,1:9);A(4,1:9);A(5,1:9);A(6,1:9);A(7,1:9);A(8,1:9);A(9,1:9);A(10,1:9)]

%Part 3 - Gotta Go Fast
%a)
tic;
A2 = [];
for i = 1:300
    for j = 1:500
        A2(i,j) = (i^2 + j^2)/(i + j + 3);
    end
end
elapsed1 = toc;
%b)
tic;
B2 = zeros(300,500);
for i = 1:300
    for j = 1:500
        B2(i,j) = (i^2 + j^2)/(i + j + 3);
    end
end
elapsed2 = toc;
%c)
tic;
[X,Y] = meshgrid(1:500,1:300);
C2 = (Y.^2 + X.^2)./(Y + X + 3);
elapsed3 = toc;
T = table(elapsed1, elapsed2, elapsed3)