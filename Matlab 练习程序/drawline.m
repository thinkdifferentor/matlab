function img=drawline(img,x1,y1,x2,y2)   %因为图像坐标和数学函数坐标y轴朝向相反，所以这里所有y变量取相反数
    [h w]=size(img);
    y1=-y1;
    y2=-y2;
    
    if x1~=x2
        k=(y2-y1)/(x2-x1);
        b=y1-k*x1;      
        for i=1:w
            yy=-round(i*k+b);
            xx=i;
            if yy>=1 && yy<=h && xx>=1 && xx<=w
                img(yy,xx)=1; 
            end
        end
    end
    
    if y1~=y2
        k=(x2-x1)/(y2-y1);
        b=x1-k*y1;         
        for i=-h:1
            yy=-i;
            xx=round(i*k+b);
            if yy>=1 && yy<=h && xx>=1 && xx<=w
                img(yy,xx)=1; 
            end
        end        
    end
 
end
