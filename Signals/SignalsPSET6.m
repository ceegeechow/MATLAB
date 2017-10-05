%Signals PSET 6
%Camille Chow
%4/10/17

%Question 1
%c)
A = [-.1 1; -.6 0];
B = [.28; .28];
C = [1 0];
D = [.2];
[NUM, DEN] = ss2tf(A, B, C, D)

%d)
A1 = A';
B1 = C';
C1 = B';
D1 = D';
[NUM1, DEN1] = ss2tf(A1, B1, C1, D1) %same result

%e)
NUM2 = [.2 .3 .4];
DEN2 = [1 .1 .6];
[A2, B2, C2, D2] = tf2ss(NUM2,DEN2) %returns realization of part d

%f)
T = [8 5; 3 2];
A3 = T*A*T';
B3 = T*B;
C3 = C*T';
D3 = D;

syms z;
H = C*inv(z*eye(2) - A)*B + D;
pretty(simplify(H)) %same result


%Question 3
A = [139.3 -263 -135; 83 -156.7 -80.4; -18 34 17.5];
%a)
E = eig(A)

%b)
syms z;
f = z*inv(z*eye(3) - A); %denominator: - 200*z^3 + 20*z^2 + 42*z - 9
[num,den] = numden(f);
roots = solve(den(1,1)) %roots: -.5, .3, .3
phi = iztrans(f);

%c)
N = 50;
x0 = [1;1;1];
X = zeros(3,50);
X(:,1) = x0;
for n = 2:50'
    X(:,n) = A*X(:,n-1);
end

%d)
x = mag2db(sqrt(sum(X.*X,1)));
stem(x)
title('x[n]');
xlabel('n')
ylabel('Magnitude (dB)')

norm(A); %382.7438
e = eig((A')*A); %two tiny e vals, one large (m)
m = sqrt(max(e)); %returns same value

%e)
Xq = zeros(3,5);
Xq(:,1) = x0;
for n = 2:5
    Xq(:,n) = A*Xq(:,n-1);
    for i = 1:3
        if (Xq(i,n) > 127)
            Xq(i,n) = 127;
        elseif (Xq(i,n)< -128)
            Xq(i,n) = -128;
        end
    end
end
Xq

%f)
% Because all of the eigenvalues of A have magnitude less than one, so the system must be
% BIBO stable, and therefore the graph of the impulse response must
% approach zero, giving a negative slope on a dB plot. This slope should be
% the decay constant associated with the dominant mode.

%g)
A50 = A^50;
phiN = double(subs(phi,'n',50));
max_error = max(max(abs(A50 - phiN)))

%h)
figure;
plot3(X(1,:),X(2,:),X(3,:))
title('x[n] (3D)');
xlabel('x component');
ylabel('y component');
zlabel('z component');