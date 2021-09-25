function[w1,b1,w2,b2,trnAcc,ptrn,trnTime,trnMse]=lmNetTrain(numeric,trnD,midNodeNum,trnPara,trnFun,figPath,trnFigName,figSet)
%��ʱ��ʼ
tic;
%%%%���ݽ�����trnD�Ǻ���ID�ģ�������ȥID����
% NNTWARN OFF  %�ر�������ľ�����Ϣ
nntwarn off
% fldName=regexp(fldName,',','split');
p=trnD(:,2:end-1)';
t=trnD(:,end)';

%% �������������
% �����������
MidDim=midNodeNum;       %�м��ڵ���
% ����ѵ������
df=trnPara(1);           %��ʾ������� 25
me=trnPara(2);           %���ѭ������ 1000
eg=trnPara(3);           %Ŀ����� 0.02
lr=trnPara(4);           %ѧϰ���� 0.001
lrInc=trnPara(5);        %ѧϰ�������ӱ��� 0.001
lrIdec=trnPara(6);       %ѧϰ���ʼ��ٱ��� 10
momConst=trnPara(7);     %�������� 0.1
errRatio=trnPara(8);     %��������� 1e10
%ѵ��������ֵ
trnFun=regexp(trnFun, ',', 'split');
InputFun=trnFun{1};      %����㵽�м��Ĵ��ݺ���
OutputFun=trnFun{2};     %�м�㵽�����Ĵ��ݺ���

%%& ͼƬ���Ƹ�ֵ

trnFigName=regexp(trnFigName, ',', 'split');
figName1=trnFigName{1};
figName2=trnFigName{2};
figName3=trnFigName{3};
figName4=trnFigName{4};

%ͼƬ���ø�ֵ
fontSize=figSet(1);
figLength=figSet(2);
figWidth=figSet(3);



tp=[df me eg lr lrInc lrIdec momConst errRatio];
[r,q]=size(p);
[s2,q]=size(t);
[w1,b1]=rands(MidDim,r);
[w2,b2]=rands(s2,MidDim);

% [msgstr, msgid] = lastwarn;  %�鿴��һ��warning��message ID
% warning('off', msgid);    %�ص���

%% ������ѵ��
[w1,b1,w2,b2,epochs,trnMse]=trainlm(w1,b1,InputFun,w2,b2,OutputFun,p,t,tp);
close;
trnMse=trnMse';

%% ����ѵ��������������
ptrn=simuff(p,w1,b1,InputFun,w2,b2,OutputFun)';%ѵ������ģ��ϵͳ���
%% ���㽨ģ�׶η���׼ȷ��
trnAccNum=0;
[trnDM,trnDN]=size(trnD);
for i=trnDM:-1:1    %%���ڴ�Ԥ����
    if round(ptrn(i))==round(trnD(i,end))
        trnAccNum=trnAccNum+1;
    end
end
trnAcc=trnAccNum/trnDM*100; %train_acc��ģ�׶η���׼ȷ��

%% ѵ���Ͳ��Ե����仯ͼ
if isempty(figName2)==0
    f2=figure;
    set(gca,'fontname','����');
    [trnMseM,trnMseN]=size(trnMse);
    set(gca,'fontsize',fontSize);
    plot(1:trnMseM, trnMse(1:trnMseM), 'k-');
    title('ѵ���������ͼ');
    xlabel('ѵ������');
    ylabel('������');
    set(f2,'PaperPositionMode','auto','Position',[100,200,figLength,figWidth]);
    set(f2,'visible','off');%%%ʹͼ�β���������
    print(f2,'-dpng',strcat(figPath,'\',figName2));
end

%% ���Ʒ���Ԥ��ͼ
if isempty(figName3)==0
    f3=figure('Name','����Ԥ��ͼ','NumberTitle','off','MenuBar','none');
    iconfilename='F:\\Matlab_1\\logo.jpg';
    chgicon(f3,iconfilename);
    set(gca,'fontname','����');
    [ptrnM,ptrnN]=size(ptrn); 
    grid on;
    set(gca,'fontsize',fontSize) ;  
    ptrnCopy=ptrn;
    if numeric==0
        ptrnCopy=round(ptrn);
    end
    plot(1:trnDM,trnD(1:trnDM,end),'k.',1:ptrnM,ptrnCopy(1:ptrnM),'rx');
     axis([0 trnDM+10  min(trnD(:,trnDN))-1   max(trnD(:,trnDN))+1]);%����������ķ�Χ
    title('ѵ������Ԥ����');
    if numeric==0
        legend('ԭʼ���','Ԥ�����');
    else
        legend('ʵ��ֵ','Ԥ��ֵ');
    end
    xlabel('�������');
    ylabel('Ԥ����');
    % % %����ͼƬ����Ĵ�С������ʾ��[100,200,400,300]�������£�
    set(f3,'PaperPositionMode','auto','Position',[100,200,figLength,figWidth]);
    set(f3,'visible','off');%%%ʹͼ�β���������
    print(f3,'-dpng',strcat(figPath,'\',figName3));
end
%% ����ѵ���������ͼ
if numeric==1
    f4=figure;
    set(gca,'fontname','����');
    set(gca,'fontsize',fontSize);
    trnErrY=(ptrn./trnD(:,end)-1)*100;
    % train_err_y=ptrain-train_data(:,end);
    maxY=max(trnErrY);
    minY=min(trnErrY);
    plot(trnErrY);  
    axis([0,length(trnErrY)+10,minY-1,maxY+1]);  
    title('ѵ���������ͼ');
    xlabel('�������');
    ylabel('������(%)');
    set(f4,'PaperPositionMode','auto','Position',[100,200,figLength,figWidth]);
    set(f4,'visible','off');%%%ʹͼ�β���������
    print(f4,'-dpng',strcat(figPath,'\',figName4));
end
%% ��������ṹͼ
lmNetStructure(size(trnD,2)-2,midNodeNum,figPath,figName1,figSet);
trnTime=toc; %����ʱ��
end