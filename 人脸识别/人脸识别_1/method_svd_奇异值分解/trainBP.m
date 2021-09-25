%训练BP神经网络

%传入参数
%net  BP神经网络
%pn   为归一化处理后的训练集
%t  训练集对应的目标集

%返回参数
%net 训练后的神经网络
%tr  训练过程记录

%函数声名
function[net,tr] = trainBP(net,pn,t)

disp('开始训练BP神经网络，这个过程比较长，请耐心等待..........');
[net,tr] = train(net,pn,t);
disp('神经网络训练结束！');
