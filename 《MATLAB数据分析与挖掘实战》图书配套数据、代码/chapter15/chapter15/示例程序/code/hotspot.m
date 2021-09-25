function root = hotspot(data,unique_labels,minSupport,minImprovement,maxBranches,labelStateIndex)
%% ����hotspot����������

% �������ݣ�
% data: ǰ��n-1������Ϊ�����ͣ����һ��Ϊ��ɢ�ͣ�Ŀ���У���
% unique_labels��Ŀ���еı���
% minSupport: ��С֧�ֶ�
% minImprovement����С���Ŷ�
% maxBranches: ����֧��
% labelStateIndex: Ŀ���е�Ŀ��״̬���±�

% ���������
% node�� ���hotspot�����������ĸ��ڵ�

%% ��ʼ������
% ��ʼ��minSupportCount
[numInstances,cols] = size(data);
minSupportCount = floor(minSupport*numInstances+0.5);
if minSupportCount<=0
   minSupportCount=1; 
end

% ����label�Ĳ�ͬ״̬�ĸ���
attrCount = attr_state_count(data(:,end),unique_labels);

% ��ʼ��targetValue 
targetValue = attrCount(labelStateIndex,1)/numInstances;

% ��ʼ��ȫ�ֹ���
% clear global m_rules;
global m_rules;
m_rules=[];

%% �������ڵ�
root = struct('splitAttributeIndex',cols,'stateIndex',labelStateIndex,...
    'stateCount',attrCount(labelStateIndex,1),'allCount',numInstances,...
    'support', targetValue,...
    'lessThan',2,'children',[]); % 'lessThan': 0:'<=' ,1:'>' , '2':'='
% �����������splitValues ��tests
splitValues = zeros(1,cols);
tests = zeros(1,cols);
root.children = constructChildren(data,targetValue,splitValues,tests,...
    minSupportCount,minImprovement,maxBranches,labelStateIndex);

return ;
end