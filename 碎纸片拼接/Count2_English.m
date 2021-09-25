% =========================单面纵横切英文碎纸片拼接=========================

%碎纸片条数
Num=209;

%每个碎纸片的大小
Row=180;
Colum=72;

%文件中的每个图片的像素矩阵
Image=cell(1,Num);

%每幅图片左右两列像素矩阵-特征向量
Dataleft=cell(1,Num);
Dataright=cell(1,Num);
Dataup=cell(1,Num);
Datadown=cell(1,Num);

%左右碎纸片间对比的结果-特征向量差向量
CountLeft=cell(Num,Num);
CountRight=cell(Num,Num);
CountUp=cell(Num,Num);
CountDown=cell(Num,Num);

%灰度化图片
Gray=cell(1,Num);

%灰度图片二值化阈值
Mythresh=zeros(1,Num);


for index=0:Num-1
    Image{index+1}=imread(['D:\用户目录\我的文档\MATLAB\作业5\附件4\',sprintf('%03d',index),'.bmp'],'bmp');
    Mythresh(1,index+1) = OTSU(Image{index+1}); %利用OTSU算法确定二值化阈值
    Gray{index+1} = im2bw(Image{index+1},Mythresh(1,index+1)); %对图像二值化
    Dataleft{index+1}=Gray{index+1}(1:end,1);
    Dataright{index+1}=Gray{index+1}(1:end,Colum);
    Dataup{index+1}=Gray{index+1}(1,1:end);
    Datadown{index+1}=Gray{index+1}(Row,1:end);
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
    
    %查找上方的纸带
    for j=1:Num%要比较的纸带
       CountUp{i,j}(1,1:end)=Dataup{i}(1,1:end)-Datadown{j}(1,1:end); 
    end
    
    %查找下方的纸带
    for j=1:Num%要比较的纸带
       CountDown{i,j}(1,1:end)=Datadown{i}(1,1:end)-Dataup{j}(1,1:end); 
    end
    
end

%计数每两条碎纸片特征向量差向量中0的个数
Cntleft=zeros(Num,Num);
Cntright=zeros(Num,Num);
Cntup=zeros(Num,Num);
Cntdown=zeros(Num,Num);

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
   
   %上方计数
   for j=1:Num
       for k=1:Colum%每个像素的记数
            if(CountUp{i,j}(1,k)==0)
                Cntup(i,j)=Cntup(i,j)+1;
            end
       end
   end
   
   %下方计数
   for j=1:Num
       for k=1:Colum%每个像素的记数
            if(CountDown{i,j}(1,k)==0)
                Cntdown(i,j)=Cntdown(i,j)+1;
            end
       end
   end
end


%找到计数矩阵中每一行中最大值以及对应的index
   Max_right=zeros(Num,1);
   Index_right=zeros(Num,1);
   Max_left=zeros(Num,1);
   Index_left=zeros(Num,1);
   Max_up=zeros(Num,1);
   Index_up=zeros(Num,1);
   Max_down=zeros(Num,1);
   Index_down=zeros(Num,1);
   
   
   
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
          
          %查找上方最匹配的
          if(Cntup(i,j)>Max_up(i,1))  
                Max_up(i,1)=Cntup(i,j);
                Index_up(i,1)=j;
          end
          
          %查找下方最匹配的
          if(Cntdown(i,j)>Max_down(i,1))  
                Max_down(i,1)=Cntdown(i,j);
                Index_down(i,1)=j;
          end
          
      end
   end
   
   
   
   

