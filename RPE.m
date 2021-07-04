function R=RPE(probs)
if (100*probs)>90
    R=9;
elseif (100*probs)<=90 && (100*probs)>10
    R=8;
elseif (100*probs)<=10 && (100*probs)>3
    R=7;
elseif (100*probs)<=3 && (100*probs)>1
    R=6;
elseif (100*probs)<=1 && (100*probs)>0.8  
    R=5;
elseif (100*probs)<=0.8 && (100*probs)>0.6
    R=4;
elseif (100*probs)<=0.6 && (100*probs)>0.4
    R=3;
elseif (100*probs)<=0.4 && (100*probs)>0.2
    R=2;
else
    R=1;
end
end