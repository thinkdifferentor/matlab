% 例 2 某地区有 6 个母因素 yi （i = 1,2,",6 ）， 5 个子因素 x j （j = 1,2,",5）如
% 下：
% x1 ：固定资产投资 y1 ：国民收入
% x2 ：工业投资 y2 ：工业收入
% x3 ：农业投资 y3 ：农业收入
% x4 ：科技投资 y4 ：商业收入
% x5 ：交通投资 y5 ：交通收入
% y6 ：建筑业收入
% 其数据列于表 4。
% 表 4 投资和收入数据
% 1979 1980 1981 1982 1983
% x1
% 308.58 310 295 346 367
% x 2
% 195.4 189.9 187.2 205 222.7
% x 3
% 24.6 21 12.2 15.1 14.57
% x 4
% 20 25.6 23.3 29.2 30
% x 5
% 18.98 19 22.3 23.5 27.655
% y1
% 170 174 197 216.4 235.8
% y 2
% 57.55 70.74 76.8 80.7 89.85
% y 3
% 88.56 70 85.38 99.83 103.4
% y 4
% 11.19 13.28 16.82 18.9 22.8
% y 5
% 4.03 4.26 4.34 5.06 5.78
% y 6
% 13.7 15.6 13.77 11.98 13.95



clc,clear
load data.txt %把原始数据存放在纯文本文件 data.txt 中
n=size(data,1);

for i=1:n
    data(i,:)=data(i,:)/data(i,1); %标准化数据
end

ck=data(6:n,:);
m1=size(ck,1);
bj=data(1:5,:);
m2=size(bj,1);

for i=1:m1
    for j=1:m2
        t(j,:)=bj(j,:)-ck(i,:);
    end
    jc1=min(min(abs(t')));
    jc2=max(max(abs(t')));
    
    rho=0.5;
    
    ksi=(jc1+rho*jc2)./(abs(t)+rho*jc2);
    rt=sum(ksi')/size(ksi,2);
    r(i,:)=rt;
end

%输出关联矩阵
r


