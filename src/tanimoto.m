function [Tsc]= tanimoto(A,B)

%no of whites in A
[xaw,yaw]=find(A==1);
pntaw=[xaw,yaw];
na_w=size(pntaw);
na_w=na_w(1);

%no of blacks in A
[xabl,yabl]=find(A==0);
pntabl=[xabl,yabl];
na_bl=size(pntabl);
na_bl=na_bl(1);

%no of whites in B
[xbw,ybw]=find(B==1);
pntbw=[xbw,ybw];
nb_w=size(pntbw);
nb_w=nb_w(1);


% no of blacks in B
[xbbl,ybbl]=find(B==0);
pntbbl=[xbbl,ybbl];
nb_bl=size(pntbbl);
nb_bl=nb_bl(1);

% no of overlapping pixels
dab=pdist2(pntabl,pntbbl);
m=min(dab,[],2);
nab=0;
for i=1:length(m)
    if m(i)<=4.5
        nab=nab+1;
    end
end
%alpha
alpha=0.75-0.25*(na_bl+nb_bl)/(2*48*48);

%no of matching white pixels
noo=0;
for i=1:48
    for j=1:48
        if A(i,j)==B(i,j)
            noo=noo+1;
        end
    end
end
T=nab/(na_bl+nb_bl-nab);
Tc=noo/(na_bl+nb_bl-2*nab+noo);
Tsc=alpha*T+(1-alpha)*Tc;





