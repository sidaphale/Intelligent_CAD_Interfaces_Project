function [DS]=dollar_segmentation()
X=load('InkData.txt');
[n I]=Symbol_Strokes(X,1);
for i=1:n
    P=[X(I(i):I(i+1)-1,1),X(I(i):I(i+1)-1,2),X(I(i):I(i+1)-1,3)];
    Pts(i)=DollarTrain(P);
end
for i=1:length(Pts)
    if Pts(i)==1
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is Fixed-Support',i);
    elseif Pts(i)==2
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a Block',i);
    elseif Pts(i)==3
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a Roller-Support',i);
    elseif Pts(i)==4
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a Spring',i);
    elseif Pts(i)==5
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a Damper',i);
    elseif Pts(i)==6
        DS=fprintf('\n\tThe %dth sketch is a 0',i);
    elseif Pts(i)==7
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a 1',i);
    elseif Pts(i)==8
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a 2',i);
    elseif Pts(i)==9
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a 3',i);
    elseif Pts(i)==10
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a 4',i);
    elseif Pts(i)==11
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a 5',i);
    elseif Pts(i)==12
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a 6',i);
    elseif Pts(i)==13
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a 7',i);
    elseif Pts(i)==14
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a 8',i);
    elseif Pts(i)==15
        DS=fprintf('\n\tThe %dth sketch you drawn in mass diagram is a 9',i);
    else
        DS=fprintf('Something is Wrong');
    end
end
obj=0;
num=0;
for i=1:length(Pts)
    if Pts(i)<6
        obj=obj+1;
        tot_obj(obj)=i;
    else
        num=num+1;
        tot_num(num)=i;
    end
end
Object={'Fixed-Support','Block','Roller-Support','Spring','Damper'};
for i=1:length(tot_obj)
    if Pts(tot_obj(i))==1
        Obj{i}=Object{1};
    elseif Pts(tot_obj(i))==2
        Obj{i}=Object{2};
    elseif Pts(tot_obj(i))==3
        Obj{i}=Object{3};
    elseif Pts(tot_obj(i))==4
        Obj{i}=Object{4};
    elseif Pts(tot_obj(i))==5
        Obj{i}=Object{5};
    end
end
if length(tot_num)>0
    for i=1:length(tot_num)
        C_num(i,1)=(sum(X(I(tot_num(i)):I(tot_num(i)+1),1)))/(length(X(I(tot_num(i)):I(tot_num(i)+1),1)));
        C_num(i,2)=(sum(X(I(tot_num(i)):I(tot_num(i)+1),2)))/(length(X(I(tot_num(i)):I(tot_num(i)+1),2)));
    end
    for i=1:length(tot_obj)
        C_obj(i,1)=(sum(X(I(tot_obj(i)):I(tot_obj(i)+1),1)))/(length(X(I(tot_obj(i)):I(tot_obj(i)+1),1)));
        C_obj(i,2)=(sum(X(I(tot_obj(i)):I(tot_obj(i)+1),2)))/(length(X(I(tot_obj(i)):I(tot_obj(i)+1),2)));
    end
    for i=1:length(tot_num)
        E_dist(i,:)=pdist2(C_num(i,:),C_obj);
        [E_dist_min(i),loc(i)]=min(E_dist(i,:));
    end
    for i=1:length(tot_num)
        if tot_num(i)>=2
            if E_dist_min(i)>0.3
                fprintf('\n\tYour objects are misclassified');
                break
            end
                if (C_num(i,2)-C_obj(loc(i),2))<0
                    fprintf('\n\tYour number %d is below the object %s', Pts(tot_num(i))-6);
                    
                elseif (C_num(i,2)-C_obj(loc(i),2))>0.05
                    fprintf('\n\tYour number %d is above the object %s', Pts(tot_num(i))-6);
                    
                elseif (C_num(i,2)-C_obj(loc(i),2))<0.05 || (C_num(i,2)-C_obj(loc(i),2))>0.01
                    fprintf('\n\tYour number %d is inside the object %s', Pts(tot_num(i))-6);
                end
                
            end
        end
%     end
    
    if length(tot_num)>=2
        for i=1:length(tot_num)-1
            if (C_num(i+1,1)-C_num(i,1))>0
                fprintf('\n\tYour %d number is to the right of %d number', Pts(tot_num(i+1))-6,Pts(tot_num(i))-6);
            else
                fprintf('\n\tYour %d number is to the left of %d number', Pts(tot_num(i+1))-6,Pts(tot_num(i))-6);
            end
        end
    end
    if length(tot_obj)>=2
        for i=1:length(tot_obj)-1
            if (C_obj(i+1,1)-C_obj(i,1))>0
                fprintf('\n\tYour %s object is to the right of %s object', Obj{i+1},Obj{i});
            else
                fprintf('\n\tYour %s object is to the left of %s object', Obj{i+1},Obj{i});
            end
        end
    end
end
% plot(X(I(1):I(2)-1,1),X(I(1):I(2)-1,2))
% hold on
% for i=2:length(I)-1
%     plot(X(I(i):I(i+1)-1,1),X(I(i):I(i+1)-1,2))
% end
end