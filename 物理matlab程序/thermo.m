%����ѧ�Ȼ�ѭ��Ч�����⣬��������˫ԭ����������Ϊ�����趨���ȱ�r=1.4
%���ǿ��Ը���ʵ�����ѡ��������ѧ�����е�һ�֣��ڽ���ĳһ�����������ѧ����
%�󣬸��ݳ������ʾ�Ӽ���������̲���������ɼ��㣬��󽫹�����ͼʾ�ķ�ʽ��
%ʾ������
nMoles=input('���������Ħ����:');
P(1)=input('�����ʼѹǿ(Pa):');
V(1)=input('�����ʼ���(m^3):');
R=8.134;%���峣��
r=1.4;   %˫ԭ���������Ħ�����ݱ�
T(1)=P(1)*V(1)/(nMoles*R);   %��ʼ�¶�
PPlot=P(1);
VPlot=V(1);
WTotal=0;
i=1;
N=50;
QuitType=5;
PathType=0;
while(PathType~=QuitType)
    i=i+1;
    fprintf('�Թ���#%g\n',i-1);
    PathType=menu(sprintf('���� %g:ѡ����һ·��',i-1),...
        '��ѹ','����','����','����','�˳�');
    switch PathType
        case 1 %��ѹ����
            V(i)=input('�����ѹ���̽���ʱ�����:');
            P(i)=P(i-1);   %ѹǿ����
            T(i)=P(i)*V(i)/(nMoles*R);  %��ѹ���̽���ʱ���¶�
            W=P(i)*(V(i)-V(i-1));     %��ѹ���������Ĺ�
            VPlot=[VPlot V(i)];
            PPlot=[PPlot P(i)];
        case 2   %�������
            P(i)=input('���������̽���ʱ��ѹǿ:');
            V(i)=V(i-1);
            T(i)=P(i)*V(i)/(nMoles*R);
            W=0;
            VPlot=[VPlot V(i)];
            PPlot=[PPlot P(i)];
        case 3   %���¹���
            V(i)=input('������¹��̽���ʱ�������');
            T(i)=T(i-1)
            P(i)=nMoles*R*T(i)/V(i);
            W=nMoles*R*T(i)*log(V(i)/V(i-1));
            VNew=linspace(V(i-1),V(i),N);
            PNew=nMoles*R*T(i)./VNew;
            VPlot=[VPlot VNew];
            PPlot=[PPlot PNew];
        case 4  %���ȹ���
            V(i)=input('������ȹ��̽���ʱ�����:');
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
        title(sprintf('������=%g j,�ܹ�=%j',W,WTotal));
    end
end
WTotal
            
            