


% 第3问程序代码：

function Solution3
clear
clc
num=209
raw=0;
temp=zeros(num,1);
y=ones(180,1);
y=y.*255;
for i=1:2:num*2
    %奇数a偶数b
    if(ceil(i/2)<11)
        F(:,:,i)=imread(['00',num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread(['00',num2str(ceil(i/2)-1),'b','.bmp']);
    elseif(ceil(i/2)<101)
        F(:,:,i)=imread(['0',num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread(['0',num2str(ceil(i/2)-1),'b','.bmp']);
    else
        F(:,:,i)=imread([num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread([num2str(ceil(i/2)-1),'b','.bmp']);
    end
end
for i=1:num*2
    %首尾行
    Q(:,1,i)=F(:,1,i);
    Q(:,2,i)=F(:,72,i);
    %对左边界空白的碎片计数
    if(Q(:,1,i)==y)
        raw=raw+1;
        temp(raw)=i;
    end
end
temp(1:raw)
raw
result=zeros(22,19);
for i=1:22
    result(i)=temp(i);
end
for j=1:22
    for t=1:18    
        d=ones(num*2,1);
        d=d.*(-1);
        for i=1:num*2
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
        for i=1:num*2
            if(d(i)==(-1))
                d(i)=dmax;
            end
        end
        dmin=min(d);
        for i=1:num*2
            if(d(i)==dmin)
                result(j,t+1)=i;
                break;
            end
        end
    end
end
result;

picture2=[];
for j=1:19
    picture1=[];
    for i=1:11
        picture1=[picture1;F(:,:,result(i,j))];
    end
    picture2=[picture2,picture1];
end
 imshow(picture2)
  imwrite(picture2,'C:\Users\Administrator\Desktop\结果E31.bmp','bmp');
  picture2=[];
for j=1:19
    picture1=[];
    for i=12:22
        picture1=[picture1;F(:,:,result(i,j))];
    end
    picture2=[picture2,picture1];
end
imshow(picture2);
imwrite(picture2,'C:\Users\Administrator\Desktop\结果E32.bmp','bmp');

end

        
