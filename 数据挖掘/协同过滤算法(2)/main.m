% 主函数 
clear,clc

% 评分矩阵(稀疏矩阵) 
% data =[2,0,0,4,4,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,5;0,0,0,0,0,0,0,1,0,4,0;3,3,4,0,3,0,0,2,2,0,0;5,5,5,0,0,0,0,0,0,0,0;...
%     0,0,0,0,0,0,5,0,0,5,0;4,0,4,0,0,0,0,0,0,0,5;0,0,0,0,0,4,0,0,0,0,4;0,0,0,0,0,0,5,0,0,5,0;0,0,0,3,0,0,0,0,4,5,0; 1,1,2,1,1,2,1,0,4,5,0]; 

data=importdata('Rating_select.mat');

% 推荐函数调用
for i=1:length(data)
    [sortScore, sortIndex] = recommend(data, i,'cosSim'); 
    fprintf('第%d个用户推荐结果：\n',i);
    fprintf('\n    推荐物品  推荐度\n');
    finalRec{i} = [sortIndex, sortScore]; 
    disp(finalRec{i});
end