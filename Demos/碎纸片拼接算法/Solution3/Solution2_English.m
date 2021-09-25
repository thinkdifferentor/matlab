% 第2问英文程序代码：
function Solution2_English
clear
clc
%碎片总数
num=209;
%图像导入
%确定行列数
%生成全255矩阵
y=ones(180,1);
y=y.*255;
raw=0;
%存中间值
temp=zeros(num,1);
%标志
fw=0;
fb=0;
fg=0;
k=0;
m=0;

BW=ones(num,2);
BW=BW.*(-1);
A=0;
B=0;
for i=1:num
    if(i<11)
        F(:,:,i)=imread(['00',num2str(i-1),'.bmp']);
    elseif(i<101)
        F(:,:,i)=imread(['0',num2str(i-1),'.bmp']);
    else
        F(:,:,i)=imread([num2str(i-1),'.bmp']);
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
    fw=0;
    fb=0;
    fg=0;
    flag=0;
    count=0;
    flag=0;
    for j=1:180
        %每一列
        fw=0;
        count=0;
        for t=1:72            
            if(F(j,t,i)~=255)
                count=count+1;
            end
        end
        if((count/72)>0.4&&flag==0)
            flag=1;%经过了大多数黑色的区域
        end
        if((count/72)<0.2&&flag==1)
            fw=1;%已经经过大多数黑色区域，且出现少区域
        end
        if(fw==1&&fg==0)%当前线为全白且没有找到全白的线
            fb=1;
            BW(i,1)=j-1;%黑线位置                
%             BW(i,2)=j;
            fg=1;
        end
        if(fg==1&&fb==1)%找到了
            break;
        end
    end 
end
for i=1:num
    if(BW(i,1)==(-1))
        BW(i,1)=input('输入纵坐标：');
    end
    i
    BW(i,1)
end
abs(BW(20,1)-BW(201,1))
i=2;
temp(1:raw)

while mod(num,raw)~=0
    k=raw;
    l=1;
    del=zeros(raw,1);
    for j=1:k
        flag=0;
        for w=1:180
            if(F(w,i,temp(j))~=255)  
                flag=1;
                break;
            end
        end
        if(flag==1)
            raw=raw-1;
            del(l)=j;
            l=l+1;
        end
    end
    %删除不符合条件的碎片
    l=1;
    while del(l)~=0
        temp(del(l))=[];
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
result=zeros(raw,num/raw);
result(:,1)=temp(1:raw);
result
%找每行近似相同值,
for i=1:11
    t=0;
    for j=1:num
        if(j~=(i-1)*19+1)%自身C(j)==C((i-1)*19+1)&&
            
            if(abs(BW(j,1)-BW(result(i,1),1))<4)%同A且距离近似
                t=t+1;
                result(i,t+1)=j;
                if(t==18)%满
                    break;
                end
            end
        end
    end
end
result

Z=ones(180,72);
Z=Z.*240;
picture2=[];
for j=1:19
    picture1=[];
    for i=1:11
        if(result(i,j)==0)
            picture1=[picture1',Z(:,:)']; 
            picture1=picture1';
            continue;
        end
        picture1=[picture1',F(:,:,result(i,j))'];
        picture1=picture1';
    end
    picture2=[picture2,picture1];
end
% imshow(picture2)  

%最终结果
lresult=zeros(11,19);
% 从左向右在同类型中匹配:行
for i=1:11
    %首行
    lresult(i,1)=result(i,1);
    for j=1:18%匹配18次
        if(result(i,j+1)==0)
%             i,j
            break;
        elseif(j<18&&result(i,j+2)==0)
            disp('dd')
            for t=1:j+1
                flag=1;
                for k=1:j+1
                    if(result(i,t)==lresult(i,k))
                        flag=0;
                        
                        break;
                    end
                end
                if(flag==1)
                        lresult(i,j+1)=result(i,t);
                        break;
                end
            end
            if(flag==1)
                continue;
            end
        end
        d=zeros(19,1);
        for k=1:19%求k项对j项的平均距离
            %lresult每行中有的排除
            flag=1;
            for t=1:19
                if(result(i,k)==lresult(i,t))
                    flag=0;
                end
            end
            
            if(flag==1)%在未被匹配的碎片中筛选
%                 disp('dd')
                R=Q(:,2,lresult(i,j))-Q(:,1,result(i,k));
                d(k)=sum(abs(R(:)))/180;
                if(d(k)==0)
                    d(k)=(-1);
                end
            end
        end
        dmax=max(d);
        for t=1:19
            if(d(t)==0)
                d(t)=dmax;
            elseif(d(t)==(-1))
                d(t)=0;
            end
        end
        dmin=min(d);
        for t=1:19
            if(d(t)==dmin)
                lresult(i,j+1)=result(i,t);
                break;
            end
        end
    end
end

for i=1:11
    lresult(i,:)
    for j=1:19
        if(lresult(i,j)~=0)
            disp(BW(lresult(i,j),1))
        else
            disp('0');
        end
    end
end

%从上向下匹配
picture2=[];
for j=1:19
    picture1=[];
    for i=1:11
        if(lresult(i,j)==0)
            picture1=[picture1',Z(:,:)']; 
            picture1=picture1';
            continue;
        end
        picture1=[picture1',F(:,:,lresult(i,j))'];
        picture1=picture1';
    end
    picture2=[picture2,picture1];
end
imshow(picture2) 
imwrite(picture2,'C:\Users\Administrator\Desktop\结果EE21.bmp','bmp');

end