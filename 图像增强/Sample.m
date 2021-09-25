clear,clc;

%图像操作
I=imread('1-1.bmp');
% imfinfo('lena.jpg');
figure,imshow(I);

%图片保存
% imwrite(I,'lenaSave.jpg');

% 使用imread()读取图像后，可以看到，读入的图片I是以一个512*512*3的矩阵进行保存的，
% 即分别是RGB颜色的数字图片。为了方便起见，在本文中，
% 笔者将lena图进行了转换，转换为灰度图，即保存为一个512*512*1的矩阵。
I1=rgb2gray(I);
figure,imshow(I1);


%为了显示图像灰度的分布情况，还需要绘制灰度直方图
figure,imhist(I1);



% 为了完成多种图像处理的操作和试验，还可以对图片添加噪声。所用函数为imnoise (I, type)，
% 该函数中的type可以为5种噪声参数，分别为：'gaussian'(高斯白噪声)，'localvar'
% (与图象灰度值有关的零均值高斯白噪声)，'poisson'(泊松噪声)，'salt & pepper'(椒盐噪声)和'speckle'(斑点噪声)。
% I2=imnoise(I1,'gaussian');
% figure,imshow(I2);


% 用指定的灰度范围 [low high]显示灰度图像I。显示结果，图像中灰度值等于或低于low的都将用黑色显示，
% 而灰度值大于等于high的都显示为白色，介于low和high之间的用其灰度级的默认值的中间色调显示。
% 如果你用了一个空矩阵([]) 来代替 [low high]， imshow 函数将使用 [min(I(:))max(I(:))]作为第二个参数。
