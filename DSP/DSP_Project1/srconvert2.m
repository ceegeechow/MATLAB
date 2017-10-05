function y = srconvert2(in)
%upsampling filters
Hd2 = getFilterFIR(2);
Hd5 = getFilterFIR(5);
%downsampling filters
Hd3 = getFilterFIR(3);
Hd7 = getFilterFIR(7);

%upsample and filter by 2 six times
for i = 1:6
    in = upsample(in,2);
    in = filter(Hd2,in);
end  
%upsample and filter by 5 once
in = upsample(in,5);
in = filter(Hd5,in);

%downsample and filter by 3 once
in = filter(Hd3,in);
in = downsample(in,3);
%downsample and filter by 7 twice
for i = 1:2
    in = filter(Hd7,in);
    in = downsample(in,7);
end

y = 1000*in;