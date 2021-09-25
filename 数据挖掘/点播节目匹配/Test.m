
%载入规则库 节目名称/编号
L1=length(ID);

%载入点播信息 用户号/节目名称/观看时间/对应编号(需要匹配项)
L2=length(Match);

tic
%开始匹配
for i=1:L2%拿出一条点播记录
    for j=1:L1%在规则库中匹配
       if( Compare(name{j},Match{i}) )
            Result(i)=ID(j);
            break;
       end
    end
end
toc