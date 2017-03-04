function [haus]=hausdorff(A,B)
[xa,ya]=find(A==0);
pnta=[xa,ya];
[xb,yb]=find(B==0);
pntb=[xb,yb];
dab=pdist2(pnta,pntb);
dba=pdist2(pntb,pnta);
hab=min(dab,[],2);
hba=min(dba,[],2);
hab1=sort(hab,'descend');
hba1=sort(hba,'descend');

hab2=median(hab1);
hba2=median(hba1);

haus=max(hab2,hba2);
