%碎纸片拼接算法一

%Problem one
function Solution1_1
clear
n=19;
x=cell(n,1); %建立 cell 存储碎纸片数据结构
for i=1:n
    str=rename(i);
    imgt=imread(str);
    img=im2double(imgt);
    x{i}.pic=img; %读取图片并转化为 double 类型
    x{i}.left=img(:,1);
    x{i}.leftnum=sum(img(:,1));
    
    if(x{i}.leftnum>0.98*1980*19/n) %判断是否为边缘，仅在问题 1 中有效
        start=i;
    end
    
    x{i}.right=img(:,end);
    x{i}.rightnum=sum(img(:,end));
    
    if(x{i}.rightnum>0.98*1980*19/n)
        finish=i;
    end
end


mypic=x{start}.pic;
xuhao=start;

for j=1:n-1
    temp=1000000;
    for i=1:n %循环对比相似度
        if(length(find(xuhao==i))==0)
            q=x{start}.right-x{i}.left;
            gg=sum(abs(q)); %两种距离函数随时调整
            % gg=sum(q.*q);
            if(gg<temp)
                temp=gg;
                ww=i;
            end
        end
    end
    start=ww;
    xuhao=[xuhao start];
    mypic=[mypic x{start}.pic];
end
imshow(mypic) %输出图形



% 灰度值密度图象生成
clear
imghg=imread('183.bmp'); %随机选取样本
temp1=sum(imghg,2);
temp2=zeros(178,1);

for i=1:180-2
    temp2(i)=temp1(i)+temp1(i+1)+temp1(i+2);
end
plot(temp1);
[a b]=sort(temp1);

end
% solution1 end









