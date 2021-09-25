%按消耗分类--德克萨斯州
clear,clc

%载入数据--二维矩阵按列排列。顺序依次为工业，商业，运输，住宅，电力，焦化厂
data_TX=cell2mat(struct2cell(load('data_TX.mat')));

%时间矩阵
t=1960:2009;

%州内六类数据绘制
G=data_TX(:,1);
S=data_TX(:,2);
Y=data_TX(:,3);
Z=data_TX(:,4);
D=data_TX(:,5);

plot(t,G,t,S,t,Y,t,Z,t,D);
% title('州内六类数据绘制')
title('Classification by consumption - Texas');
legend('industrial','commercial','transportation','re sident','electric');
grid on
xlabel('time');
ylabel('MSN');


%每类能源平均值求解
avg_G=mean(G);
avg_S=mean(S);
avg_Y=mean(Y);
avg_Z=mean(Z);
avg_D=mean(D);
sum=avg_G+avg_S+avg_Y+avg_Z+avg_D;

%每类能源的标准差
std_G=std(G);
std_S=std(S);
std_Y=std(Y);
std_Z=std(Z);
std_D=std(D);

%每类能源在总能源的权值
wet_G=avg_G/sum; 
wet_S=avg_S/sum;
wet_Y=avg_Y/sum;
wet_Z=avg_Z/sum;
wet_D=avg_D/sum;


All=zeros(5,3);
All(1,1)=avg_G;All(2,1)=avg_S;All(3,1)=avg_Y;All(4,1)=avg_Z;All(5,1)=avg_D;
All(1,2)=std_G;All(2,2)=std_S;All(3,2)=std_Y;All(4,2)=std_Z;All(5,2)=std_D;
All(1,3)=wet_G;All(2,3)=wet_S;All(3,3)=wet_Y;All(4,3)=wet_Z;All(5,3)=wet_D;

%代入求解
n=length(G);
TX=zeros(n,1);
for i=1:n
   TX(i,1)=0.651135167627151*G(i,1)+0.067097894181287*S(i,1)+0.021358372260116*Y(i,1)+0.083059098019281*Z(i,1)+0.177349467912165*D(i,1);
end

%原始数据
for i=4:4:40
    Tr(i,1)=0.406323592133399*G(i,1)+0.130165486797762*S(i,1)+0.043056362352470*Y(i,1)+0.134035629109396*Z(i,1)+0.286418929606974*D(i,1);
end
Tr=Tr'

figure,
plot(t,TX);grid on
xlabel('time');
ylabel('index of energy distribution');
title('index of energy distribution - Texas');


TX1=TX(1:20,1);
t1=1960:1979;

TX2=TX(21:50,1);
t2=1980:2009;
