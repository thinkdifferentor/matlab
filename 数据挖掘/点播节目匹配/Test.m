
%�������� ��Ŀ����/���
L1=length(ID);

%����㲥��Ϣ �û���/��Ŀ����/�ۿ�ʱ��/��Ӧ���(��Ҫƥ����)
L2=length(Match);

tic
%��ʼƥ��
for i=1:L2%�ó�һ���㲥��¼
    for j=1:L1%�ڹ������ƥ��
       if( Compare(name{j},Match{i}) )
            Result(i)=ID(j);
            break;
       end
    end
end
toc