%%% This program implement image interpolation by AMLE method. Firstly, get
%%% a number of level sets from an input image by thresholdding. The threshold
%%% values are chosen automatically. Then the boundaries for each level set
%%% are extracted, the image data on the boundaries are recorded. Finally, 
%%% by using AMLE, extend those imformation to reconstract a new image,
%%% which will approximate the original one quitr well.

% 本程序使用AMLE方法实现图像插值。首先，通过入口得到一定数量的水平集从输入图像。
% 阈值是自动选择的。然后提取每个水平集的边界，记录边界上的图像数据。
% 最后，利用这些信息来重构AMLE，延伸的一种新的图像，这将原来的一个很好的近似。

clear all;
close all;
clc;

Img=imread('lena2.jpg');
Img=rgb2gray(Img);

figure(1);imshow(uint8(Img));
[ny, nx] = size(Img);

N=12;                          % A presetting parameter--Number of level_sets
h=imhist(Img)/(ny*nx);
D_max([1:N])=0;                 
count([1:N])=0;                
start=0;s=0.0; 
for n=1:N 
   for d=start:255             
       if h(d+1)>0
          count(n)=count(n)+1;
          s=s+h(d+1);
          if s>=double(n/N)          
              D_max(n)=d-1;           
              count(n)=count(n)-1;    
              s=s-h(d+1);             
              start=d;                
              break;                  
          end
       end
   end
end
count(N)=count(N)+1;
D_max(N)=D_max(N)+1;
nn=0;
for n=1:N
   if count(n)>0
      nn=nn+1;
      D_max(nn)=D_max(n);
   end
end 
% Now nn is the number of level_sets

Level_Set_Boundary=zeros([ny, nx]);  %Recode boundares only for display
Boundary_Img=zeros([ny, nx]);        %Recode the gray values of the image on the boundares

for n=1:nn
    bw=zeros([ny, nx]);
    if n==1;
        D_min=0;
    else
        D_min=D_max(n-1)+1;
    end
    for i=1:ny
        for j=1:nx
            if Img(i,j)>=D_min 
               bw(i,j)=1; 
            end
        end
    end
    
    se = strel('disk',5);          % Set a stracturing elememt
    BW2 = imopen(bw,se);           % Make open opartion to the level sets
        
    B = bwboundaries(BW2);         % Get boundaries
    for i = 1:length(B)
        boundary=B{i};
        L=length(boundary);
        for ii=1:L
            xx=boundary(ii,2);                % Get positions of the boundary points
            yy=boundary(ii,1);
            Level_Set_Boundary(yy,xx)=1;      % Recode the positions for diplay only.
            Boundary_Img(yy,xx)=Img(yy,xx);   % Recode the image data for extension.
            
        end
    end
end
figure(2);imshow(Level_Set_Boundary);
figure(3);imshow(uint8(Boundary_Img));

Diff_Img=120+50*randn([ny, nx]);             % Randon intialization
[nrow, ncol]=size(Diff_Img); 

delt=0.2;
% Iteration begin here
for n=1:300
    I_x = (Diff_Img(:,[2:ncol ncol])-Diff_Img(:,[1 1:ncol-1]))/2;
    I_y = (Diff_Img([2:nrow nrow],:)-Diff_Img([1 1:nrow-1],:))/2;
    I_xx = Diff_Img(:,[2:ncol ncol])+Diff_Img(:,[1 1:ncol-1])-2*Diff_Img;
    I_yy = Diff_Img([2:nrow nrow],:)+Diff_Img([1 1:nrow-1],:)-2*Diff_Img;
    I_xy = 0.25*(Diff_Img([2:nrow nrow],[2:ncol ncol])+Diff_Img([1 1:nrow-1],[1 1:ncol-1])-...
        Diff_Img([1 1:nrow-1],[2:ncol ncol])-Diff_Img([2:nrow nrow],[1 1:ncol-1]));
    Num = I_xx.*I_x.^2+2*I_x.*I_y.*I_xy+I_yy.*I_y.^2;
    Den = I_x.^2+I_y.^2;
    Q = Num./(Den+eps); 
    Diff_Img=Diff_Img+delt*Q;
       
    Diff_Img(Boundary_Img>0) = Boundary_Img(Boundary_Img>0);  % replace anchor point
end
figure(4); imshow(uint8(Diff_Img));       % Display the reconstracted image.



