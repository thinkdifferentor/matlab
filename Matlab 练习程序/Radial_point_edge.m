% ���߷��жϵ������ι�ϵԭ�����£�
% 
% �Ӵ��жϵ�����һ�����ߣ������������ཻ���������Ϊż������㲻�ڶ�����ڣ��������Ϊ����������ڶ�����ڡ�
% 
% ԭ��������������Щϸ�ڻ���Ҫע��һ�£��������߹�����ζ������������������һ���غϵ���������ر��жϡ�

clear all;close all;clc;

polyn=20;
poly=rand(polyn,2);
poly=createSimplyPoly(poly);  %�����򵥶����

polyn=polyn+1;                %���߷��㣬�ѵ�һ������ӵ����һ�������
poly(polyn,:)=poly(1,:);

pn=500;
p=rand(pn,2);

hold on;
for i=1:pn
   
    flag=0;
    for j=2:polyn
        x1=poly(j-1,1);         %�����ǰ��������
        y1=poly(j-1,2);
        x2=poly(j,1);
        y2=poly(j,2);
       
        k=(y1-y2)/(x1-x2);      %�����һ����ֱ��
        b=y1-k*x1;
        x=p(i,1);               %����ǰ��ֱ�ߺͶ���ν���
        y=k*x+b;          
               
        if min([x1 x2])<=x && x<=max([x1 x2]) && ...        %��ͬʱ�����ߺͶ���α���
           min([y1 y2])<=y && y<=max([y1 y2]) &&  y>=p(i,2)
               flag=flag+1;
        end
    end
   
    if mod(flag,2)==0               %ż�������ⲿ
        plot(p(i,1),p(i,2),'r.');
    else                            %���������ڲ�
        plot(p(i,1),p(i,2),'g.');        
    end
end

plot(poly(:,1),poly(:,2));