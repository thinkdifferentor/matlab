%���ķǵ�����ײ����
clear                                  %�������
v0=-4:0.2:4;                           %v20/v10���ٶȱ�����
m=0:0.2:3;                             %m2/m1������������
[V0,M]=meshgrid(v0,m);                 %���ٶȱȺ������Ⱦ���
V=(1+M.*V0)./(1+M);                    %������ȫ�ǵ�����ײ����ٶ�
s1='m1*v10+m2*v20-m1*v1-m2*v2';        %�����غ��ַ���
s2='v2-v1-e*(v10-v20)';                %�ָ�ϵ���ַ���
[v1,v2]=solve(s1,s2,'v1','v2')         %���ķǵ�����ײ���ٶȵķ��Ž�
figure                                 %����ͼ�δ���
surf(V0,M,V)                           %����ȫ�ǵ�����ײ���ٶ�����
box on                                 %���
hold on                                %����ͼ��
contour(v0,m,V,[0,0],'r','LineWidth',2)%���ٶ�Ϊ��ĵ�ֵ��
fs=16;                                 %�����С
title('������ȫ�ǵ�����ײ���ٶ�','FontSize',fs)%����
xlabel('\itv\rm_2_0/\itv\rm_1_0','FontSize',fs)%���ٶȱȱ�ǩ
ylabel('\itm\rm_2/\itm\rm_1','FontSize',fs)%�����ȱ�ǩ
zlabel('\itv\rm_1/\itv\rm_1_0','FontSize',fs)%��ײ���ٶȱȱ�ǩ
figure                                 %����ͼ�δ���
surf(V0,M,V)                           %������
box on                                 %�ӿ��
shading interp                         %Ⱦɫ
V=2*(1+M.*V0)./(1+M)-1;                %���������ȫ������ײ����ٶ�
hold on                                %����ͼ��
surf(V0,M,V)                           %��������ȫ������ײ���ٶ�����
e=0.5;                                 %�ָ�ϵ��
V=(1+e)*(1+M.*V0)./(1+M)-e;            %���嵯����ײ����ٶ�
mesh(V0,M,V)                           %��һ�㵯����ײ����ٶ���������
alpha(0.5)                             %ʹƽ��͸��
xlabel('\itv\rm_2_0/\itv\rm_1_0','FontSize',fs)%���ٶȱȱ�ǩ
ylabel('\itm\rm_2/\itm\rm_1','FontSize',fs)%�����ȱ�ǩ
zlabel('\itv\rm_1/\itv\rm_1_0','FontSize',fs)%��ײ���ٶȱȱ�ǩ
title('���ķǵ�����ײ���ٶ�','FontSize',fs)%����

