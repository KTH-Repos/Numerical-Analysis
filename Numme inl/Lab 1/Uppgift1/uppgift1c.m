 % Funktionen x^2-3*sin(3*x+2)-1
% Derivatan till funktionen: 2*x - 9*cos(3*x+2)

% Newtons metod: x(n+1) = x(n) - f(x(n))/f'(x(n))
clear
format long
clc

x = -0.7
phi = @(x) x-((x^2-3*sin(3*x+2)-1)/(2*x - 9*cos(3*x+2)));
iteration = 0;

while abs(x - phi(x)) >= 1e-10 
    skillnad = x - phi(x);
    x = phi(x);
    iteration = iteration + 1;
    disp(['x = ' num2str(x) ' Skillnad = ' num2str(skillnad) ' Iteration: ' num2str(iteration)]); 
end

x = 0.5
iteration = 0;

while abs(x - phi(x)) >= 1e-10  
    skillnad = x - phi(x);
    x = phi(x);
    iteration = iteration + 1;
    disp(['x = ' num2str(x) ' Skillnad = ' num2str(skillnad) ' Iteration: ' num2str(iteration)]); 
end

x = 1.6
iteration = 0;

while abs(x - phi(x)) >= 1e-10  
    skillnad = x - phi(x);
    x = phi(x);
    iteration = iteration + 1;
    disp(['x = ' num2str(x) ' Skillnad = ' num2str(skillnad) ' Iteration: ' num2str(iteration)]); 
end

x = 2
iteration = 0;

while abs(x - phi(x)) >= 1e-10 
    skillnad = x - phi(x);
    x = phi(x);
    iteration = iteration + 1;
    disp(['x = ' num2str(x) ' Skillnad = ' num2str(skillnad) ' Iteration: ' num2str(iteration)]); 
end


