%Camille Chow
%ECE300 PSET5
%11/30/17

% Question 3 part g
G = [0 1 1 1 0 1 1; 1 0 0 1 1 1 1; 0 0 1 1 1 0 1];
Gs = [1 0 0 1 1 1 1; 0 1 0 0 1 1 0; 0 0 1 1 1 0 1];
H = [1 0 1 1 0 0 0; 1 1 1 0 1 0 0; 1 1 0 0 0 1 0; 1 0 1 0 0 0 1];
mod(G*(H.'),2) %all zeros
mod(Gs*(H.'),2) %all zeros