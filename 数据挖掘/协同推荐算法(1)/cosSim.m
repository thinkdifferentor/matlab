%�������ƶȺ���
function [ cosSimilarity ] = cosSim( vectorA, vectorB )
    %ע��vectorA��vectorB����������
    num = vectorA * vectorB';
    denom = norm(vectorA) * norm(vectorB);
    cosSimilarity = 0.5 + 0.5 * (num./denom);
end
