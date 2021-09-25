% This is demo function for RBM-CF
% adding path
clear all; close all; clc;
addpath('DataExtraction\ml-100k');
addpath('DataExtraction\ml-1m');
addpath('DataExtraction\');
addpath('Results');
addpath('Solvers');
addpath('Utilities');

% reading data
data_type   = 'ml-100k';
data_mode   = 'seq'; % 1-sequential, 2-random 
test_ratio  = [0.9, 0.1]; 
testSizeMiniBatch = [1];

for k1 = 1:1:length(testSizeMiniBatch)
    noMiniBatch = testSizeMiniBatch(k1);
    %[train_data, validate_data, test_data, para] = getData(data_type, test_ratio);
    [train_data, validate_data, test_data, opts] = getData_miniBatch(data_type, data_mode, test_ratio, noMiniBatch);
    
    
    %% Training process
    % Parameter setting
    re_train    = 1;
     test_numHid = [1 ];
    test_maxEpoch= [50:50:1000];
    learningRate = [0.0005, 0.001, 0.001];
    
    allRatio = [0.1];
    
    for kkk = 1:1:length(allRatio)
        for i1 = 1:1:length(test_numHid)
            numHid = test_numHid(i1);
            
            for i2 = 1:1:length(test_maxEpoch)
                maxEpoch = test_maxEpoch(i2);
                
                par        = parSet(numHid, learningRate, maxEpoch);
                par.scale  = 1;
                display([data_type '_noVis' num2str(opts.no_movie) '_noUser' num2str(opts.no_user) ...
                    '_noHid' num2str(numHid) '_Lrate' num2str(learningRate(1)) '_maxEpoch' num2str(maxEpoch) ]);
                
                file_folder = ['ResultsText\'];  if (~exist(file_folder)) mkdir(file_folder); end;
                file_name_text   = [data_type '_noVis' num2str(opts.no_movie) '_' num2str(test_ratio(1)) '_' num2str(test_ratio(2))  '_scale' num2str(par.scale) '.text'];
                if(~exist([file_folder file_name_text], 'file'))
                    write_info([file_folder file_name_text], '%  noVis   nBat  ratio         rating   noHid     itr rW       trErr  VaErr  testErr  ');
                end;
                
                file_name_data = [data_type '_' data_mode '_' num2str(par.scale) '_Vis' num2str(opts.no_movie) ...
                    '_Hid' num2str(numHid) '_LRate' num2str(learningRate(1)) ...
                    '_noBatch' num2str(noMiniBatch) '_ratio' num2str(test_ratio(1)) ];

                load(['Results\' file_name_data '_epoch' num2str(maxEpoch) '.mat']);
                opts.ratio = test_ratio;               
               
                %% Validation data               
                ratio = allRatio(kkk);
                [ValidateError] = RBM_CF_Test(validate_data, ratio, visHid, hidBiases, visBiases, par);
                
                %% Test data
                %[TestError] = RBM_CF_Test(test_data, ratio, visHid, hidBiases, visBiases, par); 
                TestError = 0; 
                display(['  Validation error: ' num2str(ValidateError) ',Test error: ' num2str(TestError)]);
                
                writeResults([file_folder file_name_text], opts.no_movie, numHid, learningRate, maxEpoch, ...
                    opts.ratio, allErr(end), ValidateError, TestError, noMiniBatch, ratio);
            end
            %clear allErr ValidateError TestError
        end;
    end;
end;
display('END SIMULATION !!!');