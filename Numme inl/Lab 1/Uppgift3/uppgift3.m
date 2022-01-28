clear
format long
clc

LA = 55.1;
LB = 46.2;

xA = 93;
yA = 63;

xB = 6;
yB = 16;

% X(1) = xP och X(2) = yP
% Ekvationssystemet
f = @(X)[(xA-X(1))^2+(yA-X(2))^2-(LA)^2;
    (xB-X(1))^2+(yB-X(2))^2-(LB)^2];
% Jacobian Matrisen
J = @(X)[-2*(93-X(1)), - 2*(63-X(2));
    -2*(6-X(1)), - 2*(16-X(2))];

center = [93 ,63]; % center coordinates of the circle [x0,y0] 
radius = 55.1; % radius of the circle
angle = 0:.0001:2*pi;
r = radius;
X = r.*cos(angle)+ center(1);
Y = r.*sin(angle)+ center(2);
plot(X,Y,'c')
hold on;
grid on;
xline(0,'s');
yline(0,'s');
     
center = [6 ,16]; % center coordinates of the circle [x0,y0] 
radius = 46.2; % radius of the circle
angle = 0:.0001:2*pi;
r = radius;
X = r.*cos(angle)+ center(1);
Y = r.*sin(angle)+ center(2);
plot(X,Y,'r')

%När vi plottade cirklarna skär de varandra vid cirka (50.69 , 27.69)
%och cirka (40.28 , 46.96)

X = [50; 27]
h = 1;
hPrev = 0;
iteration = 0;

while norm(h) > 1e-10 && iteration < 500
    hPrev = h;
    h = J(X)\f(X);
    skillnad = X - (X - h)
    X = X - h
    iteration = iteration + 1
    norm(h)/norm(hPrev)^2
end
plot(X(1), X(2), '*')
disp('Value:')
X

X = [50.6; 27.6]
h = 1;
hPrev = 0;
iteration = 0;

while norm(h) > 1e-10 && iteration < 500
    hPrev = h;
    h = J(X)\f(X);
    skillnad = X - (X - h)
    X = X - h
    iteration = iteration + 1
    norm(h)/norm(hPrev)^2
end
plot(X(1), X(2), '*')
disp('Value:')
X

X = [40.28; 46.96]
h = 1;
hPrev = 0;
iteration = 0;

while norm(h) > 1e-10 && iteration < 500
    hPrev = h;
    h = J(X)\f(X);
    skillnad = X - (X - h)
    X = X - h
    iteration = iteration + 1
    norm(h)/norm(hPrev)^2
end
plot(X(1), X(2), '*')
disp('Value:')
X


X = [40.28; 47]
h = 1;
hPrev = 0;
iteration = 0;

while norm(h) > 1e-10 && iteration < 500
    hPrev = h;
    h = J(X)\f(X);
    skillnad = X - (X - h)
    iteration = iteration + 1
    X = X - h
    norm(h)/norm(hPrev)^2
end
plot(X(1), X(2), '*')
disp('Value:')
X

%Vi har kvadratisk konvergens - vi kan se detta genom att använda
%tumreglerna.

%Vi fick punkterna (50.6, 27.6) och (40.2, 46.9)

