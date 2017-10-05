function proj = orthProj(v,A)
    proj = zeros(size(A,1),1);
    for i = 1:size(A,2)
        u = A(:,i);
        proj = proj + (dot(v,u)/norm(u))*u;
    end
end