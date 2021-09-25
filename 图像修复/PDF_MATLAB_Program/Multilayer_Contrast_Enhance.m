%%% 本程序采用保持形状的灰度变换方法实现多层对比度增强
%%% 将调用到以下子函数：
%%% P_L_HE_f() : 由输入图像直方图计算分段线形拉伸函数
clear all;
close all;
clc;

I_in = imread('lena2.jpg');
I_in = double(rgb2gray(I_in));
[nrow,ncol] = size(I_in);
%%- 显示输入图像及其直方图
figure(1);
subplot(121); imshow(uint8(I_in)); subplot(122); plot(imhist(uint8(I_in)));

N=64;
I_in_int=uint8(I_in);
h=imhist(I_in_int)/(nrow*ncol);
f=P_L_HE_f(h,255,0,255,0,N);
I_in=f(I_in_int+1);
%%- 显示全局直方图均衡化的结果
figure(2);
subplot(121);imshow(uint8(I_in)); subplot(122);plot(imhist(uint8(I_in)));

K=3;    % 分层数                                        
%%- 初始化存储区
Dbmax = zeros(1,2^K); Dbmin = zeros(1,2^K);  
Damax = zeros(1,2^K); Damin = zeros(1,2^K);
Damax(1)=ceil(max(max(I_in))); Damin(1)=floor(min(min(I_in)));
I_result=I_in;
I_out(:,:,1)=double(I_in);
I_out_bw(:,:,1)=ones(nrow,ncol);

for k=1:K
    layer = 2^k;N=N/2;
    interval = 256/layer;
    for j=1:layer
        Dbmin(j) =(j-1)*interval;
        Dbmax(j) = Dbmin(j)+interval-1;
    end
    %%- 以追加方式，将前一级的每一层图像I_out(j)分为两层子图像I_out(2j-1),I_out(2j)
    j=layer/2;
    while j>=1
        %%- 将前一级的I_out(j)的定义域I_out_bw(:,:,j)一分为二，
        sum1=sum(sum(I_out(:,:,j)));
        A = sum(sum(I_out_bw(:,:,j)));
        threshold = ceil(sum1/A);                        % 求得I_out(j)的平均灰度作为阈值threshold
        Damax(2*j)=ceil(max(max(I_out(:,:,j)))); Damin(2*j)=threshold+1;
        Damax(2*j-1)=threshold; Damin(2*j-1)=floor(min(min(I_out(:,:,j))));
        I_temp_bw(:,:) = (I_out(:,:,j)>threshold);
        I_out_bw(:,:,2*j) = I_temp_bw.*I_out_bw(:,:,j);
        I_out(:,:,2*j)=I_out_bw(:,:,2*j).*I_out(:,:,j);  % 如果不空，取得子图像。
        I_out_bw(:,:,2*j-1) = (~I_out_bw(:,:,2*j)).*(I_out_bw(:,:,j));
        I_out(:,:,2*j-1)=I_out_bw(:,:,2*j-1).*I_out(:,:,j);
        j=j-1;
    end

    %%- 对小的连通分量的所属分层重新划分
    j=1;
    while j<layer
        [connected_comp_label,connected_comp_num]=bwlabel(I_out_bw(:,:,j));
        for i = 1:connected_comp_num                      % 对第j层第i个连通分量操作
            [r_ci,c_ci] = find(connected_comp_label==i);  % 提取第j层第i个连通分量的像素坐标
            A = length(r_ci);                             % 计算第j层第i个连通分量的面积;
            if A<4
                for ii=1:A
                    I_out_bw(r_ci(ii),c_ci(ii),j)=0;I_out_bw(r_ci(ii),c_ci(ii),j+1)=1;
                end
            end
        end
        [connected_comp_label,connected_comp_num]=bwlabel(I_out_bw(:,:,j+1));
        for i = 1:connected_comp_num
            [r_ci,c_ci] = find(connected_comp_label==i);
            A = length(r_ci);
            if A<4
                for ii=1:A
                    I_out_bw(r_ci(ii),c_ci(ii),j+1)=0;I_out_bw(r_ci(ii),c_ci(ii),j)=1;
                end
            end
        end
        j=j+2;
    end

    %%- 处理各层子图像
    for j=1:layer
        [connected_comp_label,connected_comp_num]=bwlabel(I_out_bw(:,:,j));  %对第j层子图重新进行标注
        for i = 1:connected_comp_num                           % 对第j层第i个连通分量操作
            [r_ci,c_ci] = find(connected_comp_label==i);       % 提取第j层第i个连通分量的像素坐标
            A = length(r_ci);                                  % 计算第j层第i个连通分量的面积
            I_ci = zeros(1,A);                                 % 开辟第j层第i个连通区图像的存贮空间
            for ii = 1:A
                I_ci(ii) = uint8(I_out(r_ci(ii),c_ci(ii),j));  % 取出第j层第i个连通区的子图像，以矢量形式存放
            end

            %%- 对第j层第i个连通区的图像作灰度变换
            I_ci_max=max(I_ci); I_ci_min=min(I_ci);
            bins_ci=I_ci_max-I_ci_min+1;
            hh=hist(I_ci-I_ci_min,bins_ci)/A;        
            h([1:256])=0;
            for ii=1:bins_ci
                h(ii+I_ci_min)=hh(ii);                 
            end                                      
            f=P_L_HE_f(h,I_ci_max,I_ci_min,Dbmax(j),Dbmin(j),N);
            I_ci=f(I_ci+1);
            %%- 将变换后第j层第i个连通区的图像放回I_out(j)和I_result
            for ii = 1:A
                I_out(r_ci(ii),c_ci(ii),j) = I_ci(ii);
                I_result(r_ci(ii),c_ci(ii)) = I_ci(ii);
            end
        end
    end
    figure(2+k);
    subplot(121); imshow(uint8(I_result)); subplot(122); plot(imhist(uint8(I_result)));
end




            

