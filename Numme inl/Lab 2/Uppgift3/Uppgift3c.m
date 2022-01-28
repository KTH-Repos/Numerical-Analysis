clear all
format long g
clc;

s = 2;
B = 1;
the = 40;

f=@(x)exp(-B*x.^2);

a = -s; %lower
b = s; %upper

h = 0.00001;    %ÄNDRA STEGLÄNGD
n=(b-a)/h;

h=(b-a)/n; xi=a:h:b;
namnare = h/3*(f(xi(1))+4*sum(f(xi(2:2:end-1)))+2*sum(f(xi(3:2:end-2)))+f(xi(end)))

g=@(t)exp(-B*t.^2)*max(generator(the+t,0));
a = -s; %lower
b = s; %upper

h = 1;    %ÄNDRA STEGLÄNGD
n=(b-a)/h;

h=(b-a)/n; xi=a:h:b;
taljare = h/3*(g(xi(1))+4*sum(g(xi(2:2:end-1)))+2*sum(g(xi(3:2:end-2)))+g(xi(end)))

m = taljare/namnare
