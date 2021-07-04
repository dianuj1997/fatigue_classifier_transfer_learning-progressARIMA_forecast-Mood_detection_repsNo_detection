X=abs(VarName1');
%L=categorical([1 0 1 0]);
n=1:length(X);
N=length(X);
sd=0;
for i=1:N
    sd=sd+(max(X)-X(i))^2;
end
sd=sd^0.5;
sd=sd/N;
L=zeros(1,N);
for i=1:N
    if X(i)>sd
        L(i)=2;
    else
        L(i)=1;
    end
end
%classes = categories(L);
figure
sizes = 15 * ones(1,length(X));
% Plot first class
scatter(n(L == 2), X(L == 2), 60, 'g', '.')
% Plot second class.
hold on;
scatter(n(L == 1), X(L == 1), 10, 'r', '.')
title('green represents bicep activity');
hold off