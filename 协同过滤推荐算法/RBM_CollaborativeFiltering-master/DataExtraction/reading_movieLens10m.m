function [rating, opts] = reading_movieLens10m(data_type)
%	[rating_binary, opts] = reading_movieLens(data_type, )
% Function to extract data into severy type

data_type = 'ml-10m';

tdata 			= importdata(['DataExtraction\' data_type '\ratings.dat']);
data            = round(tdata(:, [1, 3, 5, 7]));
% user  			= importdata(['DataExtraction\' data_type '\users.dat']);
movies          = importdata(['DataExtraction\' data_type '\movies.dat']);
%
opts.no_user    = data(end, 1);
opts.no_movie   = max(data(:, 2));
opts.no_rating  = size(data, 1);
ratio           = [0.95, 0.025];
rMiniBatch      = 1/40; 

no_training 	= round(opts.no_user * ratio(1));  	% no_training should size_nimibatch * no_miniBatch
sizeMiniBatch   = round(rMiniBatch * opts.no_user);
no_MiniBatch 	= round(no_training/ sizeMiniBatch);
no_training 	= no_MiniBatch * sizeMiniBatch;
% ratio(1)		= no_training / opts.no_user;

% training data with batch
for i = 1:1:no_MiniBatch
    cur_id = (i-1)*sizeMiniBatch; 
    batch       = sparse(sizeMiniBatch, opts.no_movie); 
    for j = 1:1:sizeMiniBatch
        idx     = find(data(:, 1) == (cur_id + j));
        batch(j, data(idx, 2))   = data(idx, 3);
    end
    % converting to Binary
    for j = 1:1:5
        train_data{i}{j} = batch == j;
    end
    display(['Extract trainning data: batch ' num2str(i) '/' num2str(no_MiniBatch)]);
end

% validation data
display(['Extract Validate data']);

no_validating 	= round(opts.no_user * ratio(2));
cur_idx         = no_MiniBatch * sizeMiniBatch  + 1; 

validate_data   = zeros(no_validating, opts.no_movie); 
for i = cur_idx:1:cur_idx + no_validating
    idx     = find(data(:, 1) == i);
    validate_data(i - cur_idx + 1, data(idx, 2))   = data(idx, 3);
end;

% Testing data 
display(['Extract Test data']);
no_testing 		= opts.no_user - no_training - no_validating;
cur_idx         = no_MiniBatch * sizeMiniBatch  + no_validating + 1; 
test_data       = zeros(no_testing, opts.no_movie); 
for i = cur_idx:1:cur_idx + no_testing
    idx     = find(data(:, 1) == i);
    test_data(i - cur_idx + 1, data(idx, 2))   = data(idx, 3);
end;

save(['DataExtraction\' data_type '_' num2str(ratio(1)) '_' num2str(ratio(2)) '.mat'], 'train_data', 'validate_data', 'test_data', 'opts');