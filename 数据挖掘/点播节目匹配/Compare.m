%模糊匹配函数
function flag=Compare(str1,str2)
    %参数说明:flag：返回值说明 1为匹配0为不匹配；str1为参照字符串，str2为待匹配字符串
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