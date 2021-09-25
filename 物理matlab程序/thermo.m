%热力学热机循环效率问题，本程序以双原子理想气体为例，设定比热比r=1.4
%人们可以根据实际情况选择四种热学过程中的一种，在进入某一个具体的热力学过程
%后，根据程序的提示从键盘输入过程参数即可完成计算，最后将过程用图示的方式显
%示出来。
nMoles=input('输入气体的摩尔数:');
P(1)=input('输入初始压强(Pa):');
V(1)=input('输入初始体积(m^3):');
R=8.134;%气体常数
r=1.4;   %双原子气体分子摩尔热容比
T(1)=P(1)*V(1)/(nMoles*R);   %初始温度
PPlot=P(1);
VPlot=V(1);
WTotal=0;
i=1;
N=50;
QuitType=5;
PathType=0;
while(PathType~=QuitType)
    i=i+1;
    fprintf('对过程#%g\n',i-1);
    PathType=menu(sprintf('过程 %g:选择下一路径',i-1),...
        '等压','等体','等温','绝热','退出');
    switch PathType
        case 1 %等压过程
            V(i)=input('输入等压过程结束时的体积:');
            P(i)=P(i-1);   %压强不变
            T(i)=P(i)*V(i)/(nMoles*R);  %等压过程结束时的温度
            W=P(i)*(V(i)-V(i-1));     %等压过程所做的功
            VPlot=[VPlot V(i)];
            PPlot=[PPlot P(i)];
        case 2   %等体过程
            P(i)=input('输入等体过程结束时的压强:');
            V(i)=V(i-1);
            T(i)=P(i)*V(i)/(nMoles*R);
            W=0;
            VPlot=[VPlot V(i)];
            PPlot=[PPlot P(i)];
        case 3   %等温过程
            V(i)=input('输入等温过程结束时的体积：');
            T(i)=T(i-1)
            P(i)=nMoles*R*T(i)/V(i);
            W=nMoles*R*T(i)*log(V(i)/V(i-1));
            VNew=linspace(V(i-1),V(i),N);
            PNew=nMoles*R*T(i)./VNew;
            VPlot=[VPlot VNew];
            PPlot=[PPlot PNew];
        case 4  %绝热过程
            V(i)=input('输入绝热过程结束时的体积:');
            C=P(i-1).*V(i-1).^r;
            P(i)=C/V(i).^r;
            T(i)=P(i)*V(i)/(nMoles*R);
            W=(P(i-1)*V(i-1)-P(i)*V(i))/(r-1);
            VNew=linspace(V(i-1),V(i),N);
            PNew=C./VNew.^r;
            VPlot=[VPlot VNew];
            PPlot=[PPlot PNew];
        otherwise
    end
    if(PathType~=QuitType)
        WTotal=WTotal+W;
        figure(gcf);
        plot(V,P,'o',VPlot,PPlot,'-')
        axis([0 1.1*max(V) 0 1.1*max(P)]);
        xlabel('V(m^3)');ylabel('P(Pa)');
        for j=1:i
            text(V(j),P(j),sprintf('%g',j));
        end
        title(sprintf('新做功=%g j,总功=%j',W,WTotal));
    end
end
WTotal
            
            