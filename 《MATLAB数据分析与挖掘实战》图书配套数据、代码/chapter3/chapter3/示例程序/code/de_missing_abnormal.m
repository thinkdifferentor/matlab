function [ output ] = de_missing_abnormal( sales,index )
%%  ȥȱʧֵ���쳣ֵ

% ȥȱʧֵ
nanvalue_ = ~isnan( sales(:,index));
sales =sales(nanvalue_,:);
% ȥȱʧֵ
abnormalvalue_ = sales(:,index)>=400;
sales = sales(abnormalvalue_,:);
abnormalvalue_ = sales(:,index) <=5000;
output = sales(abnormalvalue_,:);

end

