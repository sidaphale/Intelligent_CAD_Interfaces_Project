function [haus]=modi_haus(A,B)
[xa,ya]=find(A==0);
pnta=[xa,ya];
[xb,yb]=find(B==0);
pntb=[xb,yb];
dab=pdist2(pnta,pntb);
dba=pdist2(pntb,pnta);
hab=min(dab,[],2);
hba=min(dba,[],2);

hab1=mean(hab);
hba1=mean(hba);

haus=max(hab1,hba1);
