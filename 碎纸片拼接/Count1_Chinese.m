%%=========================单面纵切中文碎纸片拼接============================

clear,clc
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



%灰度化图片
Gray=cell(1,Num);

%灰度图片二值化阈值
Mythresh=zeros(1,Num);

tic;

%%图片读入(下标从1开始)
for index=0:Num-1
    Image{1,index+1}=imread(['附件1\',sprintf('%03d',index),'.bmp'],'bmp');
    Mythresh(1,index+1) = OTSU(Image{1,index+1}); %利用OTSU算法确定二值化阈值
    Gray{1,index+1} = im2bw(Image{1,index+1},Mythresh(1,index+1)); %对图像二值化
    Dataleft{1,index+1}=Gray{1,index+1}(1:end,1);
    Dataright{1,index+1}=Gray{1,index+1}(1:end,Colum);
end

%记录最左侧和最右侧的纸带
Left_max=0;
Right_max=0;


%% 两端纸条查找
for i=1:Num
    
    %查找最左侧--纸条右端像素为1(空白)
    if(Dataleft{i}(1:end,1)==1)
        Left_max=i;
    end
    
end


%% 纸条间特征向量的对比

%左右碎纸片间对比的结果--特征向量差向量
CountLeft=cell(Num,Num);
CountRight=cell(Num,Num);

for i=1:Num%当前纸带

    
    %查找右边的纸带
    for j=1:Num%要比较的纸带
         CountRight{i,j}(:,1)=Dataright{i}(:,1)-Dataleft{j}(:,1); 
    end
    
end



%% 计数每两条碎纸片特征向量差向量中0的个数
Cntright=zeros(Num,Num);

for i=1:Num%当前Count
 
   %右侧计数
   for j=1:Num
       for k=1:Row%每个像素的记数
            if(CountRight{i,j}(k,1)==0)
                Cntright(i,j)=Cntright(i,j)+1;
            end
       end
   end
 
end


%% 找到计数矩阵中每一行中最大值以及对应的index
% Max_right=zeros(Num,1);
% Index_right=zeros(Num,1);

%库函数调用--返回每一行的最大值以及最大值下标
[Max_right,Index_right]=max(Cntright,[],2);

% for i=1:Num
%       for j=1:Num
%            
%            %查找右侧最匹配的
%           if(Cntright(i,j)>Max_right(i,1))
%                 Max_right(i,1)=Cntright(i,j);
%                 Index_right(i,1)=j;
%           end
%           
%       end
% end
   
   
%% 排序   
Sorted=zeros(1,Num);   
Sorted(1,1)=Left_max;
% Sorted(1,Num)=Right_max;
tmp=Left_max;

%匹配序列输出
for i=2:Num
    %找到右边的纸带
    Sorted(1,i)=Index_right(tmp);
    tmp=Index_right(tmp);
end


%合成一张图片
ImageSorted=cell(1,Num);
for i=1:Num
    ImageSorted{1,i}=Image{Sorted(1,i)};
end
      
Img=cell2mat(ImageSorted);

%输出匹配结果
imshow(Img);

toc;

%保存文件
imwrite(Img,'附件1\Solution_Chinese.bmp','bmp');


