function [edited_data_binary, nz_index, removed_index] = testDataGen2(input_data, ratio)

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
removed_data  = 0.*input_data; 
for i = 1:1:no_removed
    edited_data(nz_idx1(removed_index(i)), nz_idx2(removed_index(i))) = 0; 
    removed_data(nz_idx1(removed_index(i)), nz_idx2(removed_index(i))) = value(i); 
end

% size(find(edited_data))
%  turn removed data into rating scale 5
edited_data_binary = cell(1); %zeros(size(edited_data, 1), size(edited_data, 2), 5); 

for i = 1:1:5
    edited_data_binary{i} = edited_data == i; 
end