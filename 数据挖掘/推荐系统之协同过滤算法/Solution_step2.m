% ����item��Эͬ�����Ƽ��㷨MATLABʵ�ֵڶ���
% ����item���ƾ������ó��Ƽ�����
clc,clear;

%�������־���
A=importdata('Rating_test.mat');

%����item���ƶȾ���
sim=importdata('Sim_matrix.mat');  

%��ȡ�û�������Ŀ��
[usersNum,itemNum] = size(A);  

%����Ԥ���Ƽ����־���
predict_score = zeros(usersNum,itemNum);  

%��ʼ�Ƽ�
for i = 1:usersNum   
    % �ҵ��û������۵ĵ�Ӱ������  
    find_temp = find(A(i,:));  
    % �ҵ��û�û�����۵ĵ�Ӱ����  
    ufind_temp = find(A(i,:)==0);
    % Ԥ���û�û�����۵�Ӱ������ֵ  
    for j = 1:size(ufind_temp,2)  
        % ����ĳ�û����������۵�Ӱ����δ���۵�Ӱ���ƶ�  
        for k=1:size(find_temp,2)  
            predict_score(i,ufind_temp(j)) = predict_score(i,ufind_temp(j)) + A(i,find_temp(k))*sim(find_temp(k),ufind_temp(j));  
        end  
    end  
end  

%Ԥ���Ƽ��������ݱ���
save('Predict_score.mat','predict_score');