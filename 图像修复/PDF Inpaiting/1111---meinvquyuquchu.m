clc
figure(1);
img=imread('meinv1.bmp'); 
subplot(1,4,1);imshow(img); title('Original image');
fillimg=imread('meinv2.bmp'); 
subplot(1,4,2);imshow(fillimg); title('Fill region');
I1=rgb2gray(fillimg);
subplot(1,4,3);imshow(I1,255); title('Gray image');
I=double(I1)/255;
sz=[size(fillimg,1),size(fillimg,2)];
fillregion=fillimg(:,:,1)==255;

u=0.0001;  max=50;                  
for n=1:max         
  for i=3:sz(1)-2
   for j=3:sz(2)-2    
    if fillregion(i,j)==1
modIe=u+sqrt( ((I(i+1,j+1)-I(i-1,j+1)+I(i+1,j)-I(i-1,j))/4)^2+(I(i,j+1)-I(i,j))^2); 
modISE1=u+sqrt( ((I(i+2,j+1)-I(i,j+1))/2)^2+((I(i+1,j+2)-I(i+1,j))/2)^2);   
VSE1=(I(i+2,j+1)-I(i,j+1))/(2*modISE1);                          
modINE1=u+sqrt( ((I(i,j+1)-I(i-2,j+1))/2)^2+((I(i-1,j+2)-I(i-1,j))/2)^2);
VNE1=(I(i,j+1)-I(i-2,j+1))/(2*modINE1);                        
modIS1=u+sqrt( ((I(i+2,j)-I(i,j))/2)^2+((I(i+1,j+1)-I(i+1,j-1))/2)^2);
VS1=(I(i+2,j)-I(i,j))/(2*modIS1);                                
modIN1=u+sqrt( ((I(i,j)-I(i-2,j))/2)^2+((I(i-1,j+1)-I(i-1,j-1))/2)^2);
VN1=(I(i,j)-I(i-2,j))/(2*modIN1);                                 
modIE2=u+sqrt( ((I(i+1,j+1)-I(i-1,j+1))/2)^2+((I(i,j+2)-I(i,j))/2)^2); 
VE2=(I(i,j+2)-I(i,j))/(2*modIE2);                        
modIO2=u+sqrt( ((I(i+1,j)-I(i-1,j))/2)^2+((I(i,j+1)-I(i,j-1))/2)^2); 
VO2=(I(i,j+1)-I(i,j-1))/(2*modIO2);                        
curke=(VSE1-VNE1+VS1-VN1)/4+(VE2-VO2);              
we=g(abs(curke))/modIe;   

modIw=u+sqrt( ((I(i+1,j-1)-I(i-1,j-1)+I(i+1,j)-I(i-1,j))/4)^2+(I(i,j+1)-I(i,j))^2); 
modISW1=u+sqrt( ((I(i+2,j-1)-I(i,j-1))/2)^2+((I(i+1,j)-I(i+1,j-2))/2)^2);   
VSW1=(I(i+2,j-1)-I(i,j-1))/(2*modISW1);                         
modINW1=u+sqrt( ((I(i,j-1)-I(i-2,j-1))/2)^2+((I(i-1,j)-I(i-1,j-2))/2)^2);
VNW1=(I(i,j-1)-I(i-2,j-1))/(2*modINW1);                        
modIS1=u+sqrt( ((I(i+2,j)-I(i,j))/2)^2+((I(i+1,j+1)-I(i+1,j-1))/2)^2);
VS1=(I(i+2,j)-I(i,j))/(2*modIS1);                              
modIN1=u+sqrt( ((I(i,j)-I(i-2,j))/2)^2+((I(i-1,j+1)-I(i-1,j-1))/2)^2);
VN1=(I(i,j)-I(i-2,j))/(2*modIN1);                              
modIW2=u+sqrt( ((I(i+1,j-1)-I(i-1,j-1))/2)^2+((I(i,j)-I(i,j-2))/2)^2); 
VW2=(I(i,j)-I(i,j-2))/(2*modIW2);                    
modIO2=u+sqrt( ((I(i+1,j)-I(i-1,j))/2)^2+((I(i,j+1)-I(i,j-1))/2)^2); 
VO2=(I(i,j+1)-I(i,j-1))/(2*modIO2);                   
curkw=(VSW1-VNW1+VS1-VN1)/4+(VO2-VW2);               
ww=g(abs(curkw))/modIw; 

modIn=u+sqrt( ((I(i,j)-I(i-1,j))^2+(I(i-1,j+1)-I(i-1,j-1)+I(i,j+1)-I(i,j-1))/4)^2); 
modIO1=u+sqrt( ((I(i+1,j)-I(i-1,j))/2)^2+((I(i,j+1)-I(i,j-1))/2)^2); 
VO1=(I(i+1,j)-I(i-1,j))/(2*modIO1);                        
modIN1=u+sqrt( ((I(i,j)-I(i-2,j))/2)^2+((I(i-1,j+1)-I(i-1,j-1))/2)^2);
VN1=(I(i,j)-I(i-2,j))/(2*modIN1);                      
modINE2=u+sqrt( ((I(i,j+1)-I(i-2,j+1))/2)^2+((I(i-1,j+2)-I(i-1,j))/2)^2);
VNE2=(I(i-1,j+2)-I(i-1,j))/(2*modINE2);                    
modINW2=u+sqrt( ((I(i,j-1)-I(i-2,j-1))/2)^2+((I(i-1,j)-I(i-1,j-2))/2)^2);
VNW2=(I(i-1,j)-I(i-1,j-2))/(2*modINW2);                         
modIE2=u+sqrt( ((I(i+1,j+1)-I(i-1,j+1))/2)^2+((I(i,j+2)-I(i,j))/2)^2); 
VE2=(I(i,j+2)-I(i,j))/(2*modIE2);                         
modIW2=u+sqrt( ((I(i+1,j-1)-I(i-1,j-1))/2)^2+((I(i,j)-I(i,j-2))/2)^2); 
VW2=(I(i,j)-I(i,j-2))/(2*modIW2);                       
curkn=(VO1-VN1)+(VNE2-VNW2+VE2-VW2)/4;        
wn=g(abs(curkn))/modIn;                              


modIs=u+sqrt( ((I(i+1,j)-I(i,j))^2+(I(i+1,j+1)-I(i+1,j-1)+I(i,j+1)-I(i,j-1))/4)^2); 
modIS1=u+sqrt( ((I(i+2,j)-I(i,j))/2)^2+((I(i+1,j+1)-I(i+1,j-1))/2)^2);
VS1=(I(i+2,j)-I(i,j))/(2*modIS1);                            
modIO1=u+sqrt( ((I(i+1,j)-I(i-1,j))/2)^2+((I(i,j+1)-I(i,j-1))/2)^2); 
VO1=(I(i+1,j)-I(i-1,j))/(2*modIO1);                       
modISE2=u+sqrt( ((I(i+2,j+1)-I(i,j+1))/2)^2+((I(i+1,j+2)-I(i+1,j))/2)^2);
VSE2=(I(i+1,j+2)-I(i+1,j))/(2*modISE2);                       
modISW2=u+sqrt( ((I(i+2,j-1)-I(i,j-1))/2)^2+((I(i+1,j)-I(i+1,j-2))/2)^2);
VSW2=(I(i+1,j)-I(i+1,j-2))/(2*modISW2);                        
modIE2=u+sqrt( ((I(i+1,j+1)-I(i-1,j+1))/2)^2+((I(i,j+2)-I(i,j))/2)^2); 
VE2=(I(i,j+2)-I(i,j))/(2*modIE2);                     
modIW2=u+sqrt( ((I(i+1,j-1)-I(i-1,j-1))/2)^2+((I(i,j)-I(i,j-2))/2)^2); 
VW2=(I(i,j)-I(i,j-2))/(2*modIW2);                        
curks=(VS1-VO1)+(VSE2-VSW2+VE2-VW2)/4;               
ws=g(abs(curks))/modIs;                                 

wQ=we+ww+wn+ws;                               
he=we/wQ;hw=ww/wQ;hn=wn/wQ;hs=ws/wQ;                 
I(i,j)=he*I(i,j+1)+hw*I(i,j-1)+hn*I(i-1,j)+hs*I(i+1,j);
    end
   end
  end
end
I2=uint8(round(I*255));
subplot(1,4,4);imshow(I2); title('Inpainted image');

