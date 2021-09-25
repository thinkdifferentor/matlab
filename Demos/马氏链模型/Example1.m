% 计算相邻两个状态的转移概率

a1='1110010011111110011110111111001111111110001101101';
a2='111011011010111101110111101111110011011111100111';
a=[a1 a2];
f00=length(findstr('00',a));
f01=length(findstr('01',a));
f10=length(findstr('10',a));
f11=length(findstr('11',a));





clc;
clear;

% 设置数域
format rat


% 打开文件
fid=fopen('Data.txt','r');
a=[];

% 文件读取
while (~feof(fid))
    a=[a fgetl(fid)];
end

% 数据统计
for i=0:1
    for j=0:1
        s=[int2str(i),int2str(j)];
        f(i+1,j+1)=length(findstr(s,a));
    end
end

% 比例分母求解--分别计算出第Xn为0和1的次数
% sum函数默认按列求和--对求和的矩阵进行转置
fs=sum(f');

% 比例计算
for i=1:2
    E(i,:)=f(i,:)/fs(i);
end

E;