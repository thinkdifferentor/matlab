% ����ĳ���� 1986��1992 ���·��ͨ����ƽ���������ݼ��� 6
% ��� ���
% 1 1986 71.1 5 1990 71.4
% 2 1987 72.4 6 1991 72.0
% 3 1988 72.4 7 1992 71.6
% 4 1989 72.1


clc,clear
x0=[71.1 72.4 72.4 72.1 71.4 72.0 71.6];
n=length(x0);
lamda=x0(1:n-1)./x0(2:n);
range=minmax(lamda);
x1=cumsum(x0);
for i=2:n
z(i)=0.5*(x1(i)+x1(i-1));
end
B=[-z(2:n)',ones(n-1,1)];
Y=x0(2:n)';
u=B\Y;
x=dsolve('Dx+a*x=b','x(0)=x0');
x=subs(x,{'a','b','x0'},{u(1),u(2),x1(1)});
yuce1=subs(x,'t',[0:n-1]);
digits(6),y=vpa(x); %Ϊ���Ԥ�⾫�ȣ��ȼ���Ԥ��ֵ������ʾ΢�ַ��̵Ľ�
yuce=[x0(1),diff(yuce1)];%Ԥ��ֵ���
epsilon=x0-yuce; %����в�
delta=abs(epsilon./x0); %����������
rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda; %���㼶��ƫ��ֵ

fprintf('Ԥ��ֵ:');
yuce

disp('����в�:');
epsilon

disp('����������:');
delta

disp('���㼶��ƫ��ֵ:');
rho



