%皮尔逊相关系数函数
function [ pearsSimilarity ] = pearsSim( vectorA, vectorB )
    pearsSimilarityMatrix = 0.5 + 0.5 * corrcoef(vectorA, vectorB);
    pearsSimilarity = pearsSimilarityMatrix(1,2);
end
