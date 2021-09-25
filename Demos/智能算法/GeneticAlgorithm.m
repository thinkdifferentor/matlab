clc
clear
% �Ŵ��㷨

% Ŀ�꺯��������;1��󻯣�-1��С��
Obj_minmax=1;

% ��Ⱥ��ģ���������
NumofPPU=50;

% ����Ŵ�����
NumofGEN=60;

% ���򳤶�
LenofCH=20;

% ����
Gap=0.9;

% ����ȡֵ����
Up=2.5;
% ����ȡֵ����
Down=-1;

% �Ƿ�ѡ����ױ��� ��1�� 0 ��

Choice_Gray=1;

% �Ƿ�ѡ��������:1�� 0��
Choice_Log=0;

% �Ŵ��������ܸ�����
Tracer=zeros(NumofGEN,2);

% ����������
Fielder=[LenofCH;Down;Up;1-Choice_Gray;Choice_Log;1;1];

% ��ʼ����Ⱥ
Population=crtbp(NumofPPU,LenofCH);

% ��ǰ�Ŵ�
Cur_GEN=0;

% �����ʼ����ȺΪ10����
X=bs2rv(Population,Fielder);

% ����Ŀ�꺯��ֵ
Value=fun(X);

TmpX=Down:0.01:Up;
plot(TmpX,fun(TmpX));
xlabel('x');
ylabel('y');
title('һԪ�����Ż����');
hold on;


% ��ʼ��Ⱥ����
while(Cur_GEN<NumofGEN)
    %����Ŀ�꺯������Ӧ��
    Fit_value=ranking(-Obj_minmax*Value);
    
    %ʹ�������㷨ѡ��
    Sel_population=select('rws',Population,Fit_value,Gap);
    
    %����
    Sel_population=recombin('xovsp',Sel_population);
    
    %����
    Sel_population=mut(Sel_population);
    
    %�Ӵ����巭��
    X=bs2rv(Sel_population,Fielder);
    
    %�Ӵ������ӦĿ�꺯��ֵ
    Sub_value=fun(X);

    %����Ŀ�꺯��ֵ���Ӵ�����������Ⱥ
    [Population,Value]=reins(Population,Sel_population,1,1,Obj_minmax*Value,Obj_minmax*Sub_value);
    
    %Ѱ�ҵ�ǰ��Ⱥ�����Ž�
    [Fun_value,index]=max(Value);
    
    % ������º���ȺΪ10����
    X=bs2rv(Population,Fielder);
    
    Fun_value=Fun_value*Obj_minmax;
    
    Value=Value*Obj_minmax;
    
    
    %��ǰ�Ŵ�������һ
    Cur_GEN=Cur_GEN+1;
    
    tracer(Cur_GEN,1)=Fun_value;
    
    tracer(Cur_GEN,2)=mean(Value);
    
end


plot(X(index),Fun_value,'r *');
figure;

plot(tracer(:,1),'r-*');
hold on;

plot(tracer(:,2),'b-o');
legend('���Ӵ���Ⱥ���Ž�','���Ӵ���Ⱥƽ��ֵ');
xlabel('��������');
ylabel('Ŀ�꺯���Ż����');
title('һԪ�����Ż�����');





























