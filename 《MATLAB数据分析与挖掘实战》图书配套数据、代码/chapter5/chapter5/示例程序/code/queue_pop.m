function [ item,newqueue ] = queue_pop( queue )
%% ���ʶ���

if isempty(queue)
    disp('����Ϊ�գ����ܷ��ʣ�');
    return;
end

item = queue(1); % ��һ��Ԫ�ص���
newqueue=queue(2:end); % �����ƶ�һ��Ԫ��λ��

end

