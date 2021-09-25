clear,clc
close all;
tic;
% fillImg = rgb2gray(imread('barbi_inp_1.png'));%����Ϊ��ɫͼƬ--��Ҫ��ͼƬ���ҶȻ�����
fillImg = imread('lena_inp_1.bmp');
fillRegion = fillImg == 255;%fillRegionΪ���޸���Ϊ1���Ѵ��ڵ�Ϊ0
fillImg = double(fillImg);
origImg = fillImg;%���Ǵ��޸�ͼ��
s = size(fillImg);
ind = reshape(1:s(1)*s(2),s(1),s(2));%�ҳ�������ڴ����еõ�������
sz = [size(fillImg,1) size(fillImg,2)];
sourceRegion = ~fillRegion;%���޸���Ϊ0���Ѵ��ڵ�Ϊ1��
 
% ���ն�ֵ��ʼ��
[Ix, Iy] = gradient(fillImg);
Ix = Ix ./ (255*sqrt(Ix.^2 + Iy.^2));
Ix(~isfinite(Ix))=0;
Iy = Iy ./ (255*sqrt(Ix.^2 + Iy.^2));
Iy(~isfinite(Iy))=0;
temp = Ix; Ix = -Iy; Iy = temp; % Rotate gradient 90 degrees�����ն��߷���
 
% ��ʼ���������������
C = double(sourceRegion);%���޸���Ϊ0���Ѵ��ڵ�Ϊ1��
D = repmat(-.1,sz);
 
rand('state',0);%�Ժ����������������һ�����в�������ͬ
 
% ѭ�����������޸�����
while any(fillRegion(:))
    
    % Ѱ���޸�����ĵȸ��ߺ͹�һ���ݶ�
    dR = find(conv2(double(fillRegion),[1,1,1;1,-8,1;1,1,1],'same')>0);%���о�����ҵ��߽磬dRΪһ������������ʾ�߽�����
     
    [Nx, Ny] = gradient(C);
    N = [Nx(dR(:)), Ny(dR(:))];%�ҳ��߽����ݶȣ��ڶ�ֵͼ�����ݶȵ��ڷ��߷���
    N = normr(N);
    N(~isfinite(N))=0; % handle NaN and Inf����׼���ݶ�)����߽��ķ��߷���
     
    % �������ű߽������Ŷ�
    for k = dR'
        Hp = getpatch(sz,k);%HpΪһ9*9���󣬾���ֵ�Ǵ��޸�������
        q = Hp(~(fillRegion(Hp)));%qΪһ������������,Ϊ���޸�����֪���ص������
        C(k) = sum(C(q))/numel(Hp);%�������Ŷ�
    end
     
    % �޸���=������*������
    D(dR) = abs(Ix(dR).*N(:,1)+Iy(dR).*N(:,2))+0.001;%������Ǳ߽����ݶ�ֵ�������Ǵ��޸�����ݶ����ֵ
    priorities = (0.5+10*C(dR)+10*D(dR))/20.1;
     
    %�ҵ�������ȼ������޲���, Hp
    [unused,ndx] = max(priorities);
    p = dR(ndx(1));%pΪ���޸�������������
    [Hp,rows,cols] = getpatch(sz,p);%�ҵ�����Ȩ���Ŀ飬HpΪһ9*9���󣬾���ֵ�Ǵ��޸�������
    toFill = fillRegion(Hp);%fillRegionΪ���޸���Ϊ1���Ѵ��ڵ�Ϊ0��toFillΪ���޸��飬ҲΪ���޸���Ϊ1���Ѵ��ڵ�Ϊ0
     
    % �ҵ�ƥ�������С������, Hq
    Hq = bestexemplar(origImg,origImg(rows,cols),toFill',sourceRegion);%�ҵ�����ƥ��죬HqΪһ9*9���󣬾���ֵΪ����ƥ��������
     
    % �����������
    fillRegion(Hp(toFill)) = false; %Hp(toFill)��ʾֻ���´��޸�������꣬ʹ�ô��޸����ֵΪ0
    %sourceRegion = ~fillRegion;
     
    % ���ŶȺ͵��ն�ֵ����
    C(Hp(toFill))  = C(p); %��ȥ���ǿ���޸�������Ŷȱ����£�C����sourceRegion�����޸���Ϊ0���Ѵ��ڵ�Ϊ1��������Ȩ�����޸�������Ŷ�����������Ȩ���Ŀ�����Ŷ�
    Ix(Hp(toFill)) = Ix(Hq(toFill));%������ƥ���������ݶ�����������Ȩ���Ŀ���ݶ�
    Iy(Hp(toFill)) = Iy(Hq(toFill));
     
    % ������ƥ���������䵽��Ӧ�޸�����
    ind(Hp(toFill)) = ind(Hq(toFill));%����ƥ������������Ϊ���޸��������
    origImg(rows,cols) = ind2img(ind(rows,cols),origImg);%ind(rows,cols)��ʾ���޸�������귶Χ���÷�Χ�ѱ�����ƥ����ֵ�����
     
end

%�޸�ǰ��ͼ��Ա�
inpaintedImg=origImg;
figure('name','ͼ���޸�ǰ��Ա�');
subplot(1,2,1);imshow(fillImg, [0 255]);title('ԭͼ��');
subplot(1,2,2);imshow(inpaintedImg, [0 255]);title('�޸�ͼ');
toc;
     
