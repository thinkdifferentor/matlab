
%输出提示信息
fprintf('读入人脸图片\n\n');
%用户输入特征维数数目
panDuan = 1;
% while panDuan 
%     featureNumber = input('请输入特征维数（仅限于16，32，48，64，80）：');
%     %如果输入的是16.32.48.64.80,则继续执行代码
%     if(featureNumber == 16 || featureNumber == 32 || featureNumber == 48 || featureNumber == 64 || featureNumber == 80 )
%         panDuan = 0;
%         disp('开始装载图像文件,请等待.......')
%     %如果输入的是其它数字,提示输入有误,请用户重新输入
%     else
%         fprintf('你输入的不是这5个数中的任何一个,请重新输入!\n\n')
%     end
% end

% %对训练数赋值
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


% %输入隐含层单元数，num_hidden储存该值的变量
% num_hidden = input('请输入隐含层神经元个数:(40:20:100)');
% 
% %输入输入层与隐含层之间的传递函数，func_hidden储存该字符串的变量
% func_hidden = input('请输入输入层与隐含层之间的传递函数:(tansig,purelin)','s');
% 
% %输入隐含层与输出层之间的传递函数，func_out储存该字符串的变量
% func_out = input('请输入隐含层与输出层之间的传递函数:(tansig,purelin)','s');
% 
% %输入BP训练函数，trainfunc储存该字符串的变量
% trainfunc = input('请输入BP网络训练函数:(trainrp)','s');
% 
% %输入训练目标，goal储存该值的变量
% goal = input('请输入训练目标（<0.01）(1e－5):');
% 
% %输入训练次数，epochs储存该值的变量
% epochs = input('请输入训练次数:(8000)');
% 
% %输入学习速率，learn_rate储存该值的变量
% learn_rate = input('请输入学习速率(<0.1):(0.005)');
    num_train = 5;
    num_hidden = 60;
    func_hidden='tansig';
    func_out = 'purelin';
    trainfunc = 'trainrp';
    goal = 0.001;
    epochs = 20000;
    learn_rate = 0.01;
       
 fid=fopen('face20.txt','wt');
  fprintf(fid,'num_train = 5;num_hidden = 60;func_hidden=tansig;func_out = purelin；trainfunc = trainrp; goal = 0.005; epochs = 20000; learn_rate = 0.01;');
    featureNumber = [8,16,32,24,48,64,80];
    for i=1:7
    fprintf(fid,'%d块\n',featureNumber(i));
   
     for j=1:5
         num = j;
         %得到（切片数，特征值）的穷举....不知道这东西几天能跑完...
         fprintf(fid,'这是特征向量第%d维的值\n',j);
        [result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = content(num,featureNumber(i),num_train,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate);

        fprintf(fid,'统计结束，正确识别的测试集数目为: %d\n\n',count_test);
        fprintf(fid,'正确识别的训练集数目为: %d\n\n',count_train);
        fprintf(fid,'测试集识别率为%d\n\n',Test_reg);
        fprintf(fid,'训练集识别率为%d\n\n',Train_reg);
        fprintf(fid,'总识别率为%d\n\n',Total_reg);
        fprintf(fid,'-----------------------------------------------------\n');
        fprintf(fid,'-----------------------------------------------------\n');
        clear feature;
     end
    end


%      featureNumber = 32;
%  fprintf(fid,'32块\n');
%      for j=1:5
%          num = j;
%          %得到（切片数，特征值）的穷举....不知道这东西几天能跑完...
%          fprintf(fid,'这是特征向量第%d维的值\n',j);
% [result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = content(num,featureNumber,num_train,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate);
% 
% fprintf(fid,'统计结束，正确识别的测试集数目为: %d\n\n',count_test);
% fprintf(fid,'正确识别的训练集数目为: %d\n\n',count_train);
% 
% fprintf(fid,'测试集识别率为%d\n\n',Test_reg);
% fprintf(fid,'训练集识别率为%d\n\n',Train_reg);
% fprintf(fid,'总识别率为%d\n\n',Total_reg);
% fprintf(fid,'-----------------------------------------------------\n');
% fprintf(fid,'-----------------------------------------------------\n');
%     
% clear feature;
%      end 
% 
%     featureNumber = 48;
% 
%  fprintf(fid,'48块\n');
%      for j=1:5
%          num = j;
%          %得到（切片数，特征值）的穷举....不知道这东西几天能跑完...
%          fprintf(fid,'这是特征向量第%d维的值\n',j);
% [result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = content(num,featureNumber,num_train,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate);
% 
% fprintf(fid,'统计结束，正确识别的测试集数目为: %d\n\n',count_test);
% fprintf(fid,'正确识别的训练集数目为: %d\n\n',count_train);
% 
% fprintf(fid,'测试集识别率为%d\n\n',Test_reg);
% fprintf(fid,'训练集识别率为%d\n\n',Train_reg);
% fprintf(fid,'总识别率为%d\n\n',Total_reg);
% fprintf(fid,'-----------------------------------------------------\n');
% fprintf(fid,'-----------------------------------------------------\n');
%     
% clear feature;
%      end
% 
% 
% 
%     featureNumber = 64;
%      fprintf(fid,'64块\n');
%      for j=1:5
%          num = j;
%          %得到（切片数，特征值）的穷举....不知道这东西几天能跑完...
%          fprintf(fid,'这是特征向量第%d维的值\n',j);
% [result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = content(num,featureNumber,num_train,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate);
% 
% fprintf(fid,'统计结束，正确识别的测试集数目为: %d\n\n',count_test);
% fprintf(fid,'正确识别的训练集数目为: %d\n\n',count_train);
% 
% fprintf(fid,'测试集识别率为%d\n\n',Test_reg);
% fprintf(fid,'训练集识别率为%d\n\n',Train_reg);
% fprintf(fid,'总识别率为%d\n\n',Total_reg);
% fprintf(fid,'-----------------------------------------------------\n');
% fprintf(fid,'-----------------------------------------------------\n');
%     
% clear feature;
%      end
% 
%      featureNumber = 80;
% 
%  fprintf(fid,'这是分80块\n');
%      for j=1:5
%          num = j;
%          %得到（切片数，特征值）的穷举....不知道这东西几天能跑完...
%          fprintf(fid,'这是特征向量第%d维的值\n',j);
% [result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = content(num,featureNumber,num_train,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate);
% 
% fprintf(fid,'统计结束，正确识别的测试集数目为: %d\n\n',count_test);
% fprintf(fid,'正确识别的训练集数目为: %d\n\n',count_train);
% 
% fprintf(fid,'测试集识别率为%d\n\n',Test_reg);
% fprintf(fid,'训练集识别率为%d\n\n',Train_reg);
% fprintf(fid,'总识别率为%d\n\n',Total_reg);
% fprintf(fid,'-----------------------------------------------------\n');
% fprintf(fid,'-----------------------------------------------------\n');
%     
% clear feature;
%      end
% % end
