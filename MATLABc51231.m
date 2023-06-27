k1 = 1; %intialize k's
k2 = 0;
k3 = 0;

A = [zeros(3, 3) eye(3); -8 4 0 -k1 0 0; 4 -8 4 0 -k2 0; 0 4 -8 0 0 -k3]; %intialize A
        x_o = transpose([0 0 0 0 0 0]); %intial condition
        [V, D] = eig(A); %matrix of e-vectors and diagonalization
        b = transpose([0 0 0 -1 -2 -3]); %forcing function
        z = (A)^(- 1) * b; %calc z
        c = V^(-1) * (x_o - z); %calc c
        t = linspace(0, 20); %intialize time
        x = z * ones(size(t)); %intialize solution
        for j = 1:6
            x = x + V(:, j) * exp(t * D(j, j)) * c(j); %the money
        end
x = real(x);
figure
p = plot(t, x(1, :), t, x(2, :), t, x(3, :)) %plot
xlabel('time')
ylabel('distance from initial position')
yline(0.625, '--', 'equilibrium 1')
yline(1, '--', 'equilibrium 2')
yline(0.875, '--', 'equilibrium 3')
legend('cart 1', 'cart 2', 'cart 3')
legend('Location','southeast')
ylim([0 2])
title('underdamped system')