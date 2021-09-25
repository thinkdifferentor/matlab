function [data, rating, opts] = reading_movieLens(data_type)

test = 0;
if test == 1
    data_type = 'ml-100k';
end;

switch data_type
    case 'ml-100k'
        data = importdata(['DataExtraction\' data_type '\u.data']);     
        movie_data = importdata(['DataExtraction\' data_type '\u.item']);
        opts.no_user = 943;
        opts.no_movie = 1682;
        opts.no_rating = 100000;
        for i = 1:1:opts.no_movie
            tmp = movie_data{i}; 
            k   = strfind(tmp, '|'); 
            movie.id(i)   = tmp(1); 
            movie.name{i} = tmp(k(1)+1:k(2)-1);
        end
        opts.movie = movie; 
    case 'ml-1m'
        tdata 			= importdata(['DataExtraction\' data_type '\ratings.dat']);
        data            = tdata(:, [1, 3, 5,7]);
        user  			= importdata(['DataExtraction\' data_type '\users.dat']);
        movies          = importdata(['DataExtraction\' data_type '\movies.dat']);
        
        opts.no_user    = size(user.data, 1);
        opts.no_movie   = size(movies, 1);
        opts.no_rating  = size(data, 1);
        
    case 'ml-10m'
        tdata 			= importdata(['DataExtraction\' data_type '\ratings.dat']);
        data            = round(tdata(:, [1, 3, 5, 7]));
        % user  			= importdata(['DataExtraction\' data_type '\users.dat']);
        movies          = importdata(['DataExtraction\' data_type '\movies.dat']);
        %
        opts.no_user    = data(end, 1);
        opts.no_movie   = max(data(:, 2));
        opts.no_rating  = size(data, 1);
        
    case 'ml-20m'
        tdata 			= importdata(['DataExtraction\' data_type '\ratings.csv']);
        data            = tdata.data;
        movies          = importdata(['DataExtraction\' data_type '\movies.csv']);
        
        opts.no_user = data(end, 1);
        opts.no_movie = size(movies, 1);
        opts.no_rating = size(data, 1);        
end

%% Extract rating
rating = sparse(opts.no_user, opts.no_movie); 
for i = 1:1:opts.no_user
    idx_user = find(data(:, 1) == i); 
    rating(i, data(idx_user, 2)) = data(idx_user, 3); 
end;

display(['Done reading datat!']);