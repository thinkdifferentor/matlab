function result = WidthSim( lpic,rpic )
%��i��j��Ƭ�Ŀ�����ƶ�
[~,col] = size(lpic);
lpic = lpic./255;
rpic = rpic./255;
spa = 4; %spaΪ����֮��ļ��
cha = 40; %chaΪ���ӵĿ��
%ÿһ�б�ʾһ����Ƭ��ͶӰ
for j=1:col
    if find(lpic(:,j)==0)
        lshadow(j)=1;
    else
        lshadow(j)=0;
    end
    if find(rpic(:,j)==0)
        rshadow(j)=1;
    else
        rshadow(j)=0;
    end
end
lw = 0; rw = 0; lb = 0; rb = 0;% lw,rwΪ������Ƭ�����ֿ�ȣ�lb,rbΪ������Ƭ�������
if lshadow(end)==1
    for i = col:-1:1
        if lshadow(i)==1
            lw = lw+1;
        else
            break;
        end
    end
else
    for i = col:-1:1
        if lshadow(i)==0
            lb = lb+1;
        else
            break;
        end
    end
end
if rshadow(1)==1
    for i = 1:col
        if rshadow(i)==1
            lw = lw+1;
        else
            break;
        end
    end
else
    for i = 1:col
        if rshadow(i)==0
            lb = lb+1;
        else
            break;
        end
    end
end
wmat = ((lw+rw)/cha-1)^2 + ((lb+rb)/spa-1)^2;
result = 1/(wmat+1);
end
