y = 0
syms x
for n = 1:10
    y = y + -4/(2*n-1)^2 * cos(n*x) - 2*pi*(-1)^n/n * sin(n*x);
end


pi/4 + 1/(2*pi) * y
x = linspace(-pi, pi);
subs(pi/4 + 1/(2*pi) * y, x)
plot(x,  pi/4 + 1/(2*pi) * y)