%% dij 距离矩阵
%% pij 前一跳矩阵
%% nij 下一跳矩阵
function [dij , pij , nij]=Dijstra()

    % 网络拓扑结构
    topo = [0   , 7  , 9  , inf , inf , 14; 
           7   , 0  , 10 , 15  , inf , inf;
           9   , 10 , 0  , 11  , inf , 2;
           inf , 15 , 11 , 0   , 6   , inf;
           inf , inf, inf, 6   , 0   , 9;
           14  , inf, 2 ,  inf , 9 ,   0];
       
    dij = ones(size(topo)) * inf; % 距离矩阵
    pij = zeros(size(topo));      % 前一跳矩阵
    nodeNum = size(topo  , 1);    % 取所有的顶点个数

    for nodeI = 1 : nodeNum
        sourceNode = nodeI; % 源节点
        dij(sourceNode , sourceNode) = 0;   % 源节点到源节点的距离为0
        
        s = []; % 已计算节点集合
        q = 1 : nodeNum;    % 未处理节点集合
        qval = topo(sourceNode , :);    % 源节点到未处理节点的单挑距离
        
        while size(q , 2) > 0 % 对未处理的节点进行遍历
            [x , index] = sort(qval);   % 选择最近节点
            s(end+1) = q(1 , index(1)); % 加入已经处理节点集合
            u = q(1 , index(1));        % 获得当前处理节点的id
            for i = 1 : size(topo(u , :) , 2) 
                if topo(u , i) < inf   % 考察u节点的所有直接连接节点
                    if dij(sourceNode , i) > dij(sourceNode , u) + topo(u , i) 
                        % 如果源节点到u的距离加上u到i节点的距离要比源节点直接到i节点的距离近
                        % 则u应该出现在最短路径上 ， 跟新源节点到i节点的距离值
                        dij(sourceNode , i) = dij(sourceNode , u) + topo(u , i);
                        pij(sourceNode , i) = u;
                    end
                end
            end
            q(index(1)) = []; % 从q和qval集合中移除u节点
            % qval(index(1)) = []; % 没有更新待测节点的距离矩阵
            qval = dij(sourceNode , q); % 修正！！！
        end
    end

    % 将前一跳矩阵转换为下一跳矩阵
    for i = 1 : nodeNum
        for j = 1 : nodeNum
            s = [j];
            temp = j;
            if (pij(i , temp) > 0) % 10/11/2014修正
                while temp ~= i
                    s(end + 1) = pij(i , temp);
                    temp = pij(i , temp);
                end
                temp = i;
                for k = size(s , 2) - 1: -1 : 1 
                    nij(temp , j) = s(1 , k);
                    temp = s(1 , k);
            	end
            end
        end
    end

end
