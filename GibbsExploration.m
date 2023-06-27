function[t] = GibbsExploration(n)

f = @(x)pi/4.*(x>0)-pi/4.*(x<0); %square wave

h = @(x) x - 2 * pi; %shift 2*pi right 
f_r = @(x) f(h(x)); %f is shifted

f_jump = abs(f(pi) - f_r(pi)); %mag of jump
if f_jump == 0 %there is not jump
    error("continuous function do not exhibit Gibb's phenomenon") %Gibbs doesnt happen
end

jump_bd = 0.09 * f_jump; %jump times nine percent

x = linspace(pi / 2, 3 * pi /2, 2000); %intialize domain to find max on

[p, fs] = fourier_calculation(f, n); %calculate sequence of partial fourier sums(plot output too)
[~, where] = max(fs(x)); %store max location
syms y;
mux = eval(subs(fs, y, x(where))) ;
overshoot = abs(mux - f(pi));  %magitude of overshoot,
    if overshoot >= jump_bd
       t = 1 %stores 1 in t when overshoot is greater than about 9% of 1/2 the jump
        p
        hold on
        plot(x(where), fs(x(where)), 'o', ...
            x(where) - 2*pi, fs(x(where)), 'o', ...
            x(where) + 2*pi, fs(x(where)), 'o') %plot max of FS
        hold off
       disp("Gibb's holds") %should always happen
    else
        disp("Gibb's fails-contradiction") %should never happen
        t = 0
    end
end