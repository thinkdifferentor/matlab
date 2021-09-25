% 主函数
clear,clc

% 导入数据 
% data =[4,4,0,2,2;4,0,0,3,3;4,0,0,1,1;1,1,1,2,0;2,2,2,0,0;1,1,1,0,0;5,5,5,0,0]; 
data=importdata('rating.mat');

% 推荐
[sortScore, sortIndex] = recommend(data, 2, 'cosSim'); 
len = size(sortScore);
fprintf('\n    推荐物品  推荐度\n');
finalRec = [sortIndex, sortScore];
disp(finalRec); 