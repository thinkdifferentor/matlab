%ģ��ƥ�亯��
function flag=Compare2(str1,str2)
    %����˵��:flag������ֵ˵�� 1Ϊƥ��0Ϊ��ƥ�䣻str1Ϊ�����ַ�����str2Ϊ��ƥ���ַ���
    L1=length(str1);
    L2=length(str2);
    flag=0;
    if(L1<L2)
        if (strcmp(str1,str2(1:L1)))
             flag=1;
        end
    end
end