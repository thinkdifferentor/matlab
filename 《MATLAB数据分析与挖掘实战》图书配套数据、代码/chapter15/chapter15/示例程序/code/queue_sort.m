function queue = queue_sort(queue,num,type)
%% ����
% queue�� �����ݽṹΪ�� {'attrIndex',attrIndex,'stateIndex',stateIndex,...
%  'stateCount', stateCount,'allCount',allCount,'support',support,'lessThan',lessThan}
% num �����������ǰnum��
% type��������� 'descend':���� ��'ascend'�� ����

% �Ȱ�stateCount ���������ٰ�support��������
% �����������յ��������Ȱ�support��������Ȼ����stateCount ��������

% [~,b_i] = sort([queue.stateCount],'descend');
cols = size(queue,2);
if cols<=0
   return ; 
end
[~,b_i] = sort([queue.stateCount],type);
tmp= queue(b_i);
% [~,bb_i]=sort([tmp.support],'descend');
[~,bb_i]=sort([tmp.support],type);
queue = tmp(bb_i);
cols =size(queue,2);
if num>cols % queue��û����ô�����ݣ��������ֱ�ӷ��ؼ���
    return; 
end
queue =queue(1,1:num);
end