a = rand(1,10) - 0.5            %�����������
fid = fopen('file1.txt','w');   %���ļ�׼��д
fprintf(fid,'%8.4f',a);         %д���������a
fclose(fid);                    %�ر��ļ�

fid = fopen('file1.txt','r');  %���ļ�׼����
b = fscanf(fid,'%f')           %��fscanf��
fclose(fid);                   %�ر��ļ�

fid = fopen('file1.txt','r');  %���ļ�׼����
c = textscan(fid,'%f');        %��textscan��
fclose(fid);                   %�ر��ļ�
c{:}                           %��ʾ��ȡ���ĵ�Ԫ����

