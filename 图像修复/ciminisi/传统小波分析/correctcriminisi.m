clear
clc
close
fillImg = imread('bungee1.png');
% fillImg = imread('LENA256.bmp');
 
fillRegion = fillImg == 255;%fillRegion为待修复点为1，已存在点为0
fillImg = double(fillImg);
origImg = fillImg;%都是待修复图像
s = size(fillImg);
ind = reshape(1:s(1)*s(2),s(1),s(2));%找出各点的在从列中得到的坐标
sz = [size(fillImg,1) size(fillImg,2)];
sourceRegion = ~fillRegion;%待修复点为0，已存在点为1；
 
% Initialize isophote values
[Ix, Iy] = gradient(fillImg);
Ix = Ix ./ (255*sqrt(Ix.^2 + Iy.^2));
Ix(~isfinite(Ix))=0;
Iy = Iy ./ (255*sqrt(Ix.^2 + Iy.^2));
Iy(~isfinite(Iy))=0;
temp = Ix; Ix = -Iy; Iy = temp; % Rotate gradient 90 degrees（等照度线方向）
 
% Initialize confidence and data terms（初始化置信项和数据项）
C = double(sourceRegion);%待修复点为0，已存在点为1；
D = repmat(-.1,sz);
 
 
% Seed 'rand' for reproducible results (good for testing)
rand('state',0);%以后产生的随机数都与第一次运行产生的相同
 
% Loop until entire fill region has been covered
while any(fillRegion(:))
    % Find contour & normalized gradients of fill region
    dR = find(conv2(double(fillRegion),[1,1,1;1,-8,1;1,1,1],'same')>0);%进行卷积以找到边界，dR为一组列向量，表示边界坐标
     
    [Nx, Ny] = gradient(C);
    N = [Nx(dR(:)), Ny(dR(:))];%找出边界点的梯度，在二值图像中梯度等于法线方向
    N = normr(N);
    N(~isfinite(N))=0; % handle NaN and Inf（标准化梯度)求出边界点的法线方向
     
    % Compute confidences along the fill front（计算沿着边界点的置信度）
    for k = dR'
        Hp = getpatch(sz,k);%Hp为一9*9矩阵，矩阵值是待修复块坐标
        q = Hp(~(fillRegion(Hp)));%q为一个列向量矩阵,为该修复块已知像素点的坐标
        C(k) = sum(C(q))/numel(Hp);%计算置信度
    end
     
    % Compute patch priorities = confidence term * data term
    D(dR) = abs(Ix(dR).*N(:,1)+Iy(dR).*N(:,2))+0.001;%计算的是边界点的梯度值，而不是待修复块的梯度最大值
    priorities = (0.5+10*C(dR)+10*D(dR))/20.1;
     
    % Find patch with maximum priority, Hp
    [unused,ndx] = max(priorities);
    p = dR(ndx(1));%p为待修复块的中心坐标点
    [Hp,rows,cols] = getpatch(sz,p);%找到优先权最大的块，Hp为一9*9矩阵，矩阵值是待修复块坐标
    toFill = fillRegion(Hp);%fillRegion为待修复点为1，已存在点为0，toFill为待修复块，也为待修复点为1，已存在点为0
     
    % Find exemplar that minimizes error, Hq
    Hq = bestexemplar(origImg,origImg(rows,cols),toFill',sourceRegion);%找到最优匹配快，Hq为一9*9矩阵，矩阵值为最优匹配块的坐标
     
    % Update fill region
    fillRegion(Hp(toFill)) = false; %Hp(toFill)表示只留下待修复点的坐标，使得待修复点的值为0
    %sourceRegion = ~fillRegion;
     
    % Propagate confidence & isophote values
    C(Hp(toFill))  = C(p); %被去掉那块的修复快的置信度被更新，C代表sourceRegion，待修复点为0，已存在点为1；用优先权最大的修复点的置信度来代替优先权最大的块的置信度
    Ix(Hp(toFill)) = Ix(Hq(toFill));%用最优匹配块的向量梯度来更新优先权最大的块的梯度
    Iy(Hp(toFill)) = Iy(Hq(toFill));
     
    % Copy image data from Hq to Hp
    ind(Hp(toFill)) = ind(Hq(toFill));%最优匹配块的坐标来作为待修复块的坐标
    origImg(rows,cols) = ind2img(ind(rows,cols),origImg);%ind(rows,cols)表示待修复块的坐标范围，该范围已被最优匹配块的值所替代
     
end
    inpaintedImg=origImg;
     
 
    imshow(inpaintedImg, [0 255])
     

