%%% 本程序采用迎风方案实现推广GAC模型的水平集方法：
%%% ut=|▽u|div(g▽u/|▽u|)+cg|▽u|
%%% 将调用到以下子函数：
%%% （1）gauss()        : 平滑图像以计算边缘函数g
%%% （2）createimage()  : 将当前零水平集（演化曲线）叠加在原图上显示，
%%%                       并重新初始化嵌入函数u()

clear;close all;
clc;


im=imread('lena_inp_2.bmp');
% im=rgb2gray(im);             
im=double(im);
im = imresize( im, 0.5 );    % 为了减少程序运行时间，将图像变小为原来大小的1/2
figure('name','原图像');imshow(uint8(im));
[nrow,ncol]=size(im);

J= gauss( im,3,2 );          % 为了计算函数g，先对图像作guassian预平滑
%%- 计算图像梯度模值
J_x = (J(:,[2:ncol ncol])-J(:,[1 1:ncol-1]))/2;
J_y = (J([2:nrow nrow],:)-J([1 1:nrow-1],:))/2;      
grad_im = (J_x.^2 + J_y.^2).^0.5;      

kk=5;                        % 反差参数
g=1./(1+(grad_im/kk).^2);    % 计算边缘函数g

%%- 初始化曲线为一个圆，初始化u为带符号距离函数
center=[nrow/2,ncol/2];
radius = min(center)-2;
u = zeros( nrow,ncol );                                 
for i = 1 : nrow
  for j = 1 : ncol
      distance = sqrt( sum( ( center - [ i, j ] ).^2 ) );   % 计算图像中每一点到圆心的距离
      u( i, j ) = distance - radius;                        % 圆环内部距离为负，外部为正
  end
end

%%- 将当前曲线叠加到原图像中
newim=createimage(im,u,0);           
figure('name','曲线叠加');imshow(uint8(newim));

delta_t=0.01; % 选定迭代步长
c=3;          % 选定常数速度                            

%%- 迭代开始
for iterations=1:2500
   %%-  计算Roe迎风格式梯度
   u_x_e = u(:,[2:ncol,ncol])-u;
   u_y_e = (u([2:nrow,nrow],:)+u([2:nrow,nrow],[2:ncol,ncol])-u([1 1:nrow-1],:)-u([1 1:nrow-1],[2:ncol ncol]))/4;
   u_G_e = sqrt(u_x_e .^2+u_y_e .^2);
   g_e = 0.5*(g(:,[2:ncol,ncol])+g);
   Term_e = g_e.*u_x_e./(u_G_e+eps);
    
   u_x_w  = u-u(:,[1 1:ncol-1]);
   u_y_w = (u([2:nrow,nrow],:)+u([2:nrow,nrow],[1 1:ncol-1])-u([1,1:nrow-1],:)-u([1,1:nrow-1],[1 1:ncol-1]))/4;
   u_G_w = sqrt(u_x_w.^2+u_y_w.^2);
   g_w = 0.5*(g(:,[1 1:ncol-1])+g);
   Term_w = g_w.*u_x_w./(u_G_w+eps);
    
   u_y_s = u([2:nrow,nrow],:)-u;
   u_x_s = (u(:,[2:ncol,ncol])+u([2:nrow,nrow],[2:ncol,ncol])-u(:,[1 1:ncol-1])-u([2:nrow,nrow],[1 1:ncol-1]))/4;
   u_G_s = sqrt(u_y_s.^2+ u_x_s.^2);
   g_s = 0.5*(g([2:nrow,nrow],:)+g);
   Term_s = g_s.*u_y_s./(u_G_s+eps);
    
   u_y_n = u-u([1 1:nrow-1],:);
   u_x_n = (u(:,[2:ncol,ncol])+u([1 1:nrow-1],[2:ncol,ncol])-u(:,[1 1:ncol-1])-u([1 1:nrow-1],[1 1:ncol-1]))/4;
   u_G_n = sqrt(u_y_n.^2+u_x_n.^2);
   g_n = 0.5*(g([1,1:nrow-1],:)+g);
   Term_n = g_n.*u_y_n./(u_G_n+eps);
        
   divgn = Term_e - Term_w + Term_s - Term_n;
   
%    divgn_D0_x = divgn.*(u(:,[2:ncol,ncol])-u(:,[1 1:ncol-1]));
%    upwind_x=u_x_e ;
%    upwind_x(divgn_D0_x<0)=u_x_w(divgn_D0_x<0);
%    divgn_D0_y = divgn.*(u([2:nrow,nrow],:)-u([1 1:nrow-1],:));
%    upwind_y=u_y_s ;
%    upwind_y(divgn_D0_y<0)=u_y_n(divgn_D0_y<0);
%    upwind_grad =sqrt(upwind_x.^2+upwind_y.^2);
   
   % 计算第一项
%    term1 = upwind_grad.*divgn;


%    divgn_D0_x = divgn.*(u(:,[2:ncol,ncol])-u(:,[1 1:ncol-1]));
%    upwind_x=u_x_e ;
%    upwind_x(divgn_D0_x<0)=u_x_w(divgn_D0_x<0);
%    divgn_D0_y = divgn.*(u([2:nrow,nrow],:)-u([1 1:nrow-1],:));
%    upwind_y=u_y_s ;
%    upwind_y(divgn_D0_y<0)=u_y_n(divgn_D0_y<0);
%    upwind_grad =sqrt(upwind_x.^2+upwind_y.^2);
   
   % 计算第一项
%    term1 = upwind_grad.*divgn;

   delta_minus = ((max(u_x_e,0)).^2+(min(u_x_w,0)).^2+(max(u_y_s,0)).^2+(min(u_y_n,0)).^2).^0.5;
   delta_plus = ((max(u_x_w,0)).^2+(min(u_x_e,0)).^2+(max(u_y_n,0)).^2+(min(u_y_s,0)).^2).^0.5;
   term1 = max(divgn,0).*delta_minus+min(divgn,0).*delta_plus;
   term2=c*g.*delta_minus;

   u=u+delta_t*(term1+term2);
    if(mod(iterations,50)==0)
        newim=createimage(im,u,1 );
        %figure('name','当前迭代效果');imshow(uint8(newim));
        figure(3);imshow(uint8(newim));
    end
end