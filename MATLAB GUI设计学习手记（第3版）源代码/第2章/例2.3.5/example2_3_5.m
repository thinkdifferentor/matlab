dat1 = rand(3, 5)
dlmwrite('dat1.txt', dat1, 'delimiter', '\t', 'newline', 'pc'); %采用dlmwrite函数将dat1写入文本文件dat1.txt中
fid = fopen('dat2.txt', 'wt'); %以只写、文本模式打开或创建文本文件dat2.txt
fprintf(fid, '%5.4f %5.4f %5.4f %5.4f %5.4f\n', dat1'); %采用fprintf函数将dat1写入文件dat2.txt中
fclose(fid); %关闭文件dat2.txt
