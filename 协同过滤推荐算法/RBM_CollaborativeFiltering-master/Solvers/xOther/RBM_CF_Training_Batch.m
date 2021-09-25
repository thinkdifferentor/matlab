%% 초기화 하자
function [visHid, hidBiases, visBiases, allErr] = RBM_CF_Training_Batch(batchdata, opts)
%% 실제 Restricted Boltzmann Machine을 training하자

[opts.numCases, opts.numDims, opts.numBatches] = size(batchdata);  
% batchsize = 100;                        % the number of batches
% numdims  =  size(digitdata , 2);        % the number of pixels in a single batch
% numbatches = totnum / batchsize;        % the number of images(items) in a batch

% Initializing symmetric weights and biases.
visHid      = 0.001*randn(opts.numDims, opts.numhid, 5); % Weights
hidBiases   = zeros(1,opts.numhid);              % bias of didden layer
visBiases   = zeros(opts.numDims, 5);             % bias of visible layer    
posHidProbs = zeros(opts.numCases,opts.numhid);       % positive prob. of hidden units for all test images 
negHidProbs = zeros(opts.numCases,opts.numhid);       % negative prob. of hidden units for all test images
posProds    = zeros(opts.numDims,opts.numhid);        % positive probability. 
negProds    = zeros(opts.numDims,opts.numhid);
visHidInc   = zeros(opts.numDims,opts.numhid, 5);
hidBiasInc  = zeros(1,opts.numhid);
visBiasInc  = zeros(opts.numDims, 5);
batchPosHidProbs = zeros(opts.numCases, opts.numhid, opts.numBatches);

%% 실제로 RBM을 train하자
% batchIndex = floor((numBatches-1)*rand())+1;
batchIndex = 1;   % fixed
ii = 1;

% figure(1);   % display the batch 101 (including 100 images). 
% dispims((batchdata(:, :, batchIndex))',28,28); title(sprintf('%dth batch raw data ', epoch, batchIndex)); 
            
for epoch = 1:opts.maxepoch
    errsum = 0;
    
    % 1. 전체 batch에 대해서
    %for batch = 1 : numBatches,            
    
    % 2. 토이 테스트를 위해서 한 batch에 대해서
    for batch = 1 : size(batchdata, 4)     
        
        % 모든 batch에 대해서, (한 batch는 100개의 image로 이뤄져있다.)
        %fprintf(1,'epoch %  d batch %d \r\n', epoch, batch);
        data = batchdata(:, :, :, batch); 
        
        % 하나의 batch를 한번에 처리하기 위해서 bias를 repmat
        visBias = zeros(size(data)); 
        for i =1:1:5
            visBias(:, :, i) = repmat(visBiases(:, i)', opts.numCases, 1);    % bias matrix for all 100 test images
        end
        hidBias = repmat(hidBiases, opts.numCases, 1);    % bias matrix for all 100 test images

        %%%%%%%%% START POSITIVE PHASE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % 1. batch 중에서 우리가 사용할 data를 읽어온다. 100개의 digit으로 이뤄져있다. 
                      % Current test data      
        % get this index's batch data(100개의 digit을 포함)
        % 이 data는 numCases, 즉 100개의 digit 정보를 가지고 있다. 이 값들은 0~1사이의 값이고,
        % RBM은 binary만 처리할 수 있어서 이러한 루틴을 넣는 것 같다.
        data = data > rand(opts.numCases, opts.numDims, opts.rating_scale);       % Converse data to binary format    
        % 이 값을 0또는 1로 바꾼다.
        
        % 2. positive state에서 각 batch의 특정 hidden node가 1이 될 확률을 의미한다. 
        tmp  = 0; 
        for i = 1:1:5            
            tmp = tmp + data(:, :, i) * opts.scale * visHid (:, :, i); 
        end;
        posHidProbs = 1./ (1 + exp(-tmp - hidBias));  % The positive stage: why there is "2" here 
        % posHidProbs는 R[numCases*numhid]의 공간을 갖고 있다.
        % i번째 행은 현재 batch의 i번째 item을 의미하고,
        % j번째 열을 해당 item의 j번째 hidden node가 1이 될 확률을 의미한다.

        % 3. 모든 batch에 대해서 positive state에서 hidden node가 1이 될 확률을 저장한다. 
        batchPosHidProbs(:, :, batchIndex) = posHidProbs;    % storage hidden prob. of current patch
        % batchPosHidProbs는 R[nunCases*numhid*numBatches]의 크기를 갖는다.
        % 현재 이 loop는 각 batch마다 한번씩 들어오는데 이를 다 저장을 하고, batchPosHidProbs는 여기선 안쓰인다.

        % 4. data의 평균 
        posProds    = zeros(size(visHid));              % Averaging of each probability  
        for i = 1:1:5
            posProds(:, :, i)    = data(:, :, i)' * posHidProbs; 
        end;
        % posProds는 R[numDims, numhid]의 크기를 갖는다.
        % 현재 batch내의 모든 data의 각 dimension에 대한 expectation?
        % 뒤에서 numCases로 나눠져서 data의 평균을 구한다. 

        % 5. positve phase에서 hidden node의 기대값을 나타낸다. 
        poshidact   = sum(posHidProbs);
        % poshidact는 R[numhid]의 크기를 갖는다.
        % 각 item은 뒤에서 numCases로 나눠져서 현재 batch의 각 hidden node의 기대값을 나타낸다.

        % 6. positve phase에서 visible node의 기대값을 나타낸다. 
        posvisact   = reshape(sum(data, 1), opts.numDims, opts.rating_scale);
        % poshidact는 R[numDims]의 크기를 갖는다., 5)
        % 각 item은 뒤에서 numCases로 나눠져서 현재 batch의 각 visible node의 기대값을 나타낸다.
        %%%%%%%%% END OF POSITIVE PHASE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



        %%%%% START NEGATIVE PHASE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        poshidstates = posHidProbs > rand(opts.numCases, opts.numhid);   % Gibb sampling
        % posHidProbs 앞에서 구한 현재 batch의 각 case들의 각 hidden node가 1이 될 확률이다.
        % poshidstates는 RBM의 binary한 연산을 위해서 이를 1또는 0으로 바꾼다.
        negdata = zeros(size(data)); 
        for i = 1:1:5
            negdata(:, :, i) = 1./(1 + exp(-poshidstates*visHid(:, :, i)' - visBias(:, :, i))); % negative data 
        end
        % negdata는 앞서 positive phase에서 계산된 hid node들 (1 if 확률>rand)의 값에 지금 갖고 있는 
        % visHid, 즉 vis와 hid를 연결하는 weight를 곱해서 결국 neg phase에서 vis가 1이될 확률을 의미한다. 
        
        if rem(epoch, 10) == 1 && batch == batchIndex
            ii  = ii + 1;
            % raw data (batch)
            %figure(1);
            %dispims((batchdata(:, :, batch))',28,28); title(sprintf('[%dth epoch] %dth batch raw data ', epoch, batch)); drawnow; 
            
            % negative phase에서 계산된 image -
%             figure(2); 
%             dispims(negdata',28,28); title(sprintf('[%dth epoch] %dth batch negative phase data', epoch, batch)); drawnow; 
%             drawnow;
%             pause(.01);
        end
        
        negdata = negdata > rand(opts.numCases, opts.numDims, opts.rating_scale);
        % RBM은 binary data밖에 쓸 수 없다. 즉 neg phase에서 vis data를 의미한다. 
        tmp = zeros(size(hidBias)); 
        for i = 1:1:5
            tmp = tmp + negdata(:, :, i)*(opts.scale *visHid(:, :, i));
        end 
        negHidProbs = 1./(1 + exp(-tmp - hidBias));
        % negHidProbs 는 현재 batch내에 각 data에 대해서 각 hidden node들의 확률을 나타낸다.
        
        negProbs    = zeros(size(posProds)); 
        for i = 1:1:5
            negProds(:, :, i)  = negdata(:, :, i)'*negHidProbs;
        end
        % negProds는 R[784*50]의 크기를 같는다.
        % 즉 현재 batch에 대해서 vis과 hid를 연결하는 weight를 의미? 
        
        neghidact = sum(negHidProbs);
        % neghidact R[numhid]의 크기를 갖는다.
        % 각 item은 뒤에서 numCases로 나눠져서 현재 batch의 각 hidden node의 기대값을 나타낸다.
        
        negvisact = reshape(sum(negdata, 1), opts.numDims, opts.rating_scale); 
        % negvisact R[numDims]의 크기를 갖는다.
        % 각 item은 뒤에서 numCases로 나눠져서 현재 batch의 각 visible node의 기대값을 나타낸다.
        %%%%%%%%% END OF NEGATIVE PHASE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        
        err= sqrt(sum(sum( (data(:) - negdata(:)).^2 )) / length(data(:)));
        errsum = err + errsum; % 이 errsum은 batch마다 초기화 된다. 즉 현재 batch의 총 에러를 의미 
        if epoch > 5  
            momentum = opts.finalMomentum;
        else
            momentum = opts.initialMomentum;
        end;

        %%%%%%%%% UPDATE WEIGHTS AND BIASES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % inc를 계산한다. E[pos]-E[neg] 
        visHidInc = momentum*visHidInc + ...
            opts.epsilonW*( (posProds-negProds)/opts.numCases - opts.weightCost*visHid ) ;
        visBiasInc = momentum*visBiasInc + (opts.epsilonVb/opts.numCases)*(posvisact - negvisact);
        hidBiasInc = momentum*hidBiasInc + (opts.epsilonHb/opts.numCases)*(poshidact - neghidact);
        
        % 실제 update 부분 
        visHid = visHid + visHidInc;
        visBiases = visBiases + visBiasInc;
        hidBiases = hidBiases + hidBiasInc;
        %%%%%%%%%%%%%%%% END OF UPDATES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    end
    allErr(epoch) = errsum; 
    fprintf(1, 'epoch %4i error %6.3f  \r\n', epoch, errsum);
    
    results.visHid      = visHid; 
    results.visBiases   = visBiases; 
    results.hidBias     = hidBiases;
    results.allErr      = allErr;     
end;
%plot(allErr); grid on; 
%% 구해진 RBM을 test해보자 


% 1. 먼저 테스트를 위해 random하게 data를 가져온다. 
%batchIndex = floor((numBatches-1)*rand())+1;
%fprintf(' %d th batch\r\n', batchIndex);
%data = batchdata(:, :, batchIndex); 

% % 2. 이 data에 noise를 섞는다.
% data_with_noise = data + 0.1*randn(numCases, numDims);
% 
% %. 3. RBM에서 hidden node로 갔다가 다시 visible로 오자. 
% data2 = data_with_noise > rand(numCases, numDims);      % 이 값을 0또는 1로 바꾼다.
% posHidProbs = 1./ (1 + exp(-data2*(2*visHid) - hidBias)); 
% poshidstates = posHidProbs > rand(numCases,numhid);
% negdata = 1./(1 + exp(-poshidstates*visHid' - visBias));
% negdata = negdata > rand(numCases, numDims);

% 4. 결과를 plot한다. 
% figure(1); dispims( (batchdata(:, :, batchIndex))', 28, 28); title(sprintf('1. raw data')); 
% figure(2); dispims( data2', 28, 28); title(sprintf('2. data with noise')); 
% figure(3); dispims( negdata', 28, 28); title('3. RBM result'); 






