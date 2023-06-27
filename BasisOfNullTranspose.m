function[B] = BasisOfNullTranspose(A)
r = rank(A);
Im = eye(size(A,1));
B = zeros(size(A,1)-r,size(A,1)-r);
C = [A,Im];         %initializes an augmented matrix.
C = rref(C);        
P = zeros(size(A,1),size(A,1));     %row reducing C gives a matrix P whose m - r rows form a basis for left null space 

for i = 1:size(A,1)             %stores P, which is the matrix formed from row reducing Im
    for j = 1:size(A,1)
        P(i,j) = C(i,j+size(A,2));
    end
end


for i = 1:size(A,1)         %last m-r rows form a basis of left hand null space
    for j = 1:size(A,1)-r
        B(j,i) = P(j+r,i);
    end
end
end