function y = invSTFT(s)
%compute size of output matrix
[~,n] = size(s);
m = 128*(n+1);
inv = zeros(n,m);
%compute ifft's
for i = 1:n
    r = ifft(s(:,i),1024);
    a = 128*(i-1) + 1;
    b = a + 255;
    inv(i,a:b) = (r(1:256,1)).';
end
%take avgerage of the estimates
y = sum(inv);
y2 = y(129:length(y)-128);
y(129:length(y)-128) = y2/2;
y = real(y);
end