%%% This program evolves a closed curve according linear heat flow by using
%%% Fourier transform method.

% 该程序利用傅立叶变换法，根据线性热流演化封闭曲线。

clear all;
close all;
clc;

Img = imread('lena2.jpg');
figure(1);imshow(Img);
[nrow,ncol]=size(Img);
sigama=3;                      % the parameter of gaussian kernel
x=-255:0.5:256;
g=exp(-x.^2/(2*sigama^2));

boundary_Img=zeros([nrow,ncol]);
B = bwboundaries(Img);         % Get the boundary of a binary image as a closed curve
boundary=B{2};
L=length(boundary);
for ii=1:L
    xx(ii)=boundary(ii,2);                % store the positions of the curve points
    yy(ii)=boundary(ii,1);
    boundary_Img(yy(ii),xx(ii))=1;        % for display only
end
figure(2);imshow(boundary_Img);

FTg=fft(g,L); m=max(abs(FTg)); FTg=FTg/m; % normalize FT{g}
nn=1;
for n=1:2048
  for ii=1:L
    z(ii)=xx(ii)+yy(ii)*j;               % This is the so_called Fourier Descriptor for the curve
  end
  FTz=fft(z);
  gz=FTg.*FTz;
  zz=ifft(gz);                           
  xx=real(zz);      yy=imag(zz);         % This is curve after evolving for n times. 
  if mod(n,2^nn)==0
     for ii=1:L
        boundary_Img(floor(yy(ii)),floor(xx(ii)))=1;
     end
     figure(3);imshow(boundary_Img);     % Display current curve.
     nn=nn+1;
  end
end

