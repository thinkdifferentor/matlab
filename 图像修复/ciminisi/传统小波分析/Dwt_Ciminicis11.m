function [ L_bmp ] =Dwt_Ciminicis11( bmp,LL1 )

imshow(bmp,[]);
CBMP=cell(1,4);
[m, n]=size(bmp);
Q=0;
for i=0:m/2:m/2
    for j=0:n/2:n/2
        Q=Q+1;
       CBMP{Q}=bmp(i+1:i+m/2,j+1:j+n/2);  
    end
end
figure();
imshow(CBMP{1},[]);

%imwrite(CBMP{1},'problem1_1.bmp');

% fillImg = imread('img2.bmp');
%imshow(fillImg)
% fillImg = imread('LENA256.bmp');
% fillRegion = find(fillImg >= 220);%fillRegionΪ���޸���Ϊ1���Ѵ��ڵ�Ϊ0
% fillImg(fillRegion)=255;
Onse=find(LL1(:)~=0);
 s = size(LL1);
fillRegion =zeros(s);
fillRegion(Onse)=true;
fillRegion=logical(fillRegion);
%imshow(fillRegion );
fillImg=CBMP{1};
%fillRegion = fillImg == 255;%fillRegionΪ���޸���Ϊ1���Ѵ��ڵ�Ϊ0
fillImg = double(fillImg);
origImg = fillImg;%���Ǵ��޸�ͼ��
ind = reshape(1:s(1)*s(2),s(1),s(2));%�ҳ�������ڴ����еõ�������
sz = [size(fillImg,1) size(fillImg,2)];
sourceRegion = ~fillRegion;%���޸���Ϊ0���Ѵ��ڵ�Ϊ1��
 
% Initialize isophote values
[Ix, Iy] = gradient(fillImg);%[Fx,Fy]=gradient(F)������FxΪ��ˮƽ�����ϵ��ݶȣ�
%FyΪ�䴹ֱ�����ϵ��ݶȣ�Fx�ĵ�һ��Ԫ��Ϊԭ����ڶ������һ��Ԫ��֮�Fx�ĵڶ���Ԫ��Ϊԭ������������һ��Ԫ��֮�����2���Դ����ƣ�Fx(i,j)=(F(i,j+1)-F(i,j-1))/2�����һ����Ϊ�������֮�ͬ�����Եõ�Fy��
Ix = Ix ./ (255*sqrt(Ix.^2 + Iy.^2));
Ix(~isfinite(Ix))=0;%�ж�./�����Ԫ���Ƿ����н�ģ�������inf��
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
     sourceRegion = ~fillRegion;
     C = double(sourceRegion);
    
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
    priorities = C(dR).*D(dR);
     
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
    for i=1:length(CBMP)
        CBMP{i}(rows,cols)=ind2img(ind(rows,cols), CBMP{i});
     end   
    
end
inpaintedImg=origImg;
figure();
imshow(inpaintedImg, []);
    
% for i=1:length(CBMP)
%     figure();
%     imshow(CBMP{i},[]);
% end
% figure(2);
% imshow(cim, [0 255]);
cA=idwt2(CBMP{1}, CBMP{2}, CBMP{3},CBMP{4},'haar','sX');
% cH=idwt2(CBMP{3}, CBMP{4}, CBMP{7},CBMP{8},'db1','sX');
% cV=idwt2(CBMP{9}, CBMP{10}, CBMP{13},CBMP{14},'db1','sX');
% cD=idwt2(CBMP{12}, CBMP{13}, CBMP{15},CBMP{16},'db1','sX');

% AA=idwt2(cA,cH,cV,cD,'db1','sX');
figure()
imshow(cA,[]);

L_bmp=cA;

end


