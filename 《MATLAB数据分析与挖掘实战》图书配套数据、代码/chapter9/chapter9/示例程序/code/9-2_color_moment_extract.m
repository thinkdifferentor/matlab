%% ��ɫ����ȡ����
clear;
% ������ʼ��
filename='../data/1_1_processed.jpg';  %  ͼ���и��ͼƬ·������
outputfile = '../tmp/moment.xls'; % ��ɫ����ȡ�ļ�

%% ����׾� 
results = zeros(1,9+2);
subimage=imread(filename);  % ��ȡͼ������
subimage=im2double(subimage);  % ����ת��
firstmoment= mean(mean(subimage));  % һ�׾�
for m=1:3                %  ���RGB��ͨ���ֱ����
   results(1,2+m)=firstmoment(1,1,m);
   differencemoment= subimage(:,:,m)-firstmoment(1,1,m);
   secondmoment= sqrt(sum(differencemoment(:).*differencemoment(:))/101/101); % ���׾�
   results(1,5+m)=secondmoment;
   thirdmoment= nthroot(sum(differencemoment(:).*differencemoment(:).*differencemoment(:))/101/101,3); % ���׾�
   results(1,8+m)=thirdmoment;
end

% ��ȡ�������
index_ = strfind(filename,'/');
index_dot = strfind(filename,'_');

filename = filename(index_(1,end)+1:index_dot(1,end)-1);
index__= strfind(filename,'_');
type = filename(1:index__-1);
id = filename(index__+1:end);
results(1,1)=str2double(type);
results(1,2)=str2double(id);

%% �׾�д���ļ�
result_title={'���' '���' 'Rͨ��һ�׾�' 'Gͨ��һ�׾�' 'Bͨ��һ�׾�' 'Rͨ�����׾�' ...
    'Gͨ�����׾�' 'Bͨ�����׾�' 'Rͨ�����׾�' 'Gͨ�����׾�' 'Bͨ�����׾�'};
result=[result_title;num2cell(results)];
xlswrite(outputfile,result);
disp('ͼ��׾��ļ�����');
