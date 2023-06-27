function[p, fs] = fourier_calculation(f, n) %inputs: f function_handle, n natural number;
                                            %outputs: p, plot of f_periodic
                                            %along with fourier series on [-3pi, 3pi]
                                            %fs, the formula for the fs of f
                                          
    a_o = 1 / (2*pi) * integral(@(x) f(x), -pi, pi); %calculate a_o
    if abs(a_o) <= 10^(-14) %this is to avoid terms accumulating that should be zero, 
            a_o = 0;        %but are not due to integral funct being an approx.
    end 

    a_k = cell(1, n); %initialize coeffs
    b_k = cell(1, n);
    sin_kx = cell(1, n); % sin_kx =(will be) b_k * sin(k * x)
    cos_kx = cell(1, n); % cos_kx =(will be) a_k * cos(k * x)
    syms y %intialize symbolic y

    for k = 1:n %for as many terms as the user wishes calculate the coeffs
        % a_k, b_k as well as the product a_k, b_k with cos(k*x), sin(k*x)
        a_k{k} = 1 / pi * integral(@(x) f(x) .* cos(k * x), -pi, pi);
        if abs(a_k{k}) <= 10^(-14) %this is to avoid terms accumulating that should be zero, 
            a_k{k} = 0;            %but are not due to integral funct being an approx.
        end                        %without these three lines FS for odd functiond accumulates cos terms 
        cos_kx{k}(y) = a_k{k} .* cos(k * y);

        b_k{k} = 1 / pi * integral(@(x) f(x) .* sin(k * x), -pi, pi);
        if abs(b_k{k}) <= 10^(-14) %this is to avoid terms accumulating that should be zero, 
            b_k{k} = 0;            %but are not due to integral funct being an approx.
        end  
        
        sin_kx{k}(y) = b_k{k} .* sin(k * y);
        
    end
fsum = sum([cos_kx{1, :}] + [sin_kx{1, :}]); %add summation terms 

n = 200; %for linspace number of partitions

x_l = linspace(-3*pi, -pi, n); %intervals 
x_m = linspace(-pi, pi, n);
x_r = linspace(pi, 3*pi, n);
x = linspace(-3*pi, 3*pi, n);
g = @(x) x + 2 * pi; %for shifting f(x)
h = @(x) x - 2 * pi; %to form f_periodic
f_l = @(x) f(g(x)); %compose with f
f_r = @(x) f(h(x));%to do this
fs = a_o + fsum; %finally form the nth partial fourier sum


figure %plot
 p = plot(x_l, f_l(x_l), 'red', ... 
     x_m, f(x_m), 'red',...
     x_r, f_r(x_r), 'red', ...
     x, fs(x), 'black');
 p(4).LineStyle = '--'; 
 p(4).LineWidth = 1;
 legend('f periodic', '', '', 'Fourier Series')
 legend('Location', 'best')
 title('f periodic and fourier series')
 xlabel('x')
 ylabel('y')
end

