%%�����˶��о�
v0=input('��������ٶȵĴ�Сv0(m/s):');   %���ٶ�v0
maxXmax=0;  g=9.80;                      %maxXmax������
disp('���ٷ����(��)  ���(m)  �߶�(m) ����ʱ��(s)');
for vDir=5:5:90                           %���ٷ����
    tmax=2*v0*sin(vDir*(pi/180))/g;        %���з���ʱ��
    Xmax=v0^2*sin(2*vDir*(pi/180))/g;       %���Xmax
    Ymax=v0^2*sin(vDir*(pi/180))^2/(2*g);   %�߶�
    t=0:0.05:tmax;
    x=v0*cos(vDir*(pi/180)).*t;          %tʱ��x������
    y=v0*sin(vDir*(pi/180)).*t-g.*t.*t/2;  %tʱ��y������
    plot(x,y);hold on;                    %��ͼ
    xxx=[vDir,Xmax,Ymax,tmax];disp(xxx);
    if maxXmax<Xmax                       %�ҳ������Զ�ĽǶ�
        maxvDir=vDir;maxXmax=Xmax;maxYmax=Ymax;maxtmax=tmax;
        continue;
    end
end
disp('��������̵Ĳ���:');      %��ʾ�����Զ�ĽǶȲ���
disp('���ٷ����(��)  ���(m)   �߶�(m)  ����ʱ��(s)');
maxxxx=[maxvDir,maxXmax,maxYmax,maxtmax];
disp(maxxxx);