%% BP�������Ԥ�⡪������ʶ��
%
% <html>
% <table border="0" width="600px" id="table1">	<tr>		<td><b><font size="2">�ð�������������</font></b></td>	</tr>	<tr>		<td><span class="comment"><font size="2">1�����˳���פ���ڴ�<a target="_blank" href="http://www.ilovematlab.cn/forum-158-1.html"><font color="#0000FF">���</font></a>���<a target="_blank" href="http://www.ilovematlab.cn/thread-49221-1-1.html"><font color="#0000FF">�ð���</font></a>���ʣ��������ʱش�</font></span></td></tr><tr>	<td><span class="comment"><font size="2">2���˰��������׵Ľ�ѧ��Ƶ�����׵�����������Matlab����</font></span></td>	</tr>	<tr>		<td><span class="comment"><font size="2">		3����������Ϊ�ð����Ĳ������ݣ�Լռ�ð����������ݵ�1/10����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		4���˰���Ϊԭ��������ת����ע��������<a target="_blank" href="http://www.ilovematlab.cn/">Matlab������̳</a>��<a target="_blank" href="http://www.ilovematlab.cn/forum-158-1.html">��Matlab������30������������</a>����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		5�����˰��������������о��й��������ǻ�ӭ���������Ҫ��ȣ����ǿ��Ǻ���Լ��ڰ����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		6������������������Ϊ���壬�鼮��ʵ�����ݿ�����������룬���鼮ʵ�ʷ�������Ϊ׼��</font></span></td>	</tr><tr>		<td><span class="comment"><font size="2">		7�����������������⡢Ԥ����ʽ�ȣ�<a target="_blank" href="http://www.ilovematlab.cn/thread-47939-1-1.html">��������</a>��</font></span></td>	</tr></table>
% </html>
%
web browser http://www.ilovematlab.cn/thread-61927-1-1.html
%% �����������
clear all
clc;
%% ��������������ȡ 
% ����
M=10;
% �������������
N=5; 
% ����������ȡ
pixel_value=feature_extraction(M,N);
%% ѵ����/���Լ�����
% ����ͼ����ŵ��������
rand_label=randperm(M*N);  
% ����������
direction_label=[1 0 0;1 1 0;0 1 0;0 1 1;0 0 1];
% ѵ����
train_label=rand_label(1:30);
P_train=pixel_value(train_label,:)';
dtrain_label=train_label-floor(train_label/N)*N;
dtrain_label(dtrain_label==0)=N;
T_train=direction_label(dtrain_label,:)';
% ���Լ�
test_label=rand_label(31:end);
P_test=pixel_value(test_label,:)';
dtest_label=test_label-floor(test_label/N)*N;
dtest_label(dtest_label==0)=N;
T_test=direction_label(dtest_label,:)'
%% ����BP����
net=newff(minmax(P_train),[10,3],{'tansig','purelin'},'trainlm');
% ����ѵ������
net.trainParam.epochs=1000;
net.trainParam.show=10;
net.trainParam.goal=1e-3;
net.trainParam.lr=0.1;
%% ����ѵ��
net=train(net,P_train,T_train);
%% �������
T_sim=sim(net,P_test);
for i=1:3
    for j=1:20
        if T_sim(i,j)<0.5
            T_sim(i,j)=0;
        else
            T_sim(i,j)=1;
        end
    end
end
T_sim
T_test
web browser http://www.ilovematlab.cn/thread-61927-1-1.html
%%
% 
% <html>
% <table align="center" >	<tr>		<td align="center"><font size="2">��Ȩ���У�</font><a
% href="http://www.ilovematlab.cn/">Matlab������̳</a>&nbsp;&nbsp; <script
% src="http://s3.cnzz.com/stat.php?id=971931&web_id=971931&show=pic" language="JavaScript" ></script>&nbsp;</td>	</tr></table>
% </html>
% 
