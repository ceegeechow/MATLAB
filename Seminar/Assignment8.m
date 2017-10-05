%Camille Chow
%MATLAB Section A
%Assignment 8

%Question 1 - Hald on!

load hald
params1 = ingredients\heat;
mse1 = sumsqr((ingredients * params1)-heat)
params2 = lasso(ingredients, heat, 'Lambda', 0.001);
mse2 = sumsqr((ingredients * params2)-heat)

load polydata
X = fliplr(vander(x1));
X = X(:,1:4);
Y = y1';
params = X\Y;
mse3 = sumsqr(X*params-Y)

%Question 2 - Girl look at that Bode!
syms t
f = t^5*exp(-2*t)*sin(5*t) + t^3*exp(-3*t)*cos(4*t);
L = laplace(f);

[N,D] = numden(L);
numCoeffs = double(coeffs(N));
denCoeffs = double(coeffs(D));

figure
bode(tf(numCoeffs,denCoeffs))
grid on
%The spacing of the grid decreases to the right because the x axis is
%logarithmic