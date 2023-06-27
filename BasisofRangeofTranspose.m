function[C, t] = BasisofRangeofTranspose(A)
    A = A; %store A
    Arref = rref(A); %row reduce A
    m = size(A, 1); %rows of A
    n = size(A, 2); %columns of A
    H = zeros(m, n); %initalize dirdac delta matric
    r = rank(A); %feel like using the rank is cheating, 
    count = 0; %will use count instead of rank function
    for i = 1:m
        for j = 1:n
           if Arref(i, j) ~= 0 %pivotposition
               count = count + 1; %addtocount
               H(i, j) = 1;
               break
           end
        end
    end
    H; %Dirdac delta matrix
    C = zeros(n, m - count);
    for i = 1:m
        for j = 1:n
           if H(i, j) == 1
               C(1:n, i) = Arref(i, 1:n); %BasisofRangeofTransposeMatrix this is the set nonzero row vectors of A 
               break
           end
        end
    end
    if count == r %tests whether the count is the rank
        t = 1; %proof the count is the rank
        count; %print rank
    end
end