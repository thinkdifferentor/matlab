dat1 = importdata('data2.txt', ' ', 1)    %����importdata������ȡ���ļ��������Ϊ�ո�������ͷ��1��
dat1.data                 %dat1Ϊһ���ṹ�壬��������ֵ��
dat1.textdata           %����dat1���ı����ݶΣ�����1�к͵�1�С�����ֵ��洢�ڸö���
[a, b, c, d] = textread('data2.txt', '%s %f %f %f', 'headerlines', 1)    %����textread������ȡ���ļ���������1��
fid = fopen('data2.txt');            %��ֻ��ģʽ��data2.txt������textscan��ȡ���ļ�����
dat2 = textscan(fid, '%s %f %f %f', 'HeaderLines', 1)    %����textscan������ȡ���ļ���������1��
dat2{:}
fclose(fid);                               %�ر��ļ�
