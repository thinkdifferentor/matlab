%ƥ�����ݻ�ȡ
clc,clear;

%����ƥ����Ϣ �û���/��Ŀ����/�ۿ�ʱ��/��Ӧ���(��Ҫƥ����)
Select=importdata('Result.mat');

n=length(Select);

for i=1:n
    Mid(i)=Select(i).mid;
end

Mid=Mid';


%����ƥ����Ϣ �û���/��Ŀ����/�ۿ�ʱ��/��Ӧ���(��Ҫƥ����)
% Select=importdata('Select.mat');
% 
% n=length(Select);
% 
% for i=1:n
%     Select(i).name=name{i};
% end
