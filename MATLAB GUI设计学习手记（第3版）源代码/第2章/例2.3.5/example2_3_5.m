dat1 = rand(3, 5)
dlmwrite('dat1.txt', dat1, 'delimiter', '\t', 'newline', 'pc'); %����dlmwrite������dat1д���ı��ļ�dat1.txt��
fid = fopen('dat2.txt', 'wt'); %��ֻд���ı�ģʽ�򿪻򴴽��ı��ļ�dat2.txt
fprintf(fid, '%5.4f %5.4f %5.4f %5.4f %5.4f\n', dat1'); %����fprintf������dat1д���ļ�dat2.txt��
fclose(fid); %�ر��ļ�dat2.txt
