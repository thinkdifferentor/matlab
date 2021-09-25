%���ĵ�����ײ���ٶ�����
clear                                  %�������
m21=0:0.2:3;                           %����������
v21=-4:0.2:4;                          %�ٶȱ�����
[V0,M]=meshgrid(v21,m21);              %�ٶȱȺ������Ⱦ���
s1='m1*v10+m2*v20-m1*v1-m2*v2';        %�����غ��ַ���
s2='m1*v10^2+m2*v20^2-m1*v1^2-m2*v2^2';%��е���غ��ַ���
[v1,v2]=solve(s1,s2,'v1','v2')         %���ĵ�����ײ���ٶȵķ��Ž�
V{1}=2*(1+M.*V0)./(1+M)-1;             %��һ������ײ����ٶ�
V{2}=2*(1+M.*V0)./(1+M)-V0;            %�ڶ�������ײ����ٶ�
fs=16;                                 %�����С
for i=1:2                              %ѭ��2��
    figure                             %����ͼ�δ���
    surf(v21,m21,V{i})                 %������
    box on                             %�ӿ��
    hold on                            %����ͼ��
    contour(v21,m21,V{i},[0,0],'r','LineWidth',2)%���ٶ�Ϊ��ĵ�ֵ��
    xlabel('\itv\rm_2_0/\itv\rm_1_0','FontSize',fs)%��ײǰ�ٶȱ�ǩ
    ylabel('\itm\rm_2/\itm\rm_1','FontSize',fs)%������ǩ
    zlabel(['\itv\rm_',num2str(i),'/\itv\rm_1_0'],'FontSize',fs) %��ײ���ٶȱ�ǩ
    title(['\itm\rm_',num2str(i),'���ĵ�����ײ����ٶ�'],'FontSize',fs)%����
    pause                              %��ͣ
    view(2)                            %���ø��ӽ�
    title(['\itm\rm_',num2str(i),'���ĵ�����ײ���ٶȵĸ���ͼ'],'FontSize',fs)%��������
end                                    %����ѭ��

