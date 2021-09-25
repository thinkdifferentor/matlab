%能源结构推测
clear,clc

% 亚利桑那州(AZ)
syms x
% AZ1 = 0.472*x^5 - 4644*x^4 + 1.828e+007*x^3 -3.597e+010*x^2 + 3.539e+013*x -1.393e+016;
AZ2 = -0.009815.*x^5 + 99.53.*x^4 - 4.035e+005.*x^3 + 8.178e+008.*x^2 - 8.283e+011.*x + 3.355e+014;

R_AZ(1,1)=subs(AZ2,x,2025);
R_AZ(1,2)=subs(AZ2,x,2050);

% 加利福尼亚(CA)
% CA1 = 4.455*x^5 -4.381e+004*x^4 + 1.723e+008*x^3 -3.389e+011*x^2 +3.332e+014*x -1.311e+017;
CA2 = -0.06441*x^5 + 664*x^4 -2.735e+006*x^3 + 5.626e+009*x^2-5.782e+012*x + 2.374e+015;
P_CA=solve('-0.06441*x^5 + 664*x^4 -2.735e+006*x^3 + 5.626e+009*x^2-5.782e+012*x + 2.374e+015=0','x');


R_CA(1,1)=subs(CA2,2025);
R_CA(1,2)=subs(CA2,2050);

% % 新墨西哥州(NM)
% % NM1 = 1.231*x^5 -1.212e+004*x^4 + 4.776e+007*x^3 -9.409e+010*x^2 + 9.268e+013*x-3.651e+016;
NM2 = 0.1286*x^5 -1282*x^4 + 5.112e+006*x^3 -1.019e+010*x^2 + 1.016e+013*x -4.051e+015;
R_NM(1,1)=subs(NM2,2025);
R_NM(1,2)=subs(NM2,2050);

% % 德克萨斯州(TX)
% % TX1 = 47.17*x^5 + -4.643e+005*x^4 + 1.828e+009*x^3 -3.597e+012*x^2 + 3.54e+015*x -1.394e+018;
TX2 = -3.461*x^5 + 3.459e+004*x^4 -1.383e+008*x^3 + 2.764e+011*x^2-2.762e+014*x + 1.104e+017;
P_TX=solve('-3.461*x^5 + 3.459e+004*x^4 -1.383e+008*x^3 + 2.764e+011*x^2-2.762e+014*x + 1.104e+017=0','x');
R_TX(1,1)=subs(TX2,2025);
R_TX(1,2)=subs(TX2,2050);

%数据载入
W=cell2mat(struct2cell(load('weight.mat')));

% 工业，商业，运输，住宅，电力，人口，经济，地理
% 
% 亚利桑那州(AZ)	加利福尼亚(CA)	新墨西哥州(NM)	德克萨斯州(TX)
% 
% 0.177687203899316	0.142275618712050	2.24053779366936e-05	0.410580220972879	0.269434551037819	0.0660000000000000	0.047	0.15
% 
% 0.0728134779873664	0.248487339097100	0.0724725301968636	0.329826431027982	0.276400221690688	0.594000000000000	0.558	0.35
% 
% 0.406323592133399	0.130165486797762	0.0430563623524696	0.134035629109396	0.286418929606974	0.0310000000000000	0.021	0.15
% 
% 0.651135167627151	0.0670978941812866	0.0213583722601164	0.0830590980192807	0.177349467912165	0.309000000000000	0.374	0.35


%能源结构还原
% 2025年数据还原
% 德克萨斯州
TX_P_25=[R_TX(1,1)*0.651135167627151 R_TX(1,1)*0.0670978941812866  R_TX(1,1)*0.0213583722601164  R_TX(1,1)*0.0830590980192807   R_TX(1,1)*0.177349467912165];
% 加利福利亚
CA_P_25=[R_CA(1,1)*0.0728134779873664 R_CA(1,1)*0.248487339097100 R_CA(1,1)*0.0724725301968636 R_CA(1,1)*0.329826431027982 R_CA(1,1)*0.276400221690688] ;
% 新墨西哥州
NM_P_25=[R_NM(1,1)*0.406323592133399  R_NM(1,1)*0.130165486797762 R_NM(1,1)*0.0430563623524696 R_NM(1,1)*0.134035629109396 R_NM(1,1)*0.286418929606974];
% 亚利桑那州
AZ_P_25=[R_AZ(1,1)*0.177687203899316 R_AZ(1,1)*0.142275618712050 R_AZ(1,1)*2.24053779366936e-05 R_AZ(1,1)*2.24053779366936e-05 R_AZ(1,1)*0.269434551037819];
%矩阵合成
P_2025=abs([TX_P_25;CA_P_25;NM_P_25;AZ_P_25]);

% 2050年数据还原
% 德克萨斯州
TX_P_50=[R_TX(1,2)*0.651135167627151 R_TX(1,2)*0.0670978941812866  R_TX(1,2)*0.0213583722601164  R_TX(1,2)*0.0830590980192807  R_TX(1,2)*0.177349467912165];
% 加利福利亚
CA_P_50=[R_CA(1,2)*0.0728134779873664 R_CA(1,2)*0.248487339097100 R_CA(1,2)*0.0724725301968636 R_CA(1,2)*0.329826431027982 R_CA(1,2)*0.276400221690688] ;
% 新墨西哥州
NM_P_50=[R_NM(1,2)*0.406323592133399  R_NM(1,2)*0.130165486797762 R_NM(1,2)*0.0430563623524696 R_NM(1,2)*0.134035629109396 R_NM(1,2)*0.286418929606974];
% 亚利桑那州
AZ_P_50=[R_AZ(1,2)*0.177687203899316 R_AZ(1,2)*0.142275618712050 R_AZ(1,2)*2.24053779366936e-05 R_AZ(1,2)*2.24053779366936e-05 R_AZ(1,2)*0.269434551037819];
% 矩阵合成
P_2050=abs([TX_P_50;CA_P_50;NM_P_50;AZ_P_50]);


% 德克萨斯州		加利福利亚		新墨西哥州		亚利桑那州
% 
% 0.566968878158969	0.277919932912489	0.792440582106229 0.961957696189570

%通过B参数计算权值
T=0.566968878158969+0.277919932912489+0.792440582106229	+0.961957696189570;

% 德克萨斯州
Wb_TX=0.792440582106229/T;
% 加利福利亚
Wb_CA=0.961957696189570/T;
% 新墨西哥州
Wb_NM=0.566968878158969/T;
% 亚利桑那州
Wb_AZ=0.277919932912489/T;
%矩阵合成
Wb=[Wb_TX;Wb_CA;Wb_NM;Wb_AZ];


%通过比例系数求最佳能源状况
%2025年
R_2025=zeros(4,5);
K_sum_25=[sum(P_2025(:,1)) sum(P_2025(:,2)) sum(P_2025(:,3)) sum(P_2025(:,4)) sum(P_2025(:,5))];
for j=1:5
   for i=1:4
        R_2025(i,j)=K_sum_25(1,j)*Wb(i,1);
   end
end

%2050年
R_2050=zeros(4,5);
K_sum_50=[sum(P_2050(:,1)) sum(P_2050(:,2)) sum(P_2050(:,3)) sum(P_2050(:,4)) sum(P_2050(:,5))];
for j=1:5
   for i=1:4
        R_2050(i,j)=K_sum_25(1,j)*Wb(i,1);
   end
end


%理想能源比例计算
Rate_2025=zeros(4,5);
for i=1:4
   for j=1:5
        Rate_2025(i,j)=R_2025(i,j)/sum(R_2025(i,:));
   end
end

Rate_2050=zeros(4,5);
for i=1:4
   for j=1:5
        Rate_2050(i,j)=R_2050(i,j)/sum(R_2050(i,:));
   end
end
