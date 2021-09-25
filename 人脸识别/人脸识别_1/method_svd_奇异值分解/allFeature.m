%读入人脸图片，并将其转换成为灰度矩阵,然后将灰度矩阵进行切割，再用SVD分解，并提取图片特征
%返回参数
%feature为指向装载后的数据文件的变量
%num的值为特征值向量的第几维
%函数声明
function [feature] = allFeature(num)

%用户输入特征维数数目
panDuan = 1;
while panDuan 
    featureNumber = input('请输入特征维数（仅限于8, 16，24, 32，48，64，80）：');
    %如果输入的是8.16.24.32.48.64.80,则继续执行代码
    if(featureNumber == 8||featureNumber == 16 || featureNumber == 24|| featureNumber == 32 || featureNumber == 48 || featureNumber == 64 || featureNumber == 80 )
        panDuan = 0;
        disp('开始装载图像文件,请等待.......')
    %如果输入的是其它数字,提示输入有误,请用户重新输入
    else
        fprintf('你输入的不是这5个数中的任何一个,请重新输入!\n\n')
    end
end
%得出图片的路径，并自动读入每张图片
dir = ['\1.bmp '
    '\2.bmp '
    '\3.bmp '
    '\4.bmp '
    '\5.bmp '
    '\6.bmp '
    '\7.bmp '
    '\8.bmp '
    '\9.bmp '
    '\10.bmp'];
for x=1:40,
    %将数字转换成字符，便于把两个字符连接，组成图片的完整路径
    a = int2str(x);
    b = ['s'];
    d = [b a];
    for i=1:10,
        %得到每张图片的文件名
        e = [d dir(i,1:7)];
        % 将图片转化成为灰度矩阵
        M = double(imread(e));
        %如果用户输入的是8,则执行下段代码,把数据处理得到8维的特征向量
        if (featureNumber == 8)
            for j=1:4,
                for k=1:2,
                    %将图片的灰度矩阵划分成8块小矩阵
                    temp=M((j-1)*28+1:j*28,(k-1)*46+1:k*46);
                    %对每个小矩阵进行SVD变换
                    [u,temp1,v]=svd(temp);
                    %提取一个的SVD系数作为特征值
                    temp2=temp1(num,num);
                    %得到所有图片的特征矩阵
                    feature((x-1)*10+i,(j-1)*2+k)=temp2;
                end
            end
        end
        %如果用户输入的是16,则执行下段代码,把数据处理得到16维的特征向量
        if (featureNumber == 16)
            for j=1:4,
                for k=1:4,
                    %将图片的灰度矩阵划分成16块小矩阵
                    temp=M((j-1)*28+1:j*28,(k-1)*23+1:k*23);
                    %对每个小矩阵进行SVD变换
                    [u,temp1,v]=svd(temp);
                    %提取一个的SVD系数作为特征值
                    temp2=temp1(num,num);
                    %得到所有图片的特征矩阵
                    feature((x-1)*10+i,(j-1)*4+k)=temp2;
                end
            end
        end
        %如果用户输入的是24,则执行下段代码,把数据处理得到16维的特征向量
        if (featureNumber == 24)
            for j=1:6,
                for k=1:4,
                    %将图片的灰度矩阵划分成24块小矩阵
                    temp=M((j-1)*18+1:j*18,(k-1)*23+1:k*23);
                    %对每个小矩阵进行SVD变换
                     [u,temp1,v]=svd(temp);
                    %提取一个的SVD系数作为特征值
                    temp2=temp1(num,num);
                    %得到所有图片的特征矩阵
                    feature((x-1)*10+i,(j-1)*4+k)=temp2;
                end
            end
        end

        %如果用户输入的是32,则执行下段代码,把数据处理得到32维的特征向量
        if (featureNumber == 32)
            for j=1:8,
                for k=1:4,
                    %将图片的灰度矩阵划分成32块小矩阵
                    temp=M((j-1)*14+1:j*14,(k-1)*23+1:k*23);
                    %对每个小矩阵进行SVD变换
                    [u,temp1,v]=svd(temp);
                    %提取最大的SVD系数作为特征值
                    temp2=temp1(num,num);
                    %得到所有图片的特征矩阵
                    feature((x-1)*10+i,(j-1)*4+k)=temp2;
                end
            end
        end
        %如果用户输入的是48,则执行下段代码,把数据处理得到48维的特征向量
        if (featureNumber == 48)
            for j=1:8,
                for k=1:6,
                    %将图片的灰度矩阵划分成48块小矩阵
                    temp=M((j-1)*14+1:j*14,(k-1)*15+1:k*15);
                    %对每个小矩阵进行SVD变换
                    [u,temp1,v]=svd(temp);
                    %提取最大的SVD系数作为特征值
                    temp2=temp1(num,num);
                    %得到所有图片的特征矩阵
                    feature((x-1)*10+i,(j-1)*6+k)=temp2;
                end
            end
        end
        %如果用户输入的是64,则执行下段代码,把数据处理得到64维的特征向量
        if (featureNumber == 64)
            for j=1:8,
                for k=1:8,
                    %将图片的灰度矩阵划分成64块小矩阵
                    temp=M((j-1)*14+1:j*14,(k-1)*11+1:k*11);
                    %对每个小矩阵进行SVD变换
                    [u,temp1,v]=svd(temp);
                    %提取最大的SVD系数作为特征值
                    temp2=temp1(num,num);
                    %得到所有图片的特征矩阵
                    feature((x-1)*10+i,(j-1)*8+k)=temp2;
                end
            end
        end
        %如果用户输入的是80,则执行下段代码,把数据处理得到80维的特征向量
        if (featureNumber == 80)
            for j=1:10,
                for k=1:8,
                    %将图片的灰度矩阵划分成80块小矩阵
                    temp=M((j-1)*11+1:j*11,(k-1)*11+1:k*11);
                    %对每个小矩阵进行SVD变换
                    [u,temp1,v]=svd(temp);
                    %提取最大的SVD系数作为特征值
                    temp2=temp1(num,num);
                    %得到所有图片的特征矩阵
                    feature((x-1)*10+i,(j-1)*8+k)=temp2;
                end
            end
        end
    end
end
%输出提示信息,说明图片处理完毕
fprintf('图片装载完毕，请继续下面的操作\n\n');
