function [ sortScore, sortIndex ] = recommend( data, user, simMeas ) 
    % 获取data的大小 
    [m, n] = size(data);%m为用户，n为商品 
    if user > m 
        disp('The user is not in the dataBase'); 
    end

    % 寻找用户user未评分的商品 
    unratedItem = zeros(1,n); 
    numOfUnrated = 0; 

    for j = 1:n 
        if data(user, j) == 0 
            unratedItem(1,j) = 1;%0表示已经评分，1表示未评分
            numOfUnrated = numOfUnrated + 1; 
        end
    end

    if numOfUnrated == 0 
        disp('the user has rated all items'); 
    end

    % 对未评分项打分，已达到推荐的作用 
    itemScore = zeros(numOfUnrated,2); 
    r = 0; 
    for j = 1:n 
        if unratedItem(1,j) == 1%找到未评分项
        r = r + 1; 
        %score = evaluate(data, user, simMeas, j); 
        score = SVDEvaluate(data, user, simMeas, j); 
        itemScore(r,1) = j;
        itemScore(r,2) = score; 
        end
    end
    %排序，按照分数的高低进行推荐 
    [sortScore, sortIndex_1] = sort(itemScore(:,2),'descend');
    [numOfIndex,x] = size(sortIndex_1(:,1)); 
    sortIndex = zeros(numOfIndex,1); 
    for m = 1:numOfIndex 
        sortIndex(m,:) = itemScore(sortIndex_1(m,:),1); 
    end

end