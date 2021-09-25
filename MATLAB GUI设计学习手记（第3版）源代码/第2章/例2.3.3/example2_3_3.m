dat1 = importdata('data2.txt', ' ', 1)    %采用importdata函数读取该文件，间隔符为空格，跳过开头第1行
dat1.data                 %dat1为一个结构体，返回其数值段
dat1.textdata           %返回dat1的文本数据段，即第1行和第1列。非数值项都存储在该段内
[a, b, c, d] = textread('data2.txt', '%s %f %f %f', 'headerlines', 1)    %采用textread函数读取该文件，跳过第1行
fid = fopen('data2.txt');            %以只读模式打开data2.txt，便于textscan读取该文件数据
dat2 = textscan(fid, '%s %f %f %f', 'HeaderLines', 1)    %采用textscan函数读取该文件，跳过第1行
dat2{:}
fclose(fid);                               %关闭文件
