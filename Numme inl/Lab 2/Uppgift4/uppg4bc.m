%Newtons metod i flera variabler
clear
format long g
clc;

R = 1;

posx = 1.3;
posy = 1.3;

% Xe=@(the1,the2)R*cos(the1)+R*cos(the2);
% Ye=@(the1,the2)R*sin(the1)+R*sin(the2);

% the(1) = the1 och the(2) = the2 
f = @(the)[R*cos(the(1))+R*cos(the(2)) - posx;
    R*sin(the(1))+R*sin(the(2)) - posy];
J = @(the)[-R*sin(the(1)), -R*sin(the(2));
    R*cos(the(1)), R*cos(the(2))];

the = [40; 20];
    
h = 1;
hPrev = 0;
iteration = 0;

while norm(h) > 1e-10 && iteration < 500
    hPrev = h;
    h = J(the)\f(the);
    skillnad = the - (the - h);
    the = the - h;
    iteration = iteration + 1;
    norm(h)/norm(hPrev)^2;
end

Y = 4;
w = 3*pi;
b = 0.5;
a = 2;

% syms y(t) z(t)
% eqn1 = diff(y,2) == -a*(y(t)-the(1))-Y*diff(y)+b*sin(w*t)
% eqn2 = diff(z,2) == -a*(z(t)-the(2))-Y*(diff(z) + abs(diff(y))) + b*sin(w*t)
% eqns = [eqn1 eqn2];
% 
% V = odeToVectorField(eqns)
% f = @(t,Y,Z)[Y(2);abs(Y(4)).*-4.0+sin(t.*pi.*3.0)./2.0-Y(1).*2.0-Y(2).*4.0+3.84606008958252e+1;Y(4);sin(t.*pi.*3.0)./2.0-Y(3).*2.0-Y(4).*4.0+7.77783272869972e+1]
% M = matlabFunction(V,'vars',{'t','Y','Z'})

%Startvärden
the1 = pi/2;
the2 = pi/6;
the1prime = 0;
the2prime = 0;
z0 = [the1; the1prime; the2; the2prime];

tid = 0; %Tidsenhet

% f_robotarm(z0,t,the(1),the(2),a,b,Y,w,the(1),the(2))
h = 0.01;
tt1=0:h:100-h;
for t=tt1(1:end-1)
    if (mod(tid,10) == 1)
        plot_robotarm([z0(1); z0(3)])
    end
    z0 = z0 + f_robotarm(z0,t,the(1),the(2),a,b,Y,w,the(1),the(2))*h;
    tid = tid + 1
end
z0