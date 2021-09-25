f=zeros(30,30);
f(5:24,13:17)=1;
figure(1);
imshow(f,'notruesize')
F=fft2(f,256,256);
FF=fftshift(F);
F2=log(abs(FF+0.0000001));  %防止log出现zero(0)
figure(2)
imshow(F2,[-1,5],'notruesize')
colormap(jet);           %%彩色图形 若无该项则为黑白图形 
colorbar
