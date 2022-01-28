clear all
format long
clc;

h = [0.0625, 0.125, 0.25, 0.5, 1];

felSimpsons = [0.000000 0.000000 0.000007 0.000099 0.001133];
loglog(h,felSimpsons)
grid on
hold on


xlabel('h')
ylabel('fel')

felTrapets = [0.000069 0.000275 0.001099 0.004374 0.017196];
loglog(h,felTrapets)

x = logspace(-1,2,20);
y = x.^2;
loglog(x,y)

x = logspace(-1,2,20);
y = x.^4;
loglog(x,y)

legend({'fel Simpsons','fel Trapets', 'y = x^2', 'y = x^4'})