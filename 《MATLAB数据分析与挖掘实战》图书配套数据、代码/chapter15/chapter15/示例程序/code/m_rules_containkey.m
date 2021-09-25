function [ flag ] = m_rules_containkey( newSplitValues,newTests )
%% �жϵ�ǰ�Ĺ����Ƿ��Ѿ���ȫ�ֹ�����, 0��ʾ���ڣ�����ӣ���1��ʾ�ڣ�������ӣ�

global m_rules;
cols= size(m_rules,2);
if cols<=0 % ��һ������ֱ�����
    add_2_m_rules(newSplitValues,newTests); 
    flag =0;
    return ;
end

for i=1:cols
    rule_node = m_rules(1,i);
    if equal_split_test(rule_node,newSplitValues,newTests) % �����ȣ���˵���Ѵ���
        flag=1;
        return ;
    end
end
% ������m_rules �����ڣ���������
add_2_m_rules(newSplitValues,newTests);
flag =0;
end

function add_2_m_rules(newSplitValues,newTests)
%% ���¹�����뵽ȫ�ֹ�����
% ����rule �ṹ��
    global m_rules;
    rule_node = struct('splitValues',newSplitValues,'tests',newTests);
    m_rules=[m_rules,rule_node];
end

function flag = equal_split_test(rule_node,newSplitValues,newTests)
 %% �жϸ����Ĺ�����¹����Ƿ���һ����
    splitValues = rule_node.splitValues;
    tests = rule_node.tests;
    cols = size(tests,2);
    split_sum = sum(splitValues==newSplitValues);
    test_sum = sum(tests==newTests);
    if split_sum==cols && test_sum==cols
       flag =1; 
       return;
    end
    flag =0;
end