Image=cell(1,19);
Dataleft=cell(1,19);
Dataright=cell(1,19);

for index=0:18
    Image{index+1}=imread(['D:\用户目录\我的文档\MATLAB\作业5\附件2\',sprintf('%03d',index),'.bmp'],'bmp');
    %imgGray = rgb2gray(imgRgb); % 转为灰度图像
    %thresh = graythresh(Image); %自动确定二值化阈值
    %Gray = im2bw(Image,thresh); %对图像二值化
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