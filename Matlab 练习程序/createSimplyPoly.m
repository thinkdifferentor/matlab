function p=createSimplyPoly(p)
    cen=mean(p);
    ang=atan2(p(:,1)-cen(1),p(:,2)-cen(2)); %每个点到坐标中心极角

    p=[p,ang];
    p=sortrows(p,3);    %按极角排序

    p=p(:,1:2);
end