Image=cell(1,19);
Dataleft=cell(1,19);
Dataright=cell(1,19);
Gray=cell(1,19);
Mythresh=zeros(1,19);

for index=0:18
    Image{index+1}=imread(['D:\用户目录\我的文档\MATLAB\作业5\附件1\',sprintf('%03d',index),'.bmp'],'bmp');
    Mythresh(1,index+1) = OTSU(Image{index+1}); %利用OTSU算法确定二值化阈值
    Gray{index+1} = im2bw(Image{index+1},Mythresh(1,index+1)); %对图像二值化
    Dataleft{index+1}=Gray{index+1}(1:end,1);
    Dataright{index+1}=Gray{index+1}(1:end,72);
end

fida = fopen('Data11bin.txt','wt');
for index=0:18
    fprintf(fida,'%g\t',Dataright{index+1});
    fprintf(fida,'\n');
end
fclose(fida);

fidb = fopen('Data12bin.txt','wt');
for index=0:18
    fprintf(fidb,'%g\t',Dataleft{index+1});
    fprintf(fidb,'\n');
end
fclose(fidb);