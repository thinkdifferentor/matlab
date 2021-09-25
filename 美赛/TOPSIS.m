% 评价标准
clear,clc

% 数据导入--二维数组4*4 州的顺序分别为德克萨斯州(TX)，加利福尼亚(CA)，新墨西哥州(NM)，亚利桑那州(AZ)
% 能源的顺序地热能,水能,太阳能,风能
Re=cell2mat(struct2cell(load('Re.mat')));

%矩阵处理
H_re=zeros(4);
for i=1:4
    for j=1:4
        H_re(j,i)=Re(j,i)/sum(Re(:,i));
    end
end

%归一化
G_re=zeros(4);
for i=1:4
   for j=1:4
       G_re(j,i)=Re(j,i)/sqrt(sum(Re(:,i).*Re(:,i)));
   end
end


%最优方案
B_s=[max(G_re(:,1)) max(G_re(:,2)) max(G_re(:,3)) max(G_re(:,4))];

%最差方案
W_s=[min(G_re(:,1)),min(G_re(:,2)),min(G_re(:,3)),min(G_re(:,4))];


%方差距离
Dp_re=[sqrt(sum(power(G_re(1,:)-B_s(1,:),2))) sqrt(sum(power(G_re(2,:)-B_s(1,:),2))) sqrt(sum(power(G_re(3,:)-B_s(1,:),2))) sqrt(sum(power(G_re(4,:)-B_s(1,:),2)))];
Dm_re=[sqrt(sum(power(G_re(1,:)-W_s(1,:),2))) sqrt(sum(power(G_re(2,:)-W_s(1,:),2))) sqrt(sum(power(G_re(3,:)-W_s(1,:),2))) sqrt(sum(power(G_re(4,:)-W_s(1,:),2)))];


% 综合评价
B=[Dp_re(1,1)./(Dp_re(1,1)+Dm_re(1,1)) Dp_re(1,2)./(Dp_re(1,2)+Dm_re(1,2)) Dp_re(1,3)./(Dp_re(1,3)+Dm_re(1,3)) Dp_re(1,4)./(Dp_re(1,4)+Dm_re(1,4))];


