% 文件名称索取：
function [ str ] = rename( i )
    %RENAME Summary of this function goes here
    % Detailed explanation goes here
    if i<=10
        str=strcat('00',int2str(i-1),'.bmp');
    else if i<=100
        str=strcat('0',int2str(i-1),'.bmp');
    else
        str=strcat(int2str(i-1),'.bmp');
        end
    end
end
