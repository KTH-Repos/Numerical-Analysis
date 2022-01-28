clear
format long
clc

load minidigits.mat

%plotta med plotdigit

%plotta bild nummer 400 med: plotdigit(testdata(:,400))

%avögra av sifforna i testdata som är tvåor.

%I c finns centroid  ritas med C(:,1) och C(:,2)  med plotdigit

%               testdata(j) = x1*c1 + x2*c2.... 



% Ax = b
% x = A\b

lika = 0;
fel = 0;

for i = 1:length(testdata)
x = C\testdata(:,i); 
nv(i)=norm(C*x-testdata(:,i));
end

p = (mean(nv) + min(nv))/2 

ii = [];
for i = 1:length(testdata)
if nv(i) < p
    disp(num2str(i))
    if testdatad(:,i) == 2
        lika = lika + 1;
        ii = [ii, i];
    else
        fel = fel + 1;
    end
end
end

lika
fel
totalt = lika + fel



%Totalt finns 101 2:or
disp(['Antal korrekta valda 2:or delat med alla 2:or: ' num2str(lika/101) '%'])
disp(['Antal rätt: ' num2str(lika) '/101'])

disp(['Procent tvåor missade: ' num2str(1-(lika/101)) '%'])
missade = 101-lika;
disp(['Antal tvåor missade: ' num2str(missade)])

disp(['Klassificerades felaktigt som en tvåa: ' num2str(fel/totalt) '%'])
disp(['Antal false positive: ' num2str(fel)])


