% ���۱�׼
clear,clc

% ���ݵ���--��ά����4*4 �ݵ�˳��ֱ�Ϊ�¿���˹��(TX)������������(CA)����ī������(NM)������ɣ����(AZ)
% ��Դ��˳�������,ˮ��,̫����,����
Re=cell2mat(struct2cell(load('Re.mat')));

%������
H_re=zeros(4);
for i=1:4
    for j=1:4
        H_re(j,i)=Re(j,i)/sum(Re(:,i));
    end
end

%��һ��
G_re=zeros(4);
for i=1:4
   for j=1:4
       G_re(j,i)=Re(j,i)/sqrt(sum(Re(:,i).*Re(:,i)));
   end
end


%���ŷ���
B_s=[max(G_re(:,1)) max(G_re(:,2)) max(G_re(:,3)) max(G_re(:,4))];

%����
W_s=[min(G_re(:,1)),min(G_re(:,2)),min(G_re(:,3)),min(G_re(:,4))];


%�������
Dp_re=[sqrt(sum(power(G_re(1,:)-B_s(1,:),2))) sqrt(sum(power(G_re(2,:)-B_s(1,:),2))) sqrt(sum(power(G_re(3,:)-B_s(1,:),2))) sqrt(sum(power(G_re(4,:)-B_s(1,:),2)))];
Dm_re=[sqrt(sum(power(G_re(1,:)-W_s(1,:),2))) sqrt(sum(power(G_re(2,:)-W_s(1,:),2))) sqrt(sum(power(G_re(3,:)-W_s(1,:),2))) sqrt(sum(power(G_re(4,:)-W_s(1,:),2)))];


% �ۺ�����
B=[Dp_re(1,1)./(Dp_re(1,1)+Dm_re(1,1)) Dp_re(1,2)./(Dp_re(1,2)+Dm_re(1,2)) Dp_re(1,3)./(Dp_re(1,3)+Dm_re(1,3)) Dp_re(1,4)./(Dp_re(1,4)+Dm_re(1,4))];


