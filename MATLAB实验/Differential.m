%Ӧ��΢����
clear,clc

x=[1 3 8 7];
disp('һ�ײ��');
R1=diff(x)

disp('���ײ��');
R2=diff(x,2)

disp('�����ĵ���');
x1=[1 1.1 1.2 1.3];
y1=x.^3;
dy1=diff(y1)./diff(x1)
dy2=gradient(y1,x1)

disp('���λ��ַ� �����䣨-1,1���ϣ�exp(-x^2)�Ļ���');
x2=-1:0.05:1;
y2=exp(-x2.^2);
R3=trapz(x2,y2)

disp('�߾�����ֵ����');
R4=quadl(@(x)exp(-x.^2),-1,1)


disp('�ػ���');
fun=@(x,y)1./(sqrt(x+y).*(1+x+y).^2);
R6=quad2d(fun,0,1,0,@(x)1-x)







