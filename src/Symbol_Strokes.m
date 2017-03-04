function [n I]=Symbol_Strokes(points, threshold)
% pnt=load('InkData.txt');
pnt=points;
n=1;
t=pnt(:,3);
l=numel(t);
dt=t(2:end)-t(1:end-1);
k=find(dt>threshold);
k=k+1;
I(numel(k)+2,1)=0;
I(1,1)=1;
I(2:end-1,1)=k;
I(end,1)=length(pnt);
for i=1:length(dt)
    if dt(i)>threshold
        n=n+1;
    end
end
n=n;
end