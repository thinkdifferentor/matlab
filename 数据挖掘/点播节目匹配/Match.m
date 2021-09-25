%对规则库和点播表进行匹配
clc,clear

%载入规则库 节目名称/编号
Rules=importdata('Rules.mat');
L1=length(Rules);

%载入点播信息 用户号/节目名称/观看时间/对应编号(需要匹配项)
Select=importdata('Select.mat');
L2=length(Select);

tic
%开始匹配
for i=1:L2%拿出一条点播记录
    for j=1:L1%在规则库中匹配
       if( Compare(Rules(j).name,Select(i).name) )
            Select(i).mid=Rules(j).id;
            break;
       end
    end
end
toc

save('Result','Select');%将'Select'换名存储

% Rules(1).name,Select(1).name
% n=length(a);
% for i=1:n
%     Select(i).uid=a(i);
%     Select(i).name=b{i};
%     Select(i).time=c(i);
%     Select(i).mid=0; 
% end


