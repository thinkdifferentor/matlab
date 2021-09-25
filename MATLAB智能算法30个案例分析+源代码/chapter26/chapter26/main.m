%% ��26�� �е�ʦѧϰ������ķ��ࡪ���β������ʶ��
% <html>
% <table border="0" width="600px" id="table1">	<tr>		<td><b><font size="2">�ð�������������</font></b></td>	</tr>	<tr><td><span class="comment"><font size="2">1�����˳���פ���ڴ�<a target="_blank" href="http://www.matlabsky.com/forum-78-1.html"><font color="#0000FF">���</font></a>��Ըð������ʣ��������ʱش�</font></span></td></tr><tr>	<td><span class="comment"><font size="2">2</font><font size="2">���˰��������׵Ľ�ѧ��Ƶ����Ƶ��������<a href="http://www.matlabsky.com/forum-91-1.html">http://www.matlabsky.com/forum-91-1.html</a></font><font size="2">�� </font></span></td>	</tr>			<tr>		<td><span class="comment"><font size="2">		3���˰���Ϊԭ��������ת����ע����������MATLAB�����㷨30����������������</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		4�����˰��������������о��й��������ǻ�ӭ���������Ҫ��ȣ����ǿ��Ǻ���Լ��ڰ����</font></span></td>	</tr>	<tr>		<td><span class="comment"><font size="2">		5����������Ϊ���壬��ʵ�ʷ��е��鼮�������г��룬�����鼮�е�����Ϊ׼��</font></span></td>	</tr>	</table>
% </html>

%% ��ջ�������
clear all
clc

%% ѵ����/���Լ�����

% ��������
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

%% ģ�ͽ��� 
result_grnn = [];
result_pnn = [];
time_grnn = [];
time_pnn = [];
for i = 1:4
    for j = i:4
        p_train = P_train(i:j,:);
        p_test = P_test(i:j,:);
       %% GRNN�������������
        t = cputime;
        % ��������
        net_grnn = newgrnn(p_train,T_train);
        % �������
        t_sim_grnn = sim(net_grnn,p_test);
        T_sim_grnn = round(t_sim_grnn);
        t = cputime - t;
        time_grnn = [time_grnn t];
        result_grnn = [result_grnn T_sim_grnn'];
       %% PNN�������������
        t = cputime;
        Tc_train = ind2vec(T_train);
        % ��������
        net_pnn = newpnn(p_train,Tc_train);
        % �������
        Tc_test = ind2vec(T_test);
        t_sim_pnn = sim(net_pnn,p_test);
        T_sim_pnn = vec2ind(t_sim_pnn);
        t = cputime - t;
        time_pnn = [time_pnn t];
        result_pnn = [result_pnn T_sim_pnn'];
    end
end

%% ��������

% ��ȷ��accuracy
accuracy_grnn = [];
accuracy_pnn = [];
time = [];
for i = 1:10
    accuracy_1 = length(find(result_grnn(:,i) == T_test'))/length(T_test);
    accuracy_2 = length(find(result_pnn(:,i) == T_test'))/length(T_test);
    accuracy_grnn = [accuracy_grnn accuracy_1];
    accuracy_pnn = [accuracy_pnn accuracy_2];
end
% ����Ա�
result = [T_test' result_grnn result_pnn]
accuracy = [accuracy_grnn;accuracy_pnn]
time = [time_grnn;time_pnn]
%% ��ͼ
figure(1)
plot(1:30,T_test,'bo',1:30,result_grnn(:,4),'r-*',1:30,result_pnn(:,4),'k:^')
grid on
xlabel('���Լ��������')
ylabel('���Լ��������')
string = {'���Լ�Ԥ�����Ա�(GRNN vs PNN)';['��ȷ��:' num2str(accuracy_grnn(4)*100) '%(GRNN) vs ' num2str(accuracy_pnn(4)*100) '%(PNN)']};
title(string)
legend('��ʵֵ','GRNNԤ��ֵ','PNNԤ��ֵ')
figure(2)
plot(1:10,accuracy(1,:),'r-*',1:10,accuracy(2,:),'b:o')
grid on
xlabel('ģ�ͱ��')
ylabel('���Լ���ȷ��')
title('10��ģ�͵Ĳ��Լ���ȷ�ʶԱ�(GRNN vs PNN)')
legend('GRNN','PNN')
figure(3)
plot(1:10,time(1,:),'r-*',1:10,time(2,:),'b:o')
grid on
xlabel('ģ�ͱ��')
ylabel('����ʱ��(s)')
title('10��ģ�͵�����ʱ��Ա�(GRNN vs PNN)')
legend('GRNN','PNN')

%%
% <html>
% <table width="656" align="left" >	<tr><td align="center"><p align="left"><font size="2">�����̳��</font></p><p align="left"><font size="2">Matlab������̳��<a href="http://www.matlabsky.com">www.matlabsky.com</a></font></p><p align="left"><font size="2">M</font><font size="2">atlab�����ٿƣ�<a href="http://www.mfun.la">www.mfun.la</a></font></p></td>	</tr></table>
% </html>