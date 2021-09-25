% 第3问程序代码：180*72
clear,clc

% 碎纸片数目（下标从零开始）
Num=209;


% 碎纸片读入
for i=1:2:Num*2
    
    %奇数a面 偶数b面
    if(ceil(i/2)<11) %图片命名下表从零开始 ceil函数的作用是朝正无穷方向取整->进一法
        F(:,:,i)=imread(['附件5\00',num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread(['附件5\00',num2str(ceil(i/2)-1),'b','.bmp']);
    elseif(ceil(i/2)<101)
        F(:,:,i)=imread(['附件5\0',num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread(['附件5\0',num2str(ceil(i/2)-1),'b','.bmp']);
    else
        F(:,:,i)=imread(['附件5\',num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread(['附件5\',num2str(ceil(i/2)-1),'b','.bmp']);
    end
    
end

%%
%空白像素对比矩阵
y=ones(180,1).*255;

%记下左侧全白纸片的位置
Index=zeros(Num,1);

%左侧全白纸片计数
Cnt=0;

%找出左侧全白纸片
for i=1:Num*2
    
    %首尾列像素数据
    Q(:,1,i)=F(:,1,i);
    Q(:,2,i)=F(:,72,i);
    
    %对左侧空白的碎片计数
    if(Q(:,1,i)==y)%白色对应像素值为255
        Cnt=Cnt+1;
        Index(Cnt)=i;
    end
end

Index(1:Cnt);
Cnt;

%定义结果序列矩阵
result=zeros(22,19);



%纸片左侧全白的放在结果序列的最左端
for i=1:22
    result(i)=Index(i);
end



%% 核心算法
for j=1:22
    for t=1:18    
        d=ones(Num*2,1);
        d=d.*(-1);
        for i=1:Num*2
            flag=0;
            for m=1:19
                if(i==result(j,m))
                    flag=1;
                    break
                end
            end
            if(flag==0)
                r=0;%和
                for k=1:180
                    r=r+(double(Q(k,2,result(j,t)))-double(Q(k,1,i)))^2;
                end
                d(i)=sqrt(double(r));
            end
        end
        dmax=max(d);
        for i=1:Num*2
            if(d(i)==(-1))
                d(i)=dmax;
            end
        end
        dmin=min(d);
        for i=1:Num*2
            if(d(i)==dmin)
                result(j,t+1)=i;
                break;
            end
        end
    end
end
result;



%% 纸片拼接
picture2=[];
for j=1:19
    picture1=[];
    for i=1:11
        picture1=[picture1;F(:,:,result(i,j))];
    end
    picture2=[picture2,picture1];
end

imshow(picture2)
imwrite(picture2,'附件5\3_1.bmp','bmp');

picture2=[];
for j=1:19
    picture1=[];
    for i=12:22
        picture1=[picture1;F(:,:,result(i,j))];
    end
    picture2=[picture2,picture1];
end

imshow(picture2)
imwrite(picture2,'附件5\3_2.bmp','bmp');