%-------------------------------------------------------------------------------------------------------%
%此文件功能：当用Imreads1()时，可读入一个文件夹内所有图片进行PCA分析，
%输入'\人脸匹配错误\'文件夹内的10.pgm进行匹配时发现匹配错误，说明PCA
%分析并不完全可靠；当用Imreads2()时，可读入多个文件夹内的所有图片进行
%PCA分析，手动输入'\find_faces\'文件夹内的图片进行匹配。
%-------------------------------------------------------------------------------------------------------%
clc,clear,close all
%% 要想通过其他样本脸重新建立新空间可去掉一下的屏蔽并屏蔽load
P=0.99;  %PCA贡献率
type='*.pgm';
Ipath='C:\Users\user\Desktop\毕业设计\人+车识别\人脸识别_我 - 副本\orl_faces\';  %注意路径最后有一个\
%lpath='C:\Users\user\Desktop\毕业设计\人+车识别\人脸识别_我\人脸匹配错误例子\s10\';  %当用Imreads1()时
Image=Imreads2(Ipath,type);     %读入多个文件夹下的所有图片
n=size(Image,1)*size(Image,2);     %样本图片数量
%Image=Imreads1(lpath,type);
%n=length(Image);  %当用Imreads1()时
for ii=1:n
    X(:,ii)=Image{ii}(:);  %将每张人脸转换成列向量
   % subplot(3,4,ii);imshow(Image{ii});title(ii);  %用来显示样本图片
end
averageface=1/n*sum(X')'; %平均脸  ave_fac 是行向量
X=double(X);
for i=1:n
    A(:,i)=X(:,i)-averageface; %每幅图像-平均图像（平均脸）
end
[V,D]=eig(A'*A);  %V特征值，D特征向量
[V_over,D_over]=reorder_cart(P,V,D);    %将特征值降序排序，找出前N个的和概率
u=A*V_over;                                                 %大于P的特征值及其对应的特征向量
for jj=1:size(D_over,2)
    u(:,jj)=1./sqrt(D_over(jj))*u(:,jj);  %原方差特征向量u(i)=1/sqrt(入(i))Av(i)
end                                                   %u就是新空间的变换基
Y=u'*A;  %新空间中脸的数据（特征脸空间）
Y_=zeros(n,n);
for ii=1:n
    for jj=1:n
        y_=Y(:,ii)-Y(:,jj);
        Y_(ii,jj)=norm(y_);   %求模
    end
end

[filename,filepath]=uigetfile('*.pgm','输入测试图像','10');  %手动输入待查找图片
Image_in=imread([filepath,filename]);
%Image_in=imread('C:\Users\user\Desktop\毕业设计\人+车识别\人脸识别2\find_faces\20.pgm');
figure;imshow(Image_in);title('要查找的人脸');
Image_in=double(Image_in(:));  %转换为列向量
Image_x=Image_in-averageface;
Y_in=u'*(Image_x);  %检测脸在新空间的投影
n=size(Image,1)*size(Image,2);   %样本图片数量
for ii=1:n
distance(ii)=norm(Y(:,ii)-Y_in);  %求取查找人脸与人脸空间所有样本脸的距离
end
[value,num]=min(distance);    
figure;imshow(Image{num});title('找到的人脸');
disp([num2str(value)]);       %输出查找脸与找到的脸的差值和找到的图片序号
disp([num2str(num)]);
