%%%%%%%%%%%����Ϊ��д���ı����ݣ��洢���ַ�����Ԫ����content��%%%%%%%%
content = {'�Զ�����';... 
'1.���Կ���������Զ�����ҳ�棬�������һЩ��������ҳʱ�൱���á�';...
'2.��Ҳ���Կ��ƹ����ٶȣ���ѡ��ͬ���ٶȿ��Ʒ�ʽ��';...
'3.�����ƹ����ٶ�: �����ͣ���ڹ������ϣ����ָ��λ��Խ�����·��������ٶ�Խ�졣'};
%%%%%%%%%%%���²���fprintf����ʵ��д���ı����ı��ļ�dat1.txt��%%%%%%%%
fid = fopen('dat1.txt', 'wt');                            %��ֻд���ı�ģʽ���ļ�dat1.txt
str = str2mat(content);                                 %���ַ�����Ԫ����ת��Ϊ�ַ����飬����fprintf����д����
format = [repmat('%c', 1, size(str, 2)) '\n'];   %���ɸ�ʽ�ַ���
fprintf(fid, format, str');                                 %��ָ����ʽ���ַ�����д���ı��ļ�dat1.txt��
fclose(fid);                                                   %�ر��ļ�dat1.txt
%%%%%%%%%%%���²���fwrite����ʵ��д���ı����ı��ļ�dat2.txt��%%%%%%%%%
fid = fopen('dat2.txt', 'wt');                           %��ֻд���ı�ģʽ���ļ�dat2.txt
str = str2mat(content);                                %���ַ�����Ԫ����ת��Ϊ�ַ�����str������fwrite����д����
mLine = size(str, 1);                                    %�ַ�����str������
nCol = size(str, 2);                                      %�ַ�����str������
str1 = zeros(mLine, nCol + 2);                   %��չ�ַ�����str�������Ҳ���������ַ���'\r\n'
str1(:, 1 : end-2) = str;
str1(:, end-1 : end) = char(repmat(sprintf('\r\n'), mLine, 1));
fwrite(fid, str1', 'char');                                 %�������ɵ��ַ�����д���ļ�dat2.txt��
fclose(fid);                                                   %�ر��ļ�dat2.txt
