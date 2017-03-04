function newpnt = dollar_resample(pnt)

%%% No of Resampled Points
% N is user input; 32 <= N <= 256
n = 64;


%%% Calculating the total length of stroke
% len: length of the stroke
pt_len = sqrt((pnt(1:end-1,1) - pnt(2:end,1)).^2 + (pnt(1:end-1,2) - pnt(2:end,2)).^2);
pt_len = sum(pt_len);


% Initlalizing the Resampled Points
% The first and last points of resamples matrix will be same as that of
% points matrix
D = 0;
newpt_s(1,:) = pnt(1,:);
newpt_s(64,:) = pnt(end,:);


%%% Resampling

% I: length of increment
I = pt_len/(n-1);

for k = 2:n
    
    for i = 2:numel(pnt(1:end,1))
        
        % d: distance between two adjacent points
        d = sqrt((pnt(i,1) - pnt(i-1,1)).^2 + (pnt(i,2) - pnt(i-1,2)).^2);
        
        if (D+d) >= I
            
            % newpnt_s: Resampled points matrix
            newpt_s(k,1) = pnt(i-1,1) + ((I-D)/d)*(pnt(i,1) - pnt(i-1,1));
            newpt_s(k,2) = pnt(i-1,2) + ((I-D)/d)*(pnt(i,2) - pnt(i-1,2));
            
            % Inserting the new point into the pnt matrix
            pnt = [newpt_s(k,:); pnt(i:end,:)];
            
            D = 0;
            break
        else
            D = D+d;
        end
        
    end
    
end

newpnt = newpt_s(:,1:2);