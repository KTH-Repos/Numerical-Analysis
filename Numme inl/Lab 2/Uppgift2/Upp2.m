clear all
format long
clc;

X = [-1:0.0001:1];
Y = sqrt(X+2);
plot(X,Y);
hold on;
grid on;
xline(0,'s');
yline(0,'s');

area = trapz(X,Y);

a = -1; %lower
b = 1; %upper

%n = 1;

f=@(x)sqrt(x+2);
h = 0.0625;    %ÄNDRA STEGLÄNGD
n=(b-a)/h;

sum=0;
for k=1:1:n-1
  x(k)=a+k*h;
  y(k)=f(x(k));
  sum=sum+y(k);
end

% Formula:  (h/2)*[(y0+yn)+2*(y2+y3+..+yn-1)]
svar1=h/2*(f(a)+f(b)+2*sum);
svar2=abs(svar1-area);
fprintf('\nValue: %f',svar1); 
fprintf('\nFel: %f',svar2); 

%Svar: 2.797435 a.e
