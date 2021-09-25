% https://wenku.baidu.com/view/c975a832561252d380eb6ef1.html?from=search

function Solution2
%问题一的程序，使用时请将图片文件放至D盘目录，文件输出在D盘目录 

f1=imread('D:/000.bmp'); f2=imread('D:/001.bmp'); f3=imread('D:/002.bmp'); f4=imread('D:/003.bmp'); 
f5=imread('D:/004.bmp'); f6=imread('D:/005.bmp'); f7=imread('D:/006.bmp'); f8=imread('D:/007.bmp'); 
f9=imread('D:/008.bmp'); f10=imread('D:/009.bmp'); f11=imread('D:/010.bmp'); f12=imread('D:/011.bmp');
f13=imread('D:/012.bmp'); f14=imread('D:/013.bmp'); f15=imread('D:/014.bmp'); f16=imread('D:/015.bmp'); 
f17=imread('D:/016.bmp'); f18=imread('D:/017.bmp'); f19=imread('D:/018.bmp'); 


f1=[f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 ]; 
f1=im2double(f1); 
index1=1:72:1368; 
index2=72:72:1368; 
dang=(find(sum(f1(:,index1))==1980));%找出最左边的第一条 
f0=f1(:,index1(dang):index2(dang)); 
for i=1:18 
    nextt=fun1_1(f1,dang,index1,index2);%计算欧式距离     
    ftemp=f1(:,index1(nextt):index2(nextt));     
    f0=[f0,ftemp];     
    dang=nextt; 
end 

imwrite(f0,'D:/jp1.bmp');

end
