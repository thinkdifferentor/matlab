function preprocess_apriori(input,output,separator)
%% ����Ԥ����

% ���������
% input : �����ļ���
% output������ļ���
% separator������ļ���Ŀ�ָ�����

%% ��ȡ����
[num,txt] = xlsread(input);
txt = txt(2:end,2);
%% �������
if exist(output,'file')==2
   delete(output); 
end
rows = size(num,1);
fid = fopen(output, 'w');
 
firstid= num(1,1);
fprintf(fid,'%s',txt{1,1}); 
for i=2:rows
    secondid =num(i,1);
    if firstid~=secondid % ��Ҫ����
        fprintf(fid,'%s\n',''); 
        
    else % ��Ҫ���separator��
        fprintf(fid,'%s',separator);  
    end
    % д������,�����¸�ֵid
    fprintf(fid,'%s',txt{i,1});  
    firstid = secondid;
    
end
fclose(fid);

end