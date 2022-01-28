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
    R*cos(the(1)), R*cos(the(2))]

the = [40; 20]
    
h = 1;
hPrev = 0;
iteration = 0;

while norm(h) > 1e-10 && iteration < 500
    hPrev = h;
    h = J(the)\f(the);
    skillnad = the - (the - h)
    the = the - h
    iteration = iteration + 1
    norm(h)/norm(hPrev)^2
end
disp('Value:')
the

v = [the(1); the(2)];
plot_robotarm(v);
