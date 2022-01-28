clc;                                               
clear all; close all;
format long g
global q;
global h;
global y0;

L = 0.1; %m
E = 7.6*10^9; %N/m^2
b = 0.03; %m 
tjockleken = 0.003; %m
I = 6.75*10^(-11);%m^4
MOR = 5.1*10^7; %N/m^2
q = 9.869604401;
y0 = (2 * MOR)/(E*q*tjockleken)  %m

h = 0.01/8; %ÄNDRA STEGLÄNGDEN

giss0 = 9.869604401; giss1 = 12;

fel0 = kollafel(giss0);
disp ('             Gissning               Fel                     Korr');
disp([giss0 fel0]);
t = 1;
while abs(t) > 1e-12
    fel1 = kollafel(giss1);
    t = fel1 * (giss1-giss0)/(fel1-fel0);
    disp([giss1 fel1 t]);
    fel0 = fel1; giss0 = giss1; giss1 = giss1 - t;
end

yprimstart = giss1;
x0=0; xslut=0.5;
q = giss1;
%[xut,uut]= ode45(@funktion, [x0 xslut], [0.3 0 0]);
[xut,yut] = Runge4(h, 0, 0.5, [y0 0 0]);

grid on
hold on
xlabel('x-axis');
ylabel('y-axis');
title('Pilbågen');
xline(0,'r');
yline(0,'r');

plot(xut, yut(:,1)); %Högra
plot(-xut, yut(:,1)); %Vänsta

%plot(xut, uut);
n = length(xut);

fel = yut(n,1)
q
S = q * E * I

n = numel(yut(:,1));

arclength = 0.0;
for i = 1:n-1
  arclength = arclength + sqrt((xut(i+1)-xut(i)).^2 + (yut(i+1,:)-yut(i,:)).^2);
end
l = arclength(:,1) * 2

y0felgrans = 0.01;
Lfelgrans = 0.01;
Efelgrans = 0.3*exp(9);

y0 = 0.3; 
L = 1; 
E = 7.6*10^9; 
b = 0.03; %m 
tjockleken = 0.003; %m
I = 6.75*10^(-11);%m^4

h = 0.01/8; %ÄNDRA STEGLÄNGDEN
%h = (0.5-0)/n;

giss0 = 9.869604401; giss1 = 12; %Våra gissningar

fel0 = kollafel(giss0);
disp ('             Gissning               Fel                   Korr');
disp([giss0 fel0]);
t = 1;
gissPrev = 0;
iter = 0;
while abs(t) > 1e-12 %Sekantmetoden
    gissPrev = giss1;
    fel1 = kollafel(giss1);
    t = fel1 * (giss1-giss0)/(fel1-fel0);
    disp([giss1 fel1 t]);
    fel0 = fel1;
    giss0 = giss1;
    giss1 = giss1 - t;
    
    Konstant = giss1/gissPrev^1.62;
    disp('Noggrann')
    disp([iter Konstant])
    iter = iter + 1;
end

yprimstart = giss1;
q = giss1;
%[xut,yut]= ode45(@funktion, [0 0.5], [0.3 0 0]);
[xut,yut] = Runge4(h, 0, 0.5, [y0 0 0]);

grid on
hold on
xlabel('x-axis');
ylabel('y-axis');
title('Pilbågen');
xline(0,'r');
yline(0,'r');

plot(xut, yut(:,1)); %Högra
plot(-xut, yut(:,1)); %Vänsta

%plot(xut, uut);
n = length(xut);

fel = yut(n,1)
q
S = q * E * I

n = numel(yut(:,1));

arclength = 0.0;
for i = 1:n-1
  arclength = arclength + sqrt((xut(i+1)-xut(i)).^2 + (yut(i+1,:)-yut(i,:)).^2);
end
l = arclength(:,1) * 2


%%%FUNKTIONER
function dy=funktion(t,y)
global q;
dy=zeros(3,1);
dy(1)= y(2);
dy(2)= -q.*y(1)*sqrt(1-y(2).^2);
dy(3)= sqrt(1-y(2).^2);
end

function [fel, xut, yut] = kollafel(gissning)
global q;
global h;
global y0;

ratt=0;
q = gissning;
%[xut,uut]= ode45(@funktion, [x0 xslut], [0.3 0 0]);
[xut,yut] = Runge4(h, 0, 0.5, [y0 0 0]);
n=length(xut);
yprimslut=yut(n,1);
fel=yprimslut-ratt;
end

function [xut,yut] = Runge4(h, x0, xslut, startvarden)
global q;
global y0;
fid=fopen('Svar.m','w');
fprintf(fid,'%7s %7s %7s %7s %7s \n','i','s(i)','y(i)','z(i)','x(i)');                                          
s = x0:h:xslut;                                         
n = h;
y = zeros(1,length(s)); 
z = zeros(1,length(s)); 
x = zeros(1,length(s)); 

y(1) = y0;                                        
z(1) = 0;                                          
x(1) = 0;

F_xyz = @(s,y,z,x) z; 
G_xyz = @(s,y,z,x) -q.*y*sqrt(1-z.^2);
H_xyz = @(s,y,z,x) sqrt((1-z).^2);

for i=1:(length(s)-1)                              
    k_1 = F_xyz(s(i),y(i),z(i),x(i));
    L_1 = G_xyz(s(i),y(i),z(i),x(i));
    M_1 = H_xyz(s(i),y(i),z(i),x(i));
    
    k_2 = F_xyz(s(i)+0.5*h,y(i)+0.5*h*k_1,z(i)+0.5*h*L_1,x(i)+0.5*h*M_1);
    L_2 = G_xyz(s(i)+0.5*h,y(i)+0.5*h*k_1,z(i)+0.5*h*L_1,x(i)+0.5*h*M_1);
    M_2 = H_xyz(s(i)+0.5*h,y(i)+0.5*h*k_1,z(i)+0.5*h*L_1,x(i)+0.5*h*M_1);
    
    k_3 = F_xyz((s(i)+0.5*h),(y(i)+0.5*h*k_2),(z(i)+0.5*h*L_2),(x(i)+0.5*h*M_2));
    L_3 = G_xyz((s(i)+0.5*h),(y(i)+0.5*h*k_2),(z(i)+0.5*h*L_2),(x(i)+0.5*h*M_2));
    M_3 = H_xyz((s(i)+0.5*h),(y(i)+0.5*h*k_2),(z(i)+0.5*h*L_2),(x(i)+0.5*h*M_2));
    
    k_4 = F_xyz((s(i)+h),(y(i)+k_3*h),(z(i)+L_3*h),(x(i)+M_3*h));       
    L_4 = G_xyz((s(i)+h),(y(i)+k_3*h),(z(i)+L_3*h),(x(i)+M_3*h));
    M_4 = H_xyz((s(i)+h),(y(i)+k_3*h),(z(i)+L_3*h),(x(i)+M_3*h));
    
    y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;
    z(i+1) = z(i) + (1/6)*(L_1+2*L_2+2*L_3+L_4)*h; 
    x(i+1) = x(i) + (1/6)*(M_1+2*M_2+2*M_3+M_4)*h;   
end

 total = [y',z',x'];
 s = s';

 %plot(s, total(:,1));
 
 xut = s;
 yut = total;

% %RITAR DEN RIKTIGA!
% hold on
% [xut,uut]= ode45(@funktion, [0 0.5], [0.3 0 0]);
% plot(xut, uut(:,1));
% %----------
end