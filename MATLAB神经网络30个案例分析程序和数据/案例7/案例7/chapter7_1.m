%% ����7��RBF����Ļع�-�����Ժ����ع��ʵ�� 
% 
% 
% <html>
% <table border="0" width="600px" id="table1">	<tr>		<td><b><font size="2">�ð�������������</font></b></td>	</tr>	<tr>		<td><span class="comment"><font size="2">1�����˳���פ���ڴ�<a target="_blank" href="http://www.ilovematlab.cn/forum-158-1.html"><font color="#0000FF">���</font></a>���<a target="_blank" href="http://www.ilovematlab.cn/thread-48362-1-1.html"><font color="#0000FF">�ð���</font></a>���ʣ��������ʱش�</font></span></td></tr><tr>	<td><span class="comment"><font size="2">2���˰��������׵Ľ�ѧ��Ƶ�����׵�����������Matlab����</font></span></td>	</tr>	<tr>		<td><span class="comment"><font size="2">		3����������Ϊ�ð����Ĳ������ݣ�Լռ�ð����������ݵ�1/10����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		4���˰���Ϊԭ��������ת����ע��������<a target="_blank" href="http://www.ilovematlab.cn/">Matlab������̳</a>��<a target="_blank" href="http://www.ilovematlab.cn/forum-158-1.html">��Matlab������30������������</a>����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		5�����˰��������������о��й��������ǻ�ӭ���������Ҫ��ȣ����ǿ��Ǻ���Լ��ڰ����</font></span></td>	</tr>		<tr>		<td><span class="comment"><font size="2">		6������������������Ϊ���壬�鼮��ʵ�����ݿ�����������룬���鼮ʵ�ʷ�������Ϊ׼��</font></span></td>	</tr><tr>		<td><span class="comment"><font size="2">		7�����������������⡢Ԥ����ʽ�ȣ�<a target="_blank" href="http://www.ilovematlab.cn/thread-47939-1-1.html">��������</a>��</font></span></td>	</tr></table>
% </html>
% 


%% ��ջ�������
clc
clear

%% �������� ������� 
% ���ò��� 
interval=0.01;

% ����x1 x2
x1=-1.5:interval:1.5;
x2=-1.5:interval:1.5;

% ���պ����������Ӧ�ĺ���ֵ����Ϊ����������
F =20+x1.^2-10*cos(2*pi*x1)+x2.^2-10*cos(2*pi*x2); 

%% ���罨����ѵ��
% ���罨�� ����Ϊ[x1;x2],���ΪF��Spreadʹ��Ĭ�ϡ�
net=newrbe([x1;x2],F)

%% �����Ч����֤

% ���ǽ�ԭ���ݻش�����������Ч����
ty=sim(net,[x1;x2]);

% ����ʹ��ͼ����������Է����Ժ��������Ч��
figure
plot3(x1,x2,F,'rd');
hold on;
plot3(x1,x2,ty,'b-.');
view(113,36)
title('���ӻ��ķ����۲�׼ȷRBF����������Ч��')
xlabel('x1')
ylabel('x2')
zlabel('F')
grid on 

web browser http://www.ilovematlab.cn/viewthread.php?tid=65099
%%
% 
% <html>
% <table align="center" >	<tr>		<td align="center"><font size="2">��Ȩ���У�</font><a
% href="http://www.ilovematlab.cn/">Matlab������̳</a>&nbsp;&nbsp; <script
% src="http://s3.cnzz.com/stat.php?id=971931&web_id=971931&show=pic" language="JavaScript" ></script>&nbsp;</td>	</tr></table>
% </html>
% 

