clear
format long 
clc

LA = 55.1;
LB = 46.2;
LC = 46.2;

xA = 93;
yA = 63;

xB = 6;
yB = 16;

xC = 20;
yC = 83;

% X(1) = xP och X(2) = yP 
f = @(X)[(xA-X(1))^2+(yA-X(2))^2-(LA)^2;
    (xB-X(1))^2+(yB-X(2))^2-(LB)^2;
    (xC-X(1))^2+(yC-X(2))^2-LC^2];
J = @(X)[-2*(93-X(1)), - 2*(63-X(2));
    -2*(6-X(1)), - 2*(16-X(2));
    -2*(20-X(1)), - 2*(83-X(2))];

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

center = [20 ,83]; % center coordinates of the circle [x0,y0] 
radius = 46.2; % radius of the circle
angle = 0:.0001:2*pi;
r = radius;
X = r.*cos(angle)+ center(1);
Y = r.*sin(angle)+ center(2);
plot(X,Y,'b')

%När vi plottade cirklarna skär de varandra vid cirka (50.69 , 27.69)
%och cirka (40.28 , 46.96)

X = [40.2; 46.9]
iteration = 0;

while 1
    b = f(X);
    A = J(X);
    d = -A\b;
    
    X = X + d
    iteration = iteration + 1
    
    if norm(d) <= 1e-10 && iteration < 500
        break
    end

end
plot(X(1), X(2), '*')
disp('Value:')
X


%Vi har kvadratisk konvergens

%Vi fick punkterna (50.6, 27.6) och (40.2, 46.9)

