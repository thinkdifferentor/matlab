%--------------------------------------------------------------------------------------%
%������ʵ�ֹ��ܣ�����ͼƬ���ڵ��ļ��еĻ���Ϣ��ͼƬ��ʽ��
%���������д˸�ʽͼƬ(Ҫ�����ͼƬ����һ��)���洢����ΪԪ�����飨cell����Ԫ������
%ÿһ��Ϊһ���ļ����ڵ�����ͼƬ
%����images=Imread('C:\Users\user\Desktop\��ҵ���\��+��ʶ��\����ʶ��2\orl_faces\','*.pgm');
%--------------------------------------------------------------------------------------%
%dir()�����г�һ��Ŀ¼��������Ϣ������ֵΪ�ṹ���������ͣ���������
%���֣�name:�ļ���Ŀ¼�����ƣ�date:�޸����ڣ�bytes:�ļ���С��
%isdir:�Ƿ���Ŀ¼����Dir=dir('C:\Users\user\Desktop\face\');���ش�·����
%�����ļ�����Ϣ������Dir=dir('C:\Users\user\Desktop\face\*.pgm');���ش�
%·����.pgm��ʽ���ļ���Ϣ��
function Image=Imreads2(filepath,type)    
FilDir=dir(filepath);   %FilDirΪ�ṹ��
FilDir([1 2])=[];  %��Ϊ��һ�͵ڶ����ǡ�.����..���ļ�������ɾ��
for ii=1:length(FilDir)    
    ImDir{ii}=dir([[filepath,FilDir(ii).name],'\',type]);  %ImDir��һ���ṹ��,���������Ϊ�ַ���     
end   %ImDir{1}(3).name  ��Ӧs1�ļ����ڵ�3��ͼƬ��name��Ϣ
t=0;
for ii=1:length(ImDir)
    for jj=1:length(ImDir{ii})
        t=t+1;
        Image{t}=imread([[filepath,FilDir(ii).name],'\',ImDir{ii}(jj).name]);  %Ԫ������
    end       %ÿһ����һ�����ļ����ڵ�����ͼƬ
end
end