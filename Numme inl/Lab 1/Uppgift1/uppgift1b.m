clear
clc
format long

x = -0.7
phi = @(x) (1/9)*(x^(2)-3*sin(3*x+2)-1)+x;
iteration = 0;

while abs(x - phi(x)) >= 10^(-5) 
    skillnad = x - phi(x);
    x = phi(x);
    iteration = iteration + 1;
    disp(['x = ' num2str(x) ' Skillnad = ' num2str(skillnad) ' Iteration: ' num2str(iteration)]); 
end

x = 0.5
iteration = 0;

while abs(x - phi(x)) >= 10^(-5) 
    skillnad = x - phi(x);
    x = phi(x);
    iteration = iteration + 1;
    disp(['x = ' num2str(x) ' Skillnad = ' num2str(skillnad) ' Iteration: ' num2str(iteration)]); 
end

x = 1.6
iteration = 0;

while abs(x - phi(x)) >= 10^(-5) 
    skillnad = x - phi(x);
    x = phi(x);
    iteration = iteration + 1;
    disp(['x = ' num2str(x) ' Skillnad = ' num2str(skillnad) ' Iteration: ' num2str(iteration)]); 
end

x = 2
iteration = 0;

while abs(x - phi(x)) >= 10^(-5) 
    skillnad = x - phi(x);
    x = phi(x);
    iteration = iteration + 1;
    disp(['x = ' num2str(x) ' Skillnad = ' num2str(skillnad) ' Iteration: ' num2str(iteration)]); 
end
