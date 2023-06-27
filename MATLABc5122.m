x_plot = zeros(8, 16); %initialize solution
for k = 2:4:14
        A = [0, 1; -16, -k]; %matrix
        x_o = [0; 0]; %initial condition
        [V, D] = eig(A); %matrix of e-vectors and diagonalization
        b = [0; -12]; %forcing function
        z = (A)^(- 1) * b; %calculate z
        c = V^(-1) * (x_o -z); %calculate c
        t = 0:0.2:3; %time
        x = z * ones(size(t)); %initialize x
        for j = 1:2
            x = x + V(:, j) * exp(t * D(j, j)) * c(j); %the money
        end
    x_plot((k / 2), :) = x(1, :); %store solution
    x_plot((k / 2) + 1, :) = x(2, :); %store solution
end
p = plot(t, x_plot(1, :), t, x_plot(3, :), t, x_plot(5, :), t, x_plot(7, :)) %plot
yline(3/4, '--')
legend('k = 2', 'k = 6', 'k = 10', 'k = 14')
xlabel('time')
ylabel('distance')
