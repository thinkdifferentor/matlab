%%������Ԥ��
function [ppre]=lmNetPredict(preD,w1,b1,w2,b2,trnFun)
% NNTWARN OFF%�ر�������ľ�����Ϣ 
nntwarn off
%�����ppre�Ǻ���ID�ģ����������ģ�������ȥID ����
p=preD(:,2:end);
%ѵ��������ֵ
 trnFun=regexp(trnFun, ',', 'split');
InputFun=trnFun{1};%%%����㵽�м��Ĵ��ݺ���
OutputFun=trnFun{2}; %%�м�㵽�����Ĵ��ݺ���

ppre=simuff(p',w1,b1,InputFun,w2,b2,OutputFun);
 ppre=ppre';
end