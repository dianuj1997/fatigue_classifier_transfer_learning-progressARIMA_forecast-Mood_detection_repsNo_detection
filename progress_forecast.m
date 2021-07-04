alpha4kg=78.354;
alpha6kg=67.18;
%alpha10kg=59.7;
%alpha15kg=77.649;
p=[alpha4kg alpha6kg];
p= iddata(p',[]);
sys = ar(p,1);
K = 2;
fore= forecast(sys,p,K);
plot(p,'b',fore,'r'), legend('measured','forecasted')
xlabel('Weeks');
ylabel('Performance(based on RPE)');
title('2 week progression going from week#1 to week#2');
forecasty=fore.OutputData;
normal=p.OutputData;
