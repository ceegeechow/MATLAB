function y = invSTFT(s)
%compute size of output matrix
sz = size(s);
n = sz(2);
m = 128*(n+1);
inv = zeros(n,m);

%compute ifft's
for i = 1:n
    r = ifft(s(:,i));
    a = 128*(i-1) + 1;
    b = a + 256;
    inv(i,a:b) = (r(1:257,1)).';
end
y = sum(inv);
y2 = y(129:length(y)-128);
y(129:length(y)-128) = y2/2;
y = real(y);
end