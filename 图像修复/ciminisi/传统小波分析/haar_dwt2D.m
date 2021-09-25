function [LL, LH ,HL ,HH]=haar_dwt2D(img)
    [m, n]=size(img);
    for i=1:m       %ÿһ�н��зֽ�
        [L ,H]=haar_dwt(img(i,:));
        img(i,:)=[L ,H];
    end
    for j=1:n       %ÿһ�н��зֽ�
       [L ,H]=haar_dwt(img(:,j));
       img(:,j)=[L ,H];
    end
    %�����ֽⲻӦ�ü�mat2gray�ģ�����Ϊ���кõ���ʾЧ���ͼ�����
    LL=mat2gray(img(1:m/2,1:n/2));          %���ж��ǵ�Ƶ  
    LH=mat2gray(img(1:m/2,n/2+1:n));        %�е�Ƶ�и�Ƶ
    HL=mat2gray(img(m/2+1:m,1:n/2));        %�и�Ƶ�е�Ƶ
    HH=mat2gray(img(m/2+1:m,n/2+1:n));      %���ж��Ǹ�Ƶ
    
end