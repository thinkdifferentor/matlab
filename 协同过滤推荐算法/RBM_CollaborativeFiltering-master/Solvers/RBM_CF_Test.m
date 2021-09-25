function [error, error2] = RBM_CF_Test(input_data, ratio, visHid, hidBiases, visBiases, opts)
% ratio = 0.3;
% input_data = validate_data;
[edited_data_binary, nz_index, removed_index, removed_data] = testDataGen(input_data, ratio);

% testing the results 
% forward test
[out] = RBM_CF_Testing(edited_data_binary, visHid, hidBiases, visBiases, opts);

no_rating      = size(nz_index, 1);
no_removed     = round(no_rating * ratio); 
for i = 1:1:no_removed
    estimated_remove(i) = out(nz_index(removed_index(i), 1), nz_index(removed_index(i), 2)); 
    original(i)         = input_data(nz_index(removed_index(i), 1), nz_index(removed_index(i), 2)); 
    if estimated_remove(i) > 5  estimated_remove(i) = 5; end;
    if estimated_remove(i) < 1  estimated_remove(i) = 1; end; 
end

error = RMSE(round(estimated_remove (:)), original(:)); 

% corrected error
for i = 1:1:no_removed
    if estimated_remove(i) > 5 estimated_remove(i) = 5; 
    elseif estimated_remove(i) < 0 estimated_remove(i) = 0; end; 
end;
error2 = RMSE(round(estimated_remove (:)), original(:)); 