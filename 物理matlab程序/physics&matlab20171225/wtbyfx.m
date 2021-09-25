%����Ӱ�Բ����������Ħ�����µ��ٶ�
clear                                  %�������
theta=0:3:90;                          %�Ƕ�����
th=theta*pi/180;                       %��Ϊ����
m=0:2:8;                               %����������
n=length(m);                           %�����ȸ���
[M,TH]=meshgrid(m,th);                 %�����ͽǶȾ���
Vx=sqrt((1-cos(TH))./(1+M)./(1+(1+M).*tan(TH).^2));%x�����ٶ�
[vxm,i]=max(Vx);                       %����ٶȺ��±�
THm=ones(size(th'))*th(i);             %����ٶȵĽǶȾ���
mm=(3*cos(th)-2)./(cos(th).^3-3*cos(th)+2);%����ٶȵ�������
vxmm=sqrt((1-cos(th))./(1+mm)./(1+(1+mm).*tan(th).^2));%x��������ٶ�
vxmm(th>max(th(i)))=nan;               %������Ϊ����û������
fs=16;                                 %�����С
Vc={Vx,M.*Vx,(1+M).*tan(TH).*Vx};      %�ٶ�Ԫ��
tc{1}='����B�Ӱ�ԲA����Ħ�����µ�ˮƽ�ٶ�';%����֮һ
tc{2}='��ԲA���ٶ�';                    %����֮��
tc{3}='����B�Ӱ�ԲA����Ħ�����µ���ֱ�ٶ�';%����֮��
vm={vxm,m.*vxm,(1+m).*tan(th(i)).*vxm};%ÿ����������ٶ�Ԫ��
vmm={vxmm,mm.*vxmm,(1+mm).*tan(th).*vxmm};%����ٶ�Ԫ��
yc={'v_x','V','v_y'};                  %y��ǩԪ��
for j=1:3                              %ѭ��3��
    V=Vc{j};                           %ȡ�ٶ�
    V(TH>THm)=nan;                     %�������Ƕȵ��ٶȸ�Ϊ����
    figure                             %����ͼ�δ���
%    plot(theta,V,'LineWidth',2)        %��������
    plot(theta,V(:,1),'o-',theta,V(:,2),'d-',theta,V(:,3),'s-',...
        theta,V(:,4),'p-',theta,V(:,5),'h-')%��������
    grid on                            %������
    title(tc{j},'FontSize',fs)         %����
    xlabel('\it\theta\rm/\circ','FontSize',fs)%��Ǻ�����
    ylabel(['\it',yc{j},'/v\rm_0'],'FontSize',fs)%���������
    legend([repmat('\itm/M\rm=',n,1),num2str(m')],2)%ͼ��
    V=Vc{j};                           %ȡ�ٶȾ���
    V(TH<THm)=nan;                     %С�����Ƕȵ��ٶȸ�Ϊ����
    hold on                            %����ͼ��
    plot(theta,V,':','LineWidth',2)    %�����߻�������
    stem(theta(i),vm{j},'--')          %����ͼ
    if j<3                             %����ǰ2��ͼ
        txt=[num2str(theta(i)'),repmat(',',n,1),num2str(vm{j}',3)];%����ٶȼ��Ƕ�
        text(theta(i),vm{j},txt,'FontSize',fs)%�������ٶȺͽǶ�
    end                                %��������
    text(0,0.2,'\itv\rm_0=(2\itgR\rm)^{1/2}','FontSize',fs)%����ٶȵ�λ
    plot(theta,vmm{j},'-.','LineWidth',2)%������ٶ�����
end                                    %����ѭ��
figure                                 %����ͼ�δ���
subplot(2,1,1)                         %ѡ��ͼ
plot(mm,vxmm,'LineWidth',2)            %������ٶ�����
grid on                                %������
title('����B���ˮƽ�ٶ��������Ĺ�ϵ','FontSize',fs)%����
xlabel('\itm/M','FontSize',fs)         %��Ǻ�����
ylabel('\itv_x/v\rm_0','FontSize',fs)  %���������
axis([0,200,0,0.4])                    %���߷�Χ
subplot(2,1,2)                         %ѡ��ͼ
plot(mm,theta,'LineWidth',2)           %������ٶȽǶ�����
grid on                                %������
title('����B���ˮƽ�ٶȵĽǶ��������Ĺ�ϵ','FontSize',fs)%����
xlabel('\itm/M','FontSize',fs)         %��Ǻ�����
ylabel('\it\theta\rm/\circ','FontSize',fs)%���������
axis([0,200,0,50])                     %���߷�Χ

