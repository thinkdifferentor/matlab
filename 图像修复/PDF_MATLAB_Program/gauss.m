function Ig=gauss(I,ks,sigma2)
%%% 子函数: gauss()实现高斯平滑滤波
%%% 参数说明：
%%% I       - 待平滑图像
%%% ks      - 高斯核大小 (奇数)
%%% sigma2  - 高斯函数的方差
%%% Ig      - 返回的高斯平滑后的图象

[Ny,Nx]=size(I);
hks=(ks-1)/2;  % 高斯核的一半
%%- 一维卷积
if (Ny<ks)
    x=(-hks:hks);
    flt=exp(-(x.^2)/(2*sigma2));       % 一维高斯函数
    flt=flt/sum(sum(flt));             % 归一化
    %%- 扩展
    x0=mean(I(:,1:hks)); xn=mean(I(:,Nx-hks+1:Nx));
    eI=[x0*ones(Ny,ks) I xn*ones(Ny,ks)];
    Ig=conv(eI,flt);
    Ig=Ig(:,ks+hks+1:Nx+ks+hks);       % 截尾
else
    %%- 二维卷积
    x=ones(ks,1)*(-hks:hks); y=x';
    flt=exp(-(x.^2+y.^2)/(2*sigma2));  % 二维高斯函数
    flt=flt/sum(sum(flt));             % 归一化
    %%- 扩展
    if (hks>1)
        xL=mean(I(:,1:hks)')'; xR=mean(I(:,Nx-hks+1:Nx)')';
    else
        xL=I(:,1); xR=I(:,Nx);
    end
    eI=[xL*ones(1,hks) I xR*ones(1,hks)];
    if (hks>1)
        xU=mean(eI(1:hks,:)); xD=mean(eI(Ny-hks+1:Ny,:));
    else
        xU=eI(1,:); xD=eI(Ny,:);
    end
    eI=[ones(hks,1)*xU; eI; ones(hks,1)*xD];
    Ig=conv2(eI,flt,'valid');
end

