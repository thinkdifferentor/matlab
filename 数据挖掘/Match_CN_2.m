%Ƶ������Ƶ���ŵ�����ȡ
clear,clc;

%��������
load('Channel');

%Ƶ����
for i=1:length(Channel)
    Channel_Num_End(i)=Channel(i).num;
end

%Ƶ����
for i=1:length(Channel)
    Channel_Name_End{i}=Channel(i).name;
end

Channel_Num_End=Channel_Num_End';
Channel_Name_End=Channel_Name_End';


%����Ƶ������Ӧ��Ƶ����
load('Match_3.mat');

C_N=zeros(length(Match_3),1);
for i=1:length(Match_3)
    for j=1:length(Channel_Name_End)
        if(strcmp(Channel_Name_End{j},Match_3{i}))
           C_N(i)=Channel_Num_End(j); 
        end
    end
end


%���ݴ洢
save('Channel_Num_End.mat','Channel_Num_End');
save('Channel_Name_End.mat','Channel_Name_End');
