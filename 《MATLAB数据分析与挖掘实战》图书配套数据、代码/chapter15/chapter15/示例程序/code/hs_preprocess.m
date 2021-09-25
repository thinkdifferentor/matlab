function [unique_labels,data,attributes]=hs_preprocess(inputfile,labelIndex,attrsIndex,attrsIndex_txt)
%% ����Ԥ���� ����ȡ��Ҫ��������

[num,txt] = xlsread(inputfile);

attributes = txt(1,[attrsIndex_txt,labelIndex]);

labels=txt(2:end,labelIndex);
unique_labels= unique(labels);
labels=transform(labels,unique_labels);
data =[num(:,attrsIndex),labels];

disp('����Ԥ������ɣ�');
disp('Ŀ���б���Ϊ��');
rows = size(unique_labels,1);
for i=1:rows
   disp([unique_labels{i,1} ' --> ' num2str(i)]); 
end

end

function labels=transform(labels,unique_labels_)
    global unique_labels;
    unique_labels= unique_labels_;
    labels = cellfun(@find_label_index,labels);
%     disp('a');
    
end

function labelindex = find_label_index(label)
    global unique_labels;
    [rows]= size(unique_labels,1);
    for i=1:rows
       if strcmp(unique_labels{i,1},label)
           labelindex =i;
           return;
       end
    end
    disp('�������');
end