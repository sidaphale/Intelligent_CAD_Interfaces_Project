%% Dollar Train

function q = dollar_trainingdata(pnt)

% Resample Data
p = dollar_resample(pnt);

% Find Centroid
[cx,cy] = find_centroid(p);

% Finding Angle of Rotation
% In degrees
tet = atan2d(p(1,2) - cy, p(1,1) - cx);

% Rotate Point
r = dollar_rotatepoint(p,cx,cy,tet);

% Scale Points
q = dollar_scaledata(r);