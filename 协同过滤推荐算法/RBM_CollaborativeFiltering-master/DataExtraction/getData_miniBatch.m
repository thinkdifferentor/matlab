function [train_data, validate_rating, test_rating, opts] = getData_miniBatch(data_type, data_mode, ratio, noBatch)
% batchData = getData(data_type, no_user, no_movie)
%   Function to get the data
%   - Input:
%       + data_type:
%           1. "random" - random generated,
%           2. "curve" - generated based on family of curves with interpolation,
%           3. 'MovieLens' - data from MovieLens database,
%           4. "Netflix" - data from Netflix challenge database
%       + no_user: number of user
%       + no_movie: number of movie
%       + rating_scale: the rating scale (0,1, ..., K), we fixed to 5
%       + rating_ratio: the percentage of rating. <--- not neccessary
% if ~exist(rating_scale) rating_scale = 5; end;

test = 0;
if test == 1
    data_type = 'ml-1m';
    data_mode = 'seq'; %1-sequence, 2-random
    ratio     = [0.8 0.1];
    noBatch   = 1;
end

file_name_train = ['DataExtraction\' data_type '_' data_mode '_ratio' num2str(ratio(1)) ...
    '_' num2str(ratio(2)) '_noBatch' num2str(noBatch) '.mat'];
if (exist(file_name_train, 'file'))
    load(file_name_train);
else
    file_name_data = ['DataExtraction\' data_type '.mat'];
    if(exist(file_name_data, 'file'))
        load(file_name_data);
    else
        [data, rating, opts] = reading_movieLens(data_type);
        save(file_name_data, 'data', 'rating', 'opts');
    end
    
    no_training 	= round(opts.no_user * ratio(1));  	% no_training should size_nimibatch * no_miniBatch
    no_validating 	= round(opts.no_user * ratio(2));
    %no_testing 		= opts.no_user - no_training - no_validating;
    
    switch data_mode
        case 'seq'
            train_rating    = rating(1:no_training, :);   
            % validation data 
            validate_rating = rating(no_training + 1: no_training + no_validating, :); 
            test_rating     = rating(no_training + no_validating + 1:end, :); 
            
        case 'rand'
            data_index = randperm(opts.no_user, no_training);
            train_rating   = rating(data_index, :);
            remain_index = setdiff(data_index, [1:opts.no_user]); 
            validate_rating= rating(remain_index(1:no_validating), :); 
            test_rating    = rating(remain_index(no_validating + 1:end), :); 
    end
    length(find(rating(:)))
    opts.no_train_rating    = length(find(train_rating(:))); 
    opts.no_validate_rating = length(find(validate_rating(:))); 
    opts.no_test_rating     = length(find(test_rating(:))); 
    opts.rating_ratio(1)    = opts.no_train_rating/opts.no_rating; 
    opts.rating_ratio(2)    = opts.no_validate_rating/opts.no_rating; 
    opts.rating_ratio(3)    = opts.no_test_rating/opts.no_rating; 
    
    % making batch data of size sizeMiniBatch
    batchSize          = round(no_training / noBatch);
    for i = 1:1:noBatch
        cur_id = [(i-1)*batchSize + 1: i * batchSize];
        batch  = train_rating(cur_id , :);
        
        % converting to Binary
        for j = 1:1:5
            train_data{i}{j} = batch == j;
        end
        display(['Extract trainning data: batch ' num2str(i) '/' num2str(noBatch)]);
    end
    
    save(file_name_train, 'train_data', 'train_rating', 'validate_rating', 'test_rating', 'opts')
end
display('Done Generating Minibatch!');