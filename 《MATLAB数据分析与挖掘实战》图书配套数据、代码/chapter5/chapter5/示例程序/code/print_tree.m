function [nodeids_,nodevalue_] = print_tree(tree)
%% ��ӡ�����������Ĺ�ϵ����
global nodeid nodeids nodevalue;
nodeids(1)=0; % ���ڵ��ֵΪ0
nodeid=0;
nodevalue={};
if isempty(tree) 
    disp('������');
    return ;
end

queue = queue_push([],tree);
while ~isempty(queue) % ���в�Ϊ��
     [node,queue] = queue_pop(queue); % ������
     
     visit(node,queue_curr_size(queue));
     if ~strcmp(node.left,'null') % ��������Ϊ��
        queue = queue_push(queue,node.left); % ����
     end
     if ~strcmp(node.right,'null') % ��������Ϊ��
        queue = queue_push(queue,node.right); % ����
     end
end

%% ���� �ڵ��ϵ������treeplot��ͼ
nodeids_=nodeids;
nodevalue_=nodevalue;
end

function visit(node,length_)
%% ����node �ڵ㣬����������ֵΪnodeid�Ľڵ�
    global nodeid nodeids nodevalue;
    if isleaf(node)
        nodeid=nodeid+1;
        fprintf('Ҷ�ӽڵ㣬node: %d\t������ֵ: %s\n', ...
        nodeid, node.value);
        nodevalue{1,nodeid}=node.value;
    else % Ҫô��Ҷ�ӽڵ㣬Ҫô����
        %if isleaf(node.left) && ~isleaf(node.right) % ���ΪҶ�ӽڵ�,�ұ߲���
        nodeid=nodeid+1;
        nodeids(nodeid+length_+1)=nodeid;
        nodeids(nodeid+length_+2)=nodeid;
        
        fprintf('node: %d\t����ֵ: %s\t��������Ϊ�ڵ㣺node%d��������Ϊ�ڵ㣺node%d\n', ...
        nodeid, node.value,nodeid+length_+1,nodeid+length_+2);
        nodevalue{1,nodeid}=node.value;
    end
end

function flag = isleaf(node)
%% �Ƿ���Ҷ�ӽڵ�
    if strcmp(node.left,'null') && strcmp(node.right,'null') % ���Ҷ�Ϊ��
        flag =1;
    else
        flag=0;
    end
end