%�Թ����͵㲥�����ƥ��
clc,clear

%�������� ��Ŀ����/���
Rules=importdata('Rules.mat');
L1=length(Rules);

%����㲥��Ϣ �û���/��Ŀ����/�ۿ�ʱ��/��Ӧ���(��Ҫƥ����)
Select=importdata('Select.mat');
L2=length(Select);

tic
%��ʼƥ��
for i=1:L2%�ó�һ���㲥��¼
    for j=1:L1%�ڹ������ƥ��
       if( Compare(Rules(j).name,Select(i).name) )
            Select(i).mid=Rules(j).id;
            break;
       end
    end
end
toc

save('Result','Select');%��'Select'�����洢

% Rules(1).name,Select(1).name
% n=length(a);
% for i=1:n
%     Select(i).uid=a(i);
%     Select(i).name=b{i};
%     Select(i).time=c(i);
%     Select(i).mid=0; 
% end


