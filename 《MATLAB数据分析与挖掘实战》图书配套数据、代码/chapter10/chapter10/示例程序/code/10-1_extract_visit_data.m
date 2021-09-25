%% ��ȡ�������ݣ���ͬһ��ID�����ݽ��оۺ�
clear;
% ������ʼ��
inputfile = '../data/visit_data.xls'; % sessionID��������
outputfile = '../tmp/visit_data.txt'; % �ۺϺ�������ļ�
separator = ','; % �ۺϺ�ķ������ݵķָ���

%% ��ȡ����
[num,txt] = xlsread(inputfile);
txt = txt(2:end,2);

%% ����ļ��Ƿ���ڣ�������ɾ��
if exist(outputfile,'file')==2 % ����������Ӱ��
    disp(['�ļ�' outputfile '���ڣ����ڱ�ɾ��...']);
   delete(outputfile); 
end

%% �������
rows = size(num,1);
fid = fopen(outputfile, 'w'); 
firstid= num(1,1);
fprintf(fid,'%s\t%s',num2str(firstid),txt{1,1}); 
for i=2:rows
    secondid =num(i,1);
    if firstid~=secondid % ��Ҫ����
        fprintf(fid,'%s\n%s\t','',num2str(secondid)); 
        
    else % ��Ҫ���separator��
        fprintf(fid,'%s',separator);  
    end
    % д������,�����¸�ֵid
    fprintf(fid,'%s',txt{i,1});  
    firstid = secondid;    
end
fclose(fid);

%% ��ӡ���
disp(['�����Ѿ�����sessionID���оۺϣ��ۺϺ�����ݴ洢�ڡ�' outputfile '���ļ��У�']);