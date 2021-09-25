% This program implement regularized P_M equation by semi-implicit schema
% with AOS algorithm.It will call gauss() for calculation of |grad(I_sigama)|
% and Thomas() to solve a tri-diagonal liniear equation.

% 本程序实现p_m方程正则化的AOS算法的半隐式方案。这将调用gauss()函数计算|grad（i_sigama）|和thomas()函数解决三对角Liniear方程。


clear all;
close all;
clc;

Img = imread('lena2.jpg');
Img = double(rgb2gray(Img));
figure(1);imshow(uint8(Img));

[nrow, ncol] = size(Img);
Img=Img+20*randn([nrow, ncol]);  %add noise
figure(2);imshow(uint8(Img));

N=max(nrow, ncol);
alpha=zeros(1,N); beta=zeros(1,N); gama=zeros(1,N); % store tri_diagonal enements
u1=zeros([nrow, ncol]);                             % store mediate results
u2=zeros([nrow, ncol]);
timestep=5;                                         % note: a very large step length can be used
nn=2;
for n=1:5                                           % note: very few iterations needed
    I_temp=gauss(Img,3,1);
    Ix = 0.5*(I_temp(:,[2:ncol,ncol])-I_temp(:,[1,1:ncol-1]));
    Iy = 0.5*(I_temp([2:nrow,nrow],:)-I_temp([1,1:nrow-1],:));
    grad=Ix.^2+Iy.^2;
    g=1./(1+grad/100);                              % other edge function can be used
    
    for i=1:nrow                                    % using Thomas algorithm to solve u1 row by row 
       beta(1)=-0.5*timestep*(g(i,2)+g(i,1));
       alpha(1)=1-beta(1);
       for j=2:ncol-1
           beta(j)=-0.5*timestep*(g(i,j+1)+g(i,j));
           gama(j)=-0.5*timestep*(g(i,j-1)+g(i,j));
           alpha(j)=1-beta(j)-gama(j);
       end
       gama(ncol)=-0.5*timestep*(g(i,ncol)+g(i,ncol-1));
       alpha(ncol)=1- gama(ncol);
       u1(i,:)=Thomas(ncol,alpha,beta,gama,Img(i,:));
    end
    
    for j=1:ncol                                     % using Thomas algorithm to solve u2 colunm by colunm                                 
       beta(1)=-0.5*timestep*(g(2,j)+g(1,j));
       alpha(1)=1-beta(1);
       for i=2:nrow-1
           beta(j)=-0.5*timestep*(g(i+1,j)+g(i,j));
           gama(j)=-0.5*timestep*(g(i-1,j)+g(i,j));
           alpha(j)=1-beta(j)-gama(j);
       end
       gama(nrow)=-0.5*timestep*(g(nrow,j)+g(nrow-1,j));
       alpha(nrow)=1- gama(nrow);
       u2(:,j)=Thomas(nrow,alpha,beta,gama,Img(:,j));
    end  
    Img=0.5*(u1+u2);                                 % average u1 and u2 to complete one iteration.      
      nn=nn+1;
      figure(nn);imshow(uint8(Img));                 % display results
end


