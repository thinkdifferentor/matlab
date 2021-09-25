%问题三吸收率矩阵求解


%测试单元间的距离
d0 = 0.2778;


load Receive5
Absorb5=iradon(Receive5,[0:179]);

Num=size(Absorb5,1);

[W, L] = meshgrid([-Num/2:Num/2]*d0);

%轮廓图
imagesc(W(1,:), L(:,1), Absorb5)