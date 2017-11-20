%Camille Chow
%ECE300 PSET3
%11/2/17

%Question 4 part f
p = .001:.001:.499;
s = size(p);

f1 = @(PI,p) log((1 - PI - 2*p + 3*PI.*p)./(PI + 2*p - 3*PI.*p)).*(1 - 3*p)...
    + p.*log(p) + (1-p)*log(1-p) - 2*p.*log(2*p) - (1 - 2*p).*log(1 - 2*p);

pis = zeros(1,s(1,2));
for i = 1:s(1,2)
    f2 = @(x) f1(x,p(1,i));
    pis(1,i) = fzero(f2,.3);
end

figure
subplot(2,1,1)
plot(p,pis)
xlabel('p')
ylabel('pi_0')
title('Optimal Pi_0 versus p')

I = @(PI,p) -(PI + 2*p - 3*PI.*p).*log(PI + 2*p - 3*PI.*p) ...
    - (1 - PI - 2*p + 3*PI.*p).*log(1 - PI - 2*p + 3*PI.*p) ...
    + PI.*(p.*log(p) + (1-p).*log(1-p)) ...
    + (1 - PI).*(2*p.*log(2*p) + (1 - 2*p).*log(1 - 2*p));
C = I(pis,p);
C = C/log(2);

subplot(2,1,2)
plot(p,C)
xlabel('p')
ylabel('Channel capacity (bits)')
title('Channel capacity versus p')

%Question 5
sigmas = [1 .8 .1 .01];
lambda1 = .9;
lambda2 = .005;
D1 = zeros(1,4);
R1 = zeros(1,4);
D2 = zeros(1,4);
R2 = zeros(1,4);
D3 = zeros(1,4);
R3 = zeros(1,4);
Rmax = 100;
Rmin = 0;
while (Rmax > 5) || (Rmin <= 4.9)
    lambda3 = (lambda1 + lambda2)/2;
    for i = 1:4
        if sigmas(1,i) > lambda1
            D1(1,i) = lambda1;
            R1(1,i) = .5*log2(sigmas(1,i)/D1(1,i));
        else
            D1(1,i) = sigmas(1,i);
            R1(1,i) = 0;
        end
        if sigmas(1,i) > lambda2
            D2(1,i) = lambda2;
            R2(1,i) = .5*log2(sigmas(1,i)/D2(1,i));
        else
            D2(1,i) = sigmas(1,i);
            R2(1,i) = 0;
        end
        if sigmas(1,i) > lambda3
            D3(1,i) = lambda3;
            R3(1,i) = .5*log2(sigmas(1,i)/D3(1,i));
        else
            D3(1,i) = sigmas(1,i);
            R3(1,i) = 0;
        end
    end
    Rmax = sum(R2);
    Rmin = sum(R1);
    r = sum(R3);
    if (r > Rmin) && (r < 5)
        lambda1 = lambda3;
        Rmin = r;
    elseif (r < Rmax) && (r >= 5)
        lambda2 = lambda3;
        Rmax = r;
    end    
end

lambda3 %optimal lambda
sum(R3) %rate
sum(D3) %distortion
