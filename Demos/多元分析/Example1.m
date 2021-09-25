% 设有 5 个销售员 w1, w2, w3, w4, w5 ，他们的销售业绩由二维变量 (v1,v2) 描述
% 表 1 销售员业绩表
% 销售员 v1 （销售量）百件 v2 （回收款项）万元
% w1 1 0
% w2 1 1
% w3 3 2
% w4 4 3
% w5 2 5


clc,clear
%原始数据
a=[1,0; 1,1; 3,2; 4,3; 2,5];

%m为员工的个数
[m,n]=size(a);

%距离矩阵
d=zeros(m,m);

%计算原始数据中任意两点之间的距离
for i=1:m
    for j=i+1:m
        d(i,j)=mandist(a(i,:),a(j,:)');
    end
end

%距离矩阵
d;

%取矩阵的非零元素-获得距离的数据
nd=nonzeros(d);

%对nd取并运算-消去nd中相同的距离得到不同距离的数据
nd=union(nd,nd);

for i=1:m-1
    %找到最小分类依据
    nd_min=min(nd);
    
    %最小分类依据所在行列
    [row,col]=find(d==nd_min);
    tm=union(row,col);
    tm=reshape(tm,1,length(tm));
    %上面大括号{}代表建立数组
    s(i)={char(['第',int2str(i),'次合成，平台高度为',num2str(nd_min),'时的分类结果为： ',int2str(tm)])};
    
    %删去处理过的最小距离
    nd(find(nd==nd_min))=[];
    
    %没有数据了
    if (length(nd)==0)
        break
    end
end

%分类结果输出
s(:)




%统计工具箱
clc,clear
a=[1,0;1,1;3,2;4,3;2,5];

% Y=pdist(X)计算 m × n 矩阵X（被看作 m 个大小为 n 的向量）中两两对象间的欧氏距离。
y=pdist(a,'cityblock');

% squareform函数将一维矩阵变换为对应的M*N阶形式
yc=squareform(y);

 
% Z=linkage(Y,’method’)使用由’method’指定的算法计算生成聚类树。’method’可取表中特征字符串值。 
% 
%          ’method’取值及含义 
%        字符串          含  义 
%     ’single’       最短距离（缺省） 
%     ’complete’      最大距离 
%     ’average’      平均距离 
%     ’centroid’      重心距离 
%     ’ward’      离差平方和方法（Ward方法）
z=linkage(y);


% 生成只有顶部p个节点的冰柱图（谱系图）
[h,t]=dendrogram(z)



