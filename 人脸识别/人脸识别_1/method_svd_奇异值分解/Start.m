
%�����ʾ��Ϣ
fprintf('��������ͼƬ\n\n');
%�û���������ά����Ŀ
panDuan = 1;
% while panDuan 
%     featureNumber = input('����������ά����������16��32��48��64��80����');
%     %����������16.32.48.64.80,�����ִ�д���
%     if(featureNumber == 16 || featureNumber == 32 || featureNumber == 48 || featureNumber == 64 || featureNumber == 80 )
%         panDuan = 0;
%         disp('��ʼװ��ͼ���ļ�,��ȴ�.......')
%     %������������������,��ʾ��������,���û���������
%     else
%         fprintf('������Ĳ�����5�����е��κ�һ��,����������!\n\n')
%     end
% end

% %��ѵ������ֵ
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


% %���������㵥Ԫ����num_hidden�����ֵ�ı���
% num_hidden = input('��������������Ԫ����:(40:20:100)');
% 
% %�����������������֮��Ĵ��ݺ�����func_hidden������ַ����ı���
% func_hidden = input('�������������������֮��Ĵ��ݺ���:(tansig,purelin)','s');
% 
% %�����������������֮��Ĵ��ݺ�����func_out������ַ����ı���
% func_out = input('�������������������֮��Ĵ��ݺ���:(tansig,purelin)','s');
% 
% %����BPѵ��������trainfunc������ַ����ı���
% trainfunc = input('������BP����ѵ������:(trainrp)','s');
% 
% %����ѵ��Ŀ�꣬goal�����ֵ�ı���
% goal = input('������ѵ��Ŀ�꣨<0.01��(1e��5):');
% 
% %����ѵ��������epochs�����ֵ�ı���
% epochs = input('������ѵ������:(8000)');
% 
% %����ѧϰ���ʣ�learn_rate�����ֵ�ı���
% learn_rate = input('������ѧϰ����(<0.1):(0.005)');
    num_train = 5;
    num_hidden = 60;
    func_hidden='tansig';
    func_out = 'purelin';
    trainfunc = 'trainrp';
    goal = 0.001;
    epochs = 20000;
    learn_rate = 0.01;
       
 fid=fopen('face20.txt','wt');
  fprintf(fid,'num_train = 5;num_hidden = 60;func_hidden=tansig;func_out = purelin��trainfunc = trainrp; goal = 0.005; epochs = 20000; learn_rate = 0.01;');
    featureNumber = [8,16,32,24,48,64,80];
    for i=1:7
    fprintf(fid,'%d��\n',featureNumber(i));
   
     for j=1:5
         num = j;
         %�õ�����Ƭ��������ֵ�������....��֪���ⶫ������������...
         fprintf(fid,'��������������%dά��ֵ\n',j);
        [result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = content(num,featureNumber(i),num_train,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate);

        fprintf(fid,'ͳ�ƽ�������ȷʶ��Ĳ��Լ���ĿΪ: %d\n\n',count_test);
        fprintf(fid,'��ȷʶ���ѵ������ĿΪ: %d\n\n',count_train);
        fprintf(fid,'���Լ�ʶ����Ϊ%d\n\n',Test_reg);
        fprintf(fid,'ѵ����ʶ����Ϊ%d\n\n',Train_reg);
        fprintf(fid,'��ʶ����Ϊ%d\n\n',Total_reg);
        fprintf(fid,'-----------------------------------------------------\n');
        fprintf(fid,'-----------------------------------------------------\n');
        clear feature;
     end
    end


%      featureNumber = 32;
%  fprintf(fid,'32��\n');
%      for j=1:5
%          num = j;
%          %�õ�����Ƭ��������ֵ�������....��֪���ⶫ������������...
%          fprintf(fid,'��������������%dά��ֵ\n',j);
% [result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = content(num,featureNumber,num_train,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate);
% 
% fprintf(fid,'ͳ�ƽ�������ȷʶ��Ĳ��Լ���ĿΪ: %d\n\n',count_test);
% fprintf(fid,'��ȷʶ���ѵ������ĿΪ: %d\n\n',count_train);
% 
% fprintf(fid,'���Լ�ʶ����Ϊ%d\n\n',Test_reg);
% fprintf(fid,'ѵ����ʶ����Ϊ%d\n\n',Train_reg);
% fprintf(fid,'��ʶ����Ϊ%d\n\n',Total_reg);
% fprintf(fid,'-----------------------------------------------------\n');
% fprintf(fid,'-----------------------------------------------------\n');
%     
% clear feature;
%      end 
% 
%     featureNumber = 48;
% 
%  fprintf(fid,'48��\n');
%      for j=1:5
%          num = j;
%          %�õ�����Ƭ��������ֵ�������....��֪���ⶫ������������...
%          fprintf(fid,'��������������%dά��ֵ\n',j);
% [result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = content(num,featureNumber,num_train,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate);
% 
% fprintf(fid,'ͳ�ƽ�������ȷʶ��Ĳ��Լ���ĿΪ: %d\n\n',count_test);
% fprintf(fid,'��ȷʶ���ѵ������ĿΪ: %d\n\n',count_train);
% 
% fprintf(fid,'���Լ�ʶ����Ϊ%d\n\n',Test_reg);
% fprintf(fid,'ѵ����ʶ����Ϊ%d\n\n',Train_reg);
% fprintf(fid,'��ʶ����Ϊ%d\n\n',Total_reg);
% fprintf(fid,'-----------------------------------------------------\n');
% fprintf(fid,'-----------------------------------------------------\n');
%     
% clear feature;
%      end
% 
% 
% 
%     featureNumber = 64;
%      fprintf(fid,'64��\n');
%      for j=1:5
%          num = j;
%          %�õ�����Ƭ��������ֵ�������....��֪���ⶫ������������...
%          fprintf(fid,'��������������%dά��ֵ\n',j);
% [result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = content(num,featureNumber,num_train,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate);
% 
% fprintf(fid,'ͳ�ƽ�������ȷʶ��Ĳ��Լ���ĿΪ: %d\n\n',count_test);
% fprintf(fid,'��ȷʶ���ѵ������ĿΪ: %d\n\n',count_train);
% 
% fprintf(fid,'���Լ�ʶ����Ϊ%d\n\n',Test_reg);
% fprintf(fid,'ѵ����ʶ����Ϊ%d\n\n',Train_reg);
% fprintf(fid,'��ʶ����Ϊ%d\n\n',Total_reg);
% fprintf(fid,'-----------------------------------------------------\n');
% fprintf(fid,'-----------------------------------------------------\n');
%     
% clear feature;
%      end
% 
%      featureNumber = 80;
% 
%  fprintf(fid,'���Ƿ�80��\n');
%      for j=1:5
%          num = j;
%          %�õ�����Ƭ��������ֵ�������....��֪���ⶫ������������...
%          fprintf(fid,'��������������%dά��ֵ\n',j);
% [result_test,result_train,count_test,count_train,Test_reg,Train_reg,Total_reg] = content(num,featureNumber,num_train,num_hidden,func_hidden,func_out,trainfunc,goal,epochs,learn_rate);
% 
% fprintf(fid,'ͳ�ƽ�������ȷʶ��Ĳ��Լ���ĿΪ: %d\n\n',count_test);
% fprintf(fid,'��ȷʶ���ѵ������ĿΪ: %d\n\n',count_train);
% 
% fprintf(fid,'���Լ�ʶ����Ϊ%d\n\n',Test_reg);
% fprintf(fid,'ѵ����ʶ����Ϊ%d\n\n',Train_reg);
% fprintf(fid,'��ʶ����Ϊ%d\n\n',Total_reg);
% fprintf(fid,'-----------------------------------------------------\n');
% fprintf(fid,'-----------------------------------------------------\n');
%     
% clear feature;
%      end
% % end
