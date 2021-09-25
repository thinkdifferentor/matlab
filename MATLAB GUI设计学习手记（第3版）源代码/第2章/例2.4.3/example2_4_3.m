imageFile = 'restart.png';  %图片名，默认为当前路径下的文件
stepX = 4;                         %X轴方向的步长;当图片比较大时，建议改值适当取大

stepY = 2 * stepX;             %Y轴方向的步长；显示文本时，每个字符的高度大约是其宽度的2倍
cData = imread(imageFile);
cData = mean(cData, 3);

nLines = floor(size(cData, 1) / stepY);      %生成符号矩阵的行数
nColumns = floor(size(cData, 2) / stepX); %生成符号矩阵的列数

%↓↓↓↓↓↓↓↓↓↓生成M/2/stepX×N/stepX的矩阵↓↓↓↓↓↓↓↓↓↓
%%%%%%%%%%%%%%%%%%%%方法1：矩阵运算%%%%%%%%%%%
tic;     %记录本段代码开始执行的时刻
temp1 = cData(1 : nLines*stepY, 1 : nColumns*stepX);   %截取有效的图像数据
temp2 = reshape(temp1, stepY, []);                                  %将图像数据的行数设置为stepY
temp3 = mean(temp2, 1);                                                  %对每列数据取均值
temp4 = reshape(temp3, nLines, []);                                  %将图像数据的行数设置为nLines
temp5 = reshape(temp4', stepX, []);                                   %将temp4转置，然后行数设置为stepX
temp6 = mean(temp5, 1);                                                   %对每列数据取均值
temp7 = reshape(temp6, nColumns, nLines);                    %将所得数据重新塑形为nColumns×nLines
matrix = temp7';                                                                  % temp7转置得到所求的矩阵
toc
%toc返回：Elapsed time is 0.009063 seconds.

%%%%%%%%%%%%%%%%%%%%方法2：循环运算%%%%%%%%%%%%
tic;
matrix = zeros(nLines, nColumns);                                     %为所求矩阵预分配空间
for i = 1 : stepX,                                                                  %X轴向的位移；将循环次数小的循环放在外层
    for j = 1 : stepY,                                                              %Y轴向的位移
        matrix = matrix + cData(j : stepY : (nLines-1)*stepY+j, ...
                                               i : stepX : (nColumns-1)*stepX+i);
    end
end                                                                                      %matrix中每个像素点的stepX×stepY个元素叠加
matrix = matrix / stepX / stepY;                                           % 得到所求的matrix
toc
%toc返回Elapsed time is 0.012645 seconds.
%↑↑↑↑↑↑↑↑↑↑↑↑↑以上2段代码任选一段↑↑↑↑↑↑↑↑↑↑↑↑↑

table = '.39BHA&G@M#X25Sisr;:,.';%索引号越靠中间，符号越复杂，表明颜色越深
index = floor(matrix / 256 * length(table)) + 1;   %将matrix转化为索引矩阵
str = table(index);                                      %将索引矩阵转化为字符矩阵

fid = fopen(strcat([imageFile,'.txt']),'w');     %创建或打开要写的文本文件

%↓↓↓↓↓↓↓↓↓↓将得到的符号矩阵str写入打开的文本文件中↓↓↓↓↓↓↓
%%%%%%%%%%%%%%%%%%%%方法1：fprintf函数实现%%%%%%%%%%
tic;
format = [repmat('%c', 1, size(str, 2)) '\n'];   %生成格式字符串
fprintf(fid, format, str');                                 %按格式字符串将字符矩阵写入打开的文本中
toc
%toc返回：Elapsed time is 0.246159 seconds.

%%%%%%%%%%%%%%%%%%%%方法2：fwrite函数实现%%%%%%%%%%
tic;
mLine = size(str, 1);                                    %字符数组str的行数
nCol = size(str, 2);                                      %字符数组str的列数
str1 = zeros(mLine, nCol + 2);                   %扩展字符数组str，在最右侧添加两列字符：'\r\n'
str1(:, 1 : end-2) = str;
str1(:, end-1 : end) = repmat(sprintf('\r\n'), mLine, 1);
fwrite(fid, str1', 'char');                                 %将新生成的字符数组写入文件dat2.txt中
toc
%toc返回：Elapsed time is 0.016337 seconds.

%%%%%%%%%%%%%%%%%%%%方法3:fwrite循环实现%%%%%%%%%%%%%%%%%%%%%%
tic;
for iLine = 1 : nLines,                                  %逐行写字符矩阵
    fwrite(fid, [str(iLine, :), 13, 10]);               %写完每行字符矩阵后，写入字符串'\r\n'表示换行
end
toc
% toc返回：Elapsed time is 0.000803 seconds.
%↑↑↑↑↑↑↑↑↑↑↑↑↑以上3段程序任选一段↑↑↑↑↑↑↑↑↑↑↑↑↑

fclose(fid);                                                    %关闭生成的文本文件
