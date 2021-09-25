a = rand(1,10) - 0.5            %产生随机数组
fid = fopen('file1.txt','w');   %打开文件准备写
fprintf(fid,'%8.4f',a);         %写入随机数组a
fclose(fid);                    %关闭文件

fid = fopen('file1.txt','r');  %打开文件准备读
b = fscanf(fid,'%f')           %用fscanf读
fclose(fid);                   %关闭文件

fid = fopen('file1.txt','r');  %打开文件准备读
c = textscan(fid,'%f');        %用textscan读
fclose(fid);                   %关闭文件
c{:}                           %显示读取到的单元数组

