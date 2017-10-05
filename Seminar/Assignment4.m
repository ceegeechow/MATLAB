%Camille Chow
%MATLAB Section A
%Assignment 4

%Part d
%Test Case 1: More elements in each vector than the # of vectors
A = rand(6,4)
a = gramSchmidt(A)
isOrthonormal(a)
v1 = rand(6,1)
p1 = orthProj(v1,a)
error1 = abs(v1 - p1)

%Test Case 2: Same # of elements in each vector as the # of vectors
B = rand(4,4)
b = gramSchmidt(B)
isOrthonormal(b)
v2 = rand(4,1)
p2 = orthProj(v2,b)
error2 = abs(v2 - p2)

%Part e
x = linspace(0,2*pi);
y = sin(x);
[X, MU] = ndgrid(x,[0 pi/2 pi 3*pi/2 2*pi]);
G = exp(-(X-MU).^2)/sqrt(2*pi);
figure
plot(x,y,x,G)
xlabel('x');
ylabel('y');
title('Sine and Gaussians');
legend('Sine','Gauss1','Gauss2','Gauss3','Gauss4','Gauss5')
g = gramSchmidt(G);
Y = orthProj(y,g);
figure
subplot(2,1,1)
plot(x,y,x,Y)
xlabel('x');
ylabel('y');
title('Sine and Approximation');
legend('Sine','Approximation');

subplot(2,1,2)
plot(x,g)
xlabel('x');
ylabel('y');
title('Orthonormal Basis Functions');