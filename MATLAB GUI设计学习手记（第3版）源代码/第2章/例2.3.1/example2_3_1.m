format long g                   %������ֵ��ʾ��ʽΪlong g����ȡ������ͳ������ʽ����õ�
dat1 = load('data1.txt')     %����load������ȡ���ļ�
dat2 = importdata('data1.txt')  %����importdata������ȡ���ļ�
[a, b, c, d] = textread('data1.txt', '%2d %8.3f %8.3f %7.3f')     %ʹ��textread������ȡ���ļ���4����������
fid = fopen('data1.txt');                   %��ֻ��ģʽ�򿪸��ı��ļ���Ϊfscanf��textscan�����Ķ�ȡ������׼��
dat3 = fscanf(fid, '%g', [4, inf])       %����fscanf������ȡ���ļ������ж���������ʾ�����л���
frewind(fid);                                   %���ļ�ָ���Ƶ��ļ���ͷ
dat4 = textscan(fid, '%2d %8.3f %8.3f %7.3f')    %����textscan������ȡ�ı��ļ�����ֵ����Ԫ������
dat4{:}            %�鿴�õ�Ԫ����
fclose(fid);                             %�������˹رո��ļ�
fid = fopen('data1.txt', 'rt');     %���ı�ģʽ�򿪸��ļ�
dat5 = fread(fid);                    %��ȡ���ı��������ַ���������ASCIIֵ
str5 = char(dat5')                    %��ASCIIֵת��Ϊ�ַ���
dat6 = str2num(str5)           %���ַ�����ȡ��ֵ����
fclose(fid);                          %�������˹رո��ļ�

