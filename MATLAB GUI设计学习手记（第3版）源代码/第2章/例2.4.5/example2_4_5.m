%% �������ļ�����ȡ�ļ����
fid = fopen('data.txt');
%% ������1�У�����ÿ�ж�ȡ��1����ֵ
a = textscan(fid, 'PG%*02d %f %*s', 'HeaderLines', 1, 'Delimiter', '\n');
%% �ر������ļ�
fclose(fid);
