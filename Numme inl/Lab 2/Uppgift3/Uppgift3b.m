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

sum=0;
for k=1:1:n-1
  x(k)=a+k*h;
  y(k)=f(x(k));
  sum=sum+y(k);
end

namnare=h/2*(f(a)+f(b)+2*sum)
%namnare = 1.76416259835991

f=@(x)exp(-B*x.^2)*max(generator(the+x,0));

a = -s; %lower
b = s; %upper
h = 1;    %ÄNDRA STEGLÄNGD
n=(b-a)/h;

sum=0;
for k=1:1:n-1
  x(k)=a+k*h;
  y(k)=f(x(k));
  sum=sum+y(k);
end

taljare=h/2*(f(a)+f(b)+2*sum)
%taljare = 18548.6099498299 h=0.1   tid=28.626 s
%taljare = 18549.57098498   h=0.05  tid=73.256 s
%taljare = 18549.8116199557   h=0.025   tid=127.786 s

m = taljare/namnare
%m = 10514.1158570497  h=0.1    tid=28.626 s
%m = 10514.6606113433  h=0.05   tid=73.256 s
%m = 10514.7970131557  h=0.025  tid=127.786 s
