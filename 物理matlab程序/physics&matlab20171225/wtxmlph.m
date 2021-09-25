%б�������徲ֹ����Ҫ��ˮƽ��
clear                                  %�������
mu=0:0.2:0.6;                          %Ħ��ϵ������
theta=0:2:90;                          %�Ƕ�����(����)
th=theta*pi/180;                       %�Ƕ�����(������)
fs=16;                                 %�����С
%figure                                 %����ͼ�δ���
for i=1:length(mu)                     %��Ħ��ϵ��ѭ��
    a=atan(mu(i));                     %��Ħ����
    f1=tan(th-a);                      %����������
    f2=tan(th+a);                      %����������
    figure                                 %����ͼ�δ���
%    subplot(2,2,i)                     %ѡ��ͼ
    plot(theta,f1,theta,f2,'--','LineWidth',2)%���������޺���������
    grid on                            %������
    axis([0,90,-1,10])                 %�޶����߷�Χ
    title('ʹб�������徲ֹ��ˮƽ����Χ','FontSize',fs)%�ӱ���
    xlabel('\it\theta\rm/\circ','FontSize',fs)%�Ӻ������ǩ
    ylabel('\itF/mg','FontSize',fs)    %���������ǩ
    legend('����','����',2)            %ͼ��
    alpha=a*180/pi;                    %Ħ����
    thetaC=90-alpha;                   %�ٽ��
    hold on                            %����ͼ��
    plot(alpha,0,'*',thetaC,0,'o')     %��Ħ���Ǻ��ٽ��
    txt=['\it\mu\rm=',num2str(mu(i))]; %Ħ��ϵ���ı�
    txt=[txt,',\it\alpha\rm=',num2str(alpha,3),'\circ'];%Ħ�����ı�
    txt=[txt,',\it\theta\rm_C=',num2str(90-alpha,3),'\circ'];%�ٽ���ı�
    text(0,5,txt,'FontSize',fs)        %����ı�
    f=tan(2*a);                        %
    stem(alpha,f,'--')
    text(alpha,f,num2str(f,2),'FontSize',fs)%
end                                    %����ѭ��

