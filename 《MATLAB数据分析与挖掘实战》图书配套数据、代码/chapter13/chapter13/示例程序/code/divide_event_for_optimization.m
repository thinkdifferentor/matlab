function [dividsequence] = divide_event_for_optimization(threshold,data)
%% ���ݲɼ���EXCEL�����ݣ�������ˮ�¼���

% ���������
% threshold�������¼�ʱ����ֵ,��λ�����ӣ�
% data���������ݣ��������룻

% ���������
% dividsequence�����ػ��ֺõ�ÿ���¼�����ʼ���ݱ����������ݱ�ţ�
m=size(data,1);                        % �õ���ȡ�ı�������ά��
dividsequence=zeros(0,3);              % 'dividsequence'��һ�м�¼��ţ��ڶ��м�¼�¼�����ʼ���ݱ�ţ������м�¼�������ݱ��
flag=0;                                % ����Ƿ��ҵ���ˮ�¼�
i=2;                                   % �ӵڶ������ݿ�ʼ
eventnum=0;                            % eventnum��¼��ˮ�¼�����
threshold=threshold*60;
%% ������ˮ�¼�
while(i<=m)                            % ɨ��һ�����ݱ��õ���ˮ�¼�����š���ʼ��š���ֹ���ݱ�š�
    if(data{i,7}~=0)                   % ��ˮ������Ϊ0ʱ
        flag=1;
        start=i;                       % ��¼��ʼ���
        i=i+1;
        temp1=start;                   % temp1��¼ǰһ����ˮ��Ϊ0������
        while(1)                       % ��ͣ�ٴ������¼���ʼ�󣬿�����ͣ��
            if(i==m)                   
                endsequence=m;  
                break;  
            end          % ����Ѿ����������յ㣬�����һ�����ݵ�ǰһ��Ϊ������
            while(data{i,7}==0)
                if(i==m)                
                    endsequence=m-1; 
                    break;  
                end          % ����Ѿ����������յ㣬�����һ�����ݵ�ǰһ��Ϊ������Ϊʲô��m����
                i=i+1;
            end                        % while�������ҵ�����һ��ˮ������Ϊ0������
            temp2=i;                   % temp2��¼����һ����Ϊ0������
            d1=datenum(data{temp1,1},'yyyymmddHHMMSS');    % ʱ���ú�����datenum��������
            d2=datenum(data{temp2,1},'yyyymmddHHMMSS');
            dis=(d2-d1)*86400;                             % �õ���dis������Ϊ��λ�ģ��������s
            if(dis>=threshold||i==m)
                endsequence=temp1;                         % ������ֵ����ô��¼��Ľ������Ϊtemp1
                break;
            else
                temp1=temp2;                               % С����ֵ
            end
            if(i<=m-1)   
                i=i+1; 
            end                      % ��ֹ���
        end
    end
    if(flag==1)                        % �����־λ1����ʾ����һ����ˮ�¼��ģ����¼�����ˮ�¼�����Ϣ
        eventnum=eventnum+1;
        dividsequence=[dividsequence; eventnum start endsequence];
        flag=0;
        i=endsequence;                 % �´�ɨ��ʱi��endsequence��ʼ
    end
    i=i+1;                             % ��Ӧ��24�е�while
end
disp(['��ֵΪ' num2str(threshold/60) '����ʱ���õ��¼����ִ���Ϊ��' num2str(eventnum)]);
end
