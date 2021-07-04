alpha4kg=0.359;
alpha6kg=8.71;
%alpha10kg=59.7;
%alpha15kg=77.649;
p1=[alpha4kg alpha6kg];
p1= iddata(p1',[]);
sys1 = ar(p1,1);
K1 = 2;
fore1= forecast(sys1,p1,K1);
plot(p1,'b',fore1,'r'), legend('measured','forecasted')
xlabel('Weeks');
ylabel('Rapidity');
title('2 week rapidity going from week#1 to week#2');
forecasty1=fore1.OutputData;
normal1=p1.OutputData;