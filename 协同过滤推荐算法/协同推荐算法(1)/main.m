% ������
clear,clc

% �������� 
% data =[4,4,0,2,2;4,0,0,3,3;4,0,0,1,1;1,1,1,2,0;2,2,2,0,0;1,1,1,0,0;5,5,5,0,0]; 
data=importdata('rating.mat');

% �Ƽ�
[sortScore, sortIndex] = recommend(data, 2, 'cosSim'); 
len = size(sortScore);
fprintf('\n    �Ƽ���Ʒ  �Ƽ���\n');
finalRec = [sortIndex, sortScore];
disp(finalRec); 