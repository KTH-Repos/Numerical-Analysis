clear
format short
clc

load eiffel1.mat
t = 0;
iterations = 200;
for i = 1:iterations
    N=size(A,1); b=randn(N,1); % Godtyckligt b
    tic; 
    x=A\b; 
    t = t + toc;
end
disp('Eiffell 1 A\b time:')
t = t/iterations

load eiffel2.mat
t = 0;
iterations = 200;
for i = 1:iterations
    N=size(A,1); b=randn(N,1); % Godtyckligt b
    tic; 
    x=A\b; 
    t = t + toc;
end
disp('Eiffell 2 A\b time:')
t = t/iterations

load eiffel3.mat
t = 0;
iterations = 200;
for i = 1:iterations
    N=size(A,1); b=randn(N,1); % Godtyckligt b
    tic; 
    x=A\b; 
    t = t + toc;
end
disp('Eiffell 3 A\b time:')
t = t/iterations

load eiffel4.mat
t = 0;
iterations = 200;
for i = 1:iterations
    N=size(A,1); b=randn(N,1); % Godtyckligt b
    tic; 
    x=A\b; 
    t = t + toc;
end
disp('Eiffell 4 A\b time:')
t = t/iterations


%-----------------------------------------------------------------------

load eiffel1.mat
t = 0;
iterations = 200;
for i = 1:iterations
    N=size(A,1); b=randn(N,1); % Godtyckligt b
    tic; 
    x=inv(A)*b; 
    t = t + toc;
end
disp('Eiffell 1 inv(A)*b time:')
t = t/iterations

load eiffel2.mat
t = 0;
iterations = 200;
for i = 1:iterations
    N=size(A,1); b=randn(N,1); % Godtyckligt b
    tic; 
    x=inv(A)*b; 
    t = t + toc;
end
disp('Eiffell 2 inv(A)*b time:')
t = t/iterations

load eiffel3.mat
t = 0;
iterations = 200;
for i = 1:iterations
    N=size(A,1); b=randn(N,1); % Godtyckligt b
    tic; 
    x=inv(A)*b; 
    t = t + toc;
end
disp('Eiffell 3 inv(A)*b time:')
t = t/iterations

load eiffel4.mat
t = 0;
iterations = 200;
for i = 1:iterations
    N=size(A,1); b=randn(N,1); % Godtyckligt b
    tic; 
    x=inv(A)*b; 
    t = t + toc;
end
disp('Eiffell 4 inv(A)*b time:')
t = t/iterations





