fid = fopen('file1.dat','w+');
%���ļ�file1.dat
A = [1 : 10];
%��������A
count = fwrite(fid,A);
%д������A
fseek(fid,3,'bof');
%ָ��������4��Ԫ��
count = fwrite(fid,11);
%�ڸ�λ��д��Ԫ��11
fseek(fid,-2,'eof');
%ָ������������2��Ԫ��
count = fwrite(fid,12);
%�ڸ�λ��д��Ԫ��12
pos = ftell(fid)
%��ȡ��ǰָ��λ�ã�posΪ��0��ʼ�ķǸ�����
fseek(fid,-3,'cof');
%�ӵ�ǰλ����ǰ��3��Ԫ��
count = fwrite(fid,13);
%�ڸ�λ��д��Ԫ��13
frewind(fid);
%λ��ָ�������ļ��ײ�
D = fread(fid)
%��������Ԫ��
fclose(fid);
%�ر��ļ�
