function Level = OTSU(Image)  

%把图像数据类型转换为无符号八位整型。如果输入图像是无符号八位整型的，返回的图像和源图像相同。如果源图像不是无符号八位整型的，该函数将返回和源图像相同
%但数据类型为uint8的图像
Image=im2uint8(Image(:));

%定义灰度级数
D=256;  

%imhist是MATLAB图像处理模块中的一个函数，用以提取图像中的直方图信息。
Cnt=imhist(Image,D);  

%通常用于计算一个数组各行的累加值
%B = cumsum(A,dim)这种调用格式返回A中由标量dim所指定的维数的累加和。例如：cumsum(A,1)返回的是沿着第一维（各行）的累加和，cumsum(A,2)返回的是沿着第二维（各列）的累加和。
Num=cumsum(Cnt);  
Tmp=Cnt .* (1:D)';
u=cumsum(Tmp);  

Max=0;  
Level=0;  
  
for i=1:D  
    u0=u(i,1)/Num(i,1);  
    u1=(u(D,1)-u(i,1))/(Num(D,1)-Num(i,1));  
    Num0=Num(i,1);  
    Num1=Num(D,1)-Num0; 
    g=Num0*Num1*(u1-u0)*(u1-u0);  
    if g > Max  
        Max=g;  
        Level = i;  
    end  
end

Level=Level/256;