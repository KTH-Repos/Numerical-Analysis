% Sekantmetoden: x(n+1) = x(n) - f(x(n))*((x(n)-x(n-1))/(f(x(n))-f(x(n-1))))
%M = 1.05 * 10^4;
% max(u) - M = 0

%Vi får: 40.869645173246610

clear
format long
clc

x0 = 30;
x1 = 50;
M = 1.05 * 10^4;

iter = 0;
while abs(x1 - x0) >= 1e-5 && iter < 500
    f0 = max(generator(x0,0)) - M;
    f1 = max(generator(x1,0)) - M;
    iter = iter + 1;
    x = x0 - f0*(x1-x0)/(f1-f0)
    x0 = x1;
    x1 = x;
end
iter