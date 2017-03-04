function Y=rotate(X)
n=length(X);
Cx=sum(X(1:end,1))/n;
Cy=sum(X(1:end,2))/n;
theta=atan2(Cy-X(1,2),Cx-X(1,1));
theta=-1*theta;
Y(:,1)=(X(:,1)-Cx).*cos(theta)-(X(:,2)-Cy).*sin(theta)+Cx;
Y(:,2)=(X(:,1)-Cx).*sin(theta)-(X(:,2)-Cy).*cos(theta)+Cy;
Y(:,3)=X(:,3);