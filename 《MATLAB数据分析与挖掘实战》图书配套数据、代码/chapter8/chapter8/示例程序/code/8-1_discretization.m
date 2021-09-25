%% ������ɢ��
clear;
% ������ʼ��
datafile = '../data/data.xls'; % �����ļ�
processedfile='../tmp/data_processed.xls'; % ���ݴ�����ļ�
type=4; % ������ɢ���ķ������
index=8; % TNM��������������
typelabel={'A','B','C','D','E','F'}; % ������ɢ����ı�ʶǰ׺
rng('default'); % �̶����������

%% ��ȡ���� 
[num,txt] = xlsread(datafile);

[rows,cols] = size(num); % ����
disdata= cell(rows,cols+1); % ��ʼ��

%% ������ɢ��
for i=1:cols
   [IDX,C] = kmeans(num(:,1),type,'start','cluster'); % �Ե��������н��о���
   [B,I] =sort(C); % �Ծ������Ľ������� 
   
   for j=1:size(I,1)
       disdata(IDX==I(j),i)=cellstr([typelabel{1,i} num2str(j)]);
   end
end
disdata(:,cols+1)=txt(2:end,index);

%% д������
xlswrite(processedfile,[txt(1,1:size(typelabel,2)),txt{1,index};disdata]);
disp('������ɢ����ɣ�');
