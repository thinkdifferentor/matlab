function [ attrCount ] = attr_state_count( labels,unique_labels )
%% ��Ե���label�Ĳ�ͬstate���м���

rows = size(unique_labels,1);
attrCount = zeros(rows,1);
for i=1:rows
    attrCount(i,1)=sum(labels==i);
end


end

