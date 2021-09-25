%碎纸片条数
Num=19;

%每个碎纸片的大小
Row=1980;
Colum=72;

%文件中的每个图片的像素矩阵
Image=cell(1,Num);

%每幅图片左右两列像素矩阵-特征向量
Dataleft=cell(1,Num);
Dataright=cell(1,Num);

%左右碎纸片间对比的结果-特征向量差向量
CountLeft=cell(Num,Num);
CountRight=cell(Num,Num);

%灰度化图片
Gray=cell(1,Num);

%灰度图片二值化阈值
Mythresh=zeros(1,Num);

for index=0:Num-1
    Image{index+1}=imread(['D:\用户目录\我的文档\MATLAB\作业5\附件1\',sprintf('%03d',index),'.bmp'],'bmp');
    Mythresh(1,index+1) = OTSU(Image{index+1}); %利用OTSU算法确定二值化阈值
    Gray{index+1} = im2bw(Image{index+1},Mythresh(1,index+1)); %对图像二值化
    Dataleft{index+1}=Gray{index+1}(1:end,1);
    Dataright{index+1}=Gray{index+1}(1:end,Colum);
end


%记录最左侧和最右侧的纸带
Left_max=0;
Right_max=0;

for i=1:Num
    
    %查找最左侧
    if(Dataleft{i}(1:end,1)==1)
        Left_max=i;
    end
    
    
    %查找最右侧
    if(Dataright{i}(1:end,1)==1)
       Right_max=i;
    end
    
end

for i=1:Num%当前纸带
   
    %查找左边的纸带
    for j=1:Num%要比较的纸带
       CountLeft{i,j}(1:end,1)=Dataleft{i}(1:end,1)-Dataright{j}(1:end,1); 
    end
    
    %查找右边的纸带
    for j=1:Num%要比较的纸带
       CountRight{i,j}(1:end,1)=Dataright{i}(1:end,1)-Dataleft{j}(1:end,1); 
    end
    
end



%计数每两条碎纸片特征向量差向量中0的个数
Cntleft=zeros(Num,Num);
Cntright=zeros(Num,Num);

for i=1:Num%当前Count
   
    %左侧计数
   for j=1:Num
       for k=1:Row%每个像素的记数
            if(CountLeft{i,j}(k,1)==0)
                Cntleft(i,j)=Cntleft(i,j)+1;
            end
       end
   end
   
   %右侧计数
   for j=1:Num
       for k=1:Row%每个像素的记数
            if(CountRight{i,j}(k,1)==0)
                Cntright(i,j)=Cntright(i,j)+1;
            end
       end
   end
   
    
end


%找到计数矩阵中每一行中最大值以及对应的index
Max_right=zeros(Num,1);
Index_right=zeros(Num,1);
Max_left=zeros(Num,1);
Index_left=zeros(Num,1);
   
for i=1:Num
      for j=1:Num
           
           %查找右侧最匹配的
          if(Cntright(i,j)>Max_right(i,1))
                Max_right(i,1)=Cntright(i,j);
                Index_right(i,1)=j;
          end
          
          %查找左侧最匹配的
          if(Cntleft(i,j)>Max_left(i,1))  
                Max_left(i,1)=Cntleft(i,j);
                Index_left(i,1)=j;
          end
          
      end
end
   
   
   
Sorted=zeros(1,Num);   
Sorted(1,1)=Left_max;
Sorted(1,Num)=Right_max;
tmp=Left_max;

%匹配序列输出
for i=2:Num-1
    %找到右边的纸带
    Sorted(1,i)=Index_right(tmp);
    tmp=Index_right(tmp);
end


%合成一张图片
ImageSorted=cell(1,Num);
for i=1:Num
    ImageSorted{1,i}=Image{Sorted(1,i)};
end
      
%合成一个矩阵
%Img=zeros(Row,Colum);
% for i=1:Num
%     Img=Img+ImageSorted{1,i};
% end
Img=cell2mat(ImageSorted);

%输出匹配结果
imshow(Img);

%保存文件
imwrite(Img,'D:\用户目录\我的文档\MATLAB\作业5\附件1\Solution_Chinese.bmp','bmp');


