N = 100;
tic;
picNames = cell(N, 1);    %Ϊ�ַ�����Ԫ����picNamesԤ�����ڴ�
for i = 1 : N
    picNames{i} = sprintf('%03d.jpg', i);
end
toc
