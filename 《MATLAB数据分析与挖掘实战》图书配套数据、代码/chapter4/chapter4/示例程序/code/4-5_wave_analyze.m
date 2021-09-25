%% ����С������ ������������
clear;
% ������ʼ��
level =5;
load leleccum;
signal = leleccum(1:3920);

%% ���� level��С���ֽ�
[C,S] = wavedec2(signal,level,'bior3.7');

%% ��ȡ��i��С��ϵ��,�������������ֵ
E=zeros(1,level);
for i=1:level
    [H_i,~,~] = detcoef2('all',C,S,i);
    E(1,i)=norm(H_i,'fro');
end

%% ��ӡ��������ֵ������ȡ������ֵ
disp('�����ź�С��������ɣ���ȡ����������Ϊ��');
disp(E);