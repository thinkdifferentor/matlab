function p=circleCross(cic1,cic2)

    x0=cic1(1);
    y0=cic1(2);
    r0=cic1(3);

    x1=cic2(1);
    y1=cic2(2);
    r1=cic2(3);

    d=sqrt((x0-x1)^2+(y0-y1)^2);    %��Բ�ľ���

    k1=(y0-y1)/(x0-x1);         %������Բ��ֱ��
    b1=y1-k1*x1;

    k2=-1/k1;               %�����ҷ���ֱ��
    b2=(r0^2-r1^2-x0^2+x1^2-y0^2+y1^2)/(2*(y1-y0));

    p=[];
    if d==abs(r1-r0) || d==r1+r0        %����ʱ�Ľ���
        xx=-(b1-b2)/(k1-k2);
        yy=-(-b2*k1+b1*k2)/(k1-k2);
        p=[xx yy];
    elseif abs(r1-r0)<d && d<r1+r0      %�ཻʱ�Ľ���
                                        %�����ҷ���������һ��Բ�Ľ���
        xx1=(-b2* k2 + x1 + k2 *y1 - sqrt(-b2^2 + r1^2 + k2^2 *r1^2 - 2 *b2* k2* x1 - k2^2* x1^2 + 2*b2*y1 + 2*k2*x1*y1 - y1^2))/(1 + k2^2);
        yy1=k2*xx1+b2;
     
        xx2=(-b2* k2 + x1 + k2 *y1 + sqrt(-b2^2 + r1^2 + k2^2 *r1^2 - 2 *b2* k2* x1 - k2^2* x1^2 + 2*b2*y1 + 2*k2*x1*y1 - y1^2))/(1 + k2^2);  
        yy2=k2*xx2+b2;
        
        p=[xx1 yy1;xx2 yy2];         
    end

end