clear all
format long
clc;

X = [-1:0.0001:1];
Y = sqrt(X+2);

f=@(x)sqrt(x+2);

area = trapz(X,Y);

a = -1; %lower
b = 1; %upper

h = 0.0625;    %ÄNDRA STEGLÄNGD
n=(b-a)/h;

h=(b-a)/n; xi=a:h:b;
I= h/3*(f(xi(1))+4*sum(f(xi(2:2:end-1)))+2*sum(f(xi(3:2:end-2)))+f(xi(end)));
fprintf('\nValue: %f',I); 

svar2=abs(I-area);
fprintf('\nFel: %f',svar2); 