N = 100;
tic;
picNames = cell(N, 1);    %为字符串单元数组picNames预分配内存
for i = 1 : N
    picNames{i} = sprintf('%03d.jpg', i);
end
toc
