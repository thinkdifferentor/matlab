%% ʹ��ID3�������㷨Ԥ�������ߵ�
clear ;
% ������ʼ��
inputfile = '../data/sales_data.xls'; % ������������������

%% ����Ԥ����
disp('���ڽ�������Ԥ����...');
[matrix,attributes_label,attributes] =  id3_preprocess(inputfile);

%% ����ID3������������id3()Ϊ�Զ��庯��
disp('����Ԥ������ɣ����ڽ��й�����...');
tree = id3(matrix,attributes_label,attributes);

%% ��ӡ����������
[nodeids,nodevalues] = print_tree(tree);
tree_plot(nodeids,nodevalues);

disp('ID3�㷨������������ɣ�');