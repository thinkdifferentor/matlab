% ������ 
clear,clc

% ���־���(ϡ�����) 
data =[2,0,0,4,4,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,5;0,0,0,0,0,0,0,1,0,4,0;3,3,4,0,3,0,0,2,2,0,0;5,5,5,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,5,0,0,5,0;4,0,4,0,0,0,0,0,0,0,5;0,0,0,0,0,4,0,0,0,0,4;0,0,0,0,0,0,5,0,0,5,0;0,0,0,3,0,0,0,0,4,5,0; 1,1,2,1,1,2,1,0,4,5,0]; 

% �Ƽ���������
[sortScore, sortIndex] = recommend(data, 2,'cosSim'); 
len = size(sortScore); finalRec = [sortIndex, sortScore]; 
disp(finalRec);