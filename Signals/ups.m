%Camille Chow (collaborated with George Ho)
%Signals PSET 2
%2/21/17
function u = ups(x, M)
    s = length(x)*M - M + 1;
    u = zeros(1,s);
    u(1:M:end) = x;
end