% 数据查找
clc,clear;

%定义查数理
top=10;

%收视数据
W=importdata('Count_W.mat');
[S_W,Index_W]=Top_N(W,top);

%回看数据
B=importdata('Count_B.mat');
[S_B,Index_B]=Top_N(B,top);
