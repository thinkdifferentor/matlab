N =10;
data = randerr(N, 12, 7)';
data = data( : )';
str1 = dec2bin(data);
str2 = reshape(str1, 12, N);
seque = str2'

