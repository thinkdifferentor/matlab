% 主函数
clear,clc;

%读取用户id列表
users = load('Uid.mat');

%获取用户数
[userNum,v]=size(users);

a=recommend(1)
% %向每一位用户推荐电影
% for i=1:1
%     recommendMatrix{:,i}=recommend(i);
% end
% 
% %推荐数据保存
% % save('recommendMatrix.mat','recommendMatrix');
% recommendMatrix