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
warning off
%% ��������������ȡ 
% ����
M=10;
% �������������
N=5; 
% ����������ȡ
pixel_value=feature_extraction(M,N);
% ��һ��
pixel_value=premnmx(pixel_value);
%% ѵ����/���Լ�����
% ����ͼ����ŵ��������
rand_label=randperm(M*N);  
% ����������
direction_label=repmat(1:N,1,M);
% ѵ����
rand_train=rand_label(1:30);
Train=pixel_value(rand_train,:);
Train_label=direction_label(rand_train)';
% ���Լ�
rand_test=rand_label(31:end);
Test=pixel_value(rand_test,:);
Test_label=direction_label(rand_test)';
% SVMģ��
model=svmtrain(Train_label,Train,'-c 2 -g 0.05');
% �������
[predict_label,accuracy]=svmpredict(Test_label,Test,model);
result_svm=[Test_label';predict_label']

web browser http://www.ilovematlab.cn/thread-61927-1-1.html
%%
% 
% <html>
% <table align="center" >	<tr>		<td align="center"><font size="2">��Ȩ���У�</font><a
% href="http://www.ilovematlab.cn/">Matlab������̳</a>&nbsp;&nbsp; <script
% src="http://s3.cnzz.com/stat.php?id=971931&web_id=971931&show=pic" language="JavaScript" ></script>&nbsp;</td>	</tr></table>
% </html>
% 
