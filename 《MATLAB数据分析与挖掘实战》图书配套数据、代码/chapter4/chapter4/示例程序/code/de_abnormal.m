function [ output ] = de_abnormal( sales )
%%  ȥ�쳣ֵ,��Ϊ��

% ȥ�쳣ֵ
abnormalvalue_ = arrayfun(@abnormal_rules_1,sales);
% output = sales(abnormalvalue_,:);
sales(~abnormalvalue_,:)=NaN;
output= sales;

end

