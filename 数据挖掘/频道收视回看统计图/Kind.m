%饼状图绘制
clear,clc
close all;

%收视数据
% data=[14049,13208,9999,8887,8486,8293,7204,7020,6990,6602,135460];%输入数据 90738 226198 other 135460
% label={'频道123','频道1','频道105','频道5','频道16','频道6','频道128','频道3','频道7','频道106','其他频道'};

%回看数据
data=[3974,1972,1605,1228,1224,770,659,605,473,450,6536]; %12960 19496 other 6536
% label={'频道123','频道5','频道6','频道7','频道3','频道1','频道31','频道4','频道16','频道18','其他频道'};

% 空标签
label={'','','','','','','','','','',''};

%修改图片显示背景颜色
figure1 = figure('Color',[1 1 1]);
% explode=[0 1 0 0];%定义突出的部分
bili=data/sum(data);%计算比例
baifenbi=num2str(bili'*100,'%1.2f');%计算百分比
baifenbi=[repmat(blanks(2),length(data),1),baifenbi,repmat('%',length(data),1)];
baifenbi=cellstr(baifenbi);
Label=strcat(label,baifenbi');
pie3(data,Label)
% title('收视频道偏好统计');
% title('回看频道偏好统计');