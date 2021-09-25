function W = ica(X)

[n,m] = size(X);
chunk = 100;
alpha = 0.0005;
W = eye(n);

for iter=1:10,
  disp([num2str(iter)]);
  X = X(:,randperm(m));
  for i=1:floor(m/chunk),
    Xc = X(:,(i-1)*chunk+1:i*chunk);
    dW = (1 - 2./(1+exp(-W*Xc)))*Xc' + chunk*inv(W');
    W = W + alpha*dW;
  end
end

