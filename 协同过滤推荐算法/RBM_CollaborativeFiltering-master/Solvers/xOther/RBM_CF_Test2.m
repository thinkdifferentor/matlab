function [error] = RBM_CF_Test2(input_data, ratio, visHid, hidBiases, visBiases, opts)
% ratio = 0.3;
% input_data = validate_data;
[edited_data_binary, nz_index, removed_index] = testDataGen2(input_data, ratio);

% testing the results 
% forward test
[out] = RBM_CF_Testing(edited_data_binary, visHid, hidBiases, visBiases, opts);

no_rating      = size(nz_index, 1);
no_removed     = round(no_rating * ratio); 
for i = 1:1:no_removed
    estimated_remove(i) = out(nz_index(removed_index(i), 1), nz_index(removed_index(i), 2)); 
    original(i)         = input_data(nz_index(removed_index(i), 1), nz_index(removed_index(i), 2)); 
    if original(i) > 5  original(i) = 5; end;
end

error = RMSE(estimated_remove (:), original(:)); 