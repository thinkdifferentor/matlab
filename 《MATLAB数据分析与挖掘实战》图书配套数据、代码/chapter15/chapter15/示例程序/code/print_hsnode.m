function print_hsnode(node,level,unique_labels,attributes)
%% ��ӡhotspot������

% ���������
% node�� �ڵ�
% level�� �ڵ�ļ��������ڵ�Ϊ0

print_level_tab(level); % ��ӡlevel��tab
fprintf('%s\n',node_2_string(node,unique_labels,attributes)); % ��ӡ��ǰ�ڵ�
children = node.children;
cols = size(children,2);
for i=1:cols
    print_hsnode(children(1,i),level+1,unique_labels,attributes); % �ݹ��ӡ�ڵ�
end
end

function print_level_tab(level)
%     fprintf('Ҷ�ӽڵ㣬node: %d\t������ֵ: %s\n', ...
%         nodeid, node.value);
if level==0
    return ; % ����ӡ
end
for i=1:level
    fprintf('|\t');
end
end

