function [rating_binary, opts] = reading_movieLens1m(data_type)
%	[rating_binary, opts] = reading_movieLens(data_type, )
% Function to extract data into severy type 

% data_type = 'ml-1m';

tdata 			= importdata(['DataExtraction\' data_type '\ratings.dat']); 
data            = tdata(:, [1, 3, 5,7]); 
user  			= importdata(['DataExtraction\' data_type '\users.dat']);
movies          = importdata(['DataExtraction\' data_type '\movies.dat']);

opts.no_user = size(user.data, 1); 
opts.no_movie = size(movies, 1); 
opts.no_rating = size(data, 1); 

rating_binary = zeros(opts.no_user, opts.no_movie, 5); 
rating 		  = zeros(opts.no_user, opts.no_movie); 

for i = 1:1:opts.no_rating    
    rating_binary(data(i, 1), data(i, 2), data(i, 3)) = 1;     
	rating(data(i, 1), data(i, 2)) = data(i, 3); 
end;
opts.rating = rating; 