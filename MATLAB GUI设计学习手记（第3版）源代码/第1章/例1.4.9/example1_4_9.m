%%%%%%%%������֪��%%%%%%%%%
A ={[0 0] [1 0] [0 0] [0 1] [0 0] [1 1]
    [0 0] [0 0] [1 1] [0 0] [1 1] [0 0]
    [1 1] [0 0] [1 1] [0 0] [0 0] [1 0]
    [1 0] [0 0] [0 0] [1 0] [0 0] [0 0]
    [0 0] [0 0] [1 1] [0 0] [1 1] [0 0]
    [1 1] [0 0] [0 0] [0 0] [0 0] [0 0]
    [0 0] [0 0] [1 0] [0 1] [1 1] [0 1]
    [0 0] [0 0] [1 1] [0 0] [0 0] [0 0]};
nLine = 1;
mat = [1, 1];
a = cell2mat(A(:, nLine));

%%%%%%%%%ֱ����ֵ�Ƚ�%%%%%%%%%%%%%%%
% b = repmat(mat, size(A, 1), 1);
% index1 = find(~any(a - b, 2))
%%%%%%%%%ת��Ϊ�ַ����Ƚ�%%%%%%%%
mLines = size(A, 1);
str_a = num2str(a);
str_b = num2str(mat);
cell_a = mat2cell(str_a, ones(1, mLines), length(str_b));
index2 = find(strcmp(cell_a, str_b))   %����strcmp����
index3 = find(ismember(cell_a, str_b)) %����ismember����
index4 = strmatch(str_b, cell_a)       %����strmatch����
