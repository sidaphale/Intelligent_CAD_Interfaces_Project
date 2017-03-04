%function [P]=symbol_stroke(Training)
Training=load('fixed_support.txt');
X=Training(:,1);
Y=Training(:,2);
T=Training(:,3);
X(X==0)=[];
Y(Y==0)=[];
T(T==0)=[];
Dif=diff(T);
threshold=1.0;
st=0;
k=1;
P(1,1)=1;
siz=size(X);
siz=siz(1);
for i=1:siz-1;
    if Dif(i)>threshold
        k=k+1;
        P(k,1)=i;
        
    end
end
P(k+1,1)=siz;