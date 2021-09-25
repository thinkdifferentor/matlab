%对上一步处理中得到的特征矩阵进行划分，将其划分为训练集train_data,和测试集test_data，用以进行训练和测试，建立测试目标集t，并对训
%练集和测试集进行归一化处理。

%传入参数
%feature为经过特征提取后得出的特征矩阵

%返回参数
%train_data 为训练集向量空间
%test_data 为测试集向量空间
%t 为训练集对应的目标集向量空间
%num_train 每个人用于训练的图片数目
%num_test 每个人用于训练的图片数目

%函数声明
function[pn,pnewn,t,num_train,num_test] = train_test(feature,num_train)

fprintf('构建训练集train_data,测试集test_data，训练目标集t\n\n');

feature=feature'; %进行矩阵倒置，因为该算法要求矩阵的行数比列数少

%输入从每个人的文件夹中选出构造训练集的图片数目，num_train为储存该值的变量，该值必须大于0，小于10
% panDuan = 1;
% while panDuan 
%     num_train = input('请输入每个人用于训练的图片数目（<10,剩余的图片将被作为测试集）:');
%     %如果输入的是小于10的数字,则继续执行代码
%     if(num_train<10 )
%         panDuan = 0;
%         fprintf('开始构造训练集和测试集，请等待.......\n\n\n\n');
%     %如果输入的数字不小于10,提示输入有误,请用户重新输入
%     else
%         fprintf('你输入的数字不小于10,请重新输入!\n\n')
%     end
% end
%计算出每个人用于测试的图片数目
num_test=10-num_train;
%构造训练集
for y=1:40;               %一共有40个人，每人10张图片
    for n=1:num_train;
        %构造训练集
        train_data(:,(y-1)*num_train + n) = feature(:,(y-1)*10 + n);
    end;
    for z=1:num_test,
        %构造测试集
        test_data(:,(y-1)*num_test+z)= feature(:,(y-1)*10 +num_train+z);
    end
end
fprintf('训练集和测试集构造结束！\n\n\n\n');

%构造训练目标集t
fprintf('开始构造训练集对应的目标集，请等待......\n\n');
for y=1:40;
    for m=1:num_train;
        %构造训练集目标集
        t(y,(y-1)*num_train+m)=1;
    end
end
fprintf('训练目标集构造结束！\n\n');
fprintf('所有实验数据初始处理完毕！\n\n');
%对训练集数据进行归一化处理
pn = mat2gray(train_data);
%对测试集数据进行归一化处理
pnewn = mat2gray(test_data);