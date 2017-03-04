clear
clc
close all


pnt = load('InkData.txt');


% Loading Training Data
one = load('one_pts.txt');

pixt = load('img_pix.txt');
pixt = reshape(pixt,[48,48,70]);

%%
%~~~ Resampling Points for One Dollar
pts = dollar_trainingdata(pnt);


%~~~ Converting To Pixel

% Resample Datapoints
dp = dollar_resample(pnt);

% Find Centroid
[cx,cy] = find_centroid(dp);

% Finding Angle of Rotation
% In degrees
tet = atan2d(pnt(1,2) - cy, pnt(1,1) - cx);

% Rotate Points
ir = dollar_rotatepoint(pnt,cx,cy,tet);

[~,pix] = image_makepixel(ir);
%%
% 1$ Classifier

for i = 1:70
    
    d(i) = sum(sqrt((one(:,2*i-1) - pts(:,1)).^2 + (one(:,2*i) - pts(:,2)).^2))/64;
    
end
[~, loc_one] = min(d)

%%

% Calculate Housdroff Distance
for i = 1:70
    hou(i) = housdorff(pixt(:,:,i),pix);
end
hou = normalize(hou);

% Calculate Modified Housdroff
for i = 1:70
    mhou(i) = modhousdorff(pixt(:,:,i),pix);
end
mhou = normalize(mhou);

% Calculate Tanimoto
for i = 1:70
    T(i) = tanimoto(pixt(:,:,i),pix);
end
T = normalize(T);
T = 1 - T;

% Calculate Yule
for i = 1:70
    Y(i) = yule(pixt(:,:,i),pix);
end
Y = normalize(Y);
Y = 1 - Y;


% Calculating the Score
sc = hou + mhou + T + Y;

% Printing Output
[~, I] = min(sc)









