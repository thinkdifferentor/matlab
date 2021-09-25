%% ���Ա任
clear;
% ������ʼ��
discfile = '../data/discdata.xls'; % ����ԭʼ����
transformeddata = '../tmp/discdata.xls'; % �任�������
targetid = 184;

%% ��ȡ����
[num,txt] = xlsread(discfile);
txt(2:end,3)= num2cell(num(:,1));
txt(2:end,6)=num2cell(num(:,4));

%% ��ʼ����ر���
unidate = datestr(unique(datenum(txt(2:end,end))),26); % Ψһʱ��
unidisc = unique(txt(2:end,5));  % Ψһ����
rows = size(unidate,1);
cols = size(unidisc,1);
result = cell (rows+1,2+cols);
% �������ַ�����ǰ׺
unidiscstr = cell(1,cols);
for i =1:cols
   unidiscstr{1,i} = [txt{2,2} '|' txt{2,3} '|' num2str(targetid)...
       '|' unidisc{i,1}]; 
end
result(1,1:2)={txt{1,1},txt{1,end}};  % SYS_NAME,COLLECTTIME,disc ...
result(1,3:end)=unidiscstr;

%% ��������
txt = txt(2:end,:);
txt = txt(cell2mat(txt(:,3))==targetid,:);
rows = size(unidate,1);
for i= 1:rows
   smalltxt = txt(datenum(txt(:,end))==datenum(unidate(i,:)),:);
   result(i+1,1:2)={smalltxt{1,1},smalltxt{1,end}};
   result(i+1,3:end)= smalltxt(:,6)';
end

%% ����д��
xlswrite(transformeddata,result);
disp('���Ա任��ɣ�');
