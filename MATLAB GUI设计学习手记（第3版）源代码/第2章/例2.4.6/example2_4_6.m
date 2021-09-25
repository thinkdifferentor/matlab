x = '45438971';   %x为输入的16进制数
data = hex2dec(x); %将x转化为十进制数值
fid = fopen('temp.txt', 'wt'); %创建一个临时文件temp.txt
fwrite(fid, data, 'int32'); %以int32格式将该数值写入临时文件temp.txt中
fclose(fid); %关闭该文件
fid = fopen('temp.txt', 'rb'); %以二进制读模式打开文件temp.txt
y = fread(fid, 'float32'); %以float32格式读取该数值
fclose(fid); %关闭文件temp.txt
delete('temp.txt'); %删除该临时文件
