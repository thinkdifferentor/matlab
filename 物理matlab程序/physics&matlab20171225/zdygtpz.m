%�ʵ���������ȫ�ǵ�����ײ
clear                                  %�������
j=0:0.1:5;                             %ת��������
v=1./(1+j);                            %��ײ����ٶ�
figure                                 %����ͼ�δ���
subplot(2,1,1)                         %ѡ��ͼ
plot(j,v,'LineWidth',2)                %���ٶ�����
grid on                                %������
fs=16;                                 %�����С
xlabel('\itJ/mL\rm^2','fontsize',fs)   %�Ӻ������ǩ
ylabel('\it\omega/\omega\rm_0,\itv/v\rm_0','fontsize',fs)%���������ǩ
title('�ʵ��������ȫ�ǵ�����ײ��Ľ��ٶȺ��ٶ�','fontsize',fs)%�ӱ���
text(0,0.5,'\it\omega\rm=\itv\rm_0/\itL','fontsize',fs)%���ٶȵĵ�λ

dTm=-(2+j).*j./(1+j).^2;               %�ʵ㶯�ܵ�����
dTj=j./(1+j).^2;                       %���嶯�ܵ�����
dT=-j./(1+j);                          %ϵͳ���ܵ�����
subplot(2,1,2)                         %ѡ��ͼ
plot(j,dTm,j,dTj,'--',j,dT,'-.','LineWidth',2)%��������������
legend('�ʵ㶯�ܵ�����','���嶯�ܵ�����','ϵͳ���ܵ�����',0)%ͼ��
title('�ʵ��������ȫ�ǵ�����ײ��Ķ��ܵ�����','fontsize',fs)%�ӱ���
xlabel('\itJ/mL\rm^2','fontsize',fs)   %�Ӻ��ǩ
grid on                                %������
text(0,0,'\itE\rm_0=\itmv\rm_0^2/2','fontsize',fs)%�����ĵ�λ

