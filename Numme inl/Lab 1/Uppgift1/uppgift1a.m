format long

x = [-3:0.001:3];
y = x.^2-3.*sin(3.*x+2) - 1;

plot(x,y);
hold;
grid on;
xlabel('x-axis');
ylabel('y-axis');
xline(0,'r');
yline(0,'r');
