% ���ݲ���
clc,clear;

%���������
top=10;

%��������
W=importdata('Count_W.mat');
[S_W,Index_W]=Top_N(W,top);

%�ؿ�����
B=importdata('Count_B.mat');
[S_B,Index_B]=Top_N(B,top);
