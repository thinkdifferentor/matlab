N = 100;
tic;
picNames = repmat(' ', N, 7);    %Ϊ�ַ�����picNamesԤ�����ڴ�
for i = 1 : N
    picNames(i, :) = sprintf('%03d.jpg', i);
end
toc
