clear,clc

% 碎纸片的数目
Num=19;


%每个碎纸片的大小
Row=1980;
Colum=72;

%图像导入
for i=1:Num
    if(i<11)
        F(:,:,i)=imread(['附件1\00',num2str(i-1),'.bmp']);
    else
        F(:,:,i)=imread(['附件1\0',num2str(i-1),'.bmp']);
    end
    
    %二值化
    B(:,:,i)=im2bw(F(:,:,i),250/255);
    
    %分别去碎纸片的左右两端的像素
    Q(:,1,i)=B(:,1,i);          %左端
    Q(:,2,i)=B(:,Colum,i);      %右端
end

%定义结果数组
result=zeros(Num,1);

%找首列--左端像素值全为1
y=ones(Row,1);
for i=1:Num
    if(Q(:,1,i)==y)
        result(1)=i;%记录序号
    end
end


%找尾列-右端端像素值全为1
for i=1:Num
    if(Q(:,2,i)==y)
        result(Num)=i;%记录序号
    end
end


% 中间(17张)匹配，从首至尾的方向
 for i=1:Num-2 %当前纸带
     
     %定义距离数组并初始化为-1
     d=ones(Num,1);
     d=d.*(-1);
     
     %距离计算
     for j=1:Num%对比纸带
         
         fg=0;
         %当前碎纸片不与自己计算距离
         for t=1:Num
            if(j==result(t))
                fg=1;
            end
         end
         
         %不是自己
         if(fg==0)
             %最后一条纸带
             if(i==17)
                result(i+1)=j;
                break;
             end
             
             %当前纸带的右侧像素数据减对比纸带的左侧像素数据并取其欧氏距离
             r=0;
             for k=1:Row
                 r=r+(double(Q(k,2,result(i)))-double(Q(k,1,j)))^2;
             end
             d(j)=sqrt(double(r));
         end
     end
     
     
     %得到一组欧氏距离进行查找排序
     if(i~=17)
         %将与当前纸带相距最远的放到没有被放置过的位置
         dmax=max(d);
         for k=1:Num
             if(d(k)==(-1))
                 d(k)=dmax;
             end
         end
         
         %将与当前纸带相距最近的放到当前纸带的下一个位置
         dmin=min(d);
         for k=1:Num
             if(d(k)==dmin)
                 result(i+1)=k;
                 break;
             end
         end
         
     end
 end


%结果图片的保存和显示
picture=[];

for i=1:Num
    picture=[picture,F(:,:,result(i))];
end

imshow(picture)

imwrite(picture,'附件1\1-1.bmp','bmp');