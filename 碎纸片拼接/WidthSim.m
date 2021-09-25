function result = WidthSim( lpic,rpic )
%求i、j碎片的宽度相似度
[~,col] = size(lpic);
lpic = lpic./255;
rpic = rpic./255;
spa = 4; %spa为汉字之间的间距
cha = 40; %cha为汉子的宽度
%每一行表示一个碎片的投影
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
lw = 0; rw = 0; lb = 0; rb = 0;% lw,rw为左右碎片的文字宽度，lb,rb为左右碎片背景宽度
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
