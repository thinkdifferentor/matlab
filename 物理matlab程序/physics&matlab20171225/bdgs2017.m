%���ĸ��涯����ͼ��
clear                                  %�������
x1=-2.5;                               %��������߽�(�����ı���)
x2=10;                                 %�������ұ߽�
ym=5;                                  %�����귶Χ
x0=0.5;                                %������֮��ľ���(�벨��) 
%a=1;                                   %�������ĵİ����
a=1.5;                                 %�������ĵİ����
d=0.05;                                %��İ���
figure                                 %����ͼ�δ���
plot([0,0,0;0,0,0],[ym,a-d,-a-d;a+d,-a+d,-ym],'k','LineWidth',3)%�����µ���
rectangle('Position',[x1,-ym,x2-x1,2*ym],'LineWidth',3)%������
axis off equal                         %����ʾ���겢ʹ���������
axis([x1,x2,-ym,ym])                   %�趨���귶Χ
title('���ĸ���ͼ��','FontSize',20)    %��ʾ����
hold on                                %����ͼ��
plot(x1,0,'o')                         %���㲨Դ
th0=linspace(-pi/3,pi/3);              %�㲨Դ�ĽǶ�����
th=linspace(-pi/2,pi/2);               %��ɲ�Դ�ĽǶ�����
n=1;                                   %��1�������� 
c='rb';                                %������ɫ���� 
pause                                  %��ͣ 
while 1                                %����ѭ��
%while get(gcf,'CurrentCharacter')~=char(27)%����ESC��ѭ��
    h1(n)=plot(x1,0,'Color',c(mod(n,2)+1),'LineWidth',1.5);%��һ��������ľ��
    h2(n)=plot(x1,0,'Color',c(mod(n,2)+1),'LineWidth',1.5);%�ڶ���������ľ��
	xr=0.05;                           %���������Գ�λ��
    while xr<x0                        %����������֮��ľ�����ѭ��
        for i=1:n                      %��������ѭ��
            x=x1+x0*(n-i)+xr;          %������ĺ�����
            if x<0                     %���û�дﵽ�����ұ�
                xx=(-x1+x)*cos(th0)+x1;%����������
                yy=(-x1+x)*sin(th0);   %����������
                set(h1(i),'XData',xx,'YData',yy)%���û��β�����
            else                       %����
                xx=x*cos(th);          %����������
                yy=x*sin(th);          %����������
                set(h1(i),'XData',xx,'YData',yy+a)%���õ�һ����Բ�β�����
                set(h2(i),'XData',xx,'YData',yy-a)%���õڶ�����Բ�β�����
            end                        %��������
        end                            %����ѭ��
        drawnow                        %������Ļ
        pause(0.02)                    %��ʱ
        xr=xr+0.05;                    %��һ��
    end                                %����ѭ�� 
    n=n+1;                             %����һ��������
    if get(gcf,'CurrentCharacter')==char(27) break;end%��ESC�����˳�����
end                                    %����ѭ��
x=linspace(0,x2);                      %����������
n=4*a;                                 %�����ߵ������
[X,K]=meshgrid(x,1:2:n);               %�������������
D=(K-1)/2;                             %���̲�
Y=D/2.*sqrt(1+X.^2*4./(4*a^2-D.^2));   %������
plot(x,Y,'k--',x,-Y,'k--','LineWidth',2)%���������(�񶯼�ǿ)
D=K/2;                                 %���̲�
Y=D/2.*sqrt(1+X.^2*4./(4*a^2-D.^2));   %������
plot(x,Y,'g--',x,-Y,'g--','LineWidth',2)%����������(�񶯼���)

