Image=cell(1,209);
Dataleft=cell(1,209);
Dataright=cell(1,209);
Gray=cell(1,209);
Mythresh=zeros(1,209);
Dataup=cell(1,209);
Datadown=cell(1,209);


for index=0:208
    
    Image{index+1}=imread(['D:\用户目录\我的文档\MATLAB\作业5\附件3\',sprintf('%03d',index),'.bmp'],'bmp');
    Mythresh(1,index+1) = OTSU(Image{index+1}); %利用OTSU算法确定二值化阈值
    Gray{index+1} = im2bw(Image{index+1},Mythresh(1,index+1)); %对图像二值化
    Dataleft{index+1}=Gray{index+1}(1:end,1);
    Dataright{index+1}=Gray{index+1}(1:end,72);
    Dataup{index+1}=Gray{index+1}(1,1:end);
    Datadown{index+1}=Gray{index+1}(180,1:end);
    
end

fida = fopen('Data31bin.txt','wt');
for index=0:208
    fprintf(fida,'%g\t',Dataright{index+1});
    fprintf(fida,'\n');
end
fclose(fida);

fidb = fopen('Data32bin.txt','wt');
for index=0:208
    fprintf(fidb,'%g\t',Dataleft{index+1});
    fprintf(fidb,'\n');
end
fclose(fidb);


fidc = fopen('Data33bin.txt','wt');
for index=0:208
    fprintf(fidc,'%g\t',Dataleft{index+1});
    fprintf(fidc,'\n');
end
fclose(fidc);

fidd = fopen('Data34bin.txt','wt');
for index=0:208
    fprintf(fidd,'%g\t',Dataleft{index+1});
    fprintf(fidd,'\n');
end
fclose(fidd);