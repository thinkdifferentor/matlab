Image=cell(1,19);
Dataleft=cell(1,19);
Dataright=cell(1,19);

for index=0:18
    Image{index+1}=imread(['D:\�û�Ŀ¼\�ҵ��ĵ�\MATLAB\��ҵ5\����2\',sprintf('%03d',index),'.bmp'],'bmp');
    %imgGray = rgb2gray(imgRgb); % תΪ�Ҷ�ͼ��
    %thresh = graythresh(Image); %�Զ�ȷ����ֵ����ֵ
    %Gray = im2bw(Image,thresh); %��ͼ���ֵ��
    Dataleft{index+1}=Image{index+1}(1:end,1);
    Dataright{index+1}=Image{index+1}(1:end,72);
end


fida = fopen('Data21.txt','wt');
for index=0:18
    fprintf(fida,'%g\t',Dataright{index+1});
    fprintf(fida,'\n');
end
fclose(fida);

fidb = fopen('Data22.txt','wt');
for index=0:18
    fprintf(fidb,'%g\t',Dataleft{index+1});
    fprintf(fidb,'\n');
end
fclose(fidb);