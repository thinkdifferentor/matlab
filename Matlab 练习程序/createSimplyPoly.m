function p=createSimplyPoly(p)
    cen=mean(p);
    ang=atan2(p(:,1)-cen(1),p(:,2)-cen(2)); %ÿ���㵽�������ļ���

    p=[p,ang];
    p=sortrows(p,3);    %����������

    p=p(:,1:2);
end