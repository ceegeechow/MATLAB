function out = gramSchmidt(in)
    out = zeros(size(in));
    for i = 1:size(in,2)
        u = in(:,i);
        x = u;
        for j = 1:i-1
            v = out(:,j);           
            x = x - dot(v,u).*v;
        end
        out(:,i) = x./norm(x);           
    end
end