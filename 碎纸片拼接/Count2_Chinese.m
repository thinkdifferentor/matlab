%=========================单面纵横切中文碎纸片拼接============================
clc,clear;
files = dir('..\附件3\*.bmp');
for n=1:numel(files)
    image{n} = imread(['附件3\',files(n).name]);
end
result = xlsread('index.xlsx','Sheet1','A1:S11');
result = result+1;
[row,col] = size(result);
[r,c]=size(image{result(1,1)}');
picture = [];
for i=1:row
    temp=[];
    for j=1:col
        temp = [temp image{result(i,j)}];
    end
    picture = [picture;temp];
end
picHead = [];
picEnd =[];
max = 0;
flags = ones(1,row);%标记每个碎纸片
flag = 0;
picPre=picture';
picMid = im2bw(picPre);%二值化，1为白，0为黑
for i=1:row
    subpic = picMid(:,c*(i-1)+1:c*i); %处理后的图像每一碎纸片
    picHead = [picHead subpic(:,1)];
    picEnd =[picEnd subpic(:,end)];
    gray = grayLevel(subpic,10);%汉字参数10
    if gray>max
        flag = i;
        max = gray;
    end
end
pic = picPre(:,c*(flag-1)+1:c*flag);  %选择拼接的第一个纸片
flags(flag) = 0;
rows = size(subpic,1);
path = flag;
 
for k=1:row-1
    sign = 0;
    rate = 0;
    for i=1:row
        if flags(i)==1
            rate1 = 0;
            aend = picEnd(:,path(end)); %每次拼接后的最后一列
            head = picHead(:,i);
            rate1= Simi(aend,head);
            if rate1>rate%选择相似度更大的一个
                rate=rate1;
                sign=i;
            end
        end
    end
    if rate>0
        pic=[pic picPre(:,c*(sign-1)+1:c*sign)];%把相似度最大的纸片拼接在后面
        flags(sign) = 0;
        path=[path sign];
    end
end
figure('name','复原后纸片');
imshow(pic');
   

