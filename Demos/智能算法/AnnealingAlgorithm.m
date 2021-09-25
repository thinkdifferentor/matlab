clc
clear
% ģ���˻��㷨

% Ŀ�꺯��������;1��󻯣�-1��С��
Obj_minmax=1;

% ����ȡֵ����
Up=2.5;

% ����ȡֵ����
Down=-1;

% ȡ�м�ֵ
Mid=(Up+Down)/5;

% �¶�˥������
yita=0.99;

% �˻��㷨�������ܸ�����
Tracer=[];

% ������������
Iteration=3000;

TmpX=Down:0.01;Up;

Fun_value=fun(TmpX);

%ģ���ʼ�¶�
Tmper=max(Fun_value)-min(Fun_value);

plot(TmpX,Fun_value);
xlabel('x');
ylabel('y');
title('һԪ�����Ż����');
hold on;

% ��ȡ������[dow, up]֮��������
Random1=rand*(Up - Down)+Down;

% ������������Ӧ�ĺ���ֵ--���������ʼ״̬
Fun_random1=fun(Random1);

% ��ǰ��������
Cur_Iteration=0;

% ��ͼ���б�ǳ�ʼλ��
plot(Random1,Fun_random1,'ro','linewidth',2);

% ��ʼ�˻����
while (Cur_Iteration<Iteration)
    %�ڵ�ǰ�����㸽�����������һ��������λ��
    Random2=Random1+(2*rand-1)*Mid;
    %�������ڿ���������
    Random2=min(Random2,Up);
    Random2=max(Random2,Down);
    
    Fun_random2=fun(Random2);
    
    %���������ڵ�ǰ�㣬���ܵ������������Ϊ��ǰ������
    if(Obj_minmax*Fun_random2>Obj_minmax*Fun_random1)
        Random1=Random2;
        Fun_random1=Fun_random2;
    %���������ڵ�ǰ�㣬��Boltzmann���ʽ��ܵ������������Ϊ��ǰ������
    elseif (rand<exp(Obj_minmax*(Fun_random2-Fun_random1)/Tmper))
        Random1=Random2;
        Fun_random1=Fun_random2;
    end
    
    %�ѻ����ٶ�˥���¶�Tmper;
    Tmper=yita*Tmper;
    
    %����������һ
    Cur_Iteration=Cur_Iteration+1;
    
    %�����˻��㷨���ܸ�����
    Tracer=[Tracer;Fun_random1];
    
    [Random1,Fun_random1];
end



plot(Random1,Fun_random1,'r *','linewidth',2);
figure;
plot(Tracer(:),'r-*');
hold on;
xlabel('��������');
ylabel('Ŀ�꺯���Ż����');
title('һԪ�����Ż�����');















































