img=imread('LENA-1.bmp');
[cA, cH, cD, cV]=dwt2(img,'haar');
img=[cA, cH; cD, cV];
     
