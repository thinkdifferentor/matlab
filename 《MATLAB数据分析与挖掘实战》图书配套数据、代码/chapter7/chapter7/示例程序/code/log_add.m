function log_add( logfile,loginfo )
%% ��־׷��
% ���������
% logfileid�� ��־�ļ���
% loginfo�� ��Ҫ��¼����־��Ϣ��

%% ����־�ļ�
fileID = fopen(logfile,'a+'); % ��׷�ӵķ�ʽ�����־��Ϣ
loginfo =[datestr(now) '  ' loginfo]; % ��־��Ϣ

%% ��¼��־
fprintf(fileID,'%s\r\n',loginfo);  %  д����־��Ϣ

%% �ر���־�ļ�
fclose(fileID);


end

