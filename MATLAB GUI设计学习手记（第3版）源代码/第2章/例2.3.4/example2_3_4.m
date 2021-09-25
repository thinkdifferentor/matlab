%%%%%%%以下程序段为采用textread函数读取文本文件并提取数据%%%%%%%%
dat1 = textread('data3.txt', '%s', 'delimiter', '\n')      %采用textread读取该文本文件到字符串单元数组中
n1 = str2num(dat1{3})                                      %提取第三行的数值，即为串口1的帧数
dat1_1 = dat1(6 : 9)                                          %提取串口1的数据到字符串单元数组dat1_1中
dat1_2 = cell2mat(deblank(dat1_1))                  %将字符串单元数组转化为字符数组
dat1_3 = str2num(dat1_2)                                 %将字符数组转化为数值数组
para1 = dat1_3(:, 2)                                           %提取串口1的参数2的值，即数值数组dat1_3的第2列
m = find(strcmp(dat1, '串口2帧数：'))                %找到内容为“串口2帧数：”的行
n2 = str2num(dat1{m + 1})                                   %提取串口2的帧数
dat2_1 = dat1(m+4 : m+4+n2)                              %提取串口2的数据到字符串单元数组dat2_1中
dat2_2 = cell2mat(deblank(dat2_1))                    %将字符串单元数组转化为字符数组
dat2_3 = str2num(dat2_2)                                   %将字符数组转化为数值数组
para2 = dat2_3(:, 1)                                             %提取串口2的参数1的值，即数值数组dat2_3的第1列
%%%%%%%以下程序段为采用textscan函数读取文本文件并提取数据%%%%%%%%
fid = fopen('data3.txt');                                       %以只读模式打开数据文件
n1 = textscan(fid, '%d', 'HeaderLines', 2)           %采用textscan读取两行之后的数据，即为串口1的帧数
n1 = n1{:}                                                           %提取单元数组的单元值，即为串口1的帧数值
dat1 = textscan(fid, '%[^串口]', 'HeaderLines', 2)    %从当前位置跳两行开始读取字符串，直到遇到“串口“等字符
dat1_1 = str2num(dat1{:}{:})      %将上面读到的字符串转化为数值数组。注意，dat1_1为包含回车符的字符串
para1 = dat1_1(:, 2)                  %提取串口1的参数2的值，即为数值数组dat1_1的第2列
n2 = textscan(fid, '%d', 'HeaderLines', 1)         %文件指针跳过1行读取数值，即为串口2的帧数
n2 = n2{:}                                   %提取单元数组的单元值，即为串口1的帧数值
dat2 = textscan(fid, '%s%n%n', 'HeaderLines', 2)       %跳过2行读取串口2的数据到1个1×3的单元数值中
para2 = dat2{2}                                                            %提取串口2的参数1的数值
fclose(fid);                                                                     %关闭数据文件data3.txt
