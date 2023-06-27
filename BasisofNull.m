function[N] = BasisofNull(A)

%sets all variables needed to calc null space
    A = rref(A);
    r = rank(A);
    N = zeros(size(A,2),size(A,2)-r);
    f = zeros(size(A,2),1);
    b = zeros(size(A,2),1);
    count = 1;
 %This loop puts the indicie of the basic variables in the vector b
        for i = 1:size(A, 1)
        for j = 1:size(A, 2)
            
            if A(i,j) ~= 0  
             b(j,1) = j;
                count = count + 1;   
                break
            end
        end
        end
  %This loop checks which row of b has a zero and if it does it fills f
  %with the indicie which is the indicie of the free variables.
  
        for i = 1:size(A,2)
            if b(i,1)  == 0
          
                f(i,1) = i;
            end
        end
      
        %set a counter to be independent of loop iteration, this loop
        %checks if f at the iteration is equal to the indicie. The row of
        %the Null space matrix indicates the variables so the rows of the
        %free variables must be I.
        count = 1;
        for i = 1:size(A,2)
            for j = 1:(size(A,2)-r)
             
                 if f(i) == i
                  N(f(i),count) = 1;
                  count = count + 1;
                  break
                 end
            end
            
        end

        %used to eliminate the zeros in the origianl b and f vectors to
        %help with the iterations
        t = find(f,size(A,2)-r);
        q = find(b,r);
        
        %loop that fills the Null space matrix with the rows of the q
        %vector.
      for i = 1:r
          for k = 1:(size(A,2)-r)  
               
             N(q(i),k) = -(A(i,t(k))*N(t(k),k));
            
          end
      end
      
end