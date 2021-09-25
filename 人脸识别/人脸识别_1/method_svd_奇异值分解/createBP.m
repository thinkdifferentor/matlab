%构建BP神经网络

%传入参数
%pn为归一化处理后的训练集      向量空间

%返回参数
%net  建立的BP神经网络

%函数声明
function[net] = createBP(pn)

fprintf('开始构建BP神经网络\n\n');

%输入隐含层单元数，num_hidden储存该值的变量
num_hidden = input('请输入隐含层神经元个数:');

%输入输入层与隐含层之间的传递函数，func_hidden储存该字符串的变量
func_hidden = input('请输入输入层与隐含层之间的传递函数:','s');

%输入隐含层与输出层之间的传递函数，func_out储存该字符串的变量
func_out = input('请输入隐含层与输出层之间的传递函数:','s');

%输入BP训练函数，trainfunc储存该字符串的变量
trainfunc = input('请输入BP网络训练函数:','s');

%输入训练目标，goal储存该值的变量
goal = input('请输入训练目标（<0.01）:');

%输入训练次数，epochs储存该值的变量
epochs = input('请输入训练次数:');

%输入学习速率，learn_rate储存该值的变量
learn_rate = input('请输入学习速率(<0.1):');

fprintf('开始构建BP神经网络,请等待.....\n\n');
net = newff(minmax(pn),[num_hidden,40],{func_hidden,func_out},trainfunc);   %调用MATLAB神经网络工具箱，构建BP神经网络
net.trainParam.goal=goal;                                                           %设置训练目标
net.trainParam.epochs=epochs;                                                       %训练迭代数
net.trainParam.lr = learn_rate;                                                     %设置学习速率
fprintf('BP神经网络搭建结束！\n\n');