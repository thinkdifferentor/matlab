function [ParSwarm,OptSwarm]=InitSwarm(SwarmSize,ParticleSize,ParticleScope,AdaptFunc)
%������������ʼ������Ⱥ���޶�����Ⱥ��λ���Լ��ٶ���ָ���ķ�Χ��
%[ParSwarm,OptSwarm,BadSwarm]=InitSwarm(SwarmSize,ParticleSize,ParticleScope,AdaptFunc)
%
%���������SwarmSize:��Ⱥ��С�ĸ���
%���������ParticleSize��һ�����ӵ�ά��
%���������ParticleScope:һ�������������и�ά�ķ�Χ��
%                         ParticleScope��ʽ:
%                               3ά���ӵ�ParticleScope��ʽ:
%                                                                                                       [x1Min,x1Max
%                                                                                                          x2Min,x2Max
%                                                                                                          x3Min,x3Max]
%
%���������AdaptFunc����Ӧ�Ⱥ���
%
%�����ParSwarm��ʼ��������Ⱥ
%�����OptSwarm����Ⱥ��ǰ���Ž���ȫ�����Ž�
%
%�÷�[ParSwarm,OptSwarm,BadSwarm]=InitSwarm(SwarmSize,ParticleSize,ParticleScope,AdaptFunc);
%
%�쳣�����ȱ�֤���ļ���Matlab������·���У�Ȼ��鿴��ص���ʾ��Ϣ��
%
%�����ˣ�XXX
%����ʱ�䣺2007.3.26
%�ο����ף���
%

%�ݴ����
if nargin~=4
          error('����Ĳ�����������')
end
if nargout<2
          error('����Ĳ����ĸ���̫�٣����ܱ�֤�Ժ�����С�');
end

[row,colum]=size(ParticleSize);
if row>1|colum>1
          error('��������ӵ�ά��������һ��1��1�е����ݡ�');
end
[row,colum]=size(ParticleScope);
if row~=ParticleSize|colum~=2
          error('��������ӵ�ά����Χ����');
end

%��ʼ������Ⱥ����

%��ʼ������Ⱥ����ȫ����Ϊ[0-1]�����
%rand('state',0);
ParSwarm=rand(SwarmSize,2*ParticleSize+1);

%������Ⱥ��λ��,�ٶȵķ�Χ���е���
for k=1:ParticleSize
          ParSwarm(:,k)=ParSwarm(:,k)*(ParticleScope(k,2)-ParticleScope(k,1))+ParticleScope(k,1);
          %�����ٶȣ�ʹ�ٶ���λ�õķ�Χһ��
          ParSwarm(:,ParticleSize+k)=ParSwarm(:,ParticleSize+k)*(ParticleScope(k,2)-ParticleScope(k,1))+ParticleScope(k,1);
end
          
%��ÿһ�����Ӽ�������Ӧ�Ⱥ�����ֵ

for k=1:SwarmSize
          ParSwarm(k,2*ParticleSize+1)=AdaptFunc(ParSwarm(k,1:ParticleSize));
end

%��ʼ������Ⱥ���Ž����
OptSwarm=zeros(SwarmSize+1,ParticleSize);
%����Ⱥ���Ž����ȫ����Ϊ��
[maxValue,row]=max(ParSwarm(:,2*ParticleSize+1));
%Ѱ����Ӧ�Ⱥ���ֵ���Ľ��ھ����е�λ��(����)
OptSwarm=ParSwarm(1:SwarmSize,1:ParticleSize);
OptSwarm(SwarmSize+1,:)=ParSwarm(row,1:ParticleSize);


% ����ĺ���BaseStepPsoʵ���˱�׼ȫ�ְ�����Ⱥ�㷨�ĵ�������λ���ٶȵĹ���
function [ParSwarm,OptSwarm]=BaseStepPso(ParSwarm,OptSwarm,AdaptFunc,ParticleScope,MaxW,MinW,LoopCount,CurCount)
%����������ȫ�ְ汾������������Ⱥ�㷨�ĵ�������λ��,�ٶȵ��㷨
%
%[ParSwarm,OptSwarm]=BaseStepPso(ParSwarm,OptSwarm,AdaptFunc,ParticleScope,MaxW,MinW,LoopCount,CurCount)
%
%���������ParSwarm:����Ⱥ���󣬰������ӵ�λ�ã��ٶ��뵱ǰ��Ŀ�꺯��ֵ
%���������OptSwarm����������Ⱥ�������Ž���ȫ�����Ž�ľ���
%���������ParticleScope:һ�������������и�ά�ķ�Χ��
%���������AdaptFunc����Ӧ�Ⱥ���
%���������LoopCount���������ܴ���
%���������CurCount����ǰ�����Ĵ���
%
%����ֵ������ͬ�����ͬ������
%
%�÷���[ParSwarm,OptSwarm]=BaseStepPso(ParSwarm,OptSwarm,AdaptFunc,ParticleScope,MaxW,MinW,LoopCount,CurCount)
%
%�쳣�����ȱ�֤���ļ���Matlab������·���У�Ȼ��鿴��ص���ʾ��Ϣ��
%
%�����ˣ�XXX
%����ʱ�䣺2007.3.26
%�ο����ף�XXX
%�ο����ף�XXX
%
%�޸ļ�¼
%----------------------------------------------------------------
%2007.3.27
%�޸��ˣ�XXX
% ���2*unifrnd(0,1).*SubTract1(row,:)�е�unifrnd(0,1)�������ʹ���ܴ�Ϊ���
%���ջ���MATLAB������Ⱥ�Ż��㷨�������
%
% �������ۣ�ʹ������汾�ĵ���ϵ����Ч���ȽϺ�
%

%�ݴ����
if nargin~=8
          error('����Ĳ�����������')
end
if nargout~=2
          error('����ĸ���̫�٣����ܱ�֤ѭ��������')
end

%��ʼ�������µĲ���

%*********************************************
%*****��������Ĵ��룬���Ը��Ĺ������ӵı仯*****
%---------------------------------------------------------------------
%���εݼ�����
w=MaxW-CurCount*((MaxW-MinW)/LoopCount);
%---------------------------------------------------------------------
%w�̶��������
%w=0.7;
%---------------------------------------------------------------------
%�ο����ף��¹������ֽ�Ԯ������������Ⱥ�Ż��㷨�Ĺ���Ȩֵ�ݼ������о���������ͨ��ѧѧ����2006��1
%w�����εݼ����԰������ݼ�
%w=(MaxW-MinW)*(CurCount/LoopCount)^2+(MinW-MaxW)*(2*CurCount/LoopCount)+MaxW;
%---------------------------------------------------------------------
%w�����εݼ����԰������ݼ�
%w=MinW*(MaxW/MinW)^(1/(1+10*CurCount/LoopCount));
%*****��������Ĵ��룬���Ը��Ĺ������ӵı仯*****
%*********************************************

%�õ�����ȺȺ���С�Լ�һ������ά������Ϣ
[ParRow,ParCol]=size(ParSwarm);
%�õ����ӵ�ά��
ParCol=(ParCol-1)/2;
SubTract1=OptSwarm(1:ParRow,:)-ParSwarm(:,1:ParCol);

%*********************************************
%*****��������Ĵ��룬���Ը���c1,c2�ı仯*****
c1=2;
c2=2;
%---------------------------------------------------------------------
%con=1;
%c1=4-exp(-con*abs(mean(ParSwarm(:,2*ParCol+1))-AdaptFunc(OptSwarm(ParRow+1,:))));
%c2=4-c1;
%----------------------------------------------------------------------
%*****��������Ĵ��룬���Ը���c1,c2�ı仯*****
%*********************************************
for row=1:ParRow
       SubTract2=OptSwarm(ParRow+1,:)-ParSwarm(row,1:ParCol);
       TempV=w.*ParSwarm(row,ParCol+1:2*ParCol)+2*unifrnd(0,1).*SubTract1(row,:)+2*unifrnd(0,1).*SubTract2;
       %�����ٶȵĴ���
       for h=1:ParCol
                   if TempV(:,h)>ParticleScope(h,2)
                               TempV(:,h)=ParticleScope(h,2);
                   end
                   if TempV(:,h)<-ParticleScope(h,2)
                               TempV(:,h)=-ParticleScope(h,2)+1e-10;
                               %��1e-10��ֹ��Ӧ�Ⱥ��������
                   end
       end 
       
       %�����ٶ�
       ParSwarm(row,ParCol+1:2*ParCol)=TempV;
       
       %*********************************************
       %*****��������Ĵ��룬���Ը���Լ�����ӵı仯*****
       %---------------------------------------------------------------------
       %a=1;
       %---------------------------------------------------------------------
       a=0.729;
       %*****��������Ĵ��룬���Ը���Լ�����ӵı仯*****
       %*********************************************
       
       %����λ�õķ�Χ
       TempPos=ParSwarm(row,1:ParCol)+a*TempV;
       for h=1:ParCol
                   if TempPos(:,h)>ParticleScope(h,2)
                               TempPos(:,h)=ParticleScope(h,2);
                   end
                   if TempPos(:,h)<=ParticleScope(h,1)
                               TempPos(:,h)=ParticleScope(h,1)+1e-10;                               
                   end
       end

       %����λ�� 
       ParSwarm(row,1:ParCol)=TempPos;
       
       %����ÿ�����ӵ��µ���Ӧ��ֵ
       ParSwarm(row,2*ParCol+1)=AdaptFunc(ParSwarm(row,1:ParCol));
       if ParSwarm(row,2*ParCol+1)>AdaptFunc(OptSwarm(row,1:ParCol))
                   OptSwarm(row,1:ParCol)=ParSwarm(row,1:ParCol);
       end
end
%forѭ������

%Ѱ����Ӧ�Ⱥ���ֵ���Ľ��ھ����е�λ��(����)������ȫ�����ŵĸı� 
[maxValue,row]=max(ParSwarm(:,2*ParCol+1));
if AdaptFunc(ParSwarm(row,1:ParCol))>AdaptFunc(OptSwarm(ParRow+1,:))
          OptSwarm(ParRow+1,:)=ParSwarm(row,1:ParCol);
end

% ���������������Ժ���Ҫһ����������������������װ�������Դ�ʵ��һ������������Ⱥ�㷨�������������PsoProcess
%    ���������£�
function [Result,OnLine,OffLine,MinMaxMeanAdapt]=PsoProcess(SwarmSize,ParticleSize,ParticleScope,InitFunc,StepFindFunc,AdaptFunc,IsStep,IsDraw,LoopCount,IsPlot)
%����������һ��ѭ��n�ε�PSO�㷨�������̣�����������е���С������ƽ����Ӧ��,�Լ�������������������
%[Result,OnLine,OffLine,MinMaxMeanAdapt]=PsoProcess(SwarmSize,ParticleSize,ParticleScope,InitFunc,StepFindFunc,AdaptFunc,IsStep,IsDraw,LoopCount,IsPlot)
%���������SwarmSize:��Ⱥ��С�ĸ���
%���������ParticleSize��һ�����ӵ�ά��
%���������ParticleScope:һ�������������и�ά�ķ�Χ��
%                         ParticleScope��ʽ:
%                               3ά���ӵ�ParticleScope��ʽ:
%                                                                                                       [x1Min,x1Max
%                                                                                                          x2Min,x2Max
%                                                                                                          x3Min,x3Max]
%
%�������:InitFunc:��ʼ������Ⱥ����
%�������:StepFindFunc:���������ٶȣ�λ�ú���
%���������AdaptFunc����Ӧ�Ⱥ���
%���������IsStep���Ƿ�ÿ�ε�����ͣ��IsStep��0������ͣ��������ͣ��ȱʡ����ͣ
%���������IsDraw���Ƿ�ͼ�λ��������̣�IsDraw��0����ͼ�λ��������̣�����ͼ�λ���ʾ��ȱʡ��ͼ�λ���ʾ
%���������LoopCount�������Ĵ�����ȱʡ����100��
%���������IsPlot�������Ƿ���������������������ܵ�ͼ�α�ʾ��IsPlot=0,����ʾ��
%                                                 IsPlot=1����ʾͼ�ν����ȱʡIsPlot=1
%
%����ֵ��ResultΪ����������õ������Ž�
%����ֵ��OnLineΪ�������ܵ�����
%����ֵ��OffLineΪ�������ܵ�����
%����ֵ��MinMaxMeanAdaptΪ�������������õ�����С������ƽ����Ӧ��
%
%�÷�[Result,OnLine,OffLine,MinMaxMeanAdapt]=PsoProcess(SwarmSize,ParticleSize,ParticleScope,InitFunc,StepFindFunc,AdaptFunc,IsStep,IsDraw,LoopCount,IsPlot);
%
%�쳣�����ȱ�֤���ļ���Matlab������·���У�Ȼ��鿴��ص���ʾ��Ϣ��
%
%�����ˣ�XXX
%����ʱ�䣺2007.3.26
%�ο����ף�XXXXX%

%�޸ļ�¼��
%���MinMaxMeanAdapt���Եõ�������������
%�޸��ˣ�XXX
%�޸�ʱ�䣺2007.3.27
%�ο����ף�XXX.

%�ݴ����
if nargin<4
          error('����Ĳ�����������')
end

[row,colum]=size(ParticleSize);
if row>1|colum>1
          error('��������ӵ�ά��������һ��1��1�е����ݡ�');
end
[row,colum]=size(ParticleScope);
if row~=ParticleSize|colum~=2
          error('��������ӵ�ά����Χ����');
end

%����ȱʡֵ
if nargin<7
          IsPlot=1;
          LoopCount=100;
          IsStep=0;
          IsDraw=0;
end
if nargin<8
          IsPlot=1;
          IsDraw=0;
          LoopCount=100;
end
if nargin<9
          LoopCount=100;
          IsPlot=1;
end
if nargin<10
          IsPlot=1;
end

%�����Ƿ���ʾ2ά��������ά����Ѱ�����ŵĹ���
if IsDraw~=0
          DrawObjGraphic(ParticleSize,ParticleScope,AdaptFunc);
end

%��ʼ����Ⱥ��                
[ParSwarm,OptSwarm]=InitFunc(SwarmSize,ParticleSize,ParticleScope,AdaptFunc)

%�ڲ��Ժ���ͼ���ϻ��Ƴ�ʼ��Ⱥ��λ��
if IsDraw~=0
          if 1==ParticleSize
              for ParSwarmRow=1:SwarmSize
                          plot([ParSwarm(ParSwarmRow,1),ParSwarm(ParSwarmRow,1)],[ParSwarm(ParSwarmRow,3),0],'r*-','markersize',8);
                          text(ParSwarm(ParSwarmRow,1),ParSwarm(ParSwarmRow,3),num2str(ParSwarmRow));
              end
          end

          if 2==ParticleSize
               for ParSwarmRow=1:SwarmSize
                          stem3(ParSwarm(ParSwarmRow,1),ParSwarm(ParSwarmRow,2),ParSwarm(ParSwarmRow,5),'r.','markersize',8);
               end
          end
end
          
%��ͣ��ץͼ
if IsStep~=0
          disp('��ʼ���������������')
          pause
end

%��ʼ�����㷨�ĵ���
for k=1:LoopCount
          %��ʾ�����Ĵ�����
          disp('----------------------------------------------------------')
          TempStr=sprintf('�� %g �˵���',k);
          disp(TempStr);
          disp('----------------------------------------------------------')
          
          %����һ���������㷨
          [ParSwarm,OptSwarm]=StepFindFunc(ParSwarm,OptSwarm,AdaptFunc,ParticleScope,0.95,0.4,LoopCount,k)
          
          %��Ŀ�꺯����ͼ���ϻ���2ά���µ����ӵ���λ��
          if IsDraw~=0
                      if 1==ParticleSize
                                  for ParSwarmRow=1:SwarmSize
                                              plot([ParSwarm(ParSwarmRow,1),ParSwarm(ParSwarmRow,1)],[ParSwarm(ParSwarmRow,3),0],'r*-','markersize',8);
                                              text(ParSwarm(ParSwarmRow,1),ParSwarm(ParSwarmRow,3),num2str(ParSwarmRow));
                                  end
                      end

                      if 2==ParticleSize
                                  for ParSwarmRow=1:SwarmSize
                                              stem3(ParSwarm(ParSwarmRow,1),ParSwarm(ParSwarmRow,2),ParSwarm(ParSwarmRow,5),'r.','markersize',8);
                                  end
                      end
          end
          
          XResult=OptSwarm(SwarmSize+1,1:ParticleSize);
          YResult=AdaptFunc(XResult);          
          if IsStep~=0
                      XResult=OptSwarm(SwarmSize+1,1:ParticleSize);
                      YResult=AdaptFunc(XResult);          
                      str=sprintf('%g������������Ŀ�꺯��ֵ%g',k,YResult);
                      disp(str);
                      disp('�´ε����������������');
                      pause
          end
          
          %��¼ÿһ����ƽ����Ӧ��
          MeanAdapt(1,k)=mean(ParSwarm(:,2*ParticleSize+1));
end
%forѭ��������־

%��¼��С������ƽ����Ӧ��
MinMaxMeanAdapt=[min(MeanAdapt),max(MeanAdapt)];
%������������������
for k=1:LoopCount
          OnLine(1,k)=sum(MeanAdapt(1,1:k))/k;
          OffLine(1,k)=max(MeanAdapt(1,1:k));
end

for k=1:LoopCount
          OffLine(1,k)=sum(OffLine(1,1:k))/k;
end

%��������������������������
if 1==IsPlot
          figure
          hold on
          title('������������ͼ')
          xlabel('��������');
          ylabel('��������');
          grid on
          plot(OffLine);

          figure
          hold on
          title('������������ͼ')
          xlabel('��������');
          ylabel('��������');
          grid on
          plot(OnLine);
end
%��¼���ε����õ������Ž��
XResult=OptSwarm(SwarmSize+1,1:ParticleSize);
YResult=AdaptFunc(XResult);
Result=[XResult,YResult];

end


