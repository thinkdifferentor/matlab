%% ���ɷַ��� ��ά
clear;
% ������ʼ��
inputfile = '../data/principal_component.xls';
outputfile = '../tmp/dimention_reducted.xls'; % ��ά�������
proportion = 0.95 ; % ���ɷֵı���

%% ���ݶ�ȡ
[num,~] = xlsread(inputfile);

%% ���ɷַ���
[coeff,~,latent] = pca(num);

%% �����ۼƹ����ʣ�ȷ��ά��
sum_latent = cumsum(latent/sum(latent)); % �ۼƹ�����
dimension = find(sum_latent>proportion);
dimension= dimension(1);

%% ��ά
data = num * coeff(:,1:dimension); 
xlswrite(outputfile,data);
disp('���ɷ���������');
disp(latent');
disp('���ɷֵ�λ��������');
disp(coeff);
disp('�ۼƹ�����');
disp(sum_latent');
disp(['���ɷַ�����ɣ���ά���������' outputfile]);