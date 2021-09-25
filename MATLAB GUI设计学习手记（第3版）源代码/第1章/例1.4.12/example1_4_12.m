data = [1 5 9 8 7; 2 6 4 3 0];
index = randperm(10);
data = data(reshape(index, size(data)))
