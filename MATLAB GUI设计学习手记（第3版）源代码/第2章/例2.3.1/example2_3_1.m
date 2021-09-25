format long g                   %设置数值显示方式为long g，即取长定点和长浮点格式中最好的
dat1 = load('data1.txt')     %采用load函数读取该文件
dat2 = importdata('data1.txt')  %采用importdata函数读取该文件
[a, b, c, d] = textread('data1.txt', '%2d %8.3f %8.3f %7.3f')     %使用textread函数读取该文件到4个列向量中
fid = fopen('data1.txt');                   %以只读模式打开该文本文件，为fscanf和textscan函数的读取操作做准备
dat3 = fscanf(fid, '%g', [4, inf])       %采用fscanf函数读取该文件，逐列读，逐行显示。行列互换
frewind(fid);                                   %将文件指针移到文件开头
dat4 = textscan(fid, '%2d %8.3f %8.3f %7.3f')    %采用textscan函数读取文本文件的数值到单元数组中
dat4{:}            %查看该单元数组
fclose(fid);                             %最后别忘了关闭该文件
fid = fopen('data1.txt', 'rt');     %以文本模式打开该文件
dat5 = fread(fid);                    %读取该文本的所有字符，返回其ASCII值
str5 = char(dat5')                    %将ASCII值转化为字符串
dat6 = str2num(str5)           %由字符串获取数值数组
fclose(fid);                          %最后别忘了关闭该文件

