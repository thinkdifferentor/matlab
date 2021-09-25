function [tstAcc,ptst,tstTime] = lmNetTest(numeric,tstD,w1,b1,w2,b2,trnFun,figPath,tstFigName,figSet)
%��ʱ��ʼ
tic;
% NNTWARN OFF%�ر�������ľ�����Ϣ 
nntwarn off
%ע�⣬�����tstD�Ǻ���ID�ģ���һ�в����뽨ģ��
p=tstD(:,2:end-1);
[tstDM,tstDN]=size(tstD);
%ѵ��������ֵ

trnFun=regexp(trnFun, ',', 'split');
InputFun=trnFun{1};%%%����㵽�м��Ĵ��ݺ���
OutputFun=trnFun{2};%%�м�㵽�����Ĵ��ݺ���


%%& ͼƬ���Ƹ�ֵ

tstFigName=regexp(tstFigName, ',', 'split');
figName5=tstFigName{1};

%ͼƬ���ø�ֵ
fontSize=figSet(1);
figLength=figSet(2);
figWidth=figSet(3);

%�������
ptst=simuff(p',w1,b1,InputFun,w2,b2,OutputFun);
%% ������Խ׶η���׼ȷ��
tstAccNum=0;
for i=tstDM:-1:1  %%���ڴ�Ԥ����
    if round(ptst(i))==round(tstD(i,end))
        tstAccNum=tstAccNum+1;
    end
end
tstAcc=tstAccNum/tstDM*100; %test_acc���Խ׶η���׼ȷ��
ptst=ptst';
%% ��ͼ
if isempty(figName5)==0 %%%����ļ�������Ϊ�յ�ʱ�򣬾ͻ�ͼ�����򲻻���
    % % %% ����ͼ��
    f5=figure('Name','����Ԥ��ͼ','NumberTitle','off','MenuBar','none');
    iconfilename='F:\\Matlab_1\\logo.jpg';
    chgicon(f5,iconfilename);
    set(gca,'fontname','����');
    [tstDM,tstDN]=size(tstD);  
    grid on;
    set(gca,'fontsize',fontSize) ;   
    ptstCopy=ptst;
    if numeric==0
        ptstCopy=round(ptst);
    end
    plot(1:tstDM,tstD(1:tstDM,end),'k.',1:tstDM,ptstCopy(1:tstDM),'bx')
    axis([0 tstDM+10  min(tstD(:,tstDN))-1   max(tstD(:,tstDN))+1]);%����������ķ�Χ
    title('��������Ԥ����');
    if numeric==0
        legend('ԭʼ���','Ԥ�����');
    else
        legend('ʵ��ֵ','Ԥ��ֵ');
    end
    xlabel('�������');
    ylabel('Ԥ����');
    % % %����ͼƬ����Ĵ�С������ʾ��[100,200,400,300]�������£�
    set(f5,'PaperPositionMode','auto','Position',[100,200,figLength,figWidth]);
    set(f5,'visible','off');%%%ʹͼ�β���������
    print(f5,'-dpng',strcat(figPath,'\',figName5));
end
%% ��������������ͼ
if numeric==1
    figName6=tstFigName{2};
    f6=figure('Name','�����������ͼ','NumberTitle','off','MenuBar','none');
    iconfilename='F:\\Matlab_1\\logo.jpg';
    chgicon(f6,iconfilename);
    set(gca,'fontname','����');
    set(gca,'fontsize',fontSize) ;  
    tstErrY=(ptst./tstD(:,end)-1)*100;
    %_%trainErrY=ptrn-trnD(:,end);
    maxY=max(tstErrY);
    minY=min(tstErrY);
    plot(tstErrY);  
    axis([0,length(tstErrY)+10,minY-1,maxY+1]);  
    title('�����������ͼ');
    xlabel('�������');
    ylabel('������(%)');
    set(f6,'PaperPositionMode','auto','Position',[100,200,figLength,figWidth]);
    set(f6,'visible','off');%%%ʹͼ�β���������
    print(f6,'-dpng',strcat(figPath,'\',figName6));
end
%����ʱ��
tstTime=toc;
end

