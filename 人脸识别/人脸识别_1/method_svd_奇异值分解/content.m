%演示怎样利用loadfile, train_test, createBP, trainBP, result这5个函数完整的进行一次文本分类
function[result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = content(num,featureNumber,num_train,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate)

feature = allFeature(num,featureNumber); %loadfile

[pn,pnewn,t,num_train,num_test] = train_test(feature,num_train);   %train_test                    

net = createBP(pn,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate);   %createBP

[net,tr] = trainBP(net,pn,t);            %trainBP

[result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = result(net,pnewn,pn,num_train,num_test);        %result