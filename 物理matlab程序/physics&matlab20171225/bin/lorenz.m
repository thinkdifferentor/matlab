%% ������function
axis([10 50 -50 50 -50 50])              %%�趨������ķ�Χ
view(3)                                  %%�趨��άͼ�ι۲��ӽ�
hold on
title('Lorenz Attractor')                %%���ϱ���
options=odeset('OutputFcn','odephas3');  %%�趨��ά��ռ�����������ͼ��
[t,y]=ode23('lorfun',[0,20],[0,0,eps],options);  %%���t,y������
