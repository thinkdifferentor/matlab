% https://www.jianshu.com/p/ee12f92f8f81

function [ UF,UB ] = MannKendall( x,y,p )
% x��ʾʱ����1982-2015
%  y��ʾ��Ӧʱ��Ľ��
%  p��ʾ����ˮƽ
N = length(y);
UF = SMK(y);
yy = reshape(y,1,length(y));
yy = fliplr(yy);
UB = -fliplr(SMK(yy));
zp(1:length(UF)) = norminv(p/2);

%return
h = figure;
set(h,'position',[100 100 400 300]) %100 100ͼ�����µ��ʾ����Ļ��λ�ã�400��300�ֱ��ʾͼ��ĳ��͸�
if isempty(x)
    plot(UF,'b');
    hold on
    plot(UB,'r--');
    hold on
    legend('UF','UB')
    plot(abs(zp),'k');
    hold on
    plot(-abs(zp),'k');
    hold on
    plot(zeros(1,N),'k');
else
    plot(x,UF,'b');
    hold on
    plot(x,UB,'r--');
    hold on
    legend('UF','UB')
    plot(x,abs(zp),'k');
    hold on
    plot(x,-abs(zp),'k');
    hold on
    plot(x,zeros(1,N),'k');
end
set(gca,'linewidth',1,'fontsize',10,'fontname','Times New Roman','FontWeight','bold'); %�������塢�߿��Ӵ�
xlabel('Year','Fontname', 'Times New Roman','FontSize',10,'FontWeight','bold')
ylabel('Statistics','Fontname', 'Times New Roman','FontSize',10,'FontWeight','bold')
title('MK������','Fontname', 'Times New Roman','FontSize',10,'FontWeight','bold')

function U = SMK( Y )
N = length(Y);
s = zeros(1,N);
U(1) = 0;
for k=2:N
    r = 0;
    s(k) = 0;
    for j=1:k-1
        if Y(k)>Y(j)
            r = r+1;
        end
        s(k) = s(k-1)+r;
    end
    E = k*(k-1)/4;
    VAR = k*(k-1)*(2*k+5)/72;
    U(k) = (s(k)-E)/sqrt(VAR);
end


% https://www.ilovematlab.cn/thread-246993-1-1.html
%���д������Ҫ�õ�MK���鷨�������ռ���������matlab���룬����û��һ�������ܹ�
%��ȫ��ȷ���л��߷�����Ϣ��ȫ����϶�λ���ѱ�д��MK���鷨�������ҵĸı࣬˳���õ�
%��ȷ�����н����лл��λ���ѣ�ϣ��������Ҫ�������а���
% Mann-Kendallͻ����
% ��������y
% �������UFk��UBk2
%--------------------------------------------
%��ȡexcel�е����ݣ���������y
%��ȡy��������
%AΪʱ��;���������
A=xlswrite('����.xls');
x=A(:,1);%ʱ������
y=A(:,2);%����������
N=length(y);
n=length(y);
% �����м���---------------------------------
% �����ۼ�������Sk������=y����ʼֵ=0
Sk=zeros(size(y));
% ����ͳ����UFk������=y����ʼֵ=0
UFk=zeros(size(y));
% ����Sk����Ԫ��s
s = 0;
% i��2��ʼ����Ϊ����ͳ����UFk��ʽ��i=1ʱ��Sk(1)��E(1)��Var(1)��Ϊ0
% ��ʱUFk�����壬��˹�ʽ�У���UFk(1)=0
for i=2:n
   for j=1:i
         if y(i)>y(j)
           s=s+1;
         else
           s=s+0;
         end
   end
   Sk(i)=s;
   E=i*(i-1)/4; % Sk(i)�ľ�ֵ
  Var=i*(i-1)*(2*i+5)/72; % Sk(i)�ķ���
  UFk(i)=(Sk(i)-E)/sqrt(Var);
end
% ------------------------------�����м���end
% �����м���---------------------------------
% ����������y2������=y����ʼֵ=0
y2=zeros(size(y));
% ���������ۼ�������Sk2������=y����ʼֵ=0
Sk2=zeros(size(y));
% ��������ͳ����UBk������=y����ʼֵ=0
UBk=zeros(size(y));
% s��0
s=0;
% ��ʱ��������ת����y
% Ҳ����ʹ��y2=flipud(y);����y2=flipdim(y,1);
for i=1:n
    y2(i)=y(n-i+1);
end
% i��2��ʼ����Ϊ����ͳ����UBk��ʽ��i=1ʱ��Sk2(1)��E(1)��Var(1)��Ϊ0
% ��ʱUBk�����壬��˹�ʽ�У���UBk(1)=0
for i=2:n
   for j=1:i
         if y2(i)>y2(j)
           s=s+1;
         else
           s=s+0;
         end
   end
   Sk2(i)=s;
   E=i*(i-1)/4; % Sk2(i)�ľ�ֵ
  Var=i*(i-1)*(2*i+5)/72; % Sk2(i)�ķ���
% ���ڶ��������е��ۼ���Sk2�Ĺ����У���Ȼ�õ����ۼӷ��������ߴ���ǰ��ʱs��1��
% ��s�Ĵ�С������һ�����������ƵĴ�С�������������Ժ�Ӧ�����ֳ���ԭ�����෴
% �����Ʊ��֣���ˣ����ۼӷ�ͳ��Sk2���У�ͳ������ʽ(S(i)-E(i))/sqrt(Var(i))
% Ҳ��Ӧ�ı䣬��ͳ����UBkӦȡ�෴���Ա�����ȷ���������е�����
  UBk(i)=0-(Sk2(i)-E)/sqrt(Var);
end
% ------------------------------�����м���end
% ��ʱ��һ���ĵ�UBk���ֵ���������������ʱ���ϵ�����ͳ����
% ��UFk��ͼѰ��ͻ���ʱ��2������Ӧ����ͬ����ʱ���ᣬ���
% �ٰ�ʱ��������ת���ͳ����UBk���õ�ʱ�������UBk2����ͼ��
UBk2=zeros(size(y));
% Ҳ����ʹ��UBk2=flipud(UBk);����UBk2=flipdim(UBk,1);
for i=1:n
   UBk2(i)=UBk(n-i+1);
end
% ��ͻ����ͼʱ��ʹ��UFk��UBk2
% д��Ŀ��xls�ļ���f:\test2.xls
% Ŀ�����Sheet1
% Ŀ������UFk��A1��ʼ��UBk2��B1��ʼ
xlswrite('f:\test2.xls',UFk,'Sheet1','A1');
xlswrite('f:\test2.xls',UBk2,'Sheet1','B1');
figure(3)%��ͼ
plot(x,UFk,'r-','linewidth',1.5);
hold on
plot(x,UBk2,'b-.','linewidth',1.5);
plot(x,1.96*ones(N,1),':','linewidth',1);
axis([min(x),max(x),-5,5]);
legend('UFͳ����','UBͳ����','0.05����ˮƽ');
xlabel('t (year)','FontName','TimesNewRoman','FontSize',12);
ylabel('ͳ����','FontName','TimesNewRoman','Fontsize',12);
%grid on
hold on
plot(x,0*ones(N,1),'-.','linewidth',1);
plot(x,1.96*ones(N,1),':','linewidth',1);
plot(x,-1.96*ones(N,1),':','linewidth',1);


