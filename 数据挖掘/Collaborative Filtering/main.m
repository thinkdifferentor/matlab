% ������
clear,clc;

%��ȡ�û�id�б�
users = load('Uid.mat');

%��ȡ�û���
[userNum,v]=size(users);

a=recommend(1)
% %��ÿһλ�û��Ƽ���Ӱ
% for i=1:1
%     recommendMatrix{:,i}=recommend(i);
% end
% 
% %�Ƽ����ݱ���
% % save('recommendMatrix.mat','recommendMatrix');
% recommendMatrix