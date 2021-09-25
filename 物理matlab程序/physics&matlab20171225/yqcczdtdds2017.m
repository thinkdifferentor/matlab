%����ǿ�ų�����ת������ĵ綯��
clear                                  %�������
l=0.2;                                 %���ĳ���
b=0.01;                                %�Ÿ�Ӧǿ��
w=200*pi;                              %���ٶ�
e=b*w*l^2/2;                           %�����綯��
xm=l+0.1;                              %�ų���Χ
x=-xm:0.05:xm;                         %��������
[X,Y]=meshgrid(x);                     %�������
figure                                 %����ͼ�δ���
plot(X,Y,'x','MarkerSize',10)          %�����桱
title('����ǿ�ų�����ת������ĵ綯��','FontSize',20)%����
th=linspace(0,2*pi,30);                %�Ƕ�����
axis equal off                         %ʹ����������Ȳ�����
hold on                                %����ͼ��
plot(l*cos(th),l*sin(th),'--','linewidth',2)%������Բ
text(-l,l,['\it\epsilon\rm=',num2str(e),'V'],'FontSize',16)%��ʾ�綯��
text(0,0,'\itO','FontSize',16)         %��ʾԭ��
ht=text(l,0,'\itA','FontSize',16);     %��ʾ��ĸA��ȡ���
hp=plot([0,l],[0,0],'LineWidth',3);    %������ȡ���
pause                                  %��ͣ
th=0;                                  %��ʼ�Ƕ�����
while 1                                %����ѭ��
    th=th+pi/180;                      %��һ������
    x=l*cos(th);                       %�˵������
    y=l*sin(th);                       %�˵�������
    set(hp,'XData',[0,x],'YData',[0,y])%���ð�������
    set(ht,'Position',[x,y])           %������ĸA��λ��
    drawnow                            %ˢ����Ļ
    if get(gcf,'CurrentCharacter')==char(27) break,end%��ESC���˳�
end                                    %����ѭ��

