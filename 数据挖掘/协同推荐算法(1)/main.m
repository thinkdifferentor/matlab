% ������
clear,clc

% �������� 
% data=[4,4,0,2,2;4,0,0,3,3;4,0,0,1,1;1,1,1,...
% 2,0;2,2,2,0,0;1,1,1,0,0;5,5,5,0,0]; 
data=importdata('Rating_select.mat');
load('Uid');

% �Ƽ�
for i=1:length(Uid)
    [sortScore, sortIndex] = recommend(data, i, 'cosSim'); 
    len = size(sortScore);
%     fprintf('��%d���û��Ƽ������\n',i);
%     fprintf('\n    �Ƽ���Ʒ  �Ƽ���\n');
    finalRec{i} = [sortIndex, sortScore];
    %disp(finalRec{i}); 
end

