clear
clc
close
fillImg = imread('bungee1.png');
% fillImg = imread('LENA256.bmp');
 
fillRegion = fillImg == 255;%fillRegionΪ���޸���Ϊ1���Ѵ��ڵ�Ϊ0
fillImg = double(fillImg);
origImg = fillImg;%���Ǵ��޸�ͼ��
s = size(fillImg);
ind = reshape(1:s(1)*s(2),s(1),s(2));%�ҳ�������ڴ����еõ�������
sz = [size(fillImg,1) size(fillImg,2)];
sourceRegion = ~fillRegion;%���޸���Ϊ0���Ѵ��ڵ�Ϊ1��
 
% Initialize isophote values
[Ix, Iy] = gradient(fillImg);
Ix = Ix ./ (255*sqrt(Ix.^2 + Iy.^2));
Ix(~isfinite(Ix))=0;
Iy = Iy ./ (255*sqrt(Ix.^2 + Iy.^2));
Iy(~isfinite(Iy))=0;
temp = Ix; Ix = -Iy; Iy = temp; % Rotate gradient 90 degrees�����ն��߷���
 
% Initialize confidence and data terms����ʼ��������������
C = double(sourceRegion);%���޸���Ϊ0���Ѵ��ڵ�Ϊ1��
D = repmat(-.1,sz);
 
 
% Seed 'rand' for reproducible results (good for testing)
rand('state',0);%�Ժ����������������һ�����в�������ͬ
 
% Loop until entire fill region has been covered
while any(fillRegion(:))
    % Find contour & normalized gradients of fill region
    dR = find(conv2(double(fillRegion),[1,1,1;1,-8,1;1,1,1],'same')>0);%���о�����ҵ��߽磬dRΪһ������������ʾ�߽�����
     
    [Nx, Ny] = gradient(C);
    N = [Nx(dR(:)), Ny(dR(:))];%�ҳ��߽����ݶȣ��ڶ�ֵͼ�����ݶȵ��ڷ��߷���
    N = normr(N);
    N(~isfinite(N))=0; % handle NaN and Inf����׼���ݶ�)����߽��ķ��߷���
     
    % Compute confidences along the fill front���������ű߽������Ŷȣ�
    for k = dR'
        Hp = getpatch(sz,k);%HpΪһ9*9���󣬾���ֵ�Ǵ��޸�������
        q = Hp(~(fillRegion(Hp)));%qΪһ������������,Ϊ���޸�����֪���ص������
        C(k) = sum(C(q))/numel(Hp);%�������Ŷ�
    end
     
    % Compute patch priorities = confidence term * data term
    D(dR) = abs(Ix(dR).*N(:,1)+Iy(dR).*N(:,2))+0.001;%������Ǳ߽����ݶ�ֵ�������Ǵ��޸�����ݶ����ֵ
    priorities = (0.5+10*C(dR)+10*D(dR))/20.1;
     
    % Find patch with maximum priority, Hp
    [unused,ndx] = max(priorities);
    p = dR(ndx(1));%pΪ���޸�������������
    [Hp,rows,cols] = getpatch(sz,p);%�ҵ�����Ȩ���Ŀ飬HpΪһ9*9���󣬾���ֵ�Ǵ��޸�������
    toFill = fillRegion(Hp);%fillRegionΪ���޸���Ϊ1���Ѵ��ڵ�Ϊ0��toFillΪ���޸��飬ҲΪ���޸���Ϊ1���Ѵ��ڵ�Ϊ0
     
    % Find exemplar that minimizes error, Hq
    Hq = bestexemplar(origImg,origImg(rows,cols),toFill',sourceRegion);%�ҵ�����ƥ��죬HqΪһ9*9���󣬾���ֵΪ����ƥ��������
     
    % Update fill region
    fillRegion(Hp(toFill)) = false; %Hp(toFill)��ʾֻ���´��޸�������꣬ʹ�ô��޸����ֵΪ0
    %sourceRegion = ~fillRegion;
     
    % Propagate confidence & isophote values
    C(Hp(toFill))  = C(p); %��ȥ���ǿ���޸�������Ŷȱ����£�C����sourceRegion�����޸���Ϊ0���Ѵ��ڵ�Ϊ1��������Ȩ�����޸�������Ŷ�����������Ȩ���Ŀ�����Ŷ�
    Ix(Hp(toFill)) = Ix(Hq(toFill));%������ƥ���������ݶ�����������Ȩ���Ŀ���ݶ�
    Iy(Hp(toFill)) = Iy(Hq(toFill));
     
    % Copy image data from Hq to Hp
    ind(Hp(toFill)) = ind(Hq(toFill));%����ƥ������������Ϊ���޸��������
    origImg(rows,cols) = ind2img(ind(rows,cols),origImg);%ind(rows,cols)��ʾ���޸�������귶Χ���÷�Χ�ѱ�����ƥ����ֵ�����
     
end
    inpaintedImg=origImg;
     
 
    imshow(inpaintedImg, [0 255])
     

