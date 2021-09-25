%%%%%%%%%%%以下为待写的文本内容，存储在字符串单元数组content中%%%%%%%%
content = {'自动滚屏';... 
'1.可以控制浏览器自动滚动页面，这在浏览一些超长的网页时相当有用。';...
'2.您也可以控制滚动速度，和选择不同的速度控制方式。';...
'3.鼠标控制滚动速度: 把鼠标停留在滚动条上，鼠标指针位置越靠近下方，滚动速度越快。'};
%%%%%%%%%%%以下采用fprintf函数实现写纯文本到文本文件dat1.txt中%%%%%%%%
fid = fopen('dat1.txt', 'wt');                            %以只写、文本模式打开文件dat1.txt
str = str2mat(content);                                 %将字符串单元数组转化为字符数组，便于fprintf函数写操作
format = [repmat('%c', 1, size(str, 2)) '\n'];   %生成格式字符串
fprintf(fid, format, str');                                 %按指定格式将字符数组写入文本文件dat1.txt中
fclose(fid);                                                   %关闭文件dat1.txt
%%%%%%%%%%%以下采用fwrite函数实现写纯文本到文本文件dat2.txt中%%%%%%%%%
fid = fopen('dat2.txt', 'wt');                           %以只写、文本模式打开文件dat2.txt
str = str2mat(content);                                %将字符串单元数组转化为字符数组str，便于fwrite函数写操作
mLine = size(str, 1);                                    %字符数组str的行数
nCol = size(str, 2);                                      %字符数组str的列数
str1 = zeros(mLine, nCol + 2);                   %扩展字符数组str，在最右侧添加两列字符：'\r\n'
str1(:, 1 : end-2) = str;
str1(:, end-1 : end) = char(repmat(sprintf('\r\n'), mLine, 1));
fwrite(fid, str1', 'char');                                 %将新生成的字符数组写入文件dat2.txt中
fclose(fid);                                                   %关闭文件dat2.txt
