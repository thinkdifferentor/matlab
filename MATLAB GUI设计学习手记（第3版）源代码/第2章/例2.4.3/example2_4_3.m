imageFile = 'restart.png';  %ͼƬ����Ĭ��Ϊ��ǰ·���µ��ļ�
stepX = 4;                         %X�᷽��Ĳ���;��ͼƬ�Ƚϴ�ʱ�������ֵ�ʵ�ȡ��

stepY = 2 * stepX;             %Y�᷽��Ĳ�������ʾ�ı�ʱ��ÿ���ַ��ĸ߶ȴ�Լ�����ȵ�2��
cData = imread(imageFile);
cData = mean(cData, 3);

nLines = floor(size(cData, 1) / stepY);      %���ɷ��ž��������
nColumns = floor(size(cData, 2) / stepX); %���ɷ��ž��������

%������������������������M/2/stepX��N/stepX�ľ����������������������
%%%%%%%%%%%%%%%%%%%%����1����������%%%%%%%%%%%
tic;     %��¼���δ��뿪ʼִ�е�ʱ��
temp1 = cData(1 : nLines*stepY, 1 : nColumns*stepX);   %��ȡ��Ч��ͼ������
temp2 = reshape(temp1, stepY, []);                                  %��ͼ�����ݵ���������ΪstepY
temp3 = mean(temp2, 1);                                                  %��ÿ������ȡ��ֵ
temp4 = reshape(temp3, nLines, []);                                  %��ͼ�����ݵ���������ΪnLines
temp5 = reshape(temp4', stepX, []);                                   %��temp4ת�ã�Ȼ����������ΪstepX
temp6 = mean(temp5, 1);                                                   %��ÿ������ȡ��ֵ
temp7 = reshape(temp6, nColumns, nLines);                    %������������������ΪnColumns��nLines
matrix = temp7';                                                                  % temp7ת�õõ�����ľ���
toc
%toc���أ�Elapsed time is 0.009063 seconds.

%%%%%%%%%%%%%%%%%%%%����2��ѭ������%%%%%%%%%%%%
tic;
matrix = zeros(nLines, nColumns);                                     %Ϊ�������Ԥ����ռ�
for i = 1 : stepX,                                                                  %X�����λ�ƣ���ѭ������С��ѭ���������
    for j = 1 : stepY,                                                              %Y�����λ��
        matrix = matrix + cData(j : stepY : (nLines-1)*stepY+j, ...
                                               i : stepX : (nColumns-1)*stepX+i);
    end
end                                                                                      %matrix��ÿ�����ص��stepX��stepY��Ԫ�ص���
matrix = matrix / stepX / stepY;                                           % �õ������matrix
toc
%toc����Elapsed time is 0.012645 seconds.
%������������������������������2�δ�����ѡһ�Ρ�������������������������

table = '.39BHA&G@M#X25Sisr;:,.';%������Խ���м䣬����Խ���ӣ�������ɫԽ��
index = floor(matrix / 256 * length(table)) + 1;   %��matrixת��Ϊ��������
str = table(index);                                      %����������ת��Ϊ�ַ�����

fid = fopen(strcat([imageFile,'.txt']),'w');     %�������Ҫд���ı��ļ�

%�����������������������õ��ķ��ž���strд��򿪵��ı��ļ��С�������������
%%%%%%%%%%%%%%%%%%%%����1��fprintf����ʵ��%%%%%%%%%%
tic;
format = [repmat('%c', 1, size(str, 2)) '\n'];   %���ɸ�ʽ�ַ���
fprintf(fid, format, str');                                 %����ʽ�ַ������ַ�����д��򿪵��ı���
toc
%toc���أ�Elapsed time is 0.246159 seconds.

%%%%%%%%%%%%%%%%%%%%����2��fwrite����ʵ��%%%%%%%%%%
tic;
mLine = size(str, 1);                                    %�ַ�����str������
nCol = size(str, 2);                                      %�ַ�����str������
str1 = zeros(mLine, nCol + 2);                   %��չ�ַ�����str�������Ҳ���������ַ���'\r\n'
str1(:, 1 : end-2) = str;
str1(:, end-1 : end) = repmat(sprintf('\r\n'), mLine, 1);
fwrite(fid, str1', 'char');                                 %�������ɵ��ַ�����д���ļ�dat2.txt��
toc
%toc���أ�Elapsed time is 0.016337 seconds.

%%%%%%%%%%%%%%%%%%%%����3:fwriteѭ��ʵ��%%%%%%%%%%%%%%%%%%%%%%
tic;
for iLine = 1 : nLines,                                  %����д�ַ�����
    fwrite(fid, [str(iLine, :), 13, 10]);               %д��ÿ���ַ������д���ַ���'\r\n'��ʾ����
end
toc
% toc���أ�Elapsed time is 0.000803 seconds.
%������������������������������3�γ�����ѡһ�Ρ�������������������������

fclose(fid);                                                    %�ر����ɵ��ı��ļ�
