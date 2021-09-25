function newim = createimage( im,u,Flag )
%%% 子函数：createimage()实现当前零水平集（演化曲线）在原图上的显示
%%%         和嵌入函数u的重新初始化
%%% 参数说明：
%%% im     - 原始图像
%%% u      - 当前水平集函数
%%% Flag   - 是否进行重新初始化的标志，0：否；1：是
%%% newim  - 返回的当前零水平集（红色曲线）叠加在原图上的新图像

[nny,nnx]=size(im);
curvIndex=zeros(5*nnx*nny,2);
curvImag=zeros([nny,nnx]);
num=0;
%%- 标记当前零水平集
for i = 2 : nnx - 1
    for j = 2 : nny - 1
        if u(i,j)<0  & (u(i+1,j)>0 | u(i-1,j)>0 | u(i,j+1)>0 | u(i,j-1)>0)
            num=num+1; curvIndex(num,1)=i;curvIndex(num,2)=j;
            curvImag(i,j)=255;
        end
    end
end
%%- 在原图上显示当前零水平集
tempim = im;
tempim(curvImag>0) = 255;
newim( :, :, 1 ) = tempim;
tempim(curvImag>0) = 0;
newim( :, :, 2 ) = tempim;
newim( :, :, 3 ) = tempim;
newim = uint8( newim );

%%- 如果Flag=1，则重新初始化u
if Flag
    new_u = zeros(nnx,nny);
    dist=zeros(1,num);
    for j=1:nny
        for i=1:nnx
            for k=1:num
                dist(k)=sqrt((i-curvIndex(k,1)).^2+(j-curvIndex(k,2)).^2);
            end
            new_u(i,j)=min(dist);
            if u(i,j)<0
                new_u(i,j)=-new_u(i,j);
            end
        end
    end
    u=new_u;
end

