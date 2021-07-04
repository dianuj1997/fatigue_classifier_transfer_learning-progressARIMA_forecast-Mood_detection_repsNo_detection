alpha4kg=9.61;
alpha6kg=5.18;
%alpha10kg=59.7;
%alpha15kg=77.649;
p2=[alpha4kg alpha6kg];
p2= iddata(p2',[]);
sys2 = ar(p2,1);
K2 = 2;
fore2= forecast(sys2,p2,K2);
plot(p2,'b',fore2,'r'), legend('measured','forecasted')
xlabel('Weeks');
ylabel('RPE');
title('2 week RPE going from week#1 to week#2');
forecasty2=fore2.OutputData;
normal2=p2.OutputData;