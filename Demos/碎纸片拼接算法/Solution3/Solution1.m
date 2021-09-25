% 第1问程序代码：
function Solution1

clear
clc

%图像导入
for i=1:19
    if(i<11)
        F(:,:,i)=imread(['00',num2str(i-1),'.bmp']);
    else
        F(:,:,i)=imread(['0',num2str(i-1),'.bmp']);
    end
    %二值化
    B(:,:,i)=im2bw(F(:,:,i),250/255);
    %取首位列
    Q(:,1,i)=B(:,1,i);
    Q(:,2,i)=B(:,72,i);
end
%结果
result=zeros(19,1);

%生成全255矩阵
y=ones(1980,1);
%y=y.*255;
%找首列
% Q(:,1,i)==y
for i=1:19
    if(Q(:,1,i)==y)
        result(1)=i;%记录序号
    end
end


%找尾列

for i=1:19
    if(Q(:,2,i)==y)
        result(19)=i;%记录序号
    end
end


% 中间(17张)匹配，从首至尾的方向
 for i=1:17
     %可能情况,人为干预
%      may=zeros(19,1);
%      n=1;
     d=ones(19,1);
     d=d.*(-1);
     for j=1:19
         fg=0;
         for t=1:19
            if(j==result(t))
                fg=1;
            end
         end
         if(fg==0)
             if(i==17)
                result(i+1)=j;
                break;
             end
             r=0;%和
             for k=1:1980
                 r=r+(double(Q(k,2,result(i)))-double(Q(k,1,j)))^2;
             end
	  %欧氏距离
             d(j)=sqrt(double(r));
         end
     end
     %最小距离
     if(i~=17)
         dmax=max(d);
         for k=1:19
             if(d(k)==(-1))
                 d(k)=dmax;
             end
         end
         dmin=min(d);
         for k=1:19
             if(d(k)==dmin)
                 result(i+1)=k;
                 break;
             end
         end
     end
 end

disp('最后碎片正确序列：');
result

%图片的保存和显示
picture=[];
for i=1:19
    picture=[picture,F(:,:,result(i))];
end
imshow(picture);
imwrite(picture,'C:\Users\Administrator\Desktop\结果111.bmp','bmp');


end
