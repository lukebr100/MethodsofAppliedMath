k = 0; %k is zero
A = [0, 1; -16, -k]; %matrix 
        x_o = [0; 0]; %intial condition
        [V, D] = eig(A); %matrix of e-vectors and diagonalization
        b = [0; -12]; %forcing function
        z = (A)^(- 1) * b; %calc z
        c = V^(-1) * (x_o -z); %calc c
        t = linspace(0, 5); %initialize time
        x = z * ones(size(t)); %intial solution
        for j = 1:2
            x = x + V(:, j) * exp(t * D(j, j)) * c(j); % the money
        end
    
p = plot(t, x(1, :)) %plot
yline(3/4, '--')
legend('k = 0')
xlabel('time')
ylabel('distance')
