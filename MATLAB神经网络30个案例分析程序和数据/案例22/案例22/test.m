%% LVQ�������Ԥ�⡪������ʶ��
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
direction_label=repmat(1:N,1,M);
% ѵ����
train_label=rand_label(1:30);
P_train=pixel_value(train_label,:)';
Tc_train=direction_label(train_label);
% ���Լ�
test_label=rand_label(31:end);
P_test=pixel_value(test_label,:)';
Tc_test=direction_label(test_label);
%% ����PC
for i=1:5
    rate{i}=length(find(Tc_train==i))/30;
end
%% LVQ1�㷨
[w1,w2]=lvq1_train(P_train,Tc_train,20,cell2mat(rate),0.01,5);
result_1=lvq_predict(P_test,Tc_test,20,w1,w2);
%% LVQ2�㷨
[w1,w2]=lvq2_train(P_train,Tc_train,20,0.01,5,w1,w2);
result_2=lvq_predict(P_test,Tc_test,20,w1,w2);

web browser http://www.ilovematlab.cn/thread-61927-1-1.html
%%
% 
% <html>
% <table align="center" >	<tr>		<td align="center"><font size="2">��Ȩ���У�</font><a
% href="http://www.ilovematlab.cn/">Matlab������̳</a>&nbsp;&nbsp; <script
% src="http://s3.cnzz.com/stat.php?id=971931&web_id=971931&show=pic" language="JavaScript" ></script>&nbsp;</td>	</tr></table>
% </html>
% 