function y = srconvert2(in)
%upsampling filters
Hd2 = getFilterFIR(2);
Hd5 = getFilterFIR(5);
%downsampling filters
Hd3 = getFilterFIR(3);
Hd7 = getFilterFIR(7);
tic;
%upsample and filter by 2 six times
for i = 1:6
    in = upsample(in,2);
    in = filter(Hd2,in);
end  
%upsample and filter by 5 once
in = upsample(in,5);
in = filter(Hd5,in);

in = downsample(in,147);

toc

y = 1000*in;