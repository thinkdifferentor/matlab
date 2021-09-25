%=========================˫���ݺ�����Ӣ����ֽƬƴ��========================
clc,clear;
files = dir('����4\*.bmp');
n = numel(files);
for n=1:n
    picture{n} = imread(['����4\',files(n).name]);
end
 
[subpicrow,subpiccol] = size(picture{1});%�����Ƭ������������
shadow = zeros(n,subpiccol);%ͶӰ����
 
for i =1:n%ÿһ�б�ʾһ����Ƭ��ͶӰ
    temp = picture{i}./255;
    num = 0;
    sum1 = 0;
    for j=1:subpicrow
        if sum(temp(j,:))<64
            shadow(i,j) = 1;
        end
    end
end
h_word_map = containers.Map;
for i=1:n
    temp = shadow(i,:);
    sum = 0;
    for j=1:length(temp)
        if temp(j)==0
            sum = sum+1;
        else
            if sum>0
                if h_word_map.isKey(num2str(sum))     %����ֵ�h_word_map ���м�sum
                    h_word_map(num2str(sum)) = h_word_map(num2str(sum)) +1;
                else
                    h_word_map(num2str(sum)) = 1;
                end
            end
            sum = 0;
        end
    end
end
keys = h_word_map.keys;
values = h_word_map.values;
h_word = zeros(1,length(keys));
h_word_values = zeros(1,length(keys));

for i=1:length(keys)
    h_word(i) = str2double(keys{i});
    h_word_values(i) = values{i};
end   
   
   
   

