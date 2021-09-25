%时间段总的数据对比
clear
close all
clc

%时间矩阵
t=1960:2009;

%数据载入
%% 亚利桑那州(AZ)
data_AZ=cell2mat(struct2cell(load('data_AZ.mat')));

G=sum(data_AZ(:,1));
S=sum(data_AZ(:,2));
Y=sum(data_AZ(:,3));
Z=sum(data_AZ(:,4));
D=sum(data_AZ(:,5));

%州内饼状图绘制
data=[G S 15554010 Z D];%输入数据工业，商业，运输，住宅，电力
label={'Industry','commerce','transportation','housing','electric'};%输入标签
% explode=[0 1 0 0];%定义突出的部分
bili=data/sum(data);%计算比例
baifenbi=num2str(bili'*100,'%1.2f');%计算百分比
baifenbi=[repmat(blanks(2),length(data),1),baifenbi,repmat('%',length(data),1)];
baifenbi=cellstr(baifenbi);
Label=strcat(label,baifenbi');
figure(1),subplot(1,2,1);
pie3(data,Label);
title('Arizona');

%% 加利福尼亚(CA)
data_CA=cell2mat(struct2cell(load('data_CA.mat')));

G=sum(data_CA(:,1));
S=sum(data_CA(:,2));
Y=sum(data_CA(:,3));
Z=sum(data_CA(:,4));
D=sum(data_CA(:,5));

%州内饼状图绘制
data=[G S Y Z D];%输入数据工业，商业，运输，住宅，电力
label={'Industry','commerce','transportation','housing','electric'};%输入标签
% explode=[0 1 0 0];%定义突出的部分
bili=data/sum(data);%计算比例
baifenbi=num2str(bili'*100,'%1.2f');%计算百分比
baifenbi=[repmat(blanks(2),length(data),1),baifenbi,repmat('%',length(data),1)];
baifenbi=cellstr(baifenbi);
Label=strcat(label,baifenbi');
figure(2),subplot(1,2,1)
pie3(data,Label);
title('California');


%% 新墨西哥州(NM)
data_NM=cell2mat(struct2cell(load('data_NM.mat')));

%州内六类数据绘制
G=sum(data_NM(:,1));
S=sum(data_NM(:,2));
Y=sum(data_NM(:,3));
Z=sum(data_NM(:,4));
D=sum(data_NM(:,5));

%州内饼状图绘制
data=[G S Y Z D];%输入数据工业，商业，运输，住宅，电力
label={'Industry','commerce','transportation','housing','electric'};%输入标签
% explode=[0 1 0 0];%定义突出的部分
bili=data/sum(data);%计算比例
baifenbi=num2str(bili'*100,'%1.2f');%计算百分比
baifenbi=[repmat(blanks(2),length(data),1),baifenbi,repmat('%',length(data),1)];
baifenbi=cellstr(baifenbi);
Label=strcat(label,baifenbi');
figure(3),subplot(1,2,1)
pie3(data,Label);
title('New Mexico');


%% 德克萨斯州(TX)
data_TX=cell2mat(struct2cell(load('data_TX.mat')));

%州内六类数据绘制
G=sum(data_TX(:,1));
S=sum(data_TX(:,2));
Y=sum(data_TX(:,3));
Z=sum(data_TX(:,4));
D=sum(data_TX(:,5));

%州内饼状图绘制
data=[G S Y Z D];%输入数据工业，商业，运输，住宅，电力
label={'Industry','commerce','transportation','housing','electric'};%输入标签
% explode=[0 1 0 0];%定义突出的部分
bili=data/sum(data);%计算比例
baifenbi=num2str(bili'*100,'%1.2f');%计算百分比
baifenbi=[repmat(blanks(2),length(data),1),baifenbi,repmat('%',length(data),1)];
baifenbi=cellstr(baifenbi);
Label=strcat(label,baifenbi');
figure(4),subplot(1,2,1)
pie3(data,Label);
title('Texas');





%% 亚利桑那州(AZ)
data=[87894.26802 4254248.515 15630631.46 606.2634 13281641.07 8440992.572 24940265.04 2.3731e+007];
label={'geothermal energy','hydroenergy','Solar energy','wind energy','coal','petroleum','natural gas','other'};

% 州内饼状图绘制
explode=[1 1 1 1 0 0 0 0];%定义突出的部分
bili=data/sum(data);%计算比例
baifenbi=num2str(bili'*100,'%1.2f');%计算百分比
baifenbi=[repmat(blanks(2),length(data),1),baifenbi,repmat('%',length(data),1)];
baifenbi=cellstr(baifenbi);
Label=strcat(label,baifenbi');
figure(1),subplot(1,2,2);
pie3(data,explode,Label)
title('Arizona');

%% 加利福尼亚(CA)
data=[8515192.307 18859963.82 120253752.2 1643704.647 6103336.85 44894917.63 343117659.2 2.0323e+008];
label={'geothermal energy','hydroenergy','Solar energy','wind energy','coal','petroleum','natural gas','other'};

% 州内饼状图绘制
explode=[1 1 1 1 0 0 0 0];%定义突出的部分
bili=data/sum(data);%计算比例
baifenbi=num2str(bili'*100,'%1.2f');%计算百分比
baifenbi=[repmat(blanks(2),length(data),1),baifenbi,repmat('%',length(data),1)];
baifenbi=cellstr(baifenbi);
Label=strcat(label,baifenbi');
figure(2),subplot(1,2,2)
pie3(data,explode,Label)
title('California');

%% 新墨西哥州(NM)
data=[27167.38817 77768.48776 8872232.506 152269.561 10482138.53 5737192.868 41376972.61 1.0616e+007];
label={'geothermal energy','hydroenergy','Solar energy','wind energy','coal','petroleum','natural gas','other'};

% 州内饼状图绘制
explode=[1 1 1 1 0 0 0 0];%定义突出的部分
bili=data/sum(data);%计算比例
baifenbi=num2str(bili'*100,'%1.2f');%计算百分比
baifenbi=[repmat(blanks(2),length(data),1),baifenbi,repmat('%',length(data),1)];
baifenbi=cellstr(baifenbi);
Label=strcat(label,baifenbi');
figure(3),subplot(1,2,2)
pie3(data,explode,Label)
title('New Mexico');


%% 德克萨斯州(TX)
data=[57815.28065 708583.4179 14725859.14 1388237.774 13281641.07 8440992.572 24940265.04 4.1439e+006];
label={'geothermal energy','hydroenergy','Solar energy','wind energy','coal','petroleum','natural gas','other'};

% 州内饼状图绘制
explode=[1 1 1 1 0 0 0 0];%定义突出的部分
bili=data/sum(data);%计算比例
baifenbi=num2str(bili'*100,'%1.2f');%计算百分比
baifenbi=[repmat(blanks(2),length(data),1),baifenbi,repmat('%',length(data),1)];
baifenbi=cellstr(baifenbi);
Label=strcat(label,baifenbi');
figure(4),subplot(1,2,2)
pie3(data,explode,Label)
title('Texas');
