rowName = {'¦Á', '¦Â'};
columnName = {'<html>a<sub>1</html>', '<html>a<sub>2</html>'};
data = cell(2, 2);
data{1, 1} = '<html>x<sup>1</html>';
data{1, 2} = '<html>x<sup>2</html>';
data{2, 1} = '<html>y<sup>1</html>';
data{2, 2} = '<html>y<sup>2</html>';
uitable('data', data, 'RowName', rowName, 'ColumnName', columnName, 'FontSize', 12);
