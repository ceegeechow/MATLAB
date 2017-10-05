function [val,ind] = findClosest(x,desiredValue)
    y = x(:);
    error = abs(y - desiredValue);
    l = (error == min(error));
    ind = find(l);
    val = y(ind);
end