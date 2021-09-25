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
test_para = [0.0005];
for k2= 1:1:length(test_para); 
for k1 = 1:1:length(testSizeMiniBatch)
    noMiniBatch = testSizeMiniBatch(k1);
    %[train_data, validate_data, test_data, para] = getData(data_type, test_ratio);
    [train_data, validate_data, test_data, opts] = getData_miniBatch(data_type, data_mode, test_ratio, noMiniBatch);
%     opts.Mask = 1;  if opts.Mask ==1 note = 'Mask_'; end;
   
    %% Training process
    % Parameter setting
    re_train    = 1;
    test_numHid = [5 10 30 50 ];
    test_maxEpoch= [1000];
    learningRate = test_para(k2) .* [1, 1, 1];
        
    for i1 = 1:1:length(test_numHid)
        numHid = test_numHid(i1);
         opts.Mask = 0;  if opts.Mask == 0 note = 'noMask'; end;
         opts.CD   = 1; 
    
        for i2 = 1:1:length(test_maxEpoch)
            maxEpoch = test_maxEpoch(i2);
            note = [note '_noHid' num2str(numHid) '_CD' num2str(opts.CD)];
    
            par        = parSet(numHid, learningRate, maxEpoch);
            par.scale  = 1; 
            display([data_type '_noVis' num2str(opts.no_movie) '_noUser' num2str(opts.no_user) ...
                '_noHid' num2str(numHid) '_Lrate' num2str(learningRate(1)) '_maxEpoch' num2str(maxEpoch) ]);
                                    
            file_name_data = [note data_type '_' data_mode '_' num2str(par.scale) '_Vis' num2str(opts.no_movie) ...
                '_Hid' num2str(numHid) '_LRate' num2str(learningRate(1)) ...
                '_noBatch' num2str(noMiniBatch) '_ratio' num2str(test_ratio(1)) ];
            save_folder = ['Results\' note '\'];
            if(~exist(save_folder)) mkdir(save_folder); end; 
            if(exist([save_folder file_name_data], 'file') && re_train == 0) 
                load(file_name_data);
            else
                [visHid, hidBiases, visBiases, allErr, allRMSE] = RBM_CF_Training_Batch3CD(train_data, validate_data, par, opts, [save_folder file_name_data]);
            end;            
            pr = figure(1); subplot(1,2,1); plot(allErr); grid on ; title('train error'); xlabel('epoch');% ylabel('Error');
            subplot(1,2,2); plot(allRMSE); grid on; title('RMSE'); xlabel('epoch');% ylabel('RMSE');
            save_image_folder = ['ResultsImg\' note '\']; if(~exist(save_image_folder)) mkdir(save_image_folder); end; 
            saveas(pr, [save_image_folder file_name_data '_' num2str(test_maxEpoch) '.png']);            
        end
        %clear allErr ValidateError TestError
    end;
end;
end;
display('END TRAINGING PROCESS!!!');