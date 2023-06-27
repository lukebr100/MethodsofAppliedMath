function[C, t] = BasisofNullSpace(A)
    A = A
    Arref = rref(A)
    m = size(A, 1)
    n = size(A, 2)
    H = zeros(m, n);
    r = rank(A)
    count = 0;
    for i = 1:m
        for j = 1:n
           if Arref(i, j) ~= 0 %pivotposition
               count = count + 1; %addtocount
               H(i, j) = 1;
               break
           end
        end
    end
    H %Dirdac delta matrix
    N = zeros(n, m - count)
    for i = 1:
        
    end
end