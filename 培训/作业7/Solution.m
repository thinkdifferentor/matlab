% ����˵�������ÿ��ʡ�ڵ�ͣ��ʱ��
function Solution

clc,clear
% �������ݾ���
global Tim

% ������Ŀ����
Num_city=5;

% ���ݾ���
Tim=zeros(Num_city);


% ������������--������
% �������� 1



Tim(1,2)=16;Tim(1,3)=73;Tim(1,4)=90;Tim(1,5)=61;

Tim(2,3)=78;Tim(2,4)=98;Tim(2,5)=67;

Tim(3,4)=77;Tim(3,5)=13;

Tim(4,5)=65;


Capital_total=2640;


% ʡ�ڸ��������ʱ�����ʡ��ͣ��24Сʱ
% ÿ�����ξ����ͣ��ʱ������
% During=zeros(1,Num_city);
% During(1,1)=2;During(1,2)=2;During(1,3)=3;
% During(1,4)=4;During(1,5)=5;During(1,6)=6;

% �������ξ����ͣ��ʱ���ܺ�
% Total_during=sum(During);

% �������м�ľ���Գƾ���
Tim=Tim+Tim'; 

% �����ʼȦ--�����ص㵽���һ�����й��ɵĳ�ʼȦ
c1=[1 2:4 5];
[Circle,Time]=modifycircle(c1,Num_city);

c2=[1 5 2:4];%�ı��ʼȦ�����㷨�����һ�����㲻��
[Circle2,Time2]=modifycircle(c2,Num_city);

if Time2<Time
    Time=Time2;
    Circle=Circle2;
end

Total_time=Time+Capital_total;


Circle
Time
Total_time



%*******************************************
%�޸�Ȧ���Ӻ���
%*******************************************
function [Circle,Time]=modifycircle(c1,Num_city)
global Tim
flag=1;

while flag>0
flag=0;
    for m=1:Num_city-3
        for n=m+2:Num_city-1
            if Tim(c1(m),c1(n))+Tim(c1(m+1),c1(n+1))<Tim(c1(m),c1(m+1))+Tim(c1(n),c1(n+1))
                flag=1;
                c1(m+1:n)=c1(n:-1:m+1);
            end
        end
    end
end

Time=Tim(c1(1),c1(Num_city));

for i=1:Num_city-1
    Time=Time+Tim(c1(i),c1(i+1));
end
Circle=c1;