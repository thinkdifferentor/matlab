%匹配数据获取
clc,clear;

%载入匹配信息 用户号/节目名称/观看时间/对应编号(需要匹配项)
Select=importdata('Result.mat');

n=length(Select);

for i=1:n
    Mid(i)=Select(i).mid;
end

Mid=Mid';


%载入匹配信息 用户号/节目名称/观看时间/对应编号(需要匹配项)
% Select=importdata('Select.mat');
% 
% n=length(Select);
% 
% for i=1:n
%     Select(i).name=name{i};
% end
