%统计用训练好的神经网络进行识别，分别统计训练集识别率，测试集识别率以及总识别率，以便对分类其性能进行考察。

%传入参数
%net 已经训练好的神经网络
%pnewn  归一化处理后的测试集  向量空间
%pn   归一化处理后的训练集  向量空间
%num_train  每个人用于训练的图片数目
%num_test  每个人用于测试的图片数目
%返回参数
%result_test 测试的输出结果  向量空间
%result_train 训练的输出结果 向量空间
%count_test  分类正确的测试集数目  整型
%count_train  分类正确的训练集数目  整型
%Test_reg   测试集识别率  
%Train_reg   训练集识别率
%Total_reg   总识别率
%函数声明
function[result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = result(net,pnewn,pn,num_train,num_test)

fprintf('测试神经网络,统计识别正确的图片数\n\n');

%测试模拟结果
result_test=sim(net, pnewn);
result_train=sim(net, pn);
%统计识别正确的图片数
fprintf('开始统计识别正确的图片数目，请等待......\n\n');
%C是得出的result_test中的每一列的最大值，I是最大值所在的行数
[C,I]=max(result_test);
%A是得出的result_train中的每一列的最大值，B是最大值所在的行数
[A,B]=max(result_train);
count_test=0;
count_train=0;
for f=1:40,
    for g=1:num_test
        %计算在得出的结果中，被正确识别出来的测试集图片数目
        if(I(1,(f-1)*num_test+g)==f)
          count_test=count_test+1;
        end 
    end
    for h=1:num_train
        %计算在得出的结果中，被正确识别出来的训练集图片数目
        if(B(1,(f-1)*num_train+h)==f)
          count_train=count_train+1;
        end            
    end
end
fprintf('统计结束，正确识别的测试集数目为: %d\n\n',count_test);
fprintf('正确识别的训练集数目为: %d\n\n',count_train);
%计算出所有测试集的图片总数
total_test=40*num_test;
%计算出所有训练集的图片总数
total_train=40*num_train;
%计算出测试集的识别率
Test_reg=count_test/total_test;
%计算出训练集的识别率
Train_reg=count_train/total_train;
%计算出总识别率
Total_reg=(count_test+count_train)/400;
%将结果打印出来
fprintf('测试集识别率为%d\n\n',Test_reg);
fprintf('训练集识别率为%d\n\n',Train_reg);
fprintf('总识别率为%d\n\n',Total_reg);
fprintf('-----------------------------------------------------\n');
fprintf('-----------------------------------------------------\n');
