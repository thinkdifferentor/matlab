function [train, test] = split2train_test( input,proportion )
%% ���������������Ϊѵ���Ͳ�������

% ���������
% input : ԭʼ����,Ĭ��ʹ������Ϊһ������
% proportion: ѵ����������

% ���������
% train:ѵ������
% test����������

rows=size(input,1);
%split=cvpartition(1:rows,'holdout',0.1);
split=randindex(rows,proportion);
train=input(split==0,:);
test=input(split==1,:);

end

function randindex=randindex(n,proportion)
%% ���ظ�������n���Լ������������±�
    randindex=zeros(n,1);
    rng('default'); % �̶����������
    for i=1:n
       if rand(1)>proportion
           randindex(i)=1;
       end
    end
end