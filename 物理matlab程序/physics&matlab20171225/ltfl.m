%���������ӹ⻬�����ϻ��������˶���������(��΢�ַ��̵���ֵ��ͷ��Ž�)
clear                                  %�������
b=0.1:0.1:0.7;                         %b��l�ı�ֵ����
t=0:0.1:4;                             %ʱ������
options=odeset('Events','on');         %�����¼��жϹ���
f1=figure;                             %����ͼ�δ���
hold on                                %����ͼ��
f2=figure;                             %����ͼ�δ���
hold on                                %����ͼ��
c='bgrcymk';                           %��ɫ�ַ���
m='odsph^v';                           %�����ַ���
tm=[];                                 %���µ�ʱ�������ÿ�
vm=[];                                 %���µ��ٶ������ÿ�
n=length(b);                           %��ֵ����  
for i=1:n                              %����ֵѭ��
    [tt,Y]=ode45('ltflfun',t,[b(i),0],options);%��΢�ַ��̼��㳤�Ⱥ��ٶ�
%    [tt,Y,event]=ode45('P2_11_fun',t,y0,options);%��΢�ַ��̼��㳤�Ⱥ��ٶ�
    tm=[tm,tt(end)];                   %����ʱ������
    vm=[vm,max(Y(:,2))];               %�����ٶ�����
    figure(f1)                         %�ؿ�ͼ�δ���
    plot(tt,Y(:,1),[c(i),m(i),'-'])    %����������
    figure(f2)                         %�ؿ�ͼ�δ���
    plot(tt,Y(:,2),[c(i),m(i),'-'])    %���ٶ�����
end                                    %����ѭ��
figure(f1)                             %�ؿ�ͼ�δ���
grid on                                %������
axis([0,inf,0,1])                      %���귶Χ
fs=16;                                 %�����С
xlabel('\itt/t\rm_0','FontSize',fs)    %ʱ��ȱ�ǩ
ylabel('\ity/l','FontSize',fs)         %���ȱȱ�ǩ
title('������������������Ħ�����µĳ���','FontSize',fs)%�ӱ���
legend([repmat('\itb/l\rm=',n,1),num2str(b')],4)%��ͼ��
text(1.5,0.1,'\itt\rm_0=(\itl/g\rm)^{1/2}','FontSize',fs)%��ʱ�䵥λ�ı�
text(tm,ones(size(tm)),num2str(tm',2),'FontSize',fs)%���ʱ��
stem(tm,ones(size(tm)),'--')           %����ͼ
figure(f2)                             %�ؿ�ͼ�δ���
grid on                                %������
axis([0,inf,0,1])                      %���귶Χ
xlabel('\itt/t\rm_0','FontSize',fs)    %ʱ��ȱ�ǩ
ylabel('\itv/v\rm_0','FontSize',fs)    %�ٶȱȱ�ǩ
title('������������������Ħ�����µ��ٶ�','FontSize',fs)%�ӱ���
legend([repmat('\itb/l\rm=',n,1),num2str(b')],4)%��ͼ��
text(1.5,0.1,'\itv\rm_0=(\itgl\rm)^{1/2}','FontSize',fs)%���ٶȵ�λ�ı�
text(tm,vm,num2str(vm',3),'FontSize',fs)%��������ٶ�
plot([zeros(size(tm));tm],[vm;vm],'--')%��ˮƽ��

y=dsolve('D2y-y','y(0)=b','Dy(0)=0')   %΢�ַ��̵ķ��Ž�
v=diff(y);                             %���ٶ�
[B,T]=meshgrid(b,t);                   %��Ϊ����
Y=subs(y,{'b','t'},{B,T});             %��߶ȵ���ֵ
T(Y>1)=nan;                            %������������ʱ���Ϊ����
Y(Y>1)=nan;                            %�����������ĳ��ȸ�Ϊ����
V=subs(v,{'b','t'},{B,T});             %���ٶȵ���ֵ
figure(f1)                             %�ؿ�ͼ�δ���
plot(T,Y,'.')                          %��������
figure(f2)                             %�ؿ�ͼ�δ���
plot(T,V,'.')                          %��������
b=0.1:0.01:1;                          %b��l�ı�ֵ����
f=finverse(y);                         %�󷴺���,t��ʾ�߶�
s=subs(f,'t',1);                       %�滻(���)����
tm=subs(s,'b',b);                      %�滻��ֵ��ȫ�����µ�ʱ��
vm=subs(v,{'b','t'},{b,tm});           %�滻��ֵ��ȫ�����µ��ٶ�
plot(tm,vm,'--','LineWidth',2)         %��ȫ�����µ��ٶȺ�ʱ������

