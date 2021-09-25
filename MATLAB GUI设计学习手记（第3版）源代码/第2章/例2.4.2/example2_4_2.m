[nData, strCell] = xlsread('data.xls');                    %��ȡEXCEL�ļ�
nLines = size(nData, 2);                                      %��ȡ���ݵ�����
str = input('���������:\n', 's');                             %��������ʾ����ؼ��֣�������str��
str = upper(str);                                                    %������ؼ����е�Сд��ĸת��Ϊ��д��ĸ
while ~strcmp(str, 'Q')                                          %������Ĺؼ��ֲ���Q��q
    index = strfind(strCell, str);                              %���ҹؼ��֣����ذ����ؼ��ֵ���
    if ~isequal(index, cell(size(nData, 1), 1))         %�ж�index�Ƿ�Ϊ1��6��1�Ŀյ�Ԫ����
        for i =1 : length(index)                                  %������������ؼ��ֵ��е����ݵ�������
            if ~isempty(index{i})
                strFormat = ['���룺%s\n\t' repmat('%8.4f', 1, nLines)];
                str_disp = sprintf(strFormat, strCell{i}, nData(i, :));     %��ʽ��Ҫ���������
                disp(str_disp);                                          %��ʾ��ʽ���������
            end
        end
    else
        disp('û���ҵ�����������');                     %û�г��ҵ�������������
    end
    str = input('���������:\n', 's');                         %ѭ����ʾ����ؼ���
    str = upper(str);                                                    %������ؼ����е�Сд��ĸת��Ϊ��д��ĸ
end
