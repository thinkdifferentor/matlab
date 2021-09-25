% 主函数
clear,clc;

%读取用户id列表
users = load('u.user');
%获取用户数
[userNum,v]=size(users);

%向每一位用户推荐电影
for i=1:2
    recommendMatrix{:,i}=recommend(i);
end

%推荐数据保存
save('recommendMatrix.mat','recommendMatrix');