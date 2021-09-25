% 第2问中文程序代码： 
clear,clc

%碎片总数（下标从零开始）
Num=209;

%确定行列数
%生成全255矩阵
y=ones(180,1);
y=y.*255;
raw=0;

%存中间值
temp=zeros(Num,1);

%标志
fw=0;
fb=0;
fg=0;
BW=ones(Num,2);
BW=BW.*(-1);

%图像导入
for i=1:Num
    if(i<11)
        F(:,:,i)=imread(['附件3\00',num2str(i-1),'.bmp']);
    elseif(i<101)
        F(:,:,i)=imread(['附件3\0',num2str(i-1),'.bmp']);
    else
        F(:,:,i)=imread(['附件3\',num2str(i-1),'.bmp']);
    end
    
    %取首尾列
    Q(:,1,i)=F(:,1,i);
    Q(:,2,i)=F(:,72,i);
    
    %取首尾行
    P(1,:,i)=F(1,:,i);
    P(2,:,i)=F(180,:,i);
    
    %对左边界空白的碎片计数
    if(Q(:,1,i)==y)
        raw=raw+1;
        temp(raw)=i;
    end
    
    %提取碎片的White，black值
    fw=0;
    fb=0;
    fg=0;         
    for j=1:180%每一行
        
        %假设该行为白
        fw=1;
        for t=1:72%每一列  
            
            %出现非白像素值
            if(F(j,t,i)~=255)
                fw=0;%不全白，并标识该行为黑
                if(fb==0)
                    fb=1;
                    BW(i,1)=j;%黑线位置--在该纸片上的多少行为黑
                end
            end
        end
        
        
        if(fw==1&&fg==0)%当前线为全白且没有找到全白的线
            BW(i,2)=j;
            fg=1;
        end
        
        %上一行为全白，该行出现黑色像素
        if(fg==1&&fb==1)%找到了
            break;
        end
    end  
    
end

%分类:两类
% disp(BW);

        
%参数
i=2;

temp(1:raw)%raw 为碎纸片中左侧像素全白的数目

while mod(Num,raw)~=0 %mod取余数运算mod(a,b) 取a/b的余数
    
    k=raw;
    l=1;
    del=zeros(raw,1);
    
    %筛选左侧像素为全白的碎纸片
    for j=1:k  %左侧空白纸片数目
        flag=0;
        for w=1:180  %纸片行数
            %第二列出现不为白的像素
            if(F(w,i,temp(j))~=255)  
                flag=1;
                break;
            end
        end
        
        %第二列出现黑色像素的碎纸片除去
        if(flag==1)
            raw=raw-1;
            del(l)=j;
            l=l+1;
        end
    end
    
    %删除不符合条件的碎片
    l=1;
    while del(l)~=0
        temp(del(l))=[];%删除该位置上的像素数据
        del(l)=[];
        %temp(del(l))=[]会对temp序号产生改变
        while del(l)~=0
            del(l)=del(l)-1;
            l=l+1;
        end
        l=1;
    end
    i=i+1;
    
end


temp(1:raw)
result=zeros(raw,Num/raw);
result(:,1)=temp(1:raw);

for line=1:11
    % 匹配，从首至尾的方向
     for i=1:18
         %可能情况,人为干预
         may=zeros(209,1);
         d=ones(209,1);
         d=d.*(-1);
         n=1;
         ew=0;%全白标记
         if(ew==0)%非全白
             for j=1:Num
                 fg=0;
                 for t=1:19
                     for tt=1:11
                        if(j==result(tt,t))
                            fg=1;
                        end
                    end
                 end
                 if(fg==0)%没有被选过
                     r=0;%和
                     for k=1:180
                         r=r+(double(Q(k,2,result(line,i)))-double(Q(k,1,j)))^2;
                     end
                     d(j)=sqrt(double(r));
                 end
             end
             %disp(d)
             %最小距离
             for k=1:209
                 if(d(k)==(-1))
                     d(k)=max(d);
                 end
             end
             dmin=min(d);
            % disp(d)
             for k=1:209
                 if(d(k)==dmin)
                     result(line,i+1)=k;
                     %disp([num2str(k),'d']);
                 end
             end
         else%全白，跳过该行拼下行
             disp('换行');
            break;
         end
         %结果不唯一时人工干预
     end
end

%拼接序列输出   
% disp('最后碎片正确序列：');
% result

picture2=[];
for j=1:19
    picture1=[];
    for i=1:11
        picture1=[picture1;F(:,:,result(i,j))];
    end
    picture2=[picture2,picture1];
end

imshow(picture2)
imwrite(picture2,'附件3\2_1.bmp','bmp');
