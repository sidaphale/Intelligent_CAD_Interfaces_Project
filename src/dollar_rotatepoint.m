function q = dollar_rotatepoint(p,cx,cy,th)

% Rotate about point
q(:,1) = (p(:,1) - cx)*cosd(th) - (p(:,2) - cy)*sind(th) + cx;
q(:,2) = (p(:,1) - cx)*sind(th) + (p(:,2) - cy)*cosd(th) + cy;
