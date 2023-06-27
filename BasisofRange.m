function[B, t] = BasisOfRange(A)
    A = A;
    Arref = rref(A);
    m = size(A, 1);
    n = size(A, 2);
    H = zeros(m, n);
    r = rank(A);
    count = 0;
    for i = 1:m
        for j = 1:n
           if Arref(i, j) ~= 0 %if we are in a pivot position
               count = count + 1; %add to count. will give us rank
               H(i, j) = 1; %indicates pivot position of A in matrix H
               break
           end
        end
    end
    H; %Dirdac delta matrix
    B = zeros(m, count);
    count1 = 0;
    for i = 1:m
        for j = 1:n
           if H(i, j) == 1
               count1 = count1 + 1;
               B(1:m, count1) = A(1:m, j); %BasisofRangeMatrix this is the set basis column vectors of A
               break
           end
        end
    end
    if count == r
        t = 1; %count is the same as rank == 1
        count; %print rank
    end
end