%% Kanslighet

load eiffel2.mat
N = size(A,1);
forsk=zeros(N/2,1);

tic;
[L,U]=lu(A);
for j=1:N/2
  b = zeros(N,1); b(2*j) = -1;  % Applicera kraft i nod j
  xL = L\b;            % Beräkna förskjutningarna
  xU = U\b;           % Beräkna förskjutningarna
  x = xL * xU;
  forsk(j) = norm(x); % Spara normen av förskjutningen i forsk-vektorn
end
toc

[fmax jmax] = max(forsk);  % Maximala förskjutningen med index
[fmin jmin] = min(forsk);  % Minimala förskjutningen med index

% Plotta tornet med de maximalt ('o') och
% minimalt ('*') känsliga noderna markerade

%trussplot(xnod,ynod,bars); hold on
plot(xnod(jmax),ynod(jmax),'ro',xnod(jmin),ynod(jmin),'r*');
hold off