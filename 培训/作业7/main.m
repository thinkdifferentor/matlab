function main
clc,clear
global a
% ���ݾ���
a=zeros(6);

% ��������--������
a(1,2)=18;a(1,3)=144;a(1,4)=55;a(1,5)=70;a(1,6)=117;
a(2,3)=150;a(2,4)=53;a(2,5)=80;a(2,6)=113;a(3,4)=160;
a(3,5)=179;a(3,6)=210; a(4,5)=94;a(4,6)=112;a(5,6)=162;

% �������м�ľ���Գƾ���
a=a+a'; 

% ��ȡ���и���
L=size(a,1);

% �����ʼȦ--�����ص㵽���һ�����й��ɵĳ�ʼȦ
c1=[1 2:5 6];
[circle,long]=modifycircle(c1,L);

c2=[1 6 2:5];%�ı��ʼȦ�����㷨�����һ�����㲻��
[circle2,long2]=modifycircle(c2,L);

if long2<long
    long=long2;
    circle=circle2;
end

circle,long


%*******************************************
%�޸�Ȧ���Ӻ���
%*******************************************
function [circle,long]=modifycircle(c1,L)
global a
flag=1;
while flag>0
flag=0;
    for m=1:L-3
        for n=m+2:L-1
            if a(c1(m),c1(n))+a(c1(m+1),c1(n+1))<a(c1(m),c1(m+1))+a(c1(n),c1(n+1))
                flag=1;
                c1(m+1:n)=c1(n:-1:m+1);
            end
        end
    end
end

long=a(c1(1),c1(L));

for i=1:L-1
    long=long+a(c1(i),c1(i+1));
end
circle=c1;




