%% hotspot�㷨���Խű�,����Ϊ��
clear;
% ��ʼ������
inputfile = '../data/hotspotdata.xls'; 
hotspottreefile = '../tmp/hstree.mat';
labelIndex = 3; % ����Ŀ��������ɢ������
attrsIndex=[3,5]; % ���������ж������������� 
attrsIndex_txt=[8,10];
minSupport =0.04; 
minImprovement=0.01;
maxBranches =2; % ����֧��
labelStateIndex =5; % ����Ŀ���е�Ŀ��״̬�±꣬5��ʾ��
level =0; % ��ӡroot�ڵ�����Ϊ0

%% ����Ԥ����
[unique_labels,data,attributes]=hs_preprocess(inputfile,labelIndex,attrsIndex,attrsIndex_txt);

% ����
% global unique_labels_  attributes_;
% unique_labels_=unique_labels;
% attributes_ = attributes;

%% hotspot�㷨����
disp('HotSpot����������������...');
root = hotspot(data,unique_labels,minSupport,minImprovement,maxBranches,labelStateIndex);
save(hotspottreefile,'root');
disp(['HotSpot�����������Ѿ��������ļ�"' hotspottreefile '"��!']);
%% ��ӡhotspot����������
disp('HotSpot ����������������ɣ������Ǵ�ӡ������');
print_hsnode(root,level,unique_labels,attributes);