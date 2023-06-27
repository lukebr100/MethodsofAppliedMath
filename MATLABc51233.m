k1 = 8;
k2 = 8;
k3 = 8;

A = [zeros(3, 3) eye(3); -8 4 0 -k1 0 0; 4 -8 4 0 -k2 0; 0 4 -8 0 0 -k3];
        x_o = transpose([0 0 0 0 0 0]);
        [V, D] = eig(A);
        b = transpose([0 0 0 -1 -2 -3]);
        z = (A)^(- 1) * b;
        c = V^(-1) * (x_o - z);
        t = linspace(0, 20);
        x = z * ones(size(t));
        for j = 1:6
            x = x + V(:, j) * exp(t * D(j, j)) * c(j);
        end
x = real(x);
figure
p = plot(t, x(1, :), t, x(2, :), t, x(3, :))
xlabel('time')
ylabel('distance from initial position')
yline(0.625, '--', 'equilibrium 1')
yline(1, '--', 'equilibrium 2')
yline(0.875, '--', 'equilibrium 3')
legend('cart 1', 'cart 2', 'cart 3')
legend('Location','southeast')
ylim([0 1.2])
title('overdamped system')