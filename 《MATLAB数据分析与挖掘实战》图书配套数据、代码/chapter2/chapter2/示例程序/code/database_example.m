%% MySQL���ݿ⵼������ʾ������

% ��ʼ������
clear;
sqlquery = 'select u.user,u.password,u.host from user u'; % ��ѯ�ű�
dbname='mysql'; % ���ݿ�����
username='fansy';
password='fansy';
host = 'localhost';
dpath='D:\Program Files\MySQL\Connector J 5.1.25\mysql-connector-java-5.1.25-bin.jar'; % MySQL����·��
datafile = '../tmp/user.xls'; % ���ݱ���·��

%% �������ݿⲢ��ѯ
javaaddpath(dpath);
conn = database(dbname,username,password,'Vendor','MySQL',...
          'Server',host); % �������ݿ�
curs = exec(conn,sqlquery); % ִ�в�ѯ
setdbprefs('DataReturnFormat','cellarray') % �������ݸ�ʽ
curs = fetch(curs); % ��ȡ����

%% ��������
data = curs.data;  % ��ȡ���� 
xlswrite(datafile,data); % ����д��EXCEL