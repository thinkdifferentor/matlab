%scor���Զ������;�����������������
function [V_over,D_over]=reorder_cart(P,V,D)  %P���� V�������� D��������
D=sum(D);  %���Խ���Ԫ����ȡ��DΪ�ԽǾ���
S=sum(D);
Df=0;
for ii=1:size(D,2)
    for jj=ii+1:size(D,2)
        if D(ii)>=D(jj)
            break;
        else
            buf1=D(ii);  
            D(ii)=D(jj);  %������ֵD����
            D(jj)=buf1;
            buf2=V(:,ii);
            V(:,ii)=V(:,jj);  %����Ӧ��������������
            V(:,jj)=buf2;
        end
    end
end
ii=1;
while Df/S<P
    Df=Df+D(ii);  %Ѱ��ǰii������ֵʹ��ռ������ʴ���P
    ii=ii+1;
end
    D_over=D(1:ii);
    V_over=V(:,1:ii);  %���ʴ���P������ֵ��Ӧ����������
end
