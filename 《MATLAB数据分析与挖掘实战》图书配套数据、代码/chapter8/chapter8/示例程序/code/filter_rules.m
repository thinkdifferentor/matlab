function [ filteredrules ] = filter_rules(rulesfile, rules,outputfile )
%% ���ݹ���ĺ�����˹���������ļ�

% �������
% rulesfile�������ļ���
% rules��Ҫ���˵ĺ������ƣ�
% outputfile�����˺�����������ƣ�

% �������
% filteredrules: ���˺�Ĺ���

%% д������ļ�����
fid = fopen(outputfile, 'w');
fprintf(fid, '%s   (%s, %s) \n', 'Rule', 'Support', 'Confidence');

%% ���������ļ������˹���
fid_in= fopen(rulesfile);
tline = fgetl(fid_in);
lines=0;
filteredrules={};
while ischar(tline)
    index=strfind(tline,rules);
    if ~isempty(index)
        lines=lines+1; % ��¼����
        fprintf(fid,'%s\n',tline);
        filteredrules=[filteredrules tline];
    end
    tline = fgetl(fid_in);
end

%% �ر��ļ�
fclose(fid_in);
fclose(fid);
disp(['���˺�Ĺ���������' num2str(lines) '����¼��']);
disp(['�洢�����ļ�����' outputfile '����ɣ�'])
end

