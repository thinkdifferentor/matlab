x = '45438971';   %xΪ�����16������
data = hex2dec(x); %��xת��Ϊʮ������ֵ
fid = fopen('temp.txt', 'wt'); %����һ����ʱ�ļ�temp.txt
fwrite(fid, data, 'int32'); %��int32��ʽ������ֵд����ʱ�ļ�temp.txt��
fclose(fid); %�رո��ļ�
fid = fopen('temp.txt', 'rb'); %�Զ����ƶ�ģʽ���ļ�temp.txt
y = fread(fid, 'float32'); %��float32��ʽ��ȡ����ֵ
fclose(fid); %�ر��ļ�temp.txt
delete('temp.txt'); %ɾ������ʱ�ļ�
