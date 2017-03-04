function [recognize]=DollarTrain(Pts)
X0=load('fixed_support.txt');
X1=load('Block.txt');
X2=load('roller_support.txt');
X3=Pts;
X4=load('Spring.txt');
X5=load('Damper.txt');
X6=load('0.txt');
X7=load('1.txt');
X8=load('2.txt');
X9=load('3.txt');
X10=load('4.txt');
X11=load('5.txt');
X12=load('6.txt');
X13=load('7.txt');
X14=load('8.txt');
X15=load('9.txt');

[st I]=Symbol_Strokes(X3,0.5); 
z(:,1:2) = dollar_trainingdata(X0);
z(:,3:4) = dollar_trainingdata(X1);
z(:,5:6) = dollar_trainingdata(X2);
pts = dollar_trainingdata(X3);
z(:,7:8) = dollar_trainingdata(X4);
z(:,9:10) = dollar_trainingdata(X5);
z(:,11:12) = dollar_trainingdata(X6);
z(:,13:14) = dollar_trainingdata(X7);
z(:,15:16) = dollar_trainingdata(X8);
z(:,17:18) = dollar_trainingdata(X9);
z(:,19:20) = dollar_trainingdata(X10);
z(:,21:22) = dollar_trainingdata(X11);
z(:,23:24) = dollar_trainingdata(X12);
z(:,25:26) = dollar_trainingdata(X13);
z(:,27:28) = dollar_trainingdata(X14);
z(:,29:30) = dollar_trainingdata(X15);


for i = 1:15
    
    d(i) = sum(sqrt((z(:,2*i-1) - pts(:,1)).^2 + (z(:,2*i) - pts(:,2)).^2))/64;
    
end
[~, loc_one] = min(d);
recognize=loc_one;
if recognize==1 || recognize==3
    if st==3
        recognize=3;
    else 
        recognize=1;
    end
end
if recognize==4
    if st==4
        recognize=5;
    elseif st>4
        recognize=4;
    end
end




