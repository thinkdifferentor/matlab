%% ����ͼ���и�
clear;
% ������ʼ��
sourcefile='../data/1_1.jpg';   % ԭʼͼ��·������
destfile='../tmp/1_1_processed.jpg';  % �и��ͼ��·������

%% ��ȡͼ�񲢽�ȡ
image_i= imread(sourcefile);
[width,length,z]=size(image_i);
subimage= image_i(fix(width/2)-50:fix(width/2)+50,fix(length/2)-50:fix(length/2)+50,:);

%% �����и�������
imwrite(subimage,destfile);
disp([sourcefile 'ͼƬ��ȡ��ɣ�']);
