function a = changeSign(vec)
    shift = [0 vec(1:length(vec) - 1)];
    test = ((vec < 0)&(shift>0))|((vec > 0)&(shift<0));
    a = find(test);
end