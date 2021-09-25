%% ��30�� ����ѧϰ���Ļع���ϼ����ࡪ���Ա�ʵ���о�
% <html>
% <table border="0" width="600px" id="table1">	<tr>		<td><b><font size="2">�ð�������������</font></b></td>	</tr>	<tr><td><span class="comment"><font size="2">1�����˳���פ���ڴ�<a target="_blank" href="http://www.matlabsky.com/forum-78-1.html"><font color="#0000FF">���</font></a>��Ըð������ʣ��������ʱش�</font></span></td></tr><tr>	<td><span class="comment"><font size="2">2</font><font size="2">���˰��������׵Ľ�ѧ��Ƶ����Ƶ��������<a href="http://www.matlabsky.com/forum-91-1.html">http://www.matlabsky.com/forum-91-1.html</a></font><font size="2">�� </font></span></td>	</tr>			<tr>		<td><span class="comment"><font size="2">		3���˰���Ϊԭ��������ת����ע����������MATLAB�����㷨30����������������</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		4�����˰��������������о��й��������ǻ�ӭ���������Ҫ��ȣ����ǿ��Ǻ���Լ��ڰ����</font></span></td>	</tr>	<tr>		<td><span class="comment"><font size="2">		5����������Ϊ���壬��ʵ�ʷ��е��鼮�������г��룬�����鼮�е�����Ϊ׼��</font></span></td>	</tr>	</table>
% </html>

%% Part1:ELM�Ļع���ϡ������ڽ�������׵���������ֵԤ��
clear all
clc

%% ѵ����/���Լ�����
load spectra_data.mat
% �������ѵ�����Ͳ��Լ�
temp = randperm(size(NIR,1));
% ѵ��������50������
P_train = NIR(temp(1:50),:)';
T_train = octane(temp(1:50),:)';
% ���Լ�����10������
P_test = NIR(temp(51:end),:)';
T_test = octane(temp(51:end),:)';
N = size(P_test,2);

%% ���ݹ�һ��

% ѵ����
[Pn_train,inputps] = mapminmax(P_train);
Pn_test = mapminmax('apply',P_test,inputps);
% ���Լ�
[Tn_train,outputps] = mapminmax(T_train);
Tn_test = mapminmax('apply',T_test,outputps);

%% ELM����/ѵ��
[IW,B,LW,TF,TYPE] = elmtrain(Pn_train,Tn_train,30,'sig',0);

%% ELM�������
tn_sim = elmpredict(Pn_test,IW,B,LW,TF,TYPE);
% ����һ��
T_sim = mapminmax('reverse',tn_sim,outputps);

%% ����Ա�
result = [T_test' T_sim'];
% �������
E = mse(T_sim - T_test);
% ����ϵ��
N = length(T_test);
R2=(N*sum(T_sim.*T_test)-sum(T_sim)*sum(T_test))^2/((N*sum((T_sim).^2)-(sum(T_sim))^2)*(N*sum((T_test).^2)-(sum(T_test))^2)); 

%% ��ͼ
figure(1)
plot(1:N,T_test,'r-*',1:N,T_sim,'b:o')
grid on
legend('��ʵֵ','Ԥ��ֵ')
xlabel('�������')
ylabel('����ֵ')
string = {'���Լ�����ֵ����Ԥ�����Ա�(ELM)';['(mse = ' num2str(E) ' R^2 = ' num2str(R2) ')']};
title(string)

%% Part2:ELM�ķ��ࡪ���β������ʶ��
clear all
clc

%% ѵ����/���Լ�����
load iris_data.mat
% �������ѵ�����Ͳ��Լ�
P_train = [];
T_train = [];
P_test = [];
T_test = [];
for i = 1:3
    temp_input = features((i-1)*50+1:i*50,:);
    temp_output = classes((i-1)*50+1:i*50,:);
    n = randperm(50);
    % ѵ��������120������
    P_train = [P_train temp_input(n(1:40),:)'];
    T_train = [T_train temp_output(n(1:40),:)'];
    % ���Լ�����30������
    P_test = [P_test temp_input(n(41:50),:)'];
    T_test = [T_test temp_output(n(41:50),:)'];
end

%% ELM����/ѵ��
[IW,B,LW,TF,TYPE] = elmtrain(P_train,T_train,20,'sig',1);

%% ELM�������
T_sim_1 = elmpredict(P_train,IW,B,LW,TF,TYPE);
T_sim_2 = elmpredict(P_test,IW,B,LW,TF,TYPE);

%% ����Ա�
result_1 = [T_train' T_sim_1'];
result_2 = [T_test' T_sim_2'];
% ѵ������ȷ��
k1 = length(find(T_train == T_sim_1));
n1 = length(T_train);
Accuracy_1 = k1 / n1 * 100;
disp(['ѵ������ȷ��Accuracy = ' num2str(Accuracy_1) '%(' num2str(k1) '/' num2str(n1) ')'])
% ���Լ���ȷ��
k2 = length(find(T_test == T_sim_2));
n2 = length(T_test);
Accuracy_2 = k2 / n2 * 100;
disp(['���Լ���ȷ��Accuracy = ' num2str(Accuracy_2) '%(' num2str(k2) '/' num2str(n2) ')'])

%% ��ͼ
figure(2)
plot(1:30,T_test,'bo',1:30,T_sim_2,'r-*')
grid on
xlabel('���Լ��������')
ylabel('���Լ��������')
string = {'���Լ�Ԥ�����Ա�(ELM)';['(��ȷ��Accuracy = ' num2str(Accuracy_2) '%)' ]};
title(string)
legend('��ʵֵ','ELMԤ��ֵ')

%%
% <html>
% <table width="656" align="left" >	<tr><td align="center"><p align="left"><font size="2">�����̳��</font></p><p align="left"><font size="2">Matlab������̳��<a href="http://www.matlabsky.com">www.matlabsky.com</a></font></p><p align="left"><font size="2">M</font><font size="2">atlab�����ٿƣ�<a href="http://www.mfun.la">www.mfun.la</a></font></p></td>	</tr></table>
% </html>