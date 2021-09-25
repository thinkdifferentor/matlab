% https://www.jianshu.com/p/ee12f92f8f81

function [ UF,UB ] = MannKendall( x,y,p )
% x表示时间如1982-2015
%  y表示对应时间的结果
%  p表示显著水平
N = length(y);
UF = SMK(y);
yy = reshape(y,1,length(y));
yy = fliplr(yy);
UB = -fliplr(SMK(yy));
zp(1:length(UF)) = norminv(p/2);

%return
h = figure;
set(h,'position',[100 100 400 300]) %100 100图像左下点表示在屏幕的位置，400和300分别表示图像的长和高
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
set(gca,'linewidth',1,'fontsize',10,'fontname','Times New Roman','FontWeight','bold'); %设置字体、线宽、加粗
xlabel('Year','Fontname', 'Times New Roman','FontSize',10,'FontWeight','bold')
ylabel('Statistics','Fontname', 'Times New Roman','FontSize',10,'FontWeight','bold')
title('MK检验结果','Fontname', 'Times New Roman','FontSize',10,'FontWeight','bold')

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
%最近写论文需要用到MK检验法，网上收集到大量的matlab代码，但是没有一个代码能够
%完全正确运行或者分析信息不全，结合多位网友编写的MK检验法，经过我的改编，顺利得到
%正确的运行结果，谢谢各位网友，希望对有需要的盆友有帮助
% Mann-Kendall突变检测
% 数据序列y
% 结果序列UFk，UBk2
%--------------------------------------------
%读取excel中的数据，赋给矩阵y
%获取y的样本数
%A为时间和径流数据列
A=xlswrite('数据.xls');
x=A(:,1);%时间序列
y=A(:,2);%径流数据列
N=length(y);
n=length(y);
% 正序列计算---------------------------------
% 定义累计量序列Sk，长度=y，初始值=0
Sk=zeros(size(y));
% 定义统计量UFk，长度=y，初始值=0
UFk=zeros(size(y));
% 定义Sk序列元素s
s = 0;
% i从2开始，因为根据统计量UFk公式，i=1时，Sk(1)、E(1)、Var(1)均为0
% 此时UFk无意义，因此公式中，令UFk(1)=0
for i=2:n
   for j=1:i
         if y(i)>y(j)
           s=s+1;
         else
           s=s+0;
         end
   end
   Sk(i)=s;
   E=i*(i-1)/4; % Sk(i)的均值
  Var=i*(i-1)*(2*i+5)/72; % Sk(i)的方差
  UFk(i)=(Sk(i)-E)/sqrt(Var);
end
% ------------------------------正序列计算end
% 逆序列计算---------------------------------
% 构造逆序列y2，长度=y，初始值=0
y2=zeros(size(y));
% 定义逆序累计量序列Sk2，长度=y，初始值=0
Sk2=zeros(size(y));
% 定义逆序统计量UBk，长度=y，初始值=0
UBk=zeros(size(y));
% s归0
s=0;
% 按时间序列逆转样本y
% 也可以使用y2=flipud(y);或者y2=flipdim(y,1);
for i=1:n
    y2(i)=y(n-i+1);
end
% i从2开始，因为根据统计量UBk公式，i=1时，Sk2(1)、E(1)、Var(1)均为0
% 此时UBk无意义，因此公式中，令UBk(1)=0
for i=2:n
   for j=1:i
         if y2(i)>y2(j)
           s=s+1;
         else
           s=s+0;
         end
   end
   Sk2(i)=s;
   E=i*(i-1)/4; % Sk2(i)的均值
  Var=i*(i-1)*(2*i+5)/72; % Sk2(i)的方差
% 由于对逆序序列的累计量Sk2的构建中，依然用的是累加法，即后者大于前者时s加1，
% 则s的大小表征了一种上升的趋势的大小，而序列逆序以后，应当表现出与原序列相反
% 的趋势表现，因此，用累加法统计Sk2序列，统计量公式(S(i)-E(i))/sqrt(Var(i))
% 也不应改变，但统计量UBk应取相反数以表征正确的逆序序列的趋势
  UBk(i)=0-(Sk2(i)-E)/sqrt(Var);
end
% ------------------------------逆序列计算end
% 此时上一步的到UBk表现的是逆序列在逆序时间上的趋势统计量
% 与UFk做图寻找突变点时，2条曲线应具有同样的时间轴，因此
% 再按时间序列逆转结果统计量UBk，得到时间正序的UBk2，做图用
UBk2=zeros(size(y));
% 也可以使用UBk2=flipud(UBk);或者UBk2=flipdim(UBk,1);
for i=1:n
   UBk2(i)=UBk(n-i+1);
end
% 做突变检测图时，使用UFk和UBk2
% 写入目标xls文件：f:\test2.xls
% 目标表单：Sheet1
% 目标区域：UFk从A1开始，UBk2从B1开始
xlswrite('f:\test2.xls',UFk,'Sheet1','A1');
xlswrite('f:\test2.xls',UBk2,'Sheet1','B1');
figure(3)%画图
plot(x,UFk,'r-','linewidth',1.5);
hold on
plot(x,UBk2,'b-.','linewidth',1.5);
plot(x,1.96*ones(N,1),':','linewidth',1);
axis([min(x),max(x),-5,5]);
legend('UF统计量','UB统计量','0.05显著水平');
xlabel('t (year)','FontName','TimesNewRoman','FontSize',12);
ylabel('统计量','FontName','TimesNewRoman','Fontsize',12);
%grid on
hold on
plot(x,0*ones(N,1),'-.','linewidth',1);
plot(x,1.96*ones(N,1),':','linewidth',1);
plot(x,-1.96*ones(N,1),':','linewidth',1);


