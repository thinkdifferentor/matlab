function [ output,code] = trans2matrix( inputfile,outputfile,splitter )
%% ����������ת��Ϊ0��1����ÿ�д���һ������

% ���������
% inputfile�������ļ����ո�ָ�ÿ����Ŀ��
% outputfile������ļ���ת�����0,1�����ļ���
% splitter: �����ļ���Ŀ�ļ����,Ĭ��Ϊ�ո�

% ���������
% output : ת�����0,1 ����
% code���������

if nargin<3
   splitter=' '; 
end

%% �����ļ�, ��ñ������
code={};
fid= fopen(inputfile);
tline = fgetl(fid);
lines=0;
while ischar(tline)
    lines=lines+1; % ��¼����
    tline = deblank(tline);
    tline = regexp(tline,splitter,'split');
    code=[code tline]; % �ϲ� 
    code = unique(code); % ȥ���ظ���¼
%     disp(code)
    tline = fgetl(fid);
end
disp('�������Ϊ��')
disp(num2str(1:size(code,2)))
disp( code);
fclose(fid); % �ر��ĵ�

%% ��ȡ�ļ������ݱ�������ԭʼ���ݽ���ת��
itemsnum= size(code,2);
output=zeros(lines,itemsnum);
fid= fopen(inputfile);
tline = fgetl(fid);
lines=0;
while ischar(tline)
    lines=lines+1; % ��¼����
    tline = deblank(tline);
    tline = regexp(tline,splitter,'split');
    [C,icode,itline] = intersect(code,tline);% Ѱ���±�
    output(lines,icode')=1;
    %disp(output(lines,:))
    tline = fgetl(fid);
end
fclose(fid);

%% ��ת����ľ���д���ļ�
fid = fopen(outputfile, 'w');
for i=1:lines
   fprintf(fid,'%s\n',num2str(output(i,:))); 
end
fclose(fid);
end

