% 对样本进行分类称为Q型聚类分析,对指标进行分类称为R型聚类分析。

% ======================Q型聚类分析===================================

load data2.txt %把原始数据保存在纯文本文件 data2.txt 中
r=corrcoef(data2); %计算相关系数矩阵
d=tril(r); %取出相关系数矩阵的下三角元素

for i=1:10 %对角线元素化成零
    d(i,i)=0;
end
d=d(:);
d=nonzeros(d); %取出非零元素
d=d';
d=1-d;
z=linkage(d);
dendrogram(z)



% ========================R型聚类分析================================

load data2.txt %把原始数据保存在纯文本文件gj.txt中
data2(:,3:6)=[];
data2=zscore(data2);
y=pdist(data2);
z=linkage(y);
dendrogram(z,'average')
