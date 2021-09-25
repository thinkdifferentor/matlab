% 波纹扭曲

clear all;close all;clc;

img=imread('lena.jpg');
[h w]=size(img);

wave=[10,100]; %[幅度，周期]
newh=h+2*wave(1);
neww=w+2*wave(1);
rot=0;

for i=1:10
    imgn=zeros(newh,neww);    

    rot=rot+0.2;
    for y=1:newh
        for x=1:neww

            yy=round((y-wave(1))-(wave(1)*cos(2*pi/wave(2)*x+rot)));    %依然是逆变换
            xx=round((x-wave(1))-(wave(1)*cos(2*pi/wave(2)*y+rot)));

           if yy>=1 && yy<=h && xx>=1 && xx<=w
                imgn(y,x)=img(yy,xx);
           end

        end
    end

    figure(1);
    imshow(imgn,[]);
    
    imgn(:,:,2)=imgn;       %生成gif图片
    imgn(:,:,3)=imgn(:,:,1);
    [I,map]=rgb2ind(mat2gray(imgn),256);  
    if i==0
        imwrite(I,map,'re.gif','Loopcount',inf,'DelayTime',1.5);
    else
        imwrite(I,map,'re.gif','DelayTime',0.1,'WriteMode','Append'); 
    end

end