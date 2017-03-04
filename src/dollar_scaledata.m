function pnt = dollar_scaledata(p)

% Shifting the axes of pnt
% X: x cordinate of pnt; Y: y cordinate of pnt
X = p(:,1) - min(p(:,1));
Y = p(:,2) - min(p(:,2));

% Finding the max value
% H: max of Y; L: max of X
L = max(X);
H = max(Y);

% Scaling
qx = X*(1/L);
qy = Y*(1/H);

pnt = [qx,qy];