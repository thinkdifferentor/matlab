function U = pca(X)

[U,S,V] = svd(X*X');