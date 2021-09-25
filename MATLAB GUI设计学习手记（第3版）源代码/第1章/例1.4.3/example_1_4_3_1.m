N = 100;
tic;
picNames = repmat(' ', N, 7);    %为字符数组picNames预分配内存
for i = 1 : N
    picNames(i, :) = sprintf('%03d.jpg', i);
end
toc
