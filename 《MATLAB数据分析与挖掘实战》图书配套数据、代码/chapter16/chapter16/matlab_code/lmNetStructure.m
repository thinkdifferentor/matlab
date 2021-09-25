function lmNetStructure(trnInputNum,midNodeNum,figPath,figName,figSet)
%%%---��ز���˵��---%%%
%%trainInputNum, ����ڵ���
%%midNodeNum , �����ڵ���
%%fieldName���ֶ�������һ�����飬��Ӧ����ṹͼ���������������
            % {'ZN','CU','��������','T-P','ʯ����','COD','DO','�Ͳ����'};���һ��Ϊ���������
%%figurePath��ͼƬ·��
%%figureName��ͼƬ��

fldName=cell(1,trnInputNum+1);
for i=1:trnInputNum
   fldName{1,i}=['x' num2str(i)]; 
end
fldName{1,trnInputNum+1}='y';
gcf=figure;
set(gca,'fontname','����');
hold on;

%%%������ݸ�ֵ����ֻ�ڳ�����Խ׶��ã�ʵ��ͨ����������
% ��һ���������
%trainInputNum=7;
%midNodeNum=5;
%figurePath='E:\image';
%figureName='lmStructure';
%fieldName={'ZN','CU','��������','T-P','ʯ����','COD','DO','�Ͳ����'};
%figureSet = [7;520;360];

% �ڶ����������
% trnInputNum=2;
% midNodeNum=6;
% figPath='E:\image';
% figName='lmStructure.png';
% % fldName={'ZN','CU','�Ͳ����'};
% fldName={'x1','x2','y'};

%figSet = [7;520;360];
%%---------------

I=trnInputNum; % ����ڵ���
M=midNodeNum;    % �����ڵ���
t=2;               % ����㡢�������Լ������ļ������


%ͼƬ���ø�ֵ
fontSize=figSet(1);
figLength=figSet(2);
figWidth=figSet(3);

fldName1 = {'�����','������','�����'};  %lm����������ṹע��

ci=0.18*exp(linspace(0,pi*2,100)*1i);
outputNode=fill(5*t+real(ci),(I+1)/2+imag(ci),'k');
text(double(5*t+0.5),double((I+1)/2),'\rightarrow','fontsize',12);
text(double(5*t+0.5),double((I+1)/2+1),fldName{1,end},'fontsize',fontSize);
text(double(t-0.5),double(min(1,(I-M)/2)-1),fldName1{1,1},'fontsize',fontSize);
text(double(3*t-0.5),double(min(1,(I-M)/2)-1),fldName1{1,2},'fontsize',fontSize);
text(double(5*t+0.5),double(min(1,(I-M)/2)-1),fldName1{1,3},'fontsize',fontSize);
title('lm������ṹͼ');

for node=1:M
    f(node)=fill(3*t+real(ci),node+(I-M)/2+imag(ci),'k');
    plot([3*t,5*t],[node+(I-M)/2,(I+1)/2],'k','linewidth',1);
    for j=1:I
        f(j)=fill(t+real(ci),j+imag(ci),'k');
        text(t-1,j,'\rightarrow','fontsize',12);
        text(t-3,I - j + 1,fldName{1,j},'fontsize',fontSize);
        plot([3*t,t],[node+(I-M)/2,j],'k','linewidth',1); 
    end
end  

set(gcf, 'PaperPositionMode', 'auto', 'Position', [100,200, figLength, figWidth]);
set(gcf, 'visible', 'off');%%ʹͼ�β���������
axis([t-4 5*t+3 min(1,(I-M)/2)-2 max(I+1,(I+M)/2+1)]);
axis off;

%% ����ͼ���ļ�

if isempty(figName)==0  %%%����ļ�������Ϊ�յ�ʱ�򣬾ͱ���ͼ�Σ����򲻱���     
    figPathName=strcat(figPath,'\',figName);
    print(gcf,'-dpng',figPathName); %��ͼ�α���Ϊjpeg/jpg��ʽ��ͼƬ��
end








