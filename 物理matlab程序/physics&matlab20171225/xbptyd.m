%б�������˶��о�
clear                                  %�������
a1=-45;                                %��С�¶�
alpha=a1:15:45;                        %б�����ǵĶ���
a=alpha*pi/180;                        %��Ϊ������
n=length(a);                           %�¶ȵĸ���
theta=a1:5:90;                         %������ǵĶ���
th=theta*pi/180;                       %������ǵĻ�����
[A,TH]=meshgrid(a,th);                 %���Ǻ���Ǿ���
S=2*sin(TH-A).*cos(TH)./cos(A).^2;     %��̾���(��ˮƽ������Ϊ��λ)
S(S<0)=nan;                            %С��������û������(��Ϊ����)
figure                                 %����ͼ�δ���
%plot(theta,S,'LineWidth',2)            %�����������
plot(theta,S(:,1),'o-',theta,S(:,2),'d-',theta,S(:,3),'s-',...
    theta,S(:,4),'p-',theta,S(:,5),'h-',theta,S(:,6),'<-',...
    theta,S(:,7),'>-')                 %������˶�������
grid on                                %������
h=legend([repmat('�¶�:',n,1),num2str(alpha'),repmat('\circ',n,1)]);%�����¶�ͼ��
fs=16;                                 %�����С
set(h,'FontSize',fs-2)                 %�Ŵ�ͼ��
thm=45+alpha/2;                        %�����̵����
sm=1./(1+sin(a));                      %������
text(thm,sm,num2str(sm',3),'FontSize',fs)%���������(����3λ)
th0=a1*ones(1,n);                      %������ˮƽ�ߵ���������
hold on                                %����ͼ��
plot([th0;thm],[sm;sm],'--')           %�������̵�ˮƽ����
stem(thm,sm,'--','filled')             %��ֱ��������Ϊ�����̵���ֱ��
alpha=a1-1:90;                         %б�����ǵĶ�������
thm=45+alpha/2;                        %�����̵����
a=alpha*pi/180;                        %��Ϊ������
sm=1./(1+sin(a));                      %������
plot(thm,sm,'r-.','LineWidth',3)       %������������
title('б��������б���ϵ����','FontSize',fs)%����
xlabel('���\it\theta\rm/\circ','FontSize',fs)%�������ǩ
ylabel('���\itS/X\rm_M','FontSize',fs)%�������ǩ
sm=floor(max(S(:)));                   %������ȡ����
text(a1,sm,'\itX\rm_M=\itv\rm_0^2/\itg','FontSize',fs)%˵�����ˮƽ���

