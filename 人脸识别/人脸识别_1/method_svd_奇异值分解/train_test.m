%����һ�������еõ�������������л��֣����仮��Ϊѵ����train_data,�Ͳ��Լ�test_data�����Խ���ѵ���Ͳ��ԣ���������Ŀ�꼯t������ѵ
%�����Ͳ��Լ����й�һ������

%�������
%featureΪ����������ȡ��ó�����������

%���ز���
%train_data Ϊѵ���������ռ�
%test_data Ϊ���Լ������ռ�
%t Ϊѵ������Ӧ��Ŀ�꼯�����ռ�
%num_train ÿ��������ѵ����ͼƬ��Ŀ
%num_test ÿ��������ѵ����ͼƬ��Ŀ

%��������
function[pn,pnewn,t,num_train,num_test] = train_test(feature,num_train)

fprintf('����ѵ����train_data,���Լ�test_data��ѵ��Ŀ�꼯t\n\n');

feature=feature'; %���о����ã���Ϊ���㷨Ҫ������������������

%�����ÿ���˵��ļ�����ѡ������ѵ������ͼƬ��Ŀ��num_trainΪ�����ֵ�ı�������ֵ�������0��С��10
% panDuan = 1;
% while panDuan 
%     num_train = input('������ÿ��������ѵ����ͼƬ��Ŀ��<10,ʣ���ͼƬ������Ϊ���Լ���:');
%     %����������С��10������,�����ִ�д���
%     if(num_train<10 )
%         panDuan = 0;
%         fprintf('��ʼ����ѵ�����Ͳ��Լ�����ȴ�.......\n\n\n\n');
%     %�����������ֲ�С��10,��ʾ��������,���û���������
%     else
%         fprintf('����������ֲ�С��10,����������!\n\n')
%     end
% end
%�����ÿ�������ڲ��Ե�ͼƬ��Ŀ
num_test=10-num_train;
%����ѵ����
for y=1:40;               %һ����40���ˣ�ÿ��10��ͼƬ
    for n=1:num_train;
        %����ѵ����
        train_data(:,(y-1)*num_train + n) = feature(:,(y-1)*10 + n);
    end;
    for z=1:num_test,
        %������Լ�
        test_data(:,(y-1)*num_test+z)= feature(:,(y-1)*10 +num_train+z);
    end
end
fprintf('ѵ�����Ͳ��Լ����������\n\n\n\n');

%����ѵ��Ŀ�꼯t
fprintf('��ʼ����ѵ������Ӧ��Ŀ�꼯����ȴ�......\n\n');
for y=1:40;
    for m=1:num_train;
        %����ѵ����Ŀ�꼯
        t(y,(y-1)*num_train+m)=1;
    end
end
fprintf('ѵ��Ŀ�꼯���������\n\n');
fprintf('����ʵ�����ݳ�ʼ������ϣ�\n\n');
%��ѵ�������ݽ��й�һ������
pn = mat2gray(train_data);
%�Բ��Լ����ݽ��й�һ������
pnewn = mat2gray(test_data);