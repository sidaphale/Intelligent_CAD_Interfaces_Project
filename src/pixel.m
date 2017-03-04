function [pt, img0]=pixel(Training)  
X=Training(:,1);
Y=Training(:,2);
X(X==0)=[];
Y(Y==0)=[];

m = min(X);
n = min(Y);
Y = Y-n;
X = X-m;
H = max(Y);
L = max(X);
d = abs(H-L)/2;

if H>L
X2 =((X+(d/2))/(L+(d)))*47;
Y2 = (Y/max(Y))*47;
else
Y2 = ((Y+(d/2))/(H+(d)))*47;
X2 = (X/max(X))*47;
end

X3 = round(X2); Y3 = round(Y2);
img0 = ones(48);

for i = 1:length(X3)
    img0(X3(i)+1,Y3(i)+1) = 0;
end
img0=(rot90(img0));
pt=[X3,Y3];


