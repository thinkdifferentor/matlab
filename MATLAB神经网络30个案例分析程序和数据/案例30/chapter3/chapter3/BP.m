%��ȡ����
data=xlsread('data.xls');

%ѵ��Ԥ������
data_train=data(1:113,:);
data_test=data(118:123,:);

input_train=data_train(:,1:9)';
output_train=data_train(:,10)';

input_test=data_test(:,1:9)';
output_test=data_test(:,10)';

%���ݹ�һ��
[inputn,mininput,maxinput,outputn,minoutput,maxoutput]=premnmx(input_train,output_train); %��p��t�����ֱ�׼��Ԥ���� 
net=newff(minmax(inputn),[10,1],{'tansig','purelin'},'trainlm');

net.trainParam.epochs=100;
net.trainParam.lr=0.1;
net.trainParam.goal=0.00001;
%net.trainParam.show=NaN

%����ѵ��
net=train(net,inputn,outputn);

%���ݹ�һ��
inputn_test = tramnmx(input_test,mininput,maxinput);

an=sim(net,inputn);

test_simu=postmnmx(an,minoutput,maxoutput);

error=test_simu-output_train;

plot(error)

k=error./output_train

