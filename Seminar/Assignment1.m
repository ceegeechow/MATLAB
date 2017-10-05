%Camille Chow
%MATLAB Section A
%Assignment 1

%Part 1 - Creating Scalar Variables
a = 5.7*pi/6.9;
b = 239 + exp(5) - 2.5e23;
c = log(4.23)*asin(.7);
z = (3 + 2j)*(4 + 5j);

%Part 2 - Complex Operations
r = real(z);
i = imag(z);
p = angle(z);
C = conj(z);

%Part 3 - Vector and Matrix Variables
aVec = [3.14 15 9 26 + .1j];
A1 = repmat(aVec,3,1);
A2 = [aVec;aVec;aVec];
bVec1 = [3.14; 15; 9; 26 + .1j;];
bVec2 = aVec.';
cVec = (-5:.1:5);
dVec = linspace(-5,5).';
B = [1+2j 1e-5;exp(2*pi)*1j 3+4j];
%F = eye(1000000);
G = speye(1000000);

%Part 4 - Vector and Matrix Operations
A = magic(5)/65;
B = randn(5);
C = B*A;
D = B.*A;
F = A*A*A/4 + A*A/4 + A/3 + eye(5)/6;
G = inv(A);
