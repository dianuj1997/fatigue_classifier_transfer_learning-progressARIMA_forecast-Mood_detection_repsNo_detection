load fatigue_classifier
weight=4;
T=readtable('me_1.csv');
T1=table2array(T(:,1));
XTest=T1;
Fs=256;
fb= cwtfilterbank('SignalLength',length(XTest),'SamplingFrequency',Fs);
myNet=fatigue_classifier;
siggy=XTest;
fig = figure;
set(fig,'visible','off')
cwt(siggy,'FilterBank',fb)
title('Magnitude Scalogram of sample signal')
drawnow
frame = getframe(fig);
im= frame2im(frame);
im= imresize(im,[227 227]);
imwrite(im,'signal_scalogram.jpg');



imdstest=imread('signal_scalogram.jpg');
[YPred,probs] =classify(myNet,imdstest);
%accuracy = mean(YPred == imdstest.Labels)
rpe=RPE(probs(1,2));
rp=rpe;
prog=progress(probs(1,1),rpe);
t=tension(prog)/36*100;
d=depression(prog)/60*100;
a=anger(prog)/48*100;
v=vigour(prog)/32*100;
c=confusion(prog)/28*100;
%testingee
idx=[1,2,3];
imtest=imread('signal_scalogram.jpg');
myicon = imtest;
S1="Rapidity: "+ num2str(100*max(probs(1,1)),3) + "% ,";
S2="Fatigue:"+ ", " + num2str(100*max(probs(1,2)),3) + "% ,";
S3="Pace is "+ num2str(100*max(probs(1,3)),3) + "% with in normal range and ";
S4="RPE is "+ num2str(rpe);
S5=" Current performance is "+ num2str(prog)+ "% for "+ num2str(weight) + "kg";
h=msgbox(join([S1,S2,S3,S4,S5]),'Result','custom',myicon);
probs1=probs(1,3);
%figure
%plot(XTest);
S6="Tension: "+ num2str(t)+ "%, ";
S7="Depression: "+ num2str(d)+ "%, ";
S8="Anger: "+ num2str(a)+ "%, ";
S9="Vigour: "+ num2str(v)+ "%, ";
S10="Confusion: "+ num2str(c)+ "%";

%h1=msgbox(join([S6,S7,S8,S9,S10]),'Moods','custom',myicon);