function y = str2poly(x)
%�Ѷ���ʽ���ַ�����ʾת��Ϊ��������ʾ���ٶ��Ա���Ϊx
%x���ַ�����ʽ�Ķ���ʽ
%y����������ʽ�Ķ���ʽ
% ���ߣ��޻���
% �汾�� V1.2
% ʱ�䣺2014.8.18
%�����ʽ���
    if(~ischar(x))   
            errordlg('����������������һ���ַ�����');
            return;
    end;
    x = regexprep(x, '[ |*]', ''); %ȥ���ո�*��
    tmp = regexp(x,'(?<=(x\^))\d+(?=[+-])', 'match'); %��ȡ�ݴ�
    n = str2double(tmp);
    len = max(n) + 1;
    y = zeros(1, len);
    tmp = regexp(x, '[+-]?\d*x', 'match'); %��ȡϵ��
    for i = 1 : length(tmp)
        if (strcmp(tmp{i}, 'x')) || (strcmp(tmp{i}, '+x'))
            tmp{i} = '1';
        elseif strcmp(tmp{i}, '-x')
            tmp{i} = '-1';
        else
            tmp{i} = tmp{i}(1:end-1);
        end
    end 
    factor = str2double(tmp);
    for(m = 1 : length(n)) %matlab֧�ֲ������ŷָ��ؼ��ֵ��﷨�ṹ
       y(n(m)+1) = factor(m);%�����ݴκ�ϵ������þ�������
    end
    if(length(n) == length(factor) - 1)%1���ݵ�������
        y(2) = factor(end);
    end
    tmp = str2double(regexp(x,'[+-]\d+$','match'));%��ȡ0����
    if ~isnan(tmp)
        y(1) = tmp;
    end    
    y = fliplr(y);
end
