%% ��������Ⱥ������ĺ����Ż��㷨

%% ��ջ���
clear
clc

%% ������ʼ��
x_range=[-50,50];     %����x�仯��Χ
y_range=[-50,50];     %����y�仯��Χ
range = [x_range;y_range];     %�����仯��Χ(��ɾ���)
Max_V = 0.2*(range(:,2)-range(:,1));  %����ٶ�ȡ�仯��Χ��10%~20%
n=2;                     %���Ż�������ά�����������н�x��y�����Ա�������Ϊ2

PSOparams= [25 2000 24 2 2 0.9 0.4 1500 1e-25 250 NaN 0 0];

%% ����ȺѰ��
pso_Trelea_vectorized('Rosenbrock',n,Max_V,range,0,PSOparams)  %����PSO����ģ��