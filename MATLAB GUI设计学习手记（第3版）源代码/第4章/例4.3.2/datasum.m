function datasum()
%�ļ�����datasum.m
%���÷���������������datasumȻ��س�
% ���ߣ��޻���
% �汾��V1.2
data = [1 : 5; 2 : 6; 3 : 7];
data2 = cell(size(data) + 1);
data2(1 : end-1, 1 : end-1) = num2cell(data);
h = figure('NumberTitle', 'off', 'Position', [200 200 700 200], 'Name', '��4.3.2ʾ��');
uitable('parent', h, 'units', 'normalized', 'Position', [0.1 0.1 0.8 0.8], 'Data',...
    data2, 'ColumnEditable', true, 'FontSize', 10, 'CellSelectionCallback',...
    @cellsel_callback, 'CellEditCallback', @celledit_callback);
end

%% CellSelectionCallback�ص�����
 function cellsel_callback(hTab, event)
 if ~isempty(event.Indices)
     data = get(hTab, 'Data');
     iLine = event.Indices(1);
     iColumn = event.Indices(2);
     if (iLine == size(data, 1) && iColumn < size(data, 2)) 
         data{end, iColumn} = sum(cell2mat(data(1 : end-1, iColumn)));
     elseif (iColumn == size(data, 2) && iLine < size(data, 1))
         data{iLine, end} = sum(cell2mat(data(iLine, 1 : end-1)));
     end
     set(hTab, 'Data', data);
 end
 end
 
 %% CellEditCallback�ص�����
 function celledit_callback(hTab, event)
 if isempty(event.Error)
     data = get(hTab, 'Data');
     iLine = event.Indices(1);
     iColumn = event.Indices(2);
     if (iLine < size(data, 1) && iColumn < size(data, 2))
         if ~isempty(data{iLine, end})
             data{iLine, end} = sum(cell2mat(data(iLine, 1 : end-1)));
         end
         if ~isempty(data{end, iColumn})
             data{end, iColumn} = sum(cell2mat(data(1 : end-1, iColumn)));
         end
         set(hTab, 'Data', data);
     end
 end
 end
