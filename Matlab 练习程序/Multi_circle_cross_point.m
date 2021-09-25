% ��Բ�󽻵㣬Ҫ�ȶ�Բ�����󽻵㡣
% �н����Բ��Ϊ����Բ���ཻԲ��
% ����Բ�󷨣�
% ����1.������Բ����ֱ��
% ����2.�󹫹���ֱ�߷���
% ����3.����ֱ�߽��㼴��Բ�е㡣
% �ཻԲ�󷨣�
% ����1.�󹫹��ҷ���ֱ�ߡ�
% ����2.������ֱ�߷��̺�����һ��Բ����������⼴�ɡ�
% ������ֱ�߷��̾�����Բ���̵Ĳ

clear all;close all;clc;

n=20;
cic=rand(n,3); %��x,y,r��

hold on;
for i=1:n-1
    for j=i+1:n
        cic1=cic(i,:);
        cic2=cic(j,:);
        p=circleCross(cic1,cic2);
        if ~isempty(p)
            plot(p(:,1),p(:,2),'.');
        end
    end
end

for i=1:n
    theta=0:0.001:2*pi;
    x=cic(i,1)+cic(i,3)*cos(theta);
    y=cic(i,2)+cic(i,3)*sin(theta);
    plot(x,y,'-');
end
axis equal