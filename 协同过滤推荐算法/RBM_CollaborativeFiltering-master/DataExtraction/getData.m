function [train_data, validate_data, test_data, opts] = getData(data_type, ratio)
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

switch data_type
    case 'random'
        rating_ratio = 0.05; 
        batchdata   = zeros(no_user, no_movie, rating_scale);
        for i = 1:1:rating_scale
            batchdata(:, :, i)	= rand(noUser, noMovie, noBatch) < rating_ratio;
        end;        
    case 'curve'
    case 'MovieLens-100k'
        if (exist(['DataExtraction\MovlieLens-100k_ratio' num2str(ratio(1)) ...
                    '_' num2str(ratio(2)) '.mat'], 'file'))
            load(['DataExtraction\MovlieLens-100k_ratio' num2str(ratio(1)) ...
                    '_' num2str(ratio(2)) '.mat']); 
        else
            [rating, opts]  = reading_movieLens('ml-100k');
            % 60% for training, 20% for validation, and 20% for testing 
            no_training 	= round(opts.no_user * ratio(1));  	% no_training should size_nimibatch * no_miniBatch  
			
            no_validating 	= round(opts.no_user * ratio(2));
            no_testing 		= opts.no_user - no_training - no_validating; 

            train_data 	    = rating(1:no_training, :, :);			
            validate_data 	= opts.rating(no_training+ 1: 1+no_training + no_validating, :);
            test_data 		= opts.rating(end - no_testing:end, :);
			
			opts.ratio 		= ratio; 
            save(['DataExtraction\MovlieLens-100k_ratio' num2str(ratio(1)) '_' num2str(ratio(2)) ...
                            '.mat'], 'train_data', 'validate_data', 'test_data', 'opts'); 
        end;
    case 'Netflix'
        
end
