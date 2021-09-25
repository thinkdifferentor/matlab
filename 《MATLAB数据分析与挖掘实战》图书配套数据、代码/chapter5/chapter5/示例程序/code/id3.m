function [ tree ] = id3( examples, attributes, activeAttributes )
%% ID3 �㷨 ������ID3������
    ...�ο���https://github.com/gwheaton/ID3-Decision-Tree

% ���������
% example: ����0��1����
% attributes: ����ֵ������Label��
% activeAttributes: ��Ծ������ֵ��-1,1������1��ʾ��Ծ��

% ���������
% tree�������ľ�������

%% �ṩ������Ϊ�գ����쳣
if (isempty(examples));
    error('�����ṩ���ݣ�');
end

% ����
numberAttributes = length(activeAttributes);
numberExamples = length(examples(:,1));

% �������ڵ�
tree = struct('value', 'null', 'left', 'null', 'right', 'null');

% ������һ��ȫ��Ϊ1���򷵻ء�true��
lastColumnSum = sum(examples(:, numberAttributes + 1));

if (lastColumnSum == numberExamples);
    tree.value = 'true';
    return
end
% ������һ��ȫ��Ϊ0���򷵻ء�false��
if (lastColumnSum == 0);
    tree.value = 'false';
    return
end

% �����Ծ������Ϊ�գ��򷵻�label��������ֵ
if (sum(activeAttributes) == 0);
    if (lastColumnSum >= numberExamples / 2);
        tree.value = 'true';
    else
        tree.value = 'false';
    end
    return
end

%% ���㵱ǰ���Ե���
p1 = lastColumnSum / numberExamples;
if (p1 == 0);
    p1_eq = 0;
else
    p1_eq = -1*p1*log2(p1);
end
p0 = (numberExamples - lastColumnSum) / numberExamples;
if (p0 == 0);
    p0_eq = 0;
else
    p0_eq = -1*p0*log2(p0);
end
currentEntropy = p1_eq + p0_eq;

%% Ѱ���������
gains = -1*ones(1,numberAttributes); % ��ʼ������

for i=1:numberAttributes;
    if (activeAttributes(i)) % �������Դ��ڻ�Ծ״̬���������
        s0 = 0; s0_and_true = 0;
        s1 = 0; s1_and_true = 0;
        for j=1:numberExamples;
            if (examples(j,i)); 
                s1 = s1 + 1;
                if (examples(j, numberAttributes + 1)); 
                    s1_and_true = s1_and_true + 1;
                end
            else
                s0 = s0 + 1;
                if (examples(j, numberAttributes + 1)); 
                    s0_and_true = s0_and_true + 1;
                end
            end
        end
        
        % �� S(v=1)
        if (~s1);
            p1 = 0;
        else
            p1 = (s1_and_true / s1); 
        end
        if (p1 == 0);
            p1_eq = 0;
        else
            p1_eq = -1*(p1)*log2(p1);
        end
        if (~s1);
            p0 = 0;
        else
            p0 = ((s1 - s1_and_true) / s1);
        end
        if (p0 == 0);
            p0_eq = 0;
        else
            p0_eq = -1*(p0)*log2(p0);
        end
        entropy_s1 = p1_eq + p0_eq;

        % �� S(v=0)
        if (~s0);
            p1 = 0;
        else
            p1 = (s0_and_true / s0); 
        end
        if (p1 == 0);
            p1_eq = 0;
        else
            p1_eq = -1*(p1)*log2(p1);
        end
        if (~s0);
            p0 = 0;
        else
            p0 = ((s0 - s0_and_true) / s0);
        end
        if (p0 == 0);
            p0_eq = 0;
        else
            p0_eq = -1*(p0)*log2(p0);
        end
        entropy_s0 = p1_eq + p0_eq;
        
        gains(i) = currentEntropy - ((s1/numberExamples)*entropy_s1) - ((s0/numberExamples)*entropy_s0);
    end
end

% ѡ���������
[~, bestAttribute] = max(gains);
% ������Ӧֵ
tree.value = attributes{bestAttribute};
% ȥ��Ծ״̬
activeAttributes(bestAttribute) = 0;

% ����bestAttribute�����ݽ��з���
examples_0= examples(examples(:,bestAttribute)==0,:);
examples_1= examples(examples(:,bestAttribute)==1,:);

% �� value = false or 0, ���֧
if (isempty(examples_0));
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.left = leaf;
else
    % �ݹ�
    tree.left = id3(examples_0, attributes, activeAttributes);
end
% �� value = true or 1, �ҷ�֧
if (isempty(examples_1));
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); 
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.right = leaf;
else
    % �ݹ�
    tree.right = id3(examples_1, attributes, activeAttributes);
end

% ����
return
end