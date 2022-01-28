clear
clc
load eiffel2
trussplot(xnod,ynod,bars,'c')
hold on;

%Sätt F^x,j = 1 för något j, och resten av elementen i b lika med noll)
b=zeros(2*399,1); %Sätter elementen i b lika med noll
j = 350;
b(j*2-1)=1; %Sätter F^x,j lika med 1 för j = 350

plot(xnod(j),ynod(j),'*')

x = A\b

xbel = xnod + x(1:2:end);
ybel = ynod + x(2:2:end);

trussplot(xbel,ybel,bars,'r')