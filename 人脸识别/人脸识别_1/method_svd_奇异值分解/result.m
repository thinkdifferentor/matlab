%ͳ����ѵ���õ����������ʶ�𣬷ֱ�ͳ��ѵ����ʶ���ʣ����Լ�ʶ�����Լ���ʶ���ʣ��Ա�Է��������ܽ��п��졣

%�������
%net �Ѿ�ѵ���õ�������
%pnewn  ��һ�������Ĳ��Լ�  �����ռ�
%pn   ��һ��������ѵ����  �����ռ�
%num_train  ÿ��������ѵ����ͼƬ��Ŀ
%num_test  ÿ�������ڲ��Ե�ͼƬ��Ŀ
%���ز���
%result_test ���Ե�������  �����ռ�
%result_train ѵ���������� �����ռ�
%count_test  ������ȷ�Ĳ��Լ���Ŀ  ����
%count_train  ������ȷ��ѵ������Ŀ  ����
%Test_reg   ���Լ�ʶ����  
%Train_reg   ѵ����ʶ����
%Total_reg   ��ʶ����
%��������
function[result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = result(net,pnewn,pn,num_train,num_test)

fprintf('����������,ͳ��ʶ����ȷ��ͼƬ��\n\n');

%����ģ����
result_test=sim(net, pnewn);
result_train=sim(net, pn);
%ͳ��ʶ����ȷ��ͼƬ��
fprintf('��ʼͳ��ʶ����ȷ��ͼƬ��Ŀ����ȴ�......\n\n');
%C�ǵó���result_test�е�ÿһ�е����ֵ��I�����ֵ���ڵ�����
[C,I]=max(result_test);
%A�ǵó���result_train�е�ÿһ�е����ֵ��B�����ֵ���ڵ�����
[A,B]=max(result_train);
count_test=0;
count_train=0;
for f=1:40,
    for g=1:num_test
        %�����ڵó��Ľ���У�����ȷʶ������Ĳ��Լ�ͼƬ��Ŀ
        if(I(1,(f-1)*num_test+g)==f)
          count_test=count_test+1;
        end 
    end
    for h=1:num_train
        %�����ڵó��Ľ���У�����ȷʶ�������ѵ����ͼƬ��Ŀ
        if(B(1,(f-1)*num_train+h)==f)
          count_train=count_train+1;
        end            
    end
end
fprintf('ͳ�ƽ�������ȷʶ��Ĳ��Լ���ĿΪ: %d\n\n',count_test);
fprintf('��ȷʶ���ѵ������ĿΪ: %d\n\n',count_train);
%��������в��Լ���ͼƬ����
total_test=40*num_test;
%���������ѵ������ͼƬ����
total_train=40*num_train;
%��������Լ���ʶ����
Test_reg=count_test/total_test;
%�����ѵ������ʶ����
Train_reg=count_train/total_train;
%�������ʶ����
Total_reg=(count_test+count_train)/400;
%�������ӡ����
fprintf('���Լ�ʶ����Ϊ%d\n\n',Test_reg);
fprintf('ѵ����ʶ����Ϊ%d\n\n',Train_reg);
fprintf('��ʶ����Ϊ%d\n\n',Total_reg);
fprintf('-----------------------------------------------------\n');
fprintf('-----------------------------------------------------\n');
