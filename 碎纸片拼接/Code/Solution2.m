Image=cell(1,209);
Dataleft=cell(1,209);
Dataright=cell(1,209);
Dataup=cell(1,209);
Datadown=cell(1,209);

for index=0:208
    Image{index+1}=imread(['D:\�û�Ŀ¼\�ҵ��ĵ�\MATLAB\��ҵ5\����3\',sprintf('%03d',index),'.bmp'],'bmp');
    %imgGray = rgb2gray(imgRgb); % תΪ�Ҷ�ͼ��
    %thresh = graythresh(Image); %�Զ�ȷ����ֵ����ֵ
    %Gray = im2bw(Image,thresh); %��ͼ���ֵ��
    Dataleft{index+1}=Image{index+1}(1:end,1);
    Dataright{index+1}=Image{index+1}(1:end,72);
    Dataup{index+1}=Image{index+1}(1,1:end);
    Datadown{index+1}=Image{index+1}(180,1:end);
    
end

fida = fopen('Data31.txt','wt');
for index=0:208
    fprintf(fida,'%g\t',Dataright{index+1});
    fprintf(fida,'\n');
end
fclose(fida);

fidb = fopen('Data32.txt','wt');
for index=0:208
    fprintf(fidb,'%g\t',Dataleft{index+1});
    fprintf(fidb,'\n');
end
fclose(fidb);


fidc = fopen('Data33.txt','wt');
for index=0:18
    fprintf(fidc,'%g\t',Dataleft{index+1});
    fprintf(fidc,'\n');
end
fclose(fidc);

fidd = fopen('Data34.txt','wt');
for index=0:208
    fprintf(fidd,'%g\t',Dataleft{index+1});
    fprintf(fidd,'\n');
end
fclose(fidd);

