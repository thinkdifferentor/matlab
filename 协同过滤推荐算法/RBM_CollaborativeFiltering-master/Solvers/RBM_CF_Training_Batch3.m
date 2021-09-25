%% 초기화 하자
function [visHid, hidBiases, visBiases, allErr, allRMSE] = RBM_CF_Training_Batch3(batchdata, validate_data,  para, opts, file_name)
%% 실제 Restricted Boltzmann Machine을 training하자

% [opts.numCases, opts.numDims, opts.numBatches] = size(batchdata);  
para.numBatches = max(size(batchdata)); 
[para.numCases, para.numDims] = size(batchdata{1}{1}); 

% Initializing symmetric weights and biases.
visHid      = 0.01*randn(para.numDims, para.numhid, 5); % Weights
hidBiases   = zeros(1,para.numhid);              % bias of didden layer
visBiases   = zeros(para.numDims, 5);             % bias of visible layer    
posHidProbs = zeros(para.numCases,para.numhid);       % positive prob. of hidden units for all test images 
negHidProbs = zeros(para.numCases,para.numhid);       % negative prob. of hidden units for all test images
posProds    = zeros(para.numDims,para.numhid);        % positive probability. 
negProds    = zeros(para.numDims,para.numhid);
visHidInc   = zeros(para.numDims,para.numhid, 5);
hidBiasInc  = zeros(1,para.numhid);
visBiasInc  = zeros(para.numDims, 5);
batchPosHidProbs = zeros(para.numCases, para.numhid, para.numBatches);

%% 실제로 RBM을 train하자
data = zeros(para.numCases, para.numDims, 5);
visBias = zeros(size(data)); 
for epoch = 1:para.maxepoch
    errsum = 0;
    for batch = 1 : para.numBatches         
        for i = 1:1:5
            data(:, :, i) = batchdata{batch}{i};
        end;
        
        for i =1:1:5
            visBias(:, :, i) = repmat(visBiases(:, i)', para.numCases, 1);    % bias matrix for all 100 test images
        end
        hidBias = repmat(hidBiases, para.numCases, 1);    % bias matrix for all 100 test images

        %%%%%%%%% START POSITIVE PHASE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
        tmp  = 0; 
        for i = 1:1:5            
            tmp = tmp + data(:, :, i) * para.scale * visHid (:, :, i); 
        end;
        posHidProbs = 1./ (1 + exp(-tmp - hidBias));  % The positive stage: why there is "2" here 
        
        posProds    = 0;              % Averaging of each probability  
        for i = 1:1:5
            posProds = posProds + data(:, :, i)' * posHidProbs; 
        end;
       
        poshidact   = sum(posHidProbs);       
        posvisact   = reshape(sum(data, 1), para.numDims, para.rating_scale);     

        %%%%% START NEGATIVE PHASE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        poshidstates = posHidProbs > rand(para.numCases, para.numhid);   % Gibb sampling       
        negdata = zeros(size(data)); 
        for i = 1:1:5
            negdata(:, :, i) = 1./(1 + exp(-poshidstates*visHid(:, :, i)' - visBias(:, :, i))); % negative data 
        end     
        negdata = negdata > rand(para.numCases, para.numDims, para.rating_scale);
        
        %=========== REMOVED rating data not available ==================        
        if opts.Mask == 1
            negdata = negdata.*data; 
        end;
        %================================================================
        
        tmp = zeros(size(hidBias)); 
        for i = 1:1:5
            tmp = tmp + negdata(:, :, i)*(para.scale *visHid(:, :, i));
        end 
        negHidProbs = 1./(1 + exp(-tmp - hidBias));
        
        negProbs    = 0; 
        for i = 1:1:5
            negProds  =  negProds + negdata(:, :, i)'*negHidProbs;
        end
       
        neghidact = sum(negHidProbs);
       
        negvisact = reshape(sum(negdata, 1), para.numDims, para.rating_scale); 
       
        %%%%%%%%% Calculate Error PHASE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
        err= norm(data(:) - negdata(:), 2);
        errsum = err + errsum; % 이 errsum은 batch마다 초기화 된다. 즉 현재 batch의 총 에러를 의미 
        if epoch > 5  
            momentum = para.finalMomentum;
        else
            momentum = para.initialMomentum;
        end;

        %%%%%%%%% UPDATE WEIGHTS AND BIASES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % inc를 계산한다. E[pos]-E[neg] 
        
        
        visHidInc= momentum*visHidInc + ...
                para.epsilonW*( repmat((posProds-negProds), 1, 1, 5)/(para.numCases * 1) - para.weightCost*visHid ) ;
        
        visBiasInc = momentum*visBiasInc + (para.epsilonVb/ (para.numCases * 1))*(posvisact - negvisact);
        hidBiasInc = momentum*hidBiasInc + (para.epsilonHb/ (1*para.numCases))*(poshidact - neghidact);
        
        % 실제 update 부분 
        visHid = visHid + visHidInc;
        visBiases = visBiases + visBiasInc;
        hidBiases = hidBiases + hidBiasInc;
    end
    ratio = 0.2; 
    par.cale = 1; 
    [allRMSE(epoch) allRMSE3(epoch)] = RBM_CF_Test(validate_data, ratio, visHid, hidBiases, visBiases, para);    
    allErr(epoch) = errsum; 
    %fprintf(1, 'epoch %4i, error %6.3f, RMSE %6.3 \t \n', epoch, errsum, ValidateError);
    display(['Epoch ' num2str(epoch) ', error ' num2str(errsum, 3) ', RMSE ' num2str(allRMSE(epoch)) ', cRMSE  ' num2str(allRMSE3(epoch))]);
    results.visHid      = visHid; 
    results.visBiases   = visBiases; 
    results.hidBias     = hidBiases;
    results.allErr      = allErr;     
    
    %% saving the results
    if mod(epoch , 50) == 0
        save([file_name '_epoch' num2str(epoch) '.mat'], 'opts', 'visHid', 'hidBiases', 'visBiases', 'allErr', 'para'); 
    end;
end;
plot(allErr); grid on; 
