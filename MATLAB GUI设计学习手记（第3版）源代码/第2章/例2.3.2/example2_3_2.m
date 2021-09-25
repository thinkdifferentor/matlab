dat1 = importdata('fun.m')                                %采用importdata读取数据，返回字符串单元数组
dat2 = textread('fun.m', '%s', 'delimiter', '\n')     %采用textread读取数据，返回字符串单元数组
fid = fopen('fun.m', 'rt');                                      %以只读、文本方式打开该文件
dat3 = textscan(fid, '%s', 'delimiter', '\n')            %采用textscan读取数据，返回字符串单元数组
dat3{:}                                                               %查看textscan读取到的数据内容
frewind(fid);                                                       %将文件指针移到文件开头，便于再次读取文件内容
dat4 = fread(fid);                                                %采用fread函数读取数据，返回文本字符的ASCII值
dat5 = char(dat4')                                              %将文本字符的ASCII值转化为字符串
fclose(fid);                                                           %关闭文件
