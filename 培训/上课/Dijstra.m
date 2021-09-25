%% dij �������
%% pij ǰһ������
%% nij ��һ������
function [dij , pij , nij]=Dijstra()

    % �������˽ṹ
    topo = [0   , 7  , 9  , inf , inf , 14; 
           7   , 0  , 10 , 15  , inf , inf;
           9   , 10 , 0  , 11  , inf , 2;
           inf , 15 , 11 , 0   , 6   , inf;
           inf , inf, inf, 6   , 0   , 9;
           14  , inf, 2 ,  inf , 9 ,   0];
       
    dij = ones(size(topo)) * inf; % �������
    pij = zeros(size(topo));      % ǰһ������
    nodeNum = size(topo  , 1);    % ȡ���еĶ������

    for nodeI = 1 : nodeNum
        sourceNode = nodeI; % Դ�ڵ�
        dij(sourceNode , sourceNode) = 0;   % Դ�ڵ㵽Դ�ڵ�ľ���Ϊ0
        
        s = []; % �Ѽ���ڵ㼯��
        q = 1 : nodeNum;    % δ����ڵ㼯��
        qval = topo(sourceNode , :);    % Դ�ڵ㵽δ����ڵ�ĵ�������
        
        while size(q , 2) > 0 % ��δ����Ľڵ���б���
            [x , index] = sort(qval);   % ѡ������ڵ�
            s(end+1) = q(1 , index(1)); % �����Ѿ�����ڵ㼯��
            u = q(1 , index(1));        % ��õ�ǰ����ڵ��id
            for i = 1 : size(topo(u , :) , 2) 
                if topo(u , i) < inf   % ����u�ڵ������ֱ�����ӽڵ�
                    if dij(sourceNode , i) > dij(sourceNode , u) + topo(u , i) 
                        % ���Դ�ڵ㵽u�ľ������u��i�ڵ�ľ���Ҫ��Դ�ڵ�ֱ�ӵ�i�ڵ�ľ����
                        % ��uӦ�ó��������·���� �� ����Դ�ڵ㵽i�ڵ�ľ���ֵ
                        dij(sourceNode , i) = dij(sourceNode , u) + topo(u , i);
                        pij(sourceNode , i) = u;
                    end
                end
            end
            q(index(1)) = []; % ��q��qval�������Ƴ�u�ڵ�
            % qval(index(1)) = []; % û�и��´���ڵ�ľ������
            qval = dij(sourceNode , q); % ����������
        end
    end

    % ��ǰһ������ת��Ϊ��һ������
    for i = 1 : nodeNum
        for j = 1 : nodeNum
            s = [j];
            temp = j;
            if (pij(i , temp) > 0) % 10/11/2014����
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
