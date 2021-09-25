%=========================�����ݺ���������ֽƬƴ��============================
clc,clear;
files = dir('..\����3\*.bmp');
for n=1:numel(files)
    image{n} = imread(['����3\',files(n).name]);
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
flags = ones(1,row);%���ÿ����ֽƬ
flag = 0;
picPre=picture';
picMid = im2bw(picPre);%��ֵ����1Ϊ�ף�0Ϊ��
for i=1:row
    subpic = picMid(:,c*(i-1)+1:c*i); %������ͼ��ÿһ��ֽƬ
    picHead = [picHead subpic(:,1)];
    picEnd =[picEnd subpic(:,end)];
    gray = grayLevel(subpic,10);%���ֲ���10
    if gray>max
        flag = i;
        max = gray;
    end
end
pic = picPre(:,c*(flag-1)+1:c*flag);  %ѡ��ƴ�ӵĵ�һ��ֽƬ
flags(flag) = 0;
rows = size(subpic,1);
path = flag;
 
for k=1:row-1
    sign = 0;
    rate = 0;
    for i=1:row
        if flags(i)==1
            rate1 = 0;
            aend = picEnd(:,path(end)); %ÿ��ƴ�Ӻ�����һ��
            head = picHead(:,i);
            rate1= Simi(aend,head);
            if rate1>rate%ѡ�����ƶȸ����һ��
                rate=rate1;
                sign=i;
            end
        end
    end
    if rate>0
        pic=[pic picPre(:,c*(sign-1)+1:c*sign)];%�����ƶ�����ֽƬƴ���ں���
        flags(sign) = 0;
        path=[path sign];
    end
end
figure('name','��ԭ��ֽƬ');
imshow(pic');
   

