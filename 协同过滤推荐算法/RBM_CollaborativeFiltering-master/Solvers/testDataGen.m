function [edited_data_binary, nz_index, removed_index, removed_data] = testDataGen(input_data, ratio)

%% Remove 5% of rating 
[nz_idx1, nz_idx2, value] = find(input_data); 
no_rating      = length(nz_idx1(:));
nz_index       = [nz_idx1 nz_idx2];

% make it zeros 
no_removed     = round(no_rating * ratio); 

% random select user 
removed_index  = randperm(no_rating, no_removed);

% removed data 
edited_data   = input_data;  %size(find(edited_data))
removed_data  = value(removed_index); 
for i = 1:1:no_removed
    edited_data(nz_idx1(removed_index(i)), nz_idx2(removed_index(i))) = 0; 
    %removed_data(nz_idx1(removed_index(i)), nz_idx2(removed_index(i))) = value(i); 
end

% size(find(edited_data))
%  turn removed data into rating scale 5
edited_data_binary = zeros(size(edited_data, 1), size(edited_data, 2), 5); 

[x, y, v] = find(edited_data); 
for i = 1:1:length(x)
    edited_data_binary(x(i), y(i), v(i)) = 1; 
end