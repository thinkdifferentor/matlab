%%% 本程序采用显示方案实现“平均曲率运动(MCM)”模型
clear;
clc;

%%- 读取曲线数据所在的文件
[filename, pathname] = uigetfile( ...
    {
    '*.c', 'All c-Files (*.c)'; ...
    '*.dat', 'All tif-Files (*.dat)'; ...
    '*.*','All Files (*.*)'}, ...
    'Select a curve');
%%- 如点击“取消”则返回
if isequal([filename,pathname],[0,0])
    return
end

File = fullfile(pathname,filename);
strImage=strcat(pathname,filename);
fid = fopen(strImage,'rt');
tline = fgetl(fid);
datalen=str2num(tline(3:length(tline)));
DataRange=zeros(datalen,2);
i=0;
while 1
    i=i+1;
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    divpos=0;
    while 1
        divpos=divpos+1;
        if tline(divpos)==' ', break, end
    end
    DataRange(i,1)=str2num(tline(1:divpos));
    DataRange(i,2)=str2num(tline(divpos:length(tline)));
end
fclose(fid);
hold off

%%- 绘制曲线
h=subplot(1,1,1);
fill(DataRange(:,2),DataRange(:,1),[0 0 0]);
axis ij;
axis off;
f = getframe(h);
[im, map] = frame2im(f);
im=rgb2gray(im);
im=double(im);
im=imresize(im, 0.4);             % 减小图片大小以缩短程序运行时间
[nnx,nny]=size(im);


%%- 检测曲线并将曲线上的点的坐标存入curvIndex
MaxlLengh=10*nnx+10*nny;
InitCurvImag=zeros(nnx,nny);
curvIndex=zeros(MaxlLengh,2);
num=0;
for i=1:nnx
    for j=1:nny
        if im(i,j)<5 & (im(i-1,j)>120 | im(i+1,j)>120 | im(i,j-1)>120 |im(i,j+1)>120)
            num=num+1;
            InitCurvImag(i,j)=255;
            curvIndex(num,1)=i;
            curvIndex(num,2)=j;
            for k=1:num-1
                if curvIndex(k,1)==i & curvIndex(k,2)==j
                    num=num-1;break
                end
            end
        end
    end
end
figure(2);imshow(uint8(InitCurvImag));

%%- 初始化U
U = zeros(nnx,nny);
dist=zeros(1,num);
for j=1:nny
    for i=1:nnx
        for k=1:num
            dist(k)=sqrt((i-curvIndex(k,1)).^2+(j-curvIndex(k,2)).^2);
        end
        U(i,j)=min(dist);
        if im(i,j)<5              % 如果点(i,j)在曲线内部，U为负
            U(i,j)=-U(i,j);
        end
    end
end
figure(3);surf(U);                % 显示U

%%-  迭代开始
dt=0.1;
DispCurvImag=InitCurvImag;
for n=1:1000
    U_x = (U(:,[2:nny nny])-U(:,[1 1:nny-1]))/2;
    U_y = (U([2:nnx nnx],:)-U([1 1:nnx-1],:))/2;
    U_xx = U(:,[2:nny nny])+U(:,[1 1:nny-1])-2*U;
    U_yy = U([2:nnx nnx],:)+U([1 1:nnx-1],:)-2*U;
    Dp = U([2:nnx nnx],[2:nny nny])+U([1 1:nnx-1],[1 1:nny-1]);
    Dm = U([1 1:nnx-1],[2:nny nny])+U([2:nnx nnx],[1 1:nny-1]);
    U_xy = (Dp-Dm)/4;
    Num = U_xx.*(U_y.^2)-2*U_x.*U_y.*U_xy+U_yy.*(U_x.^2);
    Den = U_x.^2+U_y.^2;
    I_t = Num./(Den+eps);

    U=U+dt*I_t;

    if mod(n,200)==0
        num=0;
        curvImag=zeros(nnx,nny);
        %%- 检测当前零水平集
        for i = 2 : nnx - 1
            for j = 2 : nny - 1
                if U(i,j)<0  & (U(i+1,j)>0 | U(i-1,j)>0 | U(i,j+1)>0 | U(i,j-1)>0)
                    num=num+1; curvIndex(num,1)=i;curvIndex(num,2)=j;
                    curvImag(i,j)=255;
                end
            end
        end
        %%- 重新初始化U
        new_u = zeros(nnx,nny);
        dist=zeros(1,num);
        for j=1:nny
            for i=1:nnx
                for k=1:num
                    dist(k)=sqrt((i-curvIndex(k,1)).^2+(j-curvIndex(k,2)).^2);
                end
                new_u(i,j)=min(dist);
                if U(i,j)<0
                    new_u(i,j)=-new_u(i,j);
                end
            end
        end
        U=new_u;
    end
    %%- 显示当前零水平集
    if mod(n,200)==0
        DispCurvImag=DispCurvImag+curvImag;
        figure(4);imshow(uint8(DispCurvImag));
    end

end



   

