dat1 = importdata('fun.m')                                %����importdata��ȡ���ݣ������ַ�����Ԫ����
dat2 = textread('fun.m', '%s', 'delimiter', '\n')     %����textread��ȡ���ݣ������ַ�����Ԫ����
fid = fopen('fun.m', 'rt');                                      %��ֻ�����ı���ʽ�򿪸��ļ�
dat3 = textscan(fid, '%s', 'delimiter', '\n')            %����textscan��ȡ���ݣ������ַ�����Ԫ����
dat3{:}                                                               %�鿴textscan��ȡ������������
frewind(fid);                                                       %���ļ�ָ���Ƶ��ļ���ͷ�������ٴζ�ȡ�ļ�����
dat4 = fread(fid);                                                %����fread������ȡ���ݣ������ı��ַ���ASCIIֵ
dat5 = char(dat4')                                              %���ı��ַ���ASCIIֵת��Ϊ�ַ���
fclose(fid);                                                           %�ر��ļ�
