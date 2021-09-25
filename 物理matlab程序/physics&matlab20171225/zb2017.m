%פ���γɵĶ���
clear                                  %�������
xm=2;                                  %���ĸ���(���ķ�Χ)
dx=0.01;                               %��������(�Բ���Ϊ��λ)
x=0:dx:xm;                             %��������
u1=cos(2*pi*x);                        %���в���λ��
u2=u1;                                 %���в���λ��
%u2=u1*0.8;                             %�ͷ����в�
%u2=u1*1.2;                             %�߷����в�
u=u1+u2;                               %פ��
figure                                 %����ͼ�δ���
h=plot(x,u,'r','LineWidth',2);         %פ�����
%h=plot(x,u,'r','LineWidth',2,'erasemode','xor');%פ�����
axis([0,xm,-3,3])                      %���߷�Χ
grid on                                %������
fs=16;                                 %�����С
xlabel('\itx/\lambda','FontSize',fs)   %x��ǩ
ylabel('\itu/A','FontSize',fs)         %y��ǩ   
title('פ�����γ�','FontSize',fs)      %����
%title('�ϳ����в�','FontSize',fs)       %����
%title('�ϳ����в�','FontSize',fs)       %����
hold on                                %����ͼ��
h1=plot(x,u1,'LineWidth',2);           %���в����
h2=plot(x,u2,'k','LineWidth',2);       %���в����
%h1=plot(x,u1,'LineWidth',2,'erasemode','xor');%���в����
%h2=plot(x,u2,'k','LineWidth',2,'erasemode','xor');%���в����
ht1=text(1,max(u1)+0.1,'\rightarrow','FontSize',fs);%��ʾ���ҵļ�ͷ
ht2=text(1,max(u2)+0.2,'\leftarrow','FontSize',fs);%��ʾ���ҵļ�ͷ
pause                                  %��ͣ
while 1                                %����ѭ��
%while get(gcf,'CurrentCharacter')~=char(27)%����ESC��ѭ��
    u1=[u1(end-1),u1(1:end-1)];        %�����ڶ���Ԫ���Ƶ���һ��
    u2=[u2(2:end),u2(2)];              %�ڶ���Ԫ���Ƶ����һ��
    u=u1+u2;                           %�ϳɲ�
    set(h1,'YData',u1)                 %�������в���λ��
    set(h2,'YData',u2)                 %�������в���λ��
    set(h,'YData',u)                   %���úϳɲ���λ��
    [um,i]=max(u1);                    %�����в������ֵ���±�
    set(ht1,'Position',[x(i),um+0.1])  %�����Ҽ�ͷ��λ��
    [um,i]=max(u2);                    %�����в������ֵ���±�
    set(ht2,'Position',[x(i),um+0.2])  %�������ͷ��λ��
    drawnow                            %������Ļ
    pause(0.1)                         %��ʱ
    if get(gcf,'CurrentCharacter')==char(27) break;end%��ESC�����˳�����
end                                    %����ѭ��

