% �������ƶȵĺ���
function [ score ] = evaluate( data, user, simMeas, item ) 
    [m,n] = size(data); 
    simTotal = 0; 
    ratSimTotal = 0; 
    % Ѱ���û������۵���Ʒ 
    % data(user, item)Ϊδ���۵���Ʒ 
    for j = 1:n 
        userRating = data(user, j);%���û����۵���Ʒ 
        ratedItem =zeros(m,1); 
        numOfNon = 0;%ͳ����������Ʒ����Ŀ 
        if userRating == 0%ֻ���ҵ������ֵ���Ʒ 
            continue; 
        end
        for i = 1:m 
            if data(i,item) ~= 0 && data(i,j) ~= 0 
                ratedItem(i,1) = 1; 
                numOfNon = numOfNon + 1; 
            end
        end
        % �ж���û�ж����ֵ��� 
        if numOfNon == 0 
            similarity = 0; 
        else % �������������ڼ��������� 
            vectorA = zeros(1,numOfNon); 
            vectorB =zeros(1,numOfNon); 
            r = 0; 
            for i = 1:m 
                if ratedItem(i,1) == 1 
                    r = r+1; 
                    vectorA(1,r) = data(i, j); 
                    vectorB(1,r) = data(i, item);
                end
            end

            switch simMeas 
                case {'cosSim'} 
                    similarity = cosSim(vectorA,vectorB); 
                case {'ecludSim'} 
                    similarity =ecludSim(vectorA,vectorB); 
                case {'pearsSim'} 
                    similarity = pearsSim(vectorA,vectorB); 
            end
        end

        disp(['the ', num2str(item), 'and ', num2str(j), ' similarity is', num2str(similarity)]); 
        simTotal = simTotal + similarity; ratSimTotal = ratSimTotal +similarity * userRating; 
    end

    if simTotal == 0 
        score = 0; 
    else
        score = ratSimTotal./simTotal;
    end

end