%%  ����19: ����������ķ���Ԥ��--����PNN�ı�ѹ���������
% 
% 
% <html>
% <table border="0" width="600px" id="table1">	<tr>		<td><b><font size="2">�ð�������������</font></b></td>	</tr>	<tr>		<td><span class="comment"><font size="2">1�����˳���פ���ڴ�<a target="_blank" href="http://www.ilovematlab.cn/forum-158-1.html"><font color="#0000FF">���</font></a>���<a target="_blank" href="http://www.ilovematlab.cn/thread-48362-1-1.html"><font color="#0000FF">�ð���</font></a>���ʣ��������ʱش�</font></span></td></tr><tr>	<td><span class="comment"><font size="2">2���˰��������׵Ľ�ѧ��Ƶ�����׵�����������Matlab����</font></span></td>	</tr>	<tr>		<td><span class="comment"><font size="2">		3����������Ϊ�ð����Ĳ������ݣ�Լռ�ð����������ݵ�1/10����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		4���˰���Ϊԭ��������ת����ע��������<a target="_blank" href="http://www.ilovematlab.cn/">Matlab������̳</a>��<a target="_blank" href="http://www.ilovematlab.cn/forum-158-1.html">��Matlab������30������������</a>����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		5�����˰��������������о��й��������ǻ�ӭ���������Ҫ��ȣ����ǿ��Ǻ���Լ��ڰ����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		6������������������Ϊ���壬�鼮��ʵ�����ݿ�����������룬���鼮ʵ�ʷ�������Ϊ׼��</font></span></td>	</tr><tr>		<td><span class="comment"><font size="2">		7�����������������⡢Ԥ����ʽ�ȣ�<a target="_blank" href="http://www.ilovematlab.cn/thread-47939-1-1.html">��������</a>��</font></span></td>	</tr></table>
% </html>
% 


%% ��ջ�������
clc;
clear all
close all
nntwarn off;
warning off;
%% ��������
load data
%% ѡȡѵ�����ݺͲ�������

Train=data(1:23,:);
Test=data(24:end,:);
p_train=Train(:,1:3)';
t_train=Train(:,4)';
p_test=Test(:,1:3)';
t_test=Test(:,4)';

%% ���������ת��Ϊ����
t_train=ind2vec(t_train);
t_train_temp=Train(:,4)';
%% ʹ��newpnn��������PNN SPREADѡȡΪ1.5
Spread=1.5;
net=newpnn(p_train,t_train,Spread)

%% ѵ�����ݻش� �鿴����ķ���Ч��

% Sim������������Ԥ��
Y=sim(net,p_train);
% �������������ת��Ϊָ��
Yc=vec2ind(Y);

%% ͨ����ͼ �۲������ѵ�����ݷ���Ч��
figure(1)
subplot(1,2,1)
stem(1:length(Yc),Yc,'bo')
hold on
stem(1:length(Yc),t_train_temp,'r*')
title('PNN ����ѵ�����Ч��')
xlabel('�������')
ylabel('������')
set(gca,'Ytick',[1:5])
subplot(1,2,2)
H=Yc-t_train_temp;
stem(H)
title('PNN ����ѵ��������ͼ')
xlabel('�������')


%% ����Ԥ��δ֪����Ч��
Y2=sim(net,p_test);
Y2c=vec2ind(Y2)
figure(2)
stem(1:length(Y2c),Y2c,'b^')
hold on
stem(1:length(Y2c),t_test,'r*')
title('PNN �����Ԥ��Ч��')
xlabel('Ԥ���������')
ylabel('������')
set(gca,'Ytick',[1:5])
web browser http://www.ilovematlab.cn/viewthread.php?tid=63455
%%
%
% <html>
% <table align="center" >	<tr>		<td align="center"><font size="2">��Ȩ���У�</font><a
% href="http://www.ilovematlab.cn/">Matlab������̳</a>&nbsp;&nbsp; <script
% src="http://s3.cnzz.com/stat.php?id=971931&web_id=971931&show=pic" language="JavaScript" ></script>&nbsp;</td>	</tr></table>
% </html>
%
