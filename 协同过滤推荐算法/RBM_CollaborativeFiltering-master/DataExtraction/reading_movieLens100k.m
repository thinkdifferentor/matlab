function [rating_binary, opts] = reading_movieLens100k(data_type)
%	[rating_binary, opts] = reading_movieLens(data_type, )
% Function to extract data into severy type 
%data_type = 'ml-100k';
data 			= importdata(['DataExtraction\' data_type '\u.data']); 
%info  			= importdata(['DataExtraction\' data_type '\u.info']);
%opts.genre 		= importdata(['DataExtraction\' data_type '\u.genre']);
%opts.item 		= importdata(['DataExtraction\' data_type '\u.item']);
%opts.occupation = importdata(['DataExtraction\' data_type '\u.occupation']);

opts.no_user = 943; 
opts.no_movie = 1682; 
opts.no_rating = 100000; 

rating_binary = zeros(opts.no_user, opts.no_movie, 5); 
rating 		  = zeros(opts.no_user, opts.no_movie); 

for i = 1:1:opts.no_rating    
    rating_binary(data(i, 1), data(i, 2), data(i, 3)) = 1;     
	rating(data(i, 1), data(i, 2)) = data(i, 3); 
end;
opts.rating = rating; 
display(['Done reading datat!']);