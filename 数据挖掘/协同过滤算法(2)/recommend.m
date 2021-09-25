function [ sortScore, sortIndex ] = recommend( data, user, simMeas ) 
    % ��ȡdata�Ĵ�С 
    [m, n] = size(data);%mΪ�û���nΪ��Ʒ 
    if user > m 
        disp('The user is not in the dataBase'); 
    end

    % Ѱ���û�userδ���ֵ���Ʒ 
    unratedItem = zeros(1,n); 
    numOfUnrated = 0; 

    for j = 1:n 
        if data(user, j) == 0 
            unratedItem(1,j) = 1;%0��ʾ�Ѿ����֣�1��ʾδ����
            numOfUnrated = numOfUnrated + 1; 
        end
    end

    if numOfUnrated == 0 
        disp('the user has rated all items'); 
    end

    % ��δ�������֣��Ѵﵽ�Ƽ������� 
    itemScore = zeros(numOfUnrated,2); 
    r = 0; 
    for j = 1:n 
        if unratedItem(1,j) == 1%�ҵ�δ������
        r = r + 1; 
        %score = evaluate(data, user, simMeas, j); 
        score = SVDEvaluate(data, user, simMeas, j); 
        itemScore(r,1) = j;
        itemScore(r,2) = score; 
        end
    end
    %���򣬰��շ����ĸߵͽ����Ƽ� 
    [sortScore, sortIndex_1] = sort(itemScore(:,2),'descend');
    [numOfIndex,x] = size(sortIndex_1(:,1)); 
    sortIndex = zeros(numOfIndex,1); 
    for m = 1:numOfIndex 
        sortIndex(m,:) = itemScore(sortIndex_1(m,:),1); 
    end

end