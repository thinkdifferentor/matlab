%% �߼��ع� �Զ���ģ
clear;
% ������ʼ��
filename = '../data/bankloan.xls' ; 

%% ��ȡ����
[num,txt] = xlsread(filename);
X = num(:,1:end-1);
Y = num(:,end);

%% �ݹ齨ģ 
flag =1;
mdl = fitglm(X,Y,'linear','distr','binomial','Link','logit');
while flag ==1
    disp(mdl); % ��ӡmodel
    pValue = mdl.Coefficients.pValue;
    pValue_gt05 =pValue>0.05 ;
    if sum(pValue_gt05)==0 % û��pValueֵ����0.05��ֵ
       flag =0;
       break;
    end
    % �Ƴ�pValue�д���0.05�ı������ı���
    fprintf('\n�Ƴ�������');
    [t,index]= max(pValue,[],1);
    fprintf('%s\t',mdl.CoefficientNames{1,index});
    fprintf('\nģ�����£�');
    if index-1~=0   
        removeVariance =mdl.CoefficientNames{1,index};
    else
        removeVariance ='1';
    end
        % ��ģ�����Ƴ�����
    mdl = removeTerms(mdl,removeVariance);
end

%% �Զ���ģ ����ӱ���
disp('��ӱ������Զ���ģ��...');
mdl2 = stepwiseglm(X,Y,'constant','Distribution','binomial','Link','logit');
disp('��ӱ������Զ���ģģ�����£�')
disp(mdl2);

%% �Զ���ģ �� �Ƴ�����
disp('�Ƴ��������Զ���ģ��...');
mdl3 =stepwiseglm(X,Y,'linear','Distribution','binomial','Link','logit');
disp('�Ƴ��������Զ���ģģ�����£�')
disp(mdl3);