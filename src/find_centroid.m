function [cx, cy] = find_centroid(p)

cx = sum(p(:,1))*(1/numel(p(:,1)));
cy = sum(p(:,2))*(1/numel(p(:,2)));