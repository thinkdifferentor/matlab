function outputdata= ployinterp_column(columndata,type)
%% ���ÿ�н��в�ֵ

% �������˵����
% columndata: ����������ݣ�����ȱʧֵ
% type: 'lagrange' ��'newton' 

% �������˵����
% output: �����ֵ��������

%% �����������ݷ�Ϊ��ȱʧֵ��ȱʧֵ����
nans = isnan(columndata);  %  ����columndata��ΪNaN�������±�
notzeroIndexes = find(nans); % Ѱ��ȱʧֵ�±�
%zeroIndexes = find(nans==0); % Ѱ�ҷ�ȱʧֵ�±�
rows=size(columndata); %ԭʼ���ݵ����� 
%currentValues=zeros(size(zeroIndexes));% ��ʼ����ǰֵ����
for i=1:size(notzeroIndexes)
    pre5=findPre5(notzeroIndexes(i),columndata);
    last5=findLast5(notzeroIndexes(i),rows(1),columndata);
    [~,pre5cols]=size(pre5);
    [~,last5cols]=size(last5);
    
    if   strcmp(type,'lagrange')
        missingValue=lagrange_interp([1:pre5cols,pre5cols+2:last5cols+pre5cols+1],...
            [pre5,last5],pre5cols+1); % �������ղ�ֵ
    else
        missingValue=newton_interp([1:pre5cols,pre5cols+2:last5cols+pre5cols+1],...
            [pre5,last5],pre5cols+1); % ţ�ٲ�ֵ
    end
    columndata(notzeroIndexes(i),1)=missingValue;
end


% ���ز�ֵ�������
outputdata=columndata;

end


function pre5=findPre5(index,columndata)
%% ��columndata��Ѱ�Ҹ����±�indexǰ��5����ֵ����NaN��������5���İ�ʵ���������
if index<=0
    disp('�Ƿ��±�');
    exit; 
end
num=5;
pre5=nan(1,5);
for i=index-1:-1:1
    if isnan(columndata(i))==0  % �жϵ�i��ֵ�Ƿ�ΪNaN
        pre5(num)=columndata(i);
        num=num-1;
    end
    if num==0 % ֻȡǰ5��
        break;
    end
end
pre5=pre5(~isnan(pre5)); % ȥ��NaN��ֵ
end 

function last5=findLast5(index,rows,columndata)
%% ��columndata��Ѱ�Ҹ����±�index����5����ֵ����NaN��������5���İ�ʵ���������
if index<=0 || index>rows
    disp('�Ƿ��±�');
    exit; 
end
num=0;
last5=nan(1,5); % ��ʼ��
for i=index+1:rows
    if isnan(columndata(i))==0  % �жϵ�i��ֵ�Ƿ�ΪNaN
        num=num+1;
        last5(num)=columndata(i); 
    end
    if num==5 % ֻȡ��5��
        break;
    end
end
last5=last5(~isnan(last5)); % ȥ��NaN��ֵ
end
