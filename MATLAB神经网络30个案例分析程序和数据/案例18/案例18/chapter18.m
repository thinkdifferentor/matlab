%%  ����18: ����Elman������ĵ�������Ԥ��ģ���о�
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

%% ��������

load data;
a=data;

%% ѡȡѵ�����ݺͲ�������

for i=1:6
    p(i,:)=[a(i,:),a(i+1,:),a(i+2,:)];
end
% ѵ����������
p_train=p(1:5,:);
% ѵ���������
t_train=a(4:8,:);
% ������������
p_test=p(6,:);
% �����������
t_test=a(9,:);

% Ϊ��Ӧ����ṹ ��ת��

p_train=p_train';
t_train=t_train';
p_test=p_test';


%% ����Ľ�����ѵ��
% ����ѭ�������ò�ͬ�����ز���Ԫ����
nn=[7 11 14 18];
for i=1:4
    threshold=[0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1];
    % ����Elman������ ���ز�Ϊnn(i)����Ԫ
    net=newelm(threshold,[nn(i),3],{'tansig','purelin'});
    % ��������ѵ������
    net.trainparam.epochs=1000;
    net.trainparam.show=20;
    % ��ʼ������
    net=init(net);
    % Elman����ѵ��
    net=train(net,p_train,t_train);
    % Ԥ������
    y=sim(net,p_test);
    % �������
    error(i,:)=y'-t_test;
end

%% ͨ����ͼ �۲첻ͬ���ز���Ԫ����ʱ�������Ԥ��Ч��

plot(1:1:3,error(1,:),'-ro','linewidth',2);
hold on;
plot(1:1:3,error(2,:),'b:x','linewidth',2);
hold on;
plot(1:1:3,error(3,:),'k-.s','linewidth',2);
hold on;
plot(1:1:3,error(4,:),'c--d','linewidth',2);
title('ElmanԤ�����ͼ')
set(gca,'Xtick',[1:3])
legend('7','11','14','18','location','best')
xlabel('ʱ���')
ylabel('���')
hold off;

web browser http://www.ilovematlab.cn/viewthread.php?tid=63640
%%
%
% <html>
% <table align="center" >	<tr>		<td align="center"><font size="2">��Ȩ���У�</font><a
% href="http://www.ilovematlab.cn/">Matlab������̳</a>&nbsp;&nbsp; <script
% src="http://s3.cnzz.com/stat.php?id=971931&web_id=971931&show=pic" language="JavaScript" ></script>&nbsp;</td>	</tr></table>
% </html>
%