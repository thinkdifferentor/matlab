function[ptrnTestAcc,ptrnTest,ppre, trnTime, tstTime]=lmNetClassify(getD,tstDNum,preD,trnPara,trnFun,midNodeNum,figPath,trnFigName,tstFigName,figSet)
%% ��ز���˵��
%%%����lm�����緽�����з��࣬
%%%�������
%getD�����н�ģ������
%tstDNum�����ݿ��У����ڲ�����ԣ�����ģ�ʵ��ֵ�ĸ���
%preD,Ҫ����ģ��Ԥ���XӰ��ֵ�����ֵ�ĸ�ֵҪ�ͽ�ģ��Ӱ�����ص�X��ֵ��ʽһ�£���ID��
%trnPara��ѵ����������ʽ��trnPara=[25;50;0.001;0.001;0.001;10;0.1;1e10];
%���εĺ���Ϊ��
%��ʾ������� 25
%���ѭ������ 1000
%%Ŀ����� 0.02
%ѧϰ���� 0.001
%ѧϰ�������ӱ��� 0.001
%ѧϰ���ʼ��ٱ��� 10
%��������� 1e10
%trnFun ѵ����������ʽ��trnFun='tansig,purelin';tansig����㵽�м��Ĵ��ݺ�����purelin�м�㵽�����Ĵ��ݺ���
%midNodeNum�м��ڵ���
%figPath ����ͼ�α���·��,��ʽ��'E:\image'������Ҫ����Ӧ·���´����ļ���,�ر�ע�⣬���·��Ҫ��
%Ӣ�ĵ�·������Ȼjava���û����
%trnFigName��ѵ���׶ε�ͼ��
%tstFigName�����Խ׶ε�ͼ��
%figSetͼ�����ã���ʽ��figSet=[7;650;320];7%ͼ�������С��650ͼ�γ��ȣ�320ͼ�ο��

%%%�������
%ptrnTest,��ģ�׶κͲ��Խ׶ε�Ԥ��ֵ
%ptrnTestAcc,��ģ�Ͳ��Խ׶ε�׼ȷ��
%ppre,Ԥ��ֵ

close all;
% NNTWARN OFF%�ر�������ľ�����Ϣ
nntwarn off
%% %������ݸ�ֵ����ֻ�ڳ�����Խ׶��ã�ʵ��ͨ����������
%   tstDNum=100;
%   preD=[251	5	4	4	5	2	4	3	;
%         259	5	5	4	4	3	5	4	];  %Ԥ�����ݵ�һ��ID�������뽨ģ��ֻ��X��û��y% 
%  midNodeNum=6;
%  trnPara=[25;50;0.001;0.001;0.001;10;0.1;1e10];
%  trnFun='tansig,purelin';
%  figPath='E:\image';
%  trnFigName='lmNetStructure,lmNetTrainError,lmNetTrainFigure,lmNetTrainRelaError';
%  tstFigName='lmNetTestFigure,lmNetTestRelaError';
%  figSet=[7;650;320];
%  getD= xlsread('data.xls','data');%�������ݣ� ����������Ǻ���ID�ģ���һ�в����뽨ģ
 %get_data(3,2)=-1;
 numeric=1;
%  fldName='ZN,CU,U,��������,T-P,ʯ����,COD,DO,�Ͳ����';
%% ��ģ���ݡ��������ݷ��룬������ID
 trnD=getD(1:end-tstDNum,1:end);
 tstD=getD(end-tstDNum+1:end,1:end);
 
%% ������ѵ��
[w1,b1,w2,b2,trnAcc,ptrn,trnTime]=lmNetTrain(numeric,trnD,midNodeNum,trnPara,trnFun,figPath,trnFigName,figSet);
%�������
% trnD��ѵ������Ҫ�����ݣ�����ID
% midNodeNum�м��ڵ���
%trnPara��ѵ����������ʽ��trnPara=[25;50;0.001;0.001;0.001;10;0.1;1e10];
%���εĺ���Ϊ��
%��ʾ������� 25
%���ѭ������ 1000
%Ŀ����� 0.02
%�������� 0.001
%ѧϰ���� 0.001
%ѧϰ�������ӱ��� 0.001
%ѧϰ���ʼ��ٱ��� 10
%��������� 1e10
% trnFun %% ѵ����������ʽ��trnFun='tansig,purelin';tansig����㵽�м��Ĵ��ݺ�����purelin�м�㵽�����Ĵ��ݺ���
% trnFigureNameѵ���׶ε�ͼ��
% figureSetͼ�����ø�ʽ��figureSet=[7;650;320];7%ͼ�������С��650ͼ�γ��ȣ�320ͼ�ο��
%�������
%w1,b1,w2,b2��������ѵ�����Ȩֵ
% trnAcc, ѵ���׶εķ���׼ȷ��
% ptrn%% ѵ���׶ζ�Ӧ����

%% ��������� 
[tstAcc,ptst,tstTime]=lmNetTest(numeric,tstD,w1,b1,w2,b2,trnFun,figPath,tstFigName,figSet);
%�������
% tstD����������Ҫ�����ݣ�����ID
%w1,b1,w2,b2��������ѵ�����Ȩֵ
% trnFun%% ѵ����������ʽ��trnFun='tansig,purelin';tansig����㵽�м��Ĵ��ݺ�����purelin�м�㵽�����Ĵ��ݺ���
% trnFigNameѵ���׶ε�ͼ��
% figSetͼ�����ø�ʽ��figSet=[7;650;320];7%ͼ�������С��650ͼ�γ��ȣ�320ͼ�ο��

%�������
% tstAcc ���Խ׶εķ���׼ȷ��
% ptst ���Խ׶ζ�Ӧ�ķ���

%% ������Ԥ��
if ~isempty(preD)
  [ppre]=lmNetPredict(preD,w1,b1,w2,b2,trnFun);
 %�������
% preD��Ԥ������Ҫ�����ݣ����������
%w1,b1,w2,b2��������ѵ�����Ȩֵ
% trnFun%% ѵ����������ʽ��trnFun='tansig,purelin';tansig����㵽�м��Ĵ��ݺ�����purelin�м�㵽�����Ĵ��ݺ���
 
%�������
%ppreԤ��׶ζ�Ӧ�ķ���
else
    ppre=[];
end
  %%
ptrnTestAcc=[trnAcc;tstAcc];
ptrnTest=[ptrn;ptst];


end

