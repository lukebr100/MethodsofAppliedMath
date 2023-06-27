function[P, Q, RN] = RankNormalForm(A)
m = size(A,1); %rows of A
n = size(A,2); %cols of A

Im = eye(m); %m x m id matrix
In = eye(n); %n x n id matrix

C = [A Im]; %Block matrix m x (n + m)to find P
D = [rref(A); In]; %Block matrix (n + m) x n to find Q
rrefC = rref(C); %GE on C
D = transpose(D);   
D = rref(D); %row reduce transpose -> column reduce the matrix
D = transpose(D); %column reduced B


Q = D((m + 1):end,:); 
P = rrefC(:, n + 1:end); 
RN = P*A*Q; %rank normal
end