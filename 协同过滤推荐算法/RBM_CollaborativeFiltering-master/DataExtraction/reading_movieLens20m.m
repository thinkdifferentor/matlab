function [rating_binary, opts] = reading_movieLens20m(data_type)
%	[rating_binary, opts] = reading_movieLens(data_type, )
% Function to extract data into severy type 

% data_type = 'ml-1m';

tdata 			= importdata(['DataExtraction\' data_type '\ratings.csv']); 
data            = tdata.data; 
movies          = importdata(['DataExtraction\' data_type '\movies.csv']);

opts.no_user = data(end, 1); 
opts.no_movie = size(movies, 1); 
opts.no_rating = size(data, 1); 

rating_binary = zeros(opts.no_user, opts.no_movie, 5); 
rating 		  = zeros(opts.no_user, opts.no_movie); 

for i = 1:1:opts.no_rating    
    rating_binary(data(i, 1), data(i, 2), data(i, 3)) = 1;     
	rating(data(i, 1), data(i, 2)) = data(i, 3); 
end;
opts.rating = rating; 