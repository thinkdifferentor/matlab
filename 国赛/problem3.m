%�����������ʾ������


%���Ե�Ԫ��ľ���
d0 = 0.2778;


load Receive5
Absorb5=iradon(Receive5,[0:179]);

Num=size(Absorb5,1);

[W, L] = meshgrid([-Num/2:Num/2]*d0);

%����ͼ
imagesc(W(1,:), L(:,1), Absorb5)