%ģ��ƥ�亯��
function flag=Compare(str1,str2)
    %����˵��:flag������ֵ˵�� 1Ϊƥ��0Ϊ��ƥ�䣻str1Ϊ�����ַ�����str2Ϊ��ƥ���ַ���
    L1=length(str1);
    L2=length(str2);
    flag=0;
    
    for i=1:L2
        if( (i+L1-1)<=L2 )
            if (strcmp(str1,str2(i:i+L1-1)))
                flag=1;
                break;
            end
        else
            break;
        end
    end
end