%Camille Chow
%MATLAB Section A
%Assignment 3

%Part 1 - Lunar Eclipse
A = true(100);
B = false(100);
[X,Y] = meshgrid(1:100,1:100);
A = A.*((sqrt((X-50).^2 + (Y-50).^2)) >= 20);
B = B + ((sqrt((X-40).^2 + (Y-40).^2)) < 20);

figure
imshow(A) %Black circle centered on the page
figure
imshow(B) %White circle off center
figure
imshow(A&B) %White crescent top left facing down
figure
imshow(A|B) %Black crescent centered facing up
figure
imshow(~(A&B)) %Black crescent top left facing down
figure
imshow(~(A|B)) %White crescent centered facing up

%Part 2 - Fun with find
testVec = sin(linspace(0,5,100)) + 1;
[a,b] = findClosest(testVec, 3/2)

%Part 3 - Sincing Ship
x = linspace(-2*pi,2*pi,10001);
y = sinc(x);
%find zeros
xCoords1 = changeSign(y);
xRoots = x(xCoords1);
yRoots = sinc(xCoords1);
%find extremum
dy = diff(y).*10001;
xCoords2 = changeSign(dy);
xMinMax = x(xCoords2);
yMinMax = sinc(xMinMax);

figure
plot(x,y,xRoots,yRoots,'ko',xMinMax,yMinMax,'r*')
