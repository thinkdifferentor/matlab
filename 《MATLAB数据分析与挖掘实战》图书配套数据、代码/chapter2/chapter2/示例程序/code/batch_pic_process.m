%% ͼƬ������ȡ
clear;
% ��ʼ������
picdir = '../data/images/' ;  % ͼƬ�����ļ���
picsave = '../tmp/';          % ��ȡͼƬ�����ļ���
logfile = '../tmp/log.txt' ;  % ��־�ļ�����·��
momentfile ='../tmp/moment.xls'; % ͼƬ�׾ش洢·��

%% ��־�ļ���ʼ��
fileID = fopen(logfile,'a+'); % ��׷�ӵķ�ʽ�����־��Ϣ
loginfo =[datestr(now) '  ' '��־��ʼ�����']; % ��־��Ϣ
fprintf(fileID,'%s\r\n',loginfo);  %  д����־��Ϣ

%% ͼƬ��������ȡ
inputfolder=dir(picdir);
inputfolder=struct2cell(inputfolder);
inputfolder=inputfolder';
isdirs=cell2mat(inputfolder(:,4));
num= sum(isdirs==0);% ͼƬ������
images=inputfolder(:,1);
images=images(isdirs==0);  % ͼƬ��
% ��־��¼
loginfo =[datestr(now) '   ' 'ͼƬ�����ļ���Ϊ��' picdir ...
    ',һ����' num2str(num) '��ͼƬ'];
fprintf(fileID,'%s\r\n',loginfo);

%% ͼƬ������ȡ�ͱ���
rows = size(images,1);
moment = zeros(rows,3); % ��ʼ��һ�׾ر���
for i= 1:rows
    % ��־��¼
    loginfo =[datestr(now) '   ' '���ڴ����' num2str(i) ...
    '��ͼƬ���ļ���Ϊ' images{i,1} ];
    fprintf(fileID,'%s\r\n',loginfo);
    imdata_i = imread([picdir images{i,1}]); % ��ȡͼƬ�ļ�
    [width,length,z]=size(imdata_i);
    subimage= imdata_i(fix(width/2)-50:fix(width/2)+50,...
        fix(length/2)-50:fix(length/2)+50,:); % ͼƬ��ȡ
    imwrite(subimage,[picsave images{i,1}]); % ����ͼƬ
    % �����ȡͼƬ��һ�׾�
    subimage=im2double(subimage); % ����ת��
    firstmoment= mean(mean(subimage));% һ�׾�
    for j=1:3
        moment(i,j)=firstmoment(1,1,j);
    end
end

%% �������� �ر���־�ļ�
xlswrite(momentfile,moment); % �ѽ׾�����д��EXCEL�ļ�
% ��־��¼
loginfo =[datestr(now) '   ' '�׾�������д���ļ�' ];
fprintf(fileID,'%s\r\n',loginfo);

fclose(fileID); % �ر���־�ļ�