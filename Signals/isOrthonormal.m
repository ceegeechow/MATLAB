function a = isOrthonormal(vecs)
    a = 1;
    if rank(vecs) ~= size(vecs,2)
        a = 0;
    else
        for i = 1:size(vecs,2)
            if (abs(norm(vecs(:,i))-1) > eps)
                a = 0;
                break
            end
        end
    end
end