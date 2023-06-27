function[B] = BasisOfNullSpaceOfTranspose(A)
    m = size(A, 1);
    n = size(A, 2);
    r = rank(A);
    I = eye(m);
    C = [A I];
    rrefC = rref(C);
    B = zeros(size(A,1)-r,size(A,1)-r);
    P = zeros(m, m);
    for i = 1:m            %stores P, which is the matrix formed from row reducing Im
        for j = 1:m
            P(i,j) = C(i, j + m);
        end
    end

    for i = 1:m        %last m-r rows form a basis of left hand null space
        for j = 1:m - r
            B(j,i) = P(j+r,i);
        end
    end
end