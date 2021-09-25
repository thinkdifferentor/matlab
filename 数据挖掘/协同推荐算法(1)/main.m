% 主函数
clear,clc

% 导入数据 
% data=[4,4,0,2,2;4,0,0,3,3;4,0,0,1,1;1,1,1,...
% 2,0;2,2,2,0,0;1,1,1,0,0;5,5,5,0,0]; 
data=importdata('Rating_select.mat');
load('Uid');

% 推荐
for i=1:length(Uid)
    [sortScore, sortIndex] = recommend(data, i, 'cosSim'); 
    len = size(sortScore);
%     fprintf('第%d个用户推荐结果：\n',i);
%     fprintf('\n    推荐物品  推荐度\n');
    finalRec{i} = [sortIndex, sortScore];
    %disp(finalRec{i}); 
end

