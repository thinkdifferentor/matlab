%% ��28�� ֧���������ķ��ࡪ������������֯���迹���Ե����ٰ����
% <html>
% <table border="0" width="600px" id="table1">	<tr>		<td><b><font size="2">�ð�������������</font></b></td>	</tr>	<tr><td><span class="comment"><font size="2">1�����˳���פ���ڴ�<a target="_blank" href="http://www.matlabsky.com/forum-78-1.html"><font color="#0000FF">���</font></a>��Ըð������ʣ��������ʱش�</font></span></td></tr><tr>	<td><span class="comment"><font size="2">2</font><font size="2">���˰��������׵Ľ�ѧ��Ƶ����Ƶ��������<a href="http://www.matlabsky.com/forum-91-1.html">http://www.matlabsky.com/forum-91-1.html</a></font><font size="2">�� </font></span></td>	</tr>			<tr>		<td><span class="comment"><font size="2">		3���˰���Ϊԭ��������ת����ע����������MATLAB�����㷨30����������������</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		4�����˰��������������о��й��������ǻ�ӭ���������Ҫ��ȣ����ǿ��Ǻ���Լ��ڰ����</font></span></td>	</tr>	<tr>		<td><span class="comment"><font size="2">		5����������Ϊ���壬��ʵ�ʷ��е��鼮�������г��룬�����鼮�е�����Ϊ׼��</font></span></td>	</tr>	</table>
% </html>

%% ��ջ�������
clear all
clc

%% ��������
load BreastTissue_data.mat
% �������ѵ�����Ͳ��Լ�
n = randperm(size(matrix,1));
% ѵ��������80������
train_matrix = matrix(n(1:80),:);
train_label = label(n(1:80),:);
% ���Լ�����26������
test_matrix = matrix(n(81:end),:);
test_label = label(n(81:end),:);

%% ���ݹ�һ��
[Train_matrix,PS] = mapminmax(train_matrix');
Train_matrix = Train_matrix';
Test_matrix = mapminmax('apply',test_matrix',PS);
Test_matrix = Test_matrix';

%% SVM����/ѵ��(RBF�˺���)

% Ѱ�����c/g��������������֤����
[c,g] = meshgrid(-10:0.2:10,-10:0.2:10);
[m,n] = size(c);
cg = zeros(m,n);
eps = 10^(-4);
v = 5;
bestc = 1;
bestg = 0.1;
bestacc = 0;
for i = 1:m
    for j = 1:n
        cmd = ['-v ',num2str(v),' -t 2',' -c ',num2str(2^c(i,j)),' -g ',num2str(2^g(i,j))];
        cg(i,j) = svmtrain(train_label,Train_matrix,cmd);     
        if cg(i,j) > bestacc
            bestacc = cg(i,j);
            bestc = 2^c(i,j);
            bestg = 2^g(i,j);
        end        
        if abs( cg(i,j)-bestacc )<=eps && bestc > 2^c(i,j) 
            bestacc = cg(i,j);
            bestc = 2^c(i,j);
            bestg = 2^g(i,j);
        end               
    end
end
cmd = [' -t 2',' -c ',num2str(bestc),' -g ',num2str(bestg)];
% ����/ѵ��SVMģ��
model = svmtrain(train_label,Train_matrix,cmd);

%% SVM�������
[predict_label_1,accuracy_1] = svmpredict(train_label,Train_matrix,model);
[predict_label_2,accuracy_2] = svmpredict(test_label,Test_matrix,model);
result_1 = [train_label predict_label_1];
result_2 = [test_label predict_label_2];

%% ��ͼ
figure
plot(1:length(test_label),test_label,'r-*')
hold on
plot(1:length(test_label),predict_label_2,'b:o')
grid on
legend('��ʵ���','Ԥ�����')
xlabel('���Լ��������')
ylabel('���Լ��������')
string = {'���Լ�SVMԤ�����Ա�(RBF�˺���)';
          ['accuracy = ' num2str(accuracy_2(1)) '%']};
title(string)

%%
% <html>
% <table width="656" align="left" >	<tr><td align="center"><p align="left"><font size="2">�����̳��</font></p><p align="left"><font size="2">Matlab������̳��<a href="http://www.matlabsky.com">www.matlabsky.com</a></font></p><p align="left"><font size="2">M</font><font size="2">atlab�����ٿƣ�<a href="http://www.mfun.la">www.mfun.la</a></font></p></td>	</tr></table>
% </html>