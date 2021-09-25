%scor可以对向量和矩阵进行升序或降序排序
function [V_over,D_over]=reorder_cart(P,V,D)  %P概率 V特征向量 D特征矩阵
D=sum(D);  %将对角线元素提取（D为对角矩阵）
S=sum(D);
Df=0;
for ii=1:size(D,2)
    for jj=ii+1:size(D,2)
        if D(ii)>=D(jj)
            break;
        else
            buf1=D(ii);  
            D(ii)=D(jj);  %对特征值D排序
            D(jj)=buf1;
            buf2=V(:,ii);
            V(:,ii)=V(:,jj);  %对相应的特征向量排序
            V(:,jj)=buf2;
        end
    end
end
ii=1;
while Df/S<P
    Df=Df+D(ii);  %寻找前ii个特征值使得占总体概率大于P
    ii=ii+1;
end
    D_over=D(1:ii);
    V_over=V(:,1:ii);  %概率大于P的特征值对应的特征向量
end
