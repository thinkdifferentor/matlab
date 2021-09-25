%������ͼ�β�ͬ���Ķ���
clear                                  %�������
T1=input('������x��������:');          %��������x���������
T2=input('������y��������:');          %��������y���������
w1=2*pi/T1;                            %x�����ԲƵ��
w2=2*pi/T2;                            %y�����ԲƵ��
tm=T1*T2;                              %���ʱ��
dt=0.005;                              %ʱ������
t=-tm:dt:tm;                           %ʱ������
m=4;                                   %��ĸ
T=T2;                                  %ȡy������
while T/2==floor(T/2)                  %����Ϊż��ʱѭ��
    T=T/2;                             %���ڳ���2
    m=m*2;                             %��ĸ����2
end                                    %����ѭ��
figure                                 %����ͼ�δ���
for i=0:8                              %���Ӵ���ѭ��
    subplot(3,3,i+1)                   %ȡ�Ӵ���
    pause                              %��ͣ
    f=pi*i/m;                          %���
    x=cos(w1*t);                       %�������������
    y=cos(w2*t+f);                     %��������������
    comet(x,y)                         %��������
    plot(x,y,'LineWidth',2)            %���켣
    hold on                            %����ͼ��
    plot(x(1),y(1),'ro')               %�����
    grid on                            %������
    if i==0                            %���ڵ�һͼ
        ylabel(['\itT\rm_1:\itT\rm_2=',num2str(T1),...
            ':',num2str(T2)],'FontSize',12)%�������
         tit='\Delta\it\phi\rm=\it\phi\rm_2-\it\phi\rm_1=0';%����
    elseif i==1                        %�������
        tit=['\pi/',num2str(m)];       %����
    else                               %����
        tit=[num2str(i),'\pi/',num2str(m)];%����
    end                                %��������
    title(tit,'FontSize',12)           %����
end                                    %����ѭ��

