fid = fopen('file1.dat','w+');
%打开文件file1.dat
A = [1 : 10];
%创建数组A
count = fwrite(fid,A);
%写入数组A
fseek(fid,3,'bof');
%指针移至第4个元素
count = fwrite(fid,11);
%在该位置写入元素11
fseek(fid,-2,'eof');
%指针移至倒数第2个元素
count = fwrite(fid,12);
%在该位置写入元素12
pos = ftell(fid)
%获取当前指针位置，pos为从0开始的非负整数
fseek(fid,-3,'cof');
%从当前位置往前移3个元素
count = fwrite(fid,13);
%在该位置写入元素13
frewind(fid);
%位置指针移至文件首部
D = fread(fid)
%读出所有元素
fclose(fid);
%关闭文件
